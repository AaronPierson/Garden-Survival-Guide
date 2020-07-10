<?php
include 'dbh_conn.php';

$userName = $_POST['name'];
$password =  $_POST['password'];
$zone =  $_POST['zone'];
$city =  $_POST['city'];
$sCode =  $_POST['State-Code'];


   $sql = INSERT INTO users (UserName, Password, Zone, City, StateCode);
VALUES ($userName, $password, $zone, $city, $sCode );

$result = mysqli_query($conn, $sql)

header("Location: ../signup.html?signup=success");

