<?php

  class DB {
  public $database;
      
      public function connect(){
       
  try
    {
    $this->database = new PDO('mysql:host=127.0.0.1;dbname=gestionpresence','root','');
    $this->database->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//        echo "Connected <br><br><br>";
    }
    catch(Exception $e)
    {
        echo $e ->getMessage();
        die('Error: could not connect');
    }
      
      }
      public function getUsers($username,$password){
          
      
          $sql_query = "SELECT * FROM admin WHERE userName='".$username."' and pass='".$password."' ";
        $results = $this->database->query($sql_query);


      $data = [];
while($row = $results->fetch(PDO::FETCH_ASSOC)){
//     var_dump($row);
    $data[]=$row;
     }

return $data;
      
      }
      
      
      public function getFiliere(){
      
      $sql_query = "select * FROM filiere";
        $results = $this->database->query($sql_query);


      $data = [];
while($row = $results->fetch(PDO::FETCH_ASSOC)){

    $data["data"][]=$row;
     }

return $data;
      
      }
      
      
      public function getMatiere(){
      
      $sql_query = "select * FROM matiere";
        $results = $this->database->query($sql_query);


      $data = [];
while($row = $results->fetch(PDO::FETCH_ASSOC)){

    $data["data"][]=$row;
     }

return $data;
      
      }
      
      public function checkRfidLF($rfid){
          
      
          $sql_query = "SELECT * FROM etudiant_lf where rfid='".$rfid."'";
        $results = $this->database->query($sql_query);


      $data = [];
while($row = $results->fetch(PDO::FETCH_ASSOC)){
//     var_dump($row);
    $data["data"]=$row;
     }

return $data;
      
      }
      
      public function checkRfidLP($rfid){
          
      
          $sql_query = "SELECT * FROM etudiant_lp_mstr where rfid2='".$rfid."'";
        $results = $this->database->query($sql_query);


      $data = [];
while($row = $results->fetch(PDO::FETCH_ASSOC)){
//     var_dump($row);
    $data["data"]=$row;
     }

return $data;
      
      }
      
      
      
      
      public function searchStudentLf($apogee){
          
      
          $sql_query = "select * from etudiant_lf where code_apogee='".$apogee."'";
        $results = $this->database->query($sql_query);


      $data = [];
while($row = $results->fetch(PDO::FETCH_ASSOC)){
//     var_dump($row);
    $data["data"]=$row;
     }

return $data;
      
      }
      
      
      public function searchStudentLp($apogee){
          
      
          $sql_query = "select * from etudiant_lp_mstr where code_apogee2='".$apogee."'";
        $results = $this->database->query($sql_query);


      $data = [];
while($row = $results->fetch(PDO::FETCH_ASSOC)){
//     var_dump($row);
    $data["data"]=$row;
     }

return $data;
      
      }
      
      
      
      
      
        public function saveExamLf($apogee,$matiere){
          
      
          $sql_query = "UPDATE exam_lf set presence = 'present(e)' WHERE code_apogee= '".$apogee."' and code_matiere= (select code_matiere from matiere where libelle_matiere='".$matiere."')";
        $results = $this->database->query($sql_query);


      $data = "Exam saved";
//while($row = $results->fetch(PDO::FETCH_ASSOC)){
////     var_dump($row);
//    $data["data"]=$row;
//     }

return $data;
      
      }
      
      
      public function saveExamLpMstr($apogee,$matiere){
          
      
          $sql_query = "UPDATE exam_lp_mstr set presence2 = 'present(e)' WHERE code_apogee2= '".$apogee."' and code_matiere2 = (select code_matiere from matiere where libelle_matiere='".$matiere."')";
        $results = $this->database->query($sql_query);


      $data = "Exam saved";
//while($row = $results->fetch(PDO::FETCH_ASSOC)){
////     var_dump($row);
//    $data["data"]=$row;
//     }

return $data;
      
      }
      
      
      public function saveSeanceLpMstr($apogee,$matiere,$filiere){
          
      
          $sql_query = "INSERT INTO `seance_lp_mstr` (`code_seance`, `filiere`, `code_matiere3`, `code_apogee3`, `dateSeance`, `professeur3`, `presence3`) VALUES (NULL,cast((SELECT code_filiere from filiere where libelle_filiere='".$filiere."') as varchar(30))  ,cast((select code_matiere from matiere where libelle_matiere='".$matiere."') as varchar(30)) , '".$apogee."', CURRENT_DATE(), 'NULL', 'present(e)')";
        $results = $this->database->query($sql_query);


      $data = "Exam saved";
//while($row = $results->fetch(PDO::FETCH_ASSOC)){
////     var_dump($row);
//    $data["data"]=$row;
//     }

return $data;
      
      }
  
  
  }




  













//        try {
//        $connect = new mysqli('127.0.0.1','root','','gestionpresence');
//            
//            
//        }
//catch(Exception $e)
//    {
//        echo $e ->getMessage();
//        die('Error: could not connect');
//    }
// if($connect){}
//else {echo "Connection Failed";
//     exit();
//     }
//        






    try
    {
    $database = new PDO('mysql:host=127.0.0.1;dbname=gestionpresence','root','');
    $database->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//        echo "Connected <br><br><br>";
    }
    catch(Exception $e)
    {
        echo $e ->getMessage();
        die('Error: could not connect');
    }
     
        $sql_query = "SELECT * FROM admin";
        $results = $database->query($sql_query);


      $data = [];
while($row = $results->fetch(PDO::FETCH_ASSOC)){
//     var_dump($row);
    $data[]=$row;
     }

return $data;
    
?>