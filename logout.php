<?php
// Step 1: Start the session.
// You must start the session on this page to be able to access and destroy it.
session_start();

// Step 2: Unset all session variables.
// This clears all the data that was stored, like user_id, user_name, and role.
session_unset();

// Step 3: Destroy the session.
// This is the most important step. It removes the session data from the server.
session_destroy();

// Step 4: Redirect the user to the login page.
// After being logged out, the user is sent back to the main index.php page.
header('Location: index.php');

// Step 5: Stop the script from running further.
// It's a good practice to exit after a redirect to prevent any further code execution.
exit;
?>