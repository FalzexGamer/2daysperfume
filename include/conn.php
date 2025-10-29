<?php
// $conn = mysqli_connect('powershareserver.com', 'powersha_pos', 'Condition5594.', 'powersha_pos');

// if ($conn->connect_error) {
//     die("Connection failed: " . $conn->connect_error);
// }

$conn = mysqli_connect('localhost', 'root', '', '2daysperfume');

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$conn2 = mysqli_connect('localhost', 'root', '', '2daysperfume_mobile');

if ($conn2->connect_error) {
    die("Connection failed: " . $conn2->connect_error);
}
