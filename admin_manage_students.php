<?php
include 'header.php';
require 'db.php';

// Handle adding a new student
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['add_student'])) {
    // For students, we create a user account and a student profile
    $full_name = $_POST['full_name'];
    $student_id_number = $_POST['student_id_number'];
    $email = strtolower(str_replace(' ', '.', $student_id_number)) . '@student.sau.edu.pk';
    $password = 'password'; // Default password for new students
    $password_hash = password_hash($password, PASSWORD_DEFAULT);

    try {
        // Insert into users table
        $stmtUser = $pdo->prepare("INSERT INTO users (name, email, password_hash, role) VALUES (?, ?, ?, 'student')");
        $stmtUser->execute([$full_name, $email, $password_hash]);
        $user_id = $pdo->lastInsertId();

        // Insert into students table
        $stmtStudent = $pdo->prepare("INSERT INTO students (student_id_number, full_name, user_id) VALUES (?, ?, ?)");
        $stmtStudent->execute([$student_id_number, $full_name, $user_id]);
        
        $success_message = "Student '$full_name' added successfully!";
    } catch (PDOException $e) {
        $error_message = "Error: " . $e->getMessage();
    }
}

// Fetch all students to display
$students = $pdo->query("SELECT * FROM students ORDER BY student_id_number ASC")->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Manage Students</h1>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addStudentModal">
      Add New Student
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
                <th>Registration No.</th>
                <th>Full Name</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($students as $student): ?>
            <tr>
                <td><?php echo htmlspecialchars($student['student_id_number']); ?></td>
                <td><?php echo htmlspecialchars($student['full_name']); ?></td>
                <td>
                    <button class="btn btn-sm btn-warning disabled">Edit</button>
                    <button class="btn btn-sm btn-danger disabled">Delete</button>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>

<div class="modal fade" id="addStudentModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"><h5 class="modal-title">Add New Student</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
      <form method="post">
        <div class="modal-body">
            <div class="mb-3">
                <label for="student_id_number" class="form-label">Registration No. (e.g., 2K24-CS-68)</label>
                <input type="text" class="form-control" name="student_id_number" required>
            </div>
            <div class="mb-3">
                <label for="full_name" class="form-label">Full Name</label>
                <input type="text" class="form-control" name="full_name" required>
            </div>
            <small class="text-muted">A user account will be created automatically. Default password is 'password'.</small>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" name="add_student" class="btn btn-primary">Save Student</button>
        </div>
      </form>
    </div>
  </div>
</div>

<?php include 'footer.php'; ?>