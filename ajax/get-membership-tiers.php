<?php
include '../include/conn.php';

// Get active royal tiers from igoldser_perfume2days database
$query = "SELECT id, tier_name as name, tier_level, min_points, max_points, tier_color, benefits FROM royal_tiers WHERE is_active = 1 ORDER BY tier_level ASC";
$result = mysqli_query($conn2, $query);

$tiers = [];
if ($result && mysqli_num_rows($result) > 0) {
    while ($tier = mysqli_fetch_assoc($result)) {
        $tiers[] = [
            'id' => $tier['id'],
            'name' => $tier['name'],
            'tier_level' => intval($tier['tier_level']),
            'min_points' => intval($tier['min_points']),
            'max_points' => $tier['max_points'] ? intval($tier['max_points']) : null,
            'tier_color' => $tier['tier_color'],
            'benefits' => $tier['benefits'],
            'discount_percentage' => 0 // No discount system in royal_tiers
        ];
    }
}

echo json_encode([
    'success' => true,
    'tiers' => $tiers
]);

mysqli_free_result($result);
?>
