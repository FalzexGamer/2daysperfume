<?php
include '../include/conn.php';

// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

$search = trim($_GET['search'] ?? '');

// Log the search term
error_log("Search term: " . $search);

// Only search if there's a search term
if (!empty($search)) {
    // If the search is purely numeric, match EXACT id only
    if (preg_match('/^\d+$/', $search)) {
        $id = (int)$search;
        $query = "SELECT u.*, ulp.tier, ulp.total_spent
                  FROM users u
                  LEFT JOIN user_loyalty_points ulp ON u.id = ulp.user_id
                  WHERE u.is_guest = 0
                  AND u.id = ?
                  ORDER BY u.id ASC";
        $stmt = mysqli_prepare($conn2, $query);
        mysqli_stmt_bind_param($stmt, "i", $id);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
    } else {
        // For non-numeric input, return empty to avoid fuzzy matches
        $result = false;
    }
} else {
    // Return empty result when no search term
    $result = false;
}

$members = [];

if ($result && mysqli_num_rows($result) > 0) {
    error_log("Found " . mysqli_num_rows($result) . " users");
    while ($user = mysqli_fetch_assoc($result)) {
        $members[] = [
            'id' => $user['id'],
            'name' => trim($user['first_name'] . ' ' . $user['last_name']),
            'member_code' => $user['email'], // Using email as member code
            'phone' => $user['phone'],
            'email' => $user['email'],
            'tier_name' => ucfirst($user['tier'] ?: 'Bronze'),
            'discount_percentage' => 0, // No discount system in users table
            'total_spent' => floatval($user['total_spent'] ?: 0)
        ];
    }
} else {
    error_log("No users found. Result: " . ($result ? "valid" : "invalid"));
    if ($result) {
        error_log("Number of rows: " . mysqli_num_rows($result));
    }
}

$response = [
    'success' => true,
    'members' => $members
];

error_log("Sending response: " . json_encode($response));
echo json_encode($response);

if (isset($stmt)) {
    mysqli_stmt_close($stmt);
}
?>
