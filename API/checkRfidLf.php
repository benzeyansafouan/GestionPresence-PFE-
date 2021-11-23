<?php
  require_once('Connection.php');
$rfid = $_POST['rfid'];
//    $_POST['rfid'];
    
$db = new DB();
$db->connect();
$checks = $db->checkRfidLF($rfid);

echo json_encode($checks);





?>