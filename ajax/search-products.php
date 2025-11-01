<?php
include '../include/conn.php';
include '../include/session.php';

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Unauthorized access']);
    exit;
}

// Get search term
$search_term = isset($_GET['search']) ? trim($_GET['search']) : '';

if (empty($search_term)) {
    echo json_encode(['success' => false, 'message' => 'Search term is required']);
    exit;
}

try {
    // Prepare the search query
    $search_term = mysqli_real_escape_string($conn2, $search_term);

    $conditions = [];

    if (preg_match('/^P(\d{1,})$/i', $search_term, $matches)) {
        $productId = intval($matches[1]);
        $conditions[] = "p.id = $productId";
    }

    if (ctype_digit($search_term)) {
        $productId = intval($search_term);
        $conditions[] = "p.id = $productId";
    }

    $conditions[] = "p.name LIKE '%$search_term%'";

    $whereClause = implode(' OR ', $conditions);

    $query = "SELECT p.id, p.name, p.price, p.sale_price, p.stock_quantity, p.image,
                     c.name AS category_name, c.id AS category_id
              FROM products p 
              LEFT JOIN categories c ON p.category_id = c.id 
              WHERE p.is_active = 1 
                AND ($whereClause)
              ORDER BY p.name ASC 
              LIMIT 20";
    
    $result = mysqli_query($conn2, $query);
    
    if (!$result) {
        throw new Exception("Database query failed: " . mysqli_error($conn));
    }
    
    $products = [];
    $html = '';
    
    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            $productId = (int)$row['id'];
            $price = 0.0;
            if (isset($row['sale_price']) && $row['sale_price'] !== '' && $row['sale_price'] !== null && (float)$row['sale_price'] > 0) {
                $price = (float)$row['sale_price'];
            } elseif (isset($row['price']) && $row['price'] !== '' && $row['price'] !== null) {
                $price = (float)$row['price'];
            }

            $sku = 'P' . str_pad((string)$productId, 6, '0', STR_PAD_LEFT);
            $stockQty = isset($row['stock_quantity']) ? (int)$row['stock_quantity'] : 0;
            $categoryName = $row['category_name'] ?? 'Uncategorized';

            $imagePath = '';
            if (!empty($row['image']) && $row['image'] !== '-') {
                if (preg_match('/^(https?:\/\/|\/)/', $row['image'])) {
                    $imagePath = $row['image'];
                } elseif (strpos($row['image'], '/') !== false) {
                    $imagePath = $row['image'];
                } else {
                    $imagePath = 'uploads/products/' . $row['image'];
                }
            }

            $products[] = [
                'id' => $productId,
                'name' => $row['name'],
                'price' => $price,
                'stock_quantity' => $stockQty,
                'category_name' => $categoryName,
                'image' => $imagePath,
                'sku' => $sku,
            ];
            
            // Generate HTML for each product
            $stock_status = $stockQty > 0 ? 'text-green-600' : 'text-red-600';
            $stock_text = $stockQty > 0 ? 'In Stock' : 'Out of Stock';

            $imageHtml = '';
            if ($imagePath) {
                $imageHtml = '<img src="' . htmlspecialchars($imagePath) . '" alt="' . htmlspecialchars($row['name']) . '" class="w-12 h-12 rounded-lg object-cover border border-gray-200">';
            } else {
                $imageHtml = '<div class="w-12 h-12 bg-gradient-to-r from-green-500 to-emerald-600 rounded-lg flex items-center justify-center">
                            <i class="fas fa-box text-white text-sm"></i>
                        </div>';
            }
            
            $html .= '
            <button onclick="addProductToCartFromSidebar(' . $productId . ')" 
                    class="w-full flex items-center justify-between p-3 bg-white border border-gray-200 rounded-lg hover:bg-green-50 hover:border-green-300 hover:shadow-md transition-all duration-200 transform hover:-translate-y-1">
                <div class="flex items-center space-x-3">
                    ' . $imageHtml . '
                    <div class="text-left">
                        <div class="font-medium text-gray-900 text-sm">' . htmlspecialchars($row['name']) . '</div>
                        <div class="text-xs text-gray-500">' . htmlspecialchars($sku) . '</div>
                        <div class="text-xs text-gray-400">' . htmlspecialchars($categoryName) . '</div>
                    </div>
                </div>
                <div class="text-right">
                    <div class="font-semibold text-green-600 text-sm">RM ' . number_format($price, 2) . '</div>
                    <div class="text-xs ' . $stock_status . '">' . $stock_text . '</div>
                    <div class="text-xs text-gray-400">Stock: ' . $stockQty . '</div>
                </div>
            </button>';
        }
        
        echo json_encode([
            'success' => true,
            'products' => $products,
            'html' => $html,
            'count' => count($products)
        ]);
    } else {
        // No products found
        $html = '
        <div class="text-center py-6">
            <div class="w-12 h-12 bg-gradient-to-br from-gray-100 to-gray-200 rounded-full flex items-center justify-center mx-auto mb-3">
                <i class="fas fa-search text-gray-400 text-lg"></i>
            </div>
            <h3 class="text-sm font-medium text-gray-900 mb-1">No Products Found</h3>
            <p class="text-xs text-gray-500">Try adjusting your search terms</p>
        </div>';
        
        echo json_encode([
            'success' => true,
            'products' => [],
            'html' => $html,
            'count' => 0
        ]);
    }
    
} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'message' => 'Error: ' . $e->getMessage()
    ]);
}

mysqli_close($conn2);
?>
