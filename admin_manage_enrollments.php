<?php
include 'header.php';
require 'db.php';

// Get the class_id from the URL, if it's selected
$class_id = $_GET['class_id'] ?? null;

// --- HANDLE ACTIONS ---
// This block runs if the "Enroll" button is clicked
if (isset($_POST['enroll'])) {
    $student_to_enroll = $_POST['student_id'];
    // Insert a new record into the enrollments table
    $stmt = $pdo->prepare("INSERT INTO enrollments (class_id, student_id) VALUES (?, ?)");
    $stmt->execute([$class_id, $student_to_enroll]);
}

// This block runs if the "Un-enroll" button is clicked
if (isset($_POST['unenroll'])) {
    $student_to_unenroll = $_POST['student_id'];
    // Delete the specific record from the enrollments table
    $stmt = $pdo->prepare("DELETE FROM enrollments WHERE class_id = ? AND student_id = ?");
    $stmt->execute([$class_id, $student_to_unenroll]);
}

// --- FETCH DATA FOR DISPLAY ---
// Fetch all classes to populate the dropdown menu
$classes = $pdo->query("SELECT id, class_name FROM classes ORDER BY class_name")->fetchAll(PDO::FETCH_ASSOC);

$enrolled_students = [];
$available_students = [];

// Only run these queries if a class has been selected from the dropdown
if ($class_id) {
    // Fetch all students who ARE ENROLLED in the selected class
    $stmt = $pdo->prepare("
        SELECT s.id, s.full_name, s.student_id_number
        FROM students s
        JOIN enrollments e ON s.id = e.student_id
        WHERE e.class_id = ? ORDER BY s.full_name
    ");
    $stmt->execute([$class_id]);
    $enrolled_students = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $enrolled_student_ids = array_column($enrolled_students, 'id');

    // Fetch all students who ARE NOT ENROLLED in the selected class
    $query = "SELECT id, full_name, student_id_number FROM students ORDER BY full_name";
    // If there are already enrolled students, exclude them from the "available" list
    if (!empty($enrolled_student_ids)) {
        $placeholders = implode(',', array_fill(0, count($enrolled_student_ids), '?'));
        $query = "SELECT id, full_name, student_id_number FROM students WHERE id NOT IN ($placeholders) ORDER BY full_name";
    }
    $stmt = $pdo->prepare($query);
    $stmt->execute($enrolled_student_ids); // The parameters for the IN clause
    $available_students = $stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Manage Class Enrollments</h1>
</div>

<div class="card bg-light mb-4">
    <div class="card-body">
        <form method="GET" class="row align-items-center">
            <div class="col-md-2">
                <label for="class_id" class="form-label"><strong>Select a Class:</strong></label>
            </div>
            <div class="col-md-8">
                <select name="class_id" id="class_id" class="form-select" onchange="this.form.submit()">
                    <option value="">-- Select a Class to Manage --</option>
                    <?php foreach ($classes as $class): ?>
                        <option value="<?php echo $class['id']; ?>" <?php if ($class['id'] == $class_id) echo 'selected'; ?>>
                            <?php echo htmlspecialchars($class['class_name']); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
        </form>
    </div>
</div>

<?php if ($class_id): // Only show the lists if a class is selected ?>
<div class="row mt-4">
    <div class="col-md-6">
        <h4>Available Students</h4>
        <div class="list-group" style="height: 500px; overflow-y: auto; border: 1px solid #ddd; padding: 5px; border-radius: 5px;">
            <?php foreach ($available_students as $student): ?>
                <div class="list-group-item d-flex justify-content-between align-items-center">
                    <div>
                        <strong><?php echo htmlspecialchars($student['full_name']); ?></strong>
                        <br><small class="text-muted"><?php echo htmlspecialchars($student['student_id_number']); ?></small>
                    </div>
                    <form method="POST" action="?class_id=<?php echo $class_id; ?>">
                        <input type="hidden" name="student_id" value="<?php echo $student['id']; ?>">
                        <button type="submit" name="enroll" class="btn btn-sm btn-success" title="Enroll Student">&rarr;</button>
                    </form>
                </div>
            <?php endforeach; ?>
        </div>
    </div>

    <div class="col-md-6">
        <h4>Enrolled Students</h4>
        <div class="list-group" style="height: 500px; overflow-y: auto; border: 1px solid #ddd; padding: 5px; border-radius: 5px;">
            <?php foreach ($enrolled_students as $student): ?>
                <div class="list-group-item d-flex justify-content-between align-items-center">
                    <form method="POST" action="?class_id=<?php echo $class_id; ?>">
                        <input type="hidden" name="student_id" value="<?php echo $student['id']; ?>">
                        <button type="submit" name="unenroll" class="btn btn-sm btn-danger" title="Un-enroll Student">&larr;</button>
                    </form>
                    <div>
                        <strong><?php echo htmlspecialchars($student['full_name']); ?></strong>
                        <br><small class="text-muted"><?php echo htmlspecialchars($student['student_id_number']); ?></small>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</div>
<?php endif; ?>

<?php include 'footer.php'; ?>