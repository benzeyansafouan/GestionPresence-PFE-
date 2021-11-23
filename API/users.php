<?php
  require_once('Connection.php');
$username = $_POST['username'];
$password = $_POST['password'];


$db = new DB();
$db->connect();
$users = $db->getUsers($username,$password);

echo json_encode($users);





?>