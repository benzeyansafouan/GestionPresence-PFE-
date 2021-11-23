<?php
  require_once('Connection.php');
$apogee = $_POST['apogee'];
//    $_POST['apogee'];
    
$db = new DB();
$db->connect();
$checks = $db->searchStudentLp($apogee);

echo json_encode($checks);





?>