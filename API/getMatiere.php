<?php
  require_once('Connection.php');


$db = new DB();
$db->connect();
$matiere = $db->getMatiere();

echo json_encode($matiere);

?>