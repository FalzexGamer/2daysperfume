<?php
include '../include/conn.php';

// Get form data
$id = $_POST['id'] ?? 0;
$first_name = $_POST['first_name'] ?? '';
$last_name = $_POST['last_name'] ?? '';
$phone = $_POST['phone'] ?? '';
$email = $_POST['email'] ?? '';
$address = $_POST['address'] ?? '';
$tier = $_POST['tier'] ?? 'bronze';
$is_active = isset($_POST['is_active']) ? 0 : 1; // Inverted logic: is_active=1 means is_guest=0

// Validation
if (!$id || empty($first_name) || empty($last_name) || empty($email)) {
    echo json_encode(['success' => false, 'message' => 'ID, First Name, Last Name, and Email are required']);
    exit;
}

// Check if email already exists for another user
$stmt_check = mysqli_prepare($conn2, "SELECT id FROM users WHERE email = ? AND id != ? AND is_guest = 0");
mysqli_stmt_bind_param($stmt_check, "si", $email, $id);
mysqli_stmt_execute($stmt_check);
$result_check = mysqli_stmt_get_result($stmt_check);

if (mysqli_num_rows($result_check) > 0) {
    echo json_encode(['success' => false, 'message' => 'Email already exists for another user']);
    exit;
}

// Update user
$stmt_update = mysqli_prepare($conn2, "
    UPDATE users 
    SET first_name = ?, last_name = ?, phone = ?, email = ?, address = ?, is_guest = ?, updated_at = NOW()
    WHERE id = ? AND is_guest = 0
");

mysqli_stmt_bind_param($stmt_update, "sssssii",
    $first_name,
    $last_name,
    $phone,
    $email,
    $address,
    $is_active,
    $id
);

if (mysqli_stmt_execute($stmt_update)) {
    // Update loyalty points tier
    $stmt_loyalty = mysqli_prepare($conn2, "
        UPDATE user_loyalty_points 
        SET tier = ?, updated_at = NOW()
        WHERE user_id = ?
    ");
    
    mysqli_stmt_bind_param($stmt_loyalty, "si", $tier, $id);
    mysqli_stmt_execute($stmt_loyalty);
    mysqli_stmt_close($stmt_loyalty);
    
    echo json_encode(['success' => true, 'message' => 'Member updated successfully']);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to update member: ' . mysqli_error($conn2)]);
}

mysqli_stmt_close($stmt_check);
mysqli_stmt_close($stmt_update);
?>
