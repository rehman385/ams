<?php
// ---- DATABASE CONNECTION ----
// Replace with your actual Render credentials

$host = 'dpg-d3oj7bu3jp1c73c1nbjg-a.singapore-postgres.render.com';
$port = '5432';
$dbname = 'attendance_db_0m4z';
$user = 'attendance_user';
$password = 'DaA9WAX7JkCPewNE8DjNA3AxCQ9xXKux'; // Your actual password

// Create the connection string (DSN) for PostgreSQL
$dsn = "pgsql:host={$host};port={$port};dbname={$dbname}";

// Set PDO options
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, // Throw exceptions on error
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,       // Fetch associative arrays
    PDO::ATTR_EMULATE_PREPARES   => false,
];

// Try to connect to the database
try {
     $pdo = new PDO($dsn, $user, $password, $options);
     // If you see this message on your site, it means the connection was successful!
     // echo "Database connection successful!"; 
} catch (\PDOException $e) {
     // If connection fails, stop the script and show an error message.
     // For a live website, you would log this error instead of showing it to the user.
     throw new \PDOException($e->getMessage(), (int)$e->getCode());
}