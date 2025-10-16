<?php
include 'header.php';
require 'db.php';

// Handle adding a new class
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['add_class'])) {
    $class_name = $_POST['class_name'];
    $teacher_id = $_POST['teacher_id'];
    $academic_year = $_POST['academic_year'];
    
    try {
        $stmt = $pdo->prepare("INSERT INTO classes (class_name, teacher_id, academic_year) VALUES (?, ?, ?)");
        $stmt->execute([$class_name, $teacher_id, $academic_year]);
        $success_message = "Class '$class_name' added successfully!";
    } catch (PDOException $e) {
        $error_message = "Error: " . $e->getMessage();
    }
}

// Fetch all teachers for the dropdown
$teachers = $pdo->query("SELECT id, name FROM users WHERE role = 'teacher' ORDER BY name ASC")->fetchAll(PDO::FETCH_ASSOC);

// Fetch all classes with their assigned teacher's name
$classes = $pdo->query("
    SELECT c.class_name, c.academic_year, u.name as teacher_name
    FROM classes c
    JOIN users u ON c.teacher_id = u.id
    ORDER BY c.class_name ASC
")->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Manage Classes</h1>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addClassModal">
      Add New Class
    </button>
</div>

<?php if (isset($success_message)): ?>
    <div class="alert alert-success"><?php echo $success_message; ?></div>
<?php elseif (isset($error_message)): ?>
    <div class="alert alert-danger"><?php echo $error_message; ?></div>
<?php endif; ?>

<div class="table-responsive">
    <table class="table table-striped table-sm">
        <thead>
            <tr>
                <th>Class Name</th>
                <th>Assigned Teacher</th>
                <th>Academic Year</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($classes as $class): ?>
            <tr>
                <td><?php echo htmlspecialchars($class['class_name']); ?></td>
                <td><?php echo htmlspecialchars($class['teacher_name']); ?></td>
                <td><?php echo htmlspecialchars($class['academic_year']); ?></td>
                <td>
                    <button class="btn btn-sm btn-warning disabled">Edit</button>
                    <button class="btn btn-sm btn-danger disabled">Delete</button>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>

<div class="modal fade" id="addClassModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"><h5 class="modal-title">Add New Class</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
      <form method="post">
        <div class="modal-body">
            <div class="mb-3">
                <label for="class_name" class="form-label">Class Name (e.g., CS-308 New Subject)</label>
                <input type="text" class="form-control" name="class_name" required>
            </div>
            <div class="mb-3">
                <label for="teacher_id" class="form-label">Assign Teacher</label>
                <select class="form-select" name="teacher_id" required>
                    <option value="">-- Select a Teacher --</option>
                    <?php foreach ($teachers as $teacher): ?>
                        <option value="<?php echo $teacher['id']; ?>"><?php echo htmlspecialchars($teacher['name']); ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="mb-3">
                <label for="academic_year" class="form-label">Academic Year</label>
                <input type="text" class="form-control" name="academic_year" value="2024-2025" required>
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" name="add_class" class="btn btn-primary">Save Class</button>
        </div>
      </form>
    </div>
  </div>
</div>

<?php include 'footer.php'; ?>