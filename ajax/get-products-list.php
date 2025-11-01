<?php
include '../include/conn.php';
include __DIR__ . '/../include/product_renderer.php';

$lowStockThreshold = 10;

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
    ORDER BY p.name
";

$result = mysqli_query($conn2, $sql);

if (!$result) {
    echo '<tr class="no-data"><td colspan="7" class="px-6 py-12 text-center text-red-500">Unable to load products from remote database.</td></tr>';
    exit;
}

$html = '';
$mobileHtml = '';

while ($row = mysqli_fetch_assoc($result)) {
    $normalized = normalize_mobile_product($row, $lowStockThreshold);
    $snippets = build_product_html($normalized, $lowStockThreshold);
    $html .= $snippets['desktop'];
    $mobileHtml .= $snippets['mobile'];
}

if ($html === '') {
    $html = '<tr class="no-data">
        <td colspan="7" class="px-6 py-12 text-center">
            <div class="flex flex-col items-center space-y-4">
                <div class="w-16 h-16 bg-gray-100 rounded-full flex items-center justify-center">
                    <i class="fas fa-box-open text-2xl text-gray-400"></i>
                </div>
                <div>
                    <h3 class="text-lg font-medium text-gray-900">No products found</h3>
                    <p class="text-sm text-gray-500 mt-1">Products from the mobile catalog will appear here once synced.</p>
                </div>
            </div>
        </td>
    </tr>';
    $mobileHtml = '<div id="mobile-empty-state" class="p-8 text-center text-gray-500">No products found</div>';
}

echo '<div id="mobile-data" style="display: none;">' . $mobileHtml . '</div>';
echo $html;
?>
