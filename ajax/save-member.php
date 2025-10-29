<?php
include '../include/conn.php';

// Get form data
$first_name = $_POST['first_name'] ?? '';
$last_name = $_POST['last_name'] ?? '';
$phone = $_POST['phone'] ?? '';
$email = $_POST['email'] ?? '';
$address = $_POST['address'] ?? '';
$tier = $_POST['tier'] ?? 'bronze';
$is_active = isset($_POST['is_active']) ? 0 : 1; // Inverted logic: is_active=1 means is_guest=0

// Validation
if (empty($first_name) || empty($last_name) || empty($email)) {
    echo json_encode(['success' => false, 'message' => 'First Name, Last Name, and Email are required']);
    exit;
}

// Check if email already exists
$stmt_check = mysqli_prepare($conn2, "SELECT id FROM users WHERE email = ? AND is_guest = 0");
mysqli_stmt_bind_param($stmt_check, "s", $email);
mysqli_stmt_execute($stmt_check);
$result_check = mysqli_stmt_get_result($stmt_check);

if (mysqli_num_rows($result_check) > 0) {
    echo json_encode(['success' => false, 'message' => 'Email already exists']);
    exit;
}

// Insert new user
$stmt_insert = mysqli_prepare($conn2, "
    INSERT INTO users (first_name, last_name, phone, email, address, is_guest, created_at, updated_at)
    VALUES (?, ?, ?, ?, ?, ?, NOW(), NOW())
");

mysqli_stmt_bind_param($stmt_insert, "sssssi",
    $first_name,
    $last_name,
    $phone,
    $email,
    $address,
    $is_active
);

if (mysqli_stmt_execute($stmt_insert)) {
    $user_id = mysqli_insert_id($conn2);
    
    // Insert loyalty points record
    $stmt_loyalty = mysqli_prepare($conn2, "
        INSERT INTO user_loyalty_points (user_id, tier, total_spent, points, created_at, updated_at)
        VALUES (?, ?, 0, 0, NOW(), NOW())
    ");
    
    mysqli_stmt_bind_param($stmt_loyalty, "is", $user_id, $tier);
    mysqli_stmt_execute($stmt_loyalty);
    mysqli_stmt_close($stmt_loyalty);
    
    echo json_encode(['success' => true, 'message' => 'Member saved successfully']);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to save member: ' . mysqli_error($conn2)]);
}

mysqli_stmt_close($stmt_check);
mysqli_stmt_close($stmt_insert);
?>
