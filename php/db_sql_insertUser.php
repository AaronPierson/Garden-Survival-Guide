 <?php
include 'dbh_conn.php';

$userName = mysqli_real_escape_string($conn, $_POST['name']);
$password =  mysqli_real_escape_string($conn, $_POST['password']);
$zone =  mysqli_real_escape_string($conn, $_POST['zone']);
$city =  mysqli_real_escape_string($conn, $_POST['city']);
$sCode =  mysqli_real_escape_string($conn, $_POST['State-Code']);


   $sql = "INSERT INTO users (UserName, Password, Zone, City, StateCode)
VALUES ('?', '?', '?', '?', '?')";

//Create a prepared statment
$stmt = mysqli_stmt_init($conn);

if(!mysqli_stmt_prepare($stmt, $sql)){
   echo "SQL error";
}else{
   mysqli_stmt_bind_param($stmt, "sssss", $userName, $password, $zone, $city, $sCode);
   mysqli_stmt_execute($stmt);
}

$result = mysqli_query($conn, $sql);
header("Location: ../signup.html?signup=success");

