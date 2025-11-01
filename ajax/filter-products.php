<?php
include '../include/conn.php';
include __DIR__ . '/../include/product_renderer.php';

$search = trim($_GET['search'] ?? '');
$status = $_GET['status'] ?? '';
$sort = $_GET['sort'] ?? 'name';
$stockStatus = $_GET['stock_status'] ?? '';
$lowStockThreshold = 10;

$conditions = [];

if ($status !== '' && ($status === '0' || $status === '1')) {
    $conditions[] = 'p.is_active = ' . (int)$status;
}

if ($search !== '') {
    $escapedSearch = mysqli_real_escape_string($conn2, $search);
    $conditions[] = "(p.name LIKE '%$escapedSearch%' OR p.brand LIKE '%$escapedSearch%' OR c.name LIKE '%$escapedSearch%')";
}

$sql = "
    SELECT 
        p.id,
        p.name,
        p.brand,
        p.price,
        p.sale_price,
        p.is_active,
        p.is_out_of_stock,
        p.stock_quantity,
        p.category_id,
        p.created_at,
        p.updated_at,
        c.name AS category_name
    FROM products p
    LEFT JOIN categories c ON p.category_id = c.id
";

if (!empty($conditions)) {
    $sql .= ' WHERE ' . implode(' AND ', $conditions);
}

switch ($sort) {
    case 'sku':
        $sql .= ' ORDER BY p.id ASC';
        break;
    case 'stock_quantity':
        $sql .= ' ORDER BY p.stock_quantity ASC';
        break;
    case 'created_at':
        $sql .= ' ORDER BY p.created_at DESC';
        break;
    default:
        $sql .= ' ORDER BY p.name ASC';
        break;
}

$result = mysqli_query($conn2, $sql);

if (!$result) {
    echo '<tr class="no-data"><td colspan="7" class="px-6 py-4 text-center text-red-500">Error loading products</td></tr>';
    exit;
}

$html = '';
$mobileHtml = '';

while ($row = mysqli_fetch_assoc($result)) {
    $normalized = normalize_mobile_product($row, $lowStockThreshold);

    $stockQty = (int)$normalized['stock_quantity'];
    $isOutOfStock = (int)$normalized['is_out_of_stock'] === 1 || $stockQty <= 0;
    $isLowStock = !$isOutOfStock && $stockQty <= $lowStockThreshold;

    $include = true;
    switch ($stockStatus) {
        case 'in_stock':
            $include = !$isOutOfStock && !$isLowStock;
            break;
        case 'low_stock':
            $include = $isLowStock;
            break;
        case 'out_stock':
            $include = $isOutOfStock;
            break;
    }

    if (!$include) {
        continue;
    }

    $snippets = build_product_html($normalized, $lowStockThreshold);
    $html .= $snippets['desktop'];
    $mobileHtml .= $snippets['mobile'];
}

if ($html === '') {
    $html = '<tr class="no-data"><td colspan="7" class="px-6 py-4 text-center text-gray-500">No products found</td></tr>';
    $mobileHtml = '<div id="mobile-empty-state" class="p-8 text-center text-gray-500">No products found</div>';
}

echo '<div id="mobile-data" style="display: none;">' . $mobileHtml . '</div>';
echo $html;
?>
