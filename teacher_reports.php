<?php
include 'header.php';
require 'db.php';

// Get the ID of the currently logged-in teacher from the session
$teacher_id = $_SESSION['user_id'];

// THIS IS THE CRITICAL FIX: The query now includes "WHERE teacher_id = ?"
// This ensures that only the classes assigned to the logged-in teacher are fetched.
$classes_stmt = $pdo->prepare("SELECT id, class_name FROM classes WHERE teacher_id = ? ORDER BY class_name");
$classes_stmt->execute([$teacher_id]);
$classes = $classes_stmt->fetchAll(PDO::FETCH_ASSOC);

$selected_class_id = $_GET['class_id'] ?? null;
$selected_month = $_GET['month'] ?? null;
$report_data = [];
$days_in_month = 0;

if ($selected_class_id && $selected_month) {
    // Security check: Make sure the selected class actually belongs to this teacher
    $is_my_class = false;
    foreach ($classes as $class) {
        if ($class['id'] == $selected_class_id) {
            $is_my_class = true;
            break;
        }
    }

    if ($is_my_class) {
        $year = date('Y', strtotime($selected_month));
        $month = date('m', strtotime($selected_month));
        $days_in_month = cal_days_in_month(CAL_GREGORIAN, $month, $year);

        $students_stmt = $pdo->prepare("SELECT s.id, s.full_name, s.student_id_number FROM students s JOIN enrollments e ON s.id = e.student_id WHERE e.class_id = ? ORDER BY s.full_name");
        $students_stmt->execute([$selected_class_id]);
        $students = $students_stmt->fetchAll(PDO::FETCH_ASSOC);

        $attendance_stmt = $pdo->prepare("SELECT student_id, attendance_date, status FROM attendance_records WHERE class_id = ? AND DATE_FORMAT(attendance_date, '%Y-%m') = ?");
        $attendance_stmt->execute([$selected_class_id, $selected_month]);
        $records = $attendance_stmt->fetchAll(PDO::FETCH_ASSOC);

        $attendance_map = [];
        foreach ($records as $record) {
            $day = date('d', strtotime($record['attendance_date']));
            $attendance_map[$record['student_id']][$day] = strtoupper(substr($record['status'], 0, 1));
        }
        
        foreach ($students as $student) {
            $report_data[$student['id']] = [
                'info' => $student,
                'attendance' => $attendance_map[$student['id']] ?? []
            ];
        }
    } else {
         echo "<div class='alert alert-danger'>Access Denied: You do not have permission to view this class report.</div>";
    }
}
?>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Attendance Reports</h1>
</div>

<div class="card bg-light mb-4">
    <div class="card-body">
        <form method="GET" class="row g-3 align-items-end">
            <div class="col-md-5">
                <label for="class_id" class="form-label"><strong>Select Your Class</strong></label>
                <select name="class_id" id="class_id" class="form-select" required>
                    <option value="">-- Choose a Class --</option>
                    <?php foreach ($classes as $class): ?>
                        <option value="<?php echo $class['id']; ?>" <?php if ($class['id'] == $selected_class_id) echo 'selected'; ?>>
                            <?php echo htmlspecialchars($class['class_name']); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-md-5">
                <label for="month" class="form-label"><strong>Select Month</strong></label>
                <input type="month" name="month" id="month" class="form-control" value="<?php echo htmlspecialchars($selected_month ?? ''); ?>" required>
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary w-100">Generate Report</button>
            </div>
        </form>
    </div>
</div>

<?php if (!empty($report_data)): ?>
<div class="d-flex justify-content-end mb-3">
    <a href="export_csv.php?class_id=<?php echo $selected_class_id; ?>&month=<?php echo $selected_month; ?>" class="btn btn-success">
        <i class="bi bi-file-earmark-excel-fill"></i> Export to CSV
    </a>
</div>

<div class="table-responsive">
    <table class="table table-bordered table-sm text-center">
        <thead class="table-dark">
            <tr>
                <th style="min-width: 200px; text-align: left;">Student Name</th>
                <?php for ($day = 1; $day <= $days_in_month; $day++): ?>
                    <th><?php echo $day; ?></th>
                <?php endfor; ?>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($report_data as $student_id => $data): ?>
            <tr>
                <td style="text-align: left;"><?php echo htmlspecialchars($data['info']['full_name']); ?></td>
                <?php for ($day = 1; $day <= $days_in_month; $day++): ?>
                    <td>
                        <?php
                            $day_str = str_pad($day, 2, '0', STR_PAD_LEFT);
                            echo $data['attendance'][$day_str] ?? '-';
                        ?>
                    </td>
                <?php endfor; ?>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <small class="text-muted">P = Present, A = Absent, L = Late, E = Excused</small>
</div>
<?php endif; ?>

<?php include 'footer.php'; ?>