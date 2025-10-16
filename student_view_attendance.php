<?php
include 'header.php';
require 'db.php';

// Ensure the user is a student and has a student_id in the session
if (!isset($_SESSION['student_id'])) {
    echo "<div class='alert alert-danger'>Could not identify student profile. Please log out and log in again.</div>";
    include 'footer.php';
    exit;
}
$student_id = $_SESSION['student_id'];

// --- FETCH ATTENDANCE SUMMARY ---
$summary_stmt = $pdo->prepare("
    SELECT 
        c.class_name,
        COUNT(ar.id) as total_days,
        SUM(CASE WHEN ar.status = 'present' THEN 1 ELSE 0 END) as present_days
    FROM enrollments e
    JOIN classes c ON e.class_id = c.id
    LEFT JOIN attendance_records ar ON e.class_id = ar.class_id AND e.student_id = ar.student_id
    WHERE e.student_id = ?
    GROUP BY c.class_name
");
$summary_stmt->execute([$student_id]);
$summary = $summary_stmt->fetchAll(PDO::FETCH_ASSOC);

// --- FETCH DETAILED ATTENDANCE LOG ---
$details_stmt = $pdo->prepare("
    SELECT ar.attendance_date, c.class_name, ar.status
    FROM attendance_records ar
    JOIN classes c ON ar.class_id = c.id
    WHERE ar.student_id = ?
    ORDER BY ar.attendance_date DESC, c.class_name
");
$details_stmt->execute([$student_id]);
$details = $details_stmt->fetchAll(PDO::FETCH_ASSOC);

?>
<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">My Attendance Summary</h1>
</div>

<div class="row">
    <?php foreach ($summary as $class_summary): ?>
        <?php
            $total = $class_summary['total_days'] > 0 ? $class_summary['total_days'] : 1;
            $present = $class_summary['present_days'] ?? 0;
            $percentage = round(($present / $total) * 100);
            $progress_color = $percentage >= 75 ? 'bg-success' : ($percentage >= 50 ? 'bg-warning' : 'bg-danger');
        ?>
        <div class="col-md-6 mb-4">
            <div class="dashboard-card">
                <h5 class="card-title"><?php echo htmlspecialchars($class_summary['class_name']); ?></h5>
                <p class="card-text">
                    Attendance: <strong><?php echo "$present / " . ($class_summary['total_days'] ?? 0); ?></strong> days
                </p>
                <div class="progress" style="height: 20px;">
                    <div class="progress-bar <?php echo $progress_color; ?>" role="progressbar" 
                         style="width: <?php echo $percentage; ?>%;" 
                         aria-valuenow="<?php echo $percentage; ?>" aria-valuemin="0" aria-valuemax="100">
                         <?php echo $percentage; ?>%
                    </div>
                </div>
            </div>
        </div>
    <?php endforeach; ?>
</div>

<h3 class="mt-4">Detailed Log</h3>
<div class="table-responsive">
    <table class="table table-striped table-hover">
        <thead class="table-dark">
            <tr>
                <th>Date</th>
                <th>Class</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($details): ?>
                <?php foreach ($details as $record): ?>
                <tr>
                    <td><?php echo date("D, d M Y", strtotime($record['attendance_date'])); ?></td>
                    <td><?php echo htmlspecialchars($record['class_name']); ?></td>
                    <td>
                        <?php 
                            $status = htmlspecialchars($record['status']);
                            $badge_class = 'bg-secondary';
                            if ($status == 'present') $badge_class = 'bg-success';
                            if ($status == 'absent') $badge_class = 'bg-danger';
                            if ($status == 'late') $badge_class = 'bg-warning text-dark';
                            echo "<span class='badge {$badge_class} text-capitalize'>{$status}</span>";
                        ?>
                    </td>
                </tr>
                <?php endforeach; ?>
            <?php else: ?>
                <tr>
                    <td colspan="3" class="text-center text-muted">No attendance records found yet.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>
</div>

<?php include 'footer.php'; ?>