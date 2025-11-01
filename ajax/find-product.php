<?php
// Suppress any output that might interfere with our response
ob_start();

include '../include/conn.php';

if (!$conn2 || $conn2->connect_error) {
    ob_clean();
    echo "ERROR: Database connection failed";
    exit;
}

// Clear any output buffer content
ob_clean();

// Start session if not already started
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

$entry = $_POST['entry'] ?? '';

if (empty($entry)) {
    echo "ERROR: Entry is required";
    exit;
}

// Search for product by barcode or SKU only (exact matches)
$entry = mysqli_real_escape_string($conn2, $entry); // Sanitize input for remote DB

$conditions = [];

// Check if entry matches synthetic SKU pattern P000123
if (preg_match('/^P(\d{1,})$/i', $entry, $matches)) {
    $productId = intval($matches[1]);
    $conditions[] = "p.id = $productId";
}

// Numeric entry could be direct product ID
if (ctype_digit($entry)) {
    $productId = intval($entry);
    $conditions[] = "p.id = $productId";
}

// Fallback to name search
$conditions[] = "p.name LIKE '%$entry%'";

$whereClause = implode(' OR ', $conditions);

$query = "SELECT p.id, p.name, p.price, p.sale_price, p.stock_quantity, c.name AS category_name 
          FROM products p 
          LEFT JOIN categories c ON p.category_id = c.id 
          WHERE ($whereClause) AND p.is_active = 1 
          ORDER BY p.id ASC 
          LIMIT 1";

$result = mysqli_query($conn2, $query);
if (!$result) {
    echo "ERROR: Database query failed: " . mysqli_error($conn);
    exit;
}

if ($result && mysqli_num_rows($result) > 0) {
    $product = mysqli_fetch_assoc($result);

    $stockQty = isset($product['stock_quantity']) ? (int)$product['stock_quantity'] : 0;
    if ($stockQty > 0) {
        $price = 0.0;
        if (isset($product['sale_price']) && $product['sale_price'] !== '' && $product['sale_price'] !== null && (float)$product['sale_price'] > 0) {
            $price = (float)$product['sale_price'];
        } elseif (isset($product['price']) && $product['price'] !== '' && $product['price'] !== null) {
            $price = (float)$product['price'];
        }

        $sku = 'P' . str_pad((string)$product['id'], 6, '0', STR_PAD_LEFT);
        $categoryName = $product['category_name'] ?? 'Uncategorized';

        echo "SUCCESS: " . $product['id'] . "|" . $product['name'] . "|" . $sku . "|" . '' . "|" . $price . "|" . $stockQty . "|" . $categoryName . "|pcs";
    } else {
        echo "ERROR: Product \"" . $product['name'] . "\" is out of stock";
    }
} else {
    echo "ERROR: Product not found. Please enter a valid product reference: " . $entry;
}

// Ensure we always have a proper response
if (!headers_sent()) {
    header('Content-Type: text/plain');
    header('Cache-Control: no-cache, no-store, must-revalidate');
}

// End output buffering and send response
ob_end_flush();
?>
