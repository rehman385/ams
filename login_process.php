<?php
session_start();
require 'db.php';

header('Content-Type: application/json');

$response = ['status' => 'error', 'message' => 'Invalid request.'];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    if (empty($email) || empty($password)) {
        $response['message'] = 'Email and password are required.';
    } else {
        $stmt = $pdo->prepare("SELECT id, name, password_hash, role FROM users WHERE email = ?");
        $stmt->execute([$email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user && password_verify($password, $user['password_hash'])) {
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['user_name'] = $user['name'];
            $_SESSION['user_role'] = $user['role'];

            // --- NEW CODE BLOCK ---
            // If the user is a student, find their student_id and save it to the session.
            if ($user['role'] == 'student') {
                $student_stmt = $pdo->prepare("SELECT id FROM students WHERE user_id = ?");
                $student_stmt->execute([$user['id']]);
                $student_profile = $student_stmt->fetch(PDO::FETCH_ASSOC);
                if ($student_profile) {
                    $_SESSION['student_id'] = $student_profile['id'];
                }
            }
            // --- END OF NEW CODE BLOCK ---

            switch ($user['role']) {
                case 'admin':   $redirect_url = 'admin_dashboard.php'; break;
                case 'teacher': $redirect_url = 'teacher_dashboard.php'; break;
                case 'student': $redirect_url = 'student_dashboard.php'; break;
                default:        $redirect_url = 'index.php';
            }
            $response = ['status' => 'success', 'redirect' => $redirect_url];
        } else {
            $response['message'] = 'Invalid email or password.';
        }
    }
}

echo json_encode($response);
?>