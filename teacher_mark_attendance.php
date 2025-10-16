<?php
include 'header.php';
require 'db.php';

// Ensure a class ID is provided in the URL
if (!isset($_GET['class_id'])) {
    echo "<div class='alert alert-danger'>Error: No class selected. Please go back to your dashboard.</div>";
    include 'footer.php';
    exit;
}

$class_id = $_GET['class_id'];
// Use the date from the URL if provided, otherwise default to today
$attendance_date = $_GET['date'] ?? date('Y-m-d');

// --- HANDLE FORM SUBMISSION ---
// This block runs when the teacher clicks "Save Attendance"
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['save_attendance'])) {
    $attendance_data = $_POST['attendance'];
    $date_to_save = $_POST['attendance_date'];

    // This is an efficient query that INSERTS a new record, but if a record for that
    // student/class/date already exists, it UPDATES the status instead.
    $stmt = $pdo->prepare("
        INSERT INTO attendance_records (class_id, student_id, attendance_date, status) 
        VALUES (:class_id, :student_id, :attendance_date, :status) 
        ON DUPLICATE KEY UPDATE status = VALUES(status)
    ");

    // Loop through each student from the form and save their attendance status
    foreach ($attendance_data as $student_id => $status) {
        $stmt->execute([
            ':class_id' => $class_id,
            ':student_id' => $student_id,
            ':attendance_date' => $date_to_save,
            ':status' => $status
        ]);
    }
    // Show a success message
    echo "<div class='alert alert-success'>Attendance for " . htmlspecialchars($date_to_save) . " has been saved successfully!</div>";
}

// --- FETCH DATA FOR DISPLAY ---
// Get the class name for the page title
$class_stmt = $pdo->prepare("SELECT class_name FROM classes WHERE id = ?");
$class_stmt->execute([$class_id]);
$class_name = $class_stmt->fetchColumn();

// Get all enrolled students for this class and join with any existing attendance record for the selected date
$students_stmt = $pdo->prepare("
    SELECT s.id, s.full_name, s.student_id_number, ar.status 
    FROM students s
    JOIN enrollments e ON s.id = e.student_id
    LEFT JOIN attendance_records ar ON s.id = ar.student_id AND ar.class_id = :class_id AND ar.attendance_date = :attendance_date
    WHERE e.class_id = :class_id_for_enrollment
    ORDER BY s.full_name
");
$students_stmt->execute([
    ':class_id' => $class_id,
    ':attendance_date' => $attendance_date,
    ':class_id_for_enrollment' => $class_id
]);
$students = $students_stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Mark Attendance</h1>
</div>
<h4>Class: <span class="text-primary"><?php echo htmlspecialchars($class_name); ?></span></h4>

<form method="GET" class="row g-3 align-items-center mb-4 bg-light p-3 rounded">
    <input type="hidden" name="class_id" value="<?php echo $class_id; ?>">
    <div class="col-auto">
        <label for="date" class="form-label"><strong>Select Date:</strong></label>
    </div>
    <div class="col-auto">
        <input type="date" id="date" name="date" class="form-control" value="<?php echo htmlspecialchars($attendance_date); ?>">
    </div>
    <div class="col-auto">
        <button type="submit" class="btn btn-info">Load Records</button>
    </div>
</form>

<form method="POST">
    <input type="hidden" name="attendance_date" value="<?php echo htmlspecialchars($attendance_date); ?>">
    <div class="table-responsive">
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Student ID</th>
                    <th>Full Name</th>
                    <th class="text-center">Present</th>
                    <th class="text-center">Absent</th>
                    <th class="text-center">Late</th>
                    <th class="text-center">Excused</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($students as $student): ?>
                <tr>
                    <td><?php echo htmlspecialchars($student['student_id_number']); ?></td>
                    <td><?php echo htmlspecialchars($student['full_name']); ?></td>
                    <?php $statuses = ['present', 'absent', 'late', 'excused']; ?>
                    <?php foreach ($statuses as $status): ?>
                    <td class="text-center">
                        <input class="form-check-input" type="radio" 
                               name="attendance[<?php echo $student['id']; ?>]" 
                               value="<?php echo $status; ?>"
                               <?php if ($student['status'] == $status) echo 'checked'; ?>
                               required>
                    </td>
                    <?php endforeach; ?>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    <button type="submit" name="save_attendance" class="btn btn-success mt-3"><i class="bi bi-check-circle-fill"></i> Save Attendance</button>
</form>

<?php include 'footer.php'; ?>