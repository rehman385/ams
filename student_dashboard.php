<?php
include 'header.php';
require 'db.php';

// Ensure the user is a student and has a student_id in the session
if (!isset($_SESSION['student_id'])) {
    echo "<div class='alert alert-danger'>Could not identify your student profile. Please log out and log in again.</div>";
    include 'footer.php';
    exit;
}
$student_id = $_SESSION['student_id'];

// Get the current day of the week (e.g., 'Monday', 'Tuesday')
$current_day = date('l'); // 'l' gives the full textual day name

// Fetch today's classes for the logged-in student from the timetable
// This query joins timetable, classes, and enrollments to get the correct schedule for this specific student.
$schedule_stmt = $pdo->prepare("
    SELECT t.start_time, t.end_time, c.class_name, t.room_number
    FROM timetable t
    JOIN classes c ON t.class_id = c.id
    JOIN enrollments e ON c.id = e.class_id
    WHERE e.student_id = ? AND t.day_of_week = ?
    ORDER BY t.start_time
");
$schedule_stmt->execute([$student_id, $current_day]);
$todays_classes = $schedule_stmt->fetchAll(PDO::FETCH_ASSOC);

?>
<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Dashboard</h1>
</div>

<div class="row">
    <div class="col-md-6 mb-4">
        <div class="dashboard-card h-100 d-flex flex-column justify-content-center text-center">
            <h4>View Full Attendance</h4>
            <p>Check your detailed attendance summary for all classes.</p>
            <a href="student_view_attendance.php" class="btn btn-primary mt-auto">View My Attendance</a>
        </div>
    </div>
    <div class="col-md-6 mb-4">
         <div class="dashboard-card h-100 d-flex flex-column justify-content-center text-center">
            <h4>View Full Timetable</h4>
            <p>See your complete weekly class schedule.</p>
            <a href="student_view_timetable.php" class="btn btn-info mt-auto">View My Timetable</a>
        </div>
    </div>
</div>

<h3 class="mt-4">Today's Schedule (<?php echo $current_day; ?>)</h3>
<div class="table-responsive">
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>Time</th>
                <th>Class Name</th>
                <th>Room / Lab</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($todays_classes): ?>
                <?php foreach ($todays_classes as $class): ?>
                    <tr>
                        <td><?php echo date("g:i A", strtotime($class['start_time'])) . ' - ' . date("g:i A", strtotime($class['end_time'])); ?></td>
                        <td><?php echo htmlspecialchars($class['class_name']); ?></td>
                        <td><?php echo htmlspecialchars($class['room_number'] ?? 'Lecture Hall'); ?></td>
                    </tr>
                <?php endforeach; ?>
            <?php else: ?>
                <tr>
                    <td colspan="3" class="text-center text-muted">No classes scheduled for today.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>
</div>

<?php include 'footer.php'; ?>