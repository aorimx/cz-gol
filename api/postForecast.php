<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cazagol";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

for ($i=1; $i <= 4; $i++) {
    $itemName="partido".$i;
    $sql = "INSERT INTO predicciones(id_partido,id_usuario,resultado) values ('".$i."','".$_POST['user']."','".$_POST[$itemName]."')";
    
    if ($conn->query($sql) === TRUE) {
        
    } else {
    }
}
$conn->close();

$data=array();
$item=["message"=>'Tu pronostico ha sido agregado con exito. Por favor no vuelvas a ingresar los datos ¡Haz paro!'];

header('Content-Type: application/json');
echo json_encode(['data'=>$item]);
?>