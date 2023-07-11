<?php
// Database configuration
$dbHost = "localhost";
$dbUsername = "";
$dbPassword = "";
$dbName = "student";

// Create a database connection
$con = mysqli_connect($dbHost, $dbUsername, $dbPassword, $dbName);

// Check connection
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}

// Email configuration
$fromEmail = "winash2626@gmail.com"; // The email address you want to use as the sender

?>
