<?php
include 'dbh_conn.php';


function insertNewUser($usernName, $password, $zone, $city, $sCode){

   $sql = INSERT INTO users (UserName, Password, Zone, City, StateCode)
VALUES ($usernName, $password, $zone, $city, $sCode );

$result = mysqli_query($conn, $sql)

}

