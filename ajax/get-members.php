<?php
include '../include/conn.php';

// Read only the id from external customers DB users table
$query = mysqli_query($conn2, "SELECT id FROM users WHERE is_guest = 0 ORDER BY id");

while ($row = mysqli_fetch_array($query)) {
    echo '<option value="' . $row['id'] . '">' . $row['id'] . '</option>';
}
?>
