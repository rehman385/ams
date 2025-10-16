<?php
// This is the correct code for connecting to your Render PostgreSQL database

// Step 1: Get the special database URL from the Render environment
$db_url = getenv("DATABASE_URL");

// If the URL isn't found, stop everything!
if ($db_url === false) {
    die("ERROR: DATABASE_URL environment variable is not set.");
}

// Step 2: Parse the URL into its individual parts
$db_parts = parse_url($db_url);

$host = $db_parts['host'];
$port = $db_parts['port'];
$dbname = ltrim($db_parts['path'], '/');
$username = $db_parts['user'];
$password = $db_parts['pass'];

try {
    // Step 3: Create the connection using the pgsql driver and the correct parts
    $pdo = new PDO("pgsql:host=$host;port=$port;dbname=$dbname", $username, $password);
    
    // Set an attribute to show errors, which helps in debugging
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
} catch(PDOException $e) {
    // If the connection fails, this error will show up in your Render logs
    die("ERROR: Could not connect to the database. " . $e->getMessage());
}
?>