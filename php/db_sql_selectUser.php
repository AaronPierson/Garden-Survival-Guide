<?php
include 'dbh_conn.php';

$userName = mysqli_real_escape_string($conn, $_POST['name']);
$password =  mysqli_real_escape_string($conn, $_POST['password']);

// sql template
$sql = "SELECT * FROM users WHERE UserName=? AND Password=?;";
//Create a prepared statment
$stmt = mysqli_stmt_init($conn);
//Prepare the prepared
if(!mysqli_stmt_prepare($stmt, $sql)){
 echo "SQL Failed";
}else{
    //Bind para to the placeholder
    mysqli_stmt_bind_param($stmt, "ss", $userName, $password);
    //Run param inside database
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    while($row = mysqli_fetch_assoc(($result))){
        echo $row['user_ID'] . "<br>";
    }

}


