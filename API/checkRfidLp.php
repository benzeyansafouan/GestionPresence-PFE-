<?php
  require_once('Connection.php');
$rfid = $_POST['rfid'];
//    $_POST['rfid'];
    
$db = new DB();
$db->connect();
$checks = $db->checkRfidLP($rfid);

echo json_encode($checks);





?>