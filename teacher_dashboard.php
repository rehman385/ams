<?php
include 'header.php';
require 'db.php';

// Fetch classes assigned to the logged-in teacher
$teacher_id = $_SESSION['user_id'];
$stmt = $pdo->prepare("SELECT id, class_name, academic_year FROM classes WHERE teacher_id = ?");
$stmt->execute([$teacher_id]);
$classes = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Teacher Dashboard</h1>
</div>

<h3>Your Classes</h3>
<p>Select a class from the list below to mark daily attendance.</p>

<div class="list-group">
    <?php if ($classes): ?>
        <?php foreach ($classes as $class): ?>
            <a href="teacher_mark_attendance.php?class_id=<?php echo $class['id']; ?>" class="list-group-item list-group-item-action">
                <strong><?php echo htmlspecialchars($class['class_name']); ?></strong>
                <small class="text-muted d-block"><?php echo htmlspecialchars($class['academic_year']); ?></small>
            </a>
        <?php endforeach; ?>
    <?php else: ?>
        <p class="text-muted">You are not assigned to any classes.</p>
    <?php endif; ?>
</div>

<h3 class="mt-4">Reports</h3>
<a href="teacher_reports.php" class="btn btn-secondary disabled">Generate Attendance Reports (Coming Soon)</a>

<?php include 'footer.php'; ?>