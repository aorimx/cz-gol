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

$sql = "SELECT * FROM partidos";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $data=array();
    while($row = mysqli_fetch_assoc($result)) {
       
        $item="<h3>".$row['id_casa']." vs ".$row['id_visita']." <small>Miercoles 29</small></h3>
        <select name=\"partido1\" id=\"\">
          <option value=\"\">Gana</option>
          <option value=\"\">Empatan</option>
          <option value=\"\">Pierde</option>
        </select>";
        $data[]=$item;
    }
}
$conn->close();
header('Content-Type: application/json');
echo json_encode(array('data'=>$data));
?>