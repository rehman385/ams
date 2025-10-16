<?php
include 'header.php';
require 'db.php';

// Security check: ensure the user is a logged-in student
if (!isset($_SESSION['student_id'])) {
    echo "<div class='alert alert-danger'>Could not identify your student profile. Please log out and log in again.</div>";
    include 'footer.php';
    exit;
}
$student_id = $_SESSION['student_id'];

// --- FETCH THE STUDENT'S WEEKLY SCHEDULE ---
// This query joins the timetable, classes, and enrollments tables to get the schedule for the specific student.
$stmt = $pdo->prepare("
    SELECT t.day_of_week, t.start_time, t.end_time, c.class_name, t.room_number
    FROM timetable t
    JOIN classes c ON t.class_id = c.id
    JOIN enrollments e ON c.id = e.class_id
    WHERE e.student_id = ?
    ORDER BY FIELD(t.day_of_week, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'), t.start_time
");
$stmt->execute([$student_id]);
$results = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Process the results by grouping them into a day-by-day array for easier display
$schedule = [];
foreach ($results as $row) {
    $schedule[$row['day_of_week']][] = $row;
}

// Define the order of days to display
$days_of_week = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
?>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">My Weekly Timetable</h1>
</div>
<p>
    This is the official teaching time schedule for the *BS (Computer Science) 2nd Semester, Academic Year 2024-2025.
</p>

<div class="table-responsive">
    <table class="table table-bordered table-hover text-center">
        <thead class="table-dark">
            <tr>
                <th style="width: 15%;">Day</th>
                <th style="width: 20%;">Time</th>
                <th>Class</th>
                <th style="width: 20%;">Room / Lab</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($days_of_week as $day): ?>
                <?php if (isset($schedule[$day])): ?>
                    <?php foreach ($schedule[$day] as $index => $class): ?>
                        <tr>
                            <?php if ($index == 0): // Use rowspan to show the day name only once ?>
                                <th rowspan="<?php echo count($schedule[$day]); ?>" class="align-middle fs-5"><?php echo $day; ?></th>
                            <?php endif; ?>
                            
                            <td><?php echo date("g:i A", strtotime($class['start_time'])) . ' - ' . date("g:i A", strtotime($class['end_time'])); ?></td>
                            
                            <td><?php echo htmlspecialchars($class['class_name']); ?></td>
                            <td><?php echo htmlspecialchars($class['room_number'] ?? 'Lecture Hall'); ?></td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <th><?php echo $day; ?></th>
                        <td colspan="3" class="text-muted">No classes scheduled.</td>
                    </tr>
                <?php endif; ?>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>

<?php include 'footer.php'; ?>