<?php

$dbServername = "localhost";
$dbUsername = "root";
$dbPassword = "";
$dbName = "garden_survial_guide";

$conn = new mysqli_connect($dbServername, $dbUsername, $dbPassword, $dbName);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  }
  echo "Connected successfully";
  ?>