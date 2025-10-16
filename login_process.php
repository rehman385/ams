<?php
// Start the session to check if the user is already logged in
session_start();

// If a user is already logged in, redirect them to their appropriate dashboard
if (isset($_SESSION['user_id'])) {
    if ($_SESSION['user_role'] === 'admin') {
        header('Location: admin_dashboard.php');
        exit();
    } elseif ($_SESSION['user_role'] === 'teacher') {
        header('Location: teacher_dashboard.php');
        exit();
    } elseif ($_SESSION['user_role'] === 'student') {
        header('Location: student_dashboard.php');
        exit();
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Attendance System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background-color: #fff;
            padding: 2rem 3rem;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 1.5rem;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #555;
        }
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* Important */
        }
        button {
            width: 100%;
            padding: 0.75rem;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: #d93025;
            text-align: center;
            margin-top: 1rem;
            display: none; /* Hidden by default */
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h1>System Login</h1>
        <form id="login-form">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Login</button>
        </form>
        <p id="error-message" class="error-message"></p>
    </div>

    <script>
        // --- JAVASCRIPT TO HANDLE THE LOGIN PROCESS ---
        
        const loginForm = document.getElementById('login-form');
        const errorMessage = document.getElementById('error-message');

        // Listen for when the user clicks the "Login" button
        loginForm.addEventListener('submit', function(event) {
            // 1. Prevent the default browser action of reloading the page
            event.preventDefault();

            // 2. Get the form data (email and password)
            const formData = new FormData(loginForm);

            // 3. Send the data to your PHP login script using Fetch API
            fetch('login_handler.php', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json()) // Expect a JSON response from PHP
            .then(data => {
                // 4. Handle the response from the PHP script
                if (data.status === 'success') {
                    // If login is successful, redirect the user to their dashboard
                    window.location.href = data.redirect;
                } else {
                    // If login fails, show the error message
                    errorMessage.textContent = data.message;
                    errorMessage.style.display = 'block';
                }
            })
            .catch(error => {
                // Handle network errors or if the PHP script has a fatal error
                console.error('Error:', error);
                errorMessage.textContent = 'An unexpected error occurred. Please try again.';
                errorMessage.style.display = 'block';
            });
        });
    </script>

</body>
</html>