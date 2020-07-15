<?php

$dbServername = "localhost";
$dbUsername = "root";
$dbPassword = "";
$dbName = "garden_survival_guide";

$conn =  mysqli_connect($dbServername, $dbUsername, $dbPassword, $dbName);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?>