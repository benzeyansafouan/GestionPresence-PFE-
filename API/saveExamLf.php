<?php
  require_once('Connection.php');
$apogee = $_POST['apogee'];
$matiere = $_POST['matiere'];
//    $_POST['apogee'];
    
$db = new DB();
$db->connect();
$checks = $db->saveExamLf($apogee,$matiere);

echo json_encode($checks);





?>