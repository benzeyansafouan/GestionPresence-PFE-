<?php
  require_once('Connection.php');
$apogee = $_POST['apogee'];
$matiere = $_POST['matiere'];
$filiere = $_POST['filiere'];
//    $_POST['apogee'];
    
$db = new DB();
$db->connect();
$checks = $db->saveSeanceLpMstr($apogee,$matiere,$filiere);

echo json_encode($checks);





?>