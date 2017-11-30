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
    
    while($partido = mysqli_fetch_assoc($result)) {
        $sql = "SELECT * FROM equipos WHERE id=".$partido['id_casa'];
        $equipoCasa = $conn->query($sql)->fetch_object();
        $sql = "SELECT * FROM equipos WHERE id=".$partido['id_visita'];
        $equipoVisita = $conn->query($sql)->fetch_object();

        $item="<h3>".$equipoCasa->name." vs ".$equipoVisita->name." <small>".$partido['fecha']."</small></h3>
        <select name=\"partido".$partido['id']."\" id=\"partido".$partido['id']."\">
          <option value=\"".$equipoCasa->id."\">Gana ".$equipoCasa->name."</option>
          <option value=\"empate\">Empatan</option>
          <option value=\"".$equipoVisita->id."\">Gana ".$equipoVisita->name."</option>
        </select>";
        $data[]=$item;
    }
}
$conn->close();
header('Content-Type: application/json');
echo json_encode(['data'=>$data]);
?>