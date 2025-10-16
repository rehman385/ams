<?php
// Set your database credentials
$host = 'localhost';
$dbname = 'attendance_db'; // The name of our database
$username = 'root';        // Default for XAMPP
$password = '';            // Default for XAMPP is an empty password

try {
    // This line establishes the connection
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    
    // Set an attribute to show errors, which helps in debugging
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
} catch(PDOException $e) {
    // If the connection fails, stop everything and show an error
    die("ERROR: Could not connect to the database. " . $e->getMessage());
}
?>