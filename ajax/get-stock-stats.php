<?php
include __DIR__ . '/../include/conn.php';

$lowStockThreshold = 10;

$stats = [
    'total' => 0,
    'in_stock' => 0,
    'low_stock' => 0,
    'out_stock' => 0,
];

$sql = "SELECT stock_quantity, is_out_of_stock, is_active FROM products";
$result = mysqli_query($conn2, $sql);

if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        if ((int)$row['is_active'] !== 1) {
            continue;
        }

        $stats['total']++;

        $stockQty = (int)$row['stock_quantity'];
        $isOutOfStock = (int)$row['is_out_of_stock'] === 1 || $stockQty <= 0;
        $isLowStock = !$isOutOfStock && $stockQty <= $lowStockThreshold;

        if ($isOutOfStock) {
            $stats['out_stock']++;
        } elseif ($isLowStock) {
            $stats['low_stock']++;
        } else {
            $stats['in_stock']++;
        }
    }
}

header('Content-Type: application/json');
echo json_encode($stats);
?>
