<?php
include '../include/conn.php';

$id = $_GET['id'] ?? 0;

if (!$id) {
    echo json_encode(['success' => false, 'message' => 'Member ID required']);
    exit;
}

// Use prepared statement for security - soft delete by setting is_guest to 1
$stmt = mysqli_prepare($conn2, "UPDATE users SET is_guest = 1, updated_at = NOW() WHERE id = ? AND is_guest = 0");
mysqli_stmt_bind_param($stmt, "i", $id);
$result = mysqli_stmt_execute($stmt);

if ($result) {
    echo json_encode(['success' => true, 'message' => 'Member deactivated successfully']);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to deactivate member: ' . mysqli_error($conn2)]);
}

mysqli_stmt_close($stmt);
?>
