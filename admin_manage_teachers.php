<?php
include 'header.php';
require 'db.php';

// Handle adding a new teacher
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['add_teacher'])) {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = 'password'; // Default password for new teachers
    $password_hash = password_hash($password, PASSWORD_DEFAULT);
    
    try {
        $stmt = $pdo->prepare("INSERT INTO users (name, email, password_hash, role) VALUES (?, ?, ?, 'teacher')");
        $stmt->execute([$name, $email, $password_hash]);
        $success_message = "Teacher '$name' added successfully!";
    } catch (PDOException $e) {
        $error_message = "Error: Email already exists or other database error.";
    }
}

// Fetch all teachers to display
$teachers = $pdo->query("SELECT id, name, email FROM users WHERE role = 'teacher' ORDER BY name ASC")->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Manage Teachers</h1>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addTeacherModal">
      Add New Teacher
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
                <th>Name</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($teachers as $teacher): ?>
            <tr>
                <td><?php echo htmlspecialchars($teacher['name']); ?></td>
                <td><?php echo htmlspecialchars($teacher['email']); ?></td>
                <td>
                    <button class="btn btn-sm btn-warning disabled">Edit</button>
                    <button class="btn btn-sm btn-danger disabled">Delete</button>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>

<div class="modal fade" id="addTeacherModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"><h5 class="modal-title">Add New Teacher</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
      <form method="post">
        <div class="modal-body">
            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" class="form-control" name="name" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email Address</label>
                <input type="email" class="form-control" name="email" required>
            </div>
             <small class="text-muted">Default password is 'password'.</small>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" name="add_teacher" class="btn btn-primary">Save Teacher</button>
        </div>
      </form>
    </div>
  </div>
</div>

<?php include 'footer.php'; ?>