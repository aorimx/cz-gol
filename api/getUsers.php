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

$sql = "SELECT id, username FROM usuarios ORDER BY username";
$result = $conn->query($sql);
$i=0;

if ($result->num_rows > 0) {
    $data=array();
    while($row = mysqli_fetch_assoc($result)) {
        $data[]=$row;
        $i++;
    }
}
$conn->close();
header('Content-Type: application/json');
echo json_encode(array('data'=>$data));
?>