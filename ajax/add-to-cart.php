<?php
include '../include/conn.php';

// Start session if not already started
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

$product_id = $_POST['product_id'] ?? 0;
$quantity = $_POST['quantity'] ?? 1; // Default to 1 if not specified
$user_id = $_SESSION['user_id'] ?? 0;

if (!$product_id || !$user_id) {
    echo "ERROR: Invalid product ID or user not authenticated";
    exit;
}

// Validate quantity
$quantity = intval($quantity);
if ($quantity <= 0) {
    echo "ERROR: Invalid quantity";
    exit;
}

// Get product details (using regular query for compatibility)
$product_id = intval($product_id); // Sanitize input
$query = "SELECT id, name, price, sale_price, stock_quantity FROM products WHERE id = $product_id AND is_active = 1";
$result = mysqli_query($conn2, $query);
$product = mysqli_fetch_assoc($result);

if (!$product) {
    echo "ERROR: Product not found";
    exit;
}

// Check stock availability
if ((int)$product['stock_quantity'] <= 0) {
    echo "ERROR: Product \"" . $product['name'] . "\" is out of stock";
    exit;
}

$price = 0.0;
if (isset($product['sale_price']) && $product['sale_price'] !== '' && $product['sale_price'] !== null && (float)$product['sale_price'] > 0) {
    $price = (float)$product['sale_price'];
} elseif (isset($product['price']) && $product['price'] !== '' && $product['price'] !== null) {
    $price = (float)$product['price'];
}

$sku = 'P' . str_pad((string)$product['id'], 6, '0', STR_PAD_LEFT);
$availableStock = (int)$product['stock_quantity'];

if ($quantity > $availableStock) {
    echo "ERROR: Requested quantity exceeds available stock";
    exit;
}

// Check if product already in cart (using regular query for compatibility)
$user_id = intval($user_id); // Sanitize input
$query_existing = "
    SELECT id, quantity, price, subtotal 
    FROM cart 
    WHERE user_id = $user_id AND product_id = $product_id AND status = 'active'
";
$result_existing = mysqli_query($conn, $query_existing);
$existing_item = mysqli_fetch_array($result_existing);

if ($existing_item) {
    // Update existing item quantity
    $new_quantity = $existing_item['quantity'] + $quantity;
    if ($new_quantity > $availableStock) {
        echo "ERROR: Requested quantity exceeds available stock";
        exit;
    }

    $new_subtotal = $new_quantity * $existing_item['price'];
    $cart_id = intval($existing_item['id']);
    
    $update_query = "
        UPDATE cart 
        SET quantity = $new_quantity, subtotal = $new_subtotal, updated_at = CURRENT_TIMESTAMP 
        WHERE id = $cart_id
    ";
    $update_result = mysqli_query($conn, $update_query);
    
    if ($update_result) {
        echo "SUCCESS: Product quantity updated in cart";
    } else {
        echo "ERROR: Failed to update cart: " . mysqli_error($conn);
    }
} else {
    // Add new item to cart
    $price = floatval($price);
    $subtotal = $price * $quantity;
    $sku = mysqli_real_escape_string($conn, $sku);
    
    $insert_query = "
        INSERT INTO cart (user_id, product_id, sku, quantity, price, subtotal) 
        VALUES ($user_id, $product_id, '$sku', $quantity, $price, $subtotal) 
    ";
    $insert_result = mysqli_query($conn, $insert_query);
    
    if ($insert_result) {
        echo "SUCCESS: Product added to cart";
    } else {
        echo "ERROR: Failed to add product to cart: " . mysqli_error($conn);
    }
}

// Ensure we always have a proper response
if (!headers_sent()) {
    header('Content-Type: text/plain');
    header('Cache-Control: no-cache, no-store, must-revalidate');
}
?>
