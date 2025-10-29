<?php
include '../include/conn.php';

// Get total members count
$total_query = "SELECT COUNT(*) as total FROM users WHERE is_guest = 0";
$total_result = mysqli_query($conn2, $total_query);
$total = mysqli_fetch_assoc($total_result)['total'];

// Get active members count (non-guests are considered active)
$active_query = "SELECT COUNT(*) as active FROM users WHERE is_guest = 0";
$active_result = mysqli_query($conn2, $active_query);
$active = mysqli_fetch_assoc($active_result)['active'];

// Get inactive members count (guests are considered inactive)
$inactive_query = "SELECT COUNT(*) as inactive FROM users WHERE is_guest = 1";
$inactive_result = mysqli_query($conn2, $inactive_query);
$inactive = mysqli_fetch_assoc($inactive_result)['inactive'];

// Get premium members count (Gold and Platinum tiers)
$premium_query = "SELECT COUNT(DISTINCT u.id) as premium 
                  FROM users u 
                  LEFT JOIN user_loyalty_points ulp ON u.id = ulp.user_id 
                  WHERE u.is_guest = 0 AND u.is_active = 1 
                  AND (ulp.tier = 'gold' OR ulp.tier = 'platinum')";
$premium_result = mysqli_query($conn2, $premium_query);
$premium = mysqli_fetch_assoc($premium_result)['premium'];

echo json_encode([
    'total' => (int)$total,
    'active' => (int)$active,
    'inactive' => (int)$inactive,
    'premium' => (int)$premium
]);
?>
