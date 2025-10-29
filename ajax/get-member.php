<?php
include '../include/conn.php';

$id = $_GET['id'] ?? 0;

if (!$id) {
    echo json_encode(['error' => 'Member ID required']);
    exit;
}

// Use prepared statement for security
$stmt = mysqli_prepare($conn2, "SELECT u.*, ulp.tier, ulp.total_spent, ulp.points
                                FROM users u 
                                LEFT JOIN user_loyalty_points ulp ON u.id = ulp.user_id 
                                WHERE u.id = ? AND u.is_guest = 0");
mysqli_stmt_bind_param($stmt, "i", $id);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$user = mysqli_fetch_array($result);

if (!$user) {
    echo json_encode(['error' => 'Member not found']);
    exit;
}

// Format the response to match the expected structure
$member = [
    'id' => $user['id'],
    'name' => trim($user['first_name'] . ' ' . $user['last_name']),
    'first_name' => $user['first_name'],
    'last_name' => $user['last_name'],
    'email' => $user['email'],
    'phone' => $user['phone'],
    'address' => $user['address'],
    'is_active' => !$user['is_guest'],
    'tier' => $user['tier'] ?: 'bronze',
    'total_spent' => $user['total_spent'] ?: 0,
    'points' => $user['points'] ?: 0,
    'created_at' => $user['created_at']
];

echo json_encode($member);
mysqli_stmt_close($stmt);
?>
