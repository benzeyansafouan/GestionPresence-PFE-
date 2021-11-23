<?php
  require_once('Connection.php');


$db = new DB();
$db->connect();
$filiere = $db->getFiliere();

echo json_encode($filiere);

?>