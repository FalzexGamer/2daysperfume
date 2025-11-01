<?php

/**
 * Helper utilities for rendering product rows in the admin UI.
 */

if (!function_exists('build_product_html')) {
    /**
     * Build desktop and mobile HTML snippets for a product.
     *
     * @param array $product Raw product data with normalized keys.
     * @param int   $lowStockThreshold Threshold to consider a product low on stock.
     *
     * @return array{desktop:string,mobile:string}
     */
    function build_product_html(array $product, int $lowStockThreshold = 10): array
    {
        $id = (int)($product['id'] ?? 0);
        $name = $product['name'] ?? 'Unnamed Product';
        $sku = $product['sku'] ?? ('P' . str_pad((string)$id, 6, '0', STR_PAD_LEFT));
        $barcode = $product['barcode'] ?? '';
        $categoryName = $product['category_name'] ?? 'Uncategorized';
        $supplierName = $product['supplier_name'] ?? '';
        $uom = $product['uom_abbr'] ?? 'pcs';
        $stockQuantity = (int)($product['stock_quantity'] ?? 0);
        $minStockLevel = (int)($product['min_stock_level'] ?? $lowStockThreshold);
        $sellingPrice = (float)($product['selling_price'] ?? 0);
        $costPrice = (float)($product['cost_price'] ?? 0);
        $isActive = (int)($product['is_active'] ?? 0) === 1;
        $isOutOfStockFlag = (int)($product['is_out_of_stock'] ?? 0) === 1;
        $imagePath = trim((string)($product['img'] ?? ''));

        $isOutOfStock = $isOutOfStockFlag || $stockQuantity <= 0;
        $isLowStock = !$isOutOfStock && $stockQuantity <= $minStockLevel;

        $stockClass = 'text-green-600';
        $stockBgClass = 'bg-green-50 border-green-200';
        $stockIcon = 'fas fa-check-circle';
        $stockText = 'In Stock';

        if ($isOutOfStock) {
            $stockClass = 'text-red-600';
            $stockBgClass = 'bg-red-50 border-red-200';
            $stockIcon = 'fas fa-times-circle';
            $stockText = 'Out of Stock';
        } elseif ($isLowStock) {
            $stockClass = 'text-orange-600';
            $stockBgClass = 'bg-orange-50 border-orange-200';
            $stockIcon = 'fas fa-exclamation-triangle';
            $stockText = 'Low Stock';
        }

        $statusBadge = $isActive
            ? '<span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-green-100 text-green-800 border border-green-200">'
                . '<i class="fas fa-check-circle mr-1"></i>Active'
                . '</span>'
            : '<span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-red-100 text-red-800 border border-red-200">'
                . '<i class="fas fa-times-circle mr-1"></i>Inactive'
                . '</span>';

        $stockBadge = '<span class="inline-flex items-center px-2 py-1 rounded-md text-xs font-medium ' . $stockBgClass . ' border ' . $stockClass . '">'
            . '<i class="' . $stockIcon . ' mr-1"></i>' . $stockText
            . '</span>';

        $hasImage = $imagePath !== '';
        $imageHtml = $hasImage
            ? '<img src="' . htmlspecialchars($imagePath, ENT_QUOTES) . '" alt="' . htmlspecialchars($name, ENT_QUOTES) . '" class="w-12 h-12 rounded-xl object-cover border border-gray-200">'
            : '<div class="w-12 h-12 bg-gradient-to-br from-blue-500 to-indigo-600 rounded-xl flex items-center justify-center">'
                . '<i class="fas fa-box text-white text-sm"></i>'
                . '</div>';

        $desktopHtml = '
    <tr class="group hover:bg-gradient-to-r hover:from-blue-50/50 hover:to-indigo-50/50 transition-all duration-200 border-b border-gray-100/50">
        <td class="px-6 py-5">
            <div class="flex items-center space-x-4">
                <div class="flex-shrink-0">' . $imageHtml . '</div>
                <div class="flex-1 min-w-0">
                    <div class="text-sm font-semibold text-gray-900 group-hover:text-blue-600 transition-colors duration-200">'
                        . htmlspecialchars($name) . '
                    </div>
                    <div class="text-xs text-gray-500 mt-1">
                        <i class="fas fa-barcode mr-1"></i>' . htmlspecialchars($sku) . '
                    </div>
                    ' . ($barcode !== ''
                        ? '<div class="text-xs text-gray-400 mt-1">'
                            . '<i class="fas fa-qrcode mr-1"></i>' . htmlspecialchars($barcode) . '
                          </div>'
                        : '') . '
                </div>
            </div>
        </td>
        <td class="px-6 py-5">
            <div class="space-y-1">
                <div class="text-sm font-medium text-gray-900">' . htmlspecialchars($sku) . '</div>
                ' . ($barcode !== ''
                    ? '<div class="text-xs text-gray-500 bg-gray-50 px-2 py-1 rounded-md inline-block">'
                        . '<i class="fas fa-qrcode mr-1"></i>' . htmlspecialchars($barcode) . '
                      </div>'
                    : '<div class="text-xs text-gray-400 italic">No barcode</div>') . '
            </div>
        </td>
        <td class="px-6 py-5">
            <div class="flex items-center space-x-2">
                <div class="w-2 h-2 bg-gradient-to-r from-green-400 to-emerald-500 rounded-full"></div>
                <span class="text-sm font-medium text-gray-900">' . htmlspecialchars($categoryName) . '</span>
            </div>
            ' . ($supplierName !== ''
                ? '<div class="text-xs text-gray-500 mt-1">'
                    . '<i class="fas fa-truck mr-1"></i>' . htmlspecialchars($supplierName) . '
                  </div>'
                : '') . '
        </td>
        <td class="px-6 py-5">
            <div class="space-y-2">
                ' . $stockBadge . '
                <div class="text-sm font-semibold ' . $stockClass . '">
                    ' . number_format($stockQuantity) . ' ' . htmlspecialchars($uom) . '
                </div>
                ' . ($minStockLevel > 0
                    ? '<div class="text-xs text-gray-500">Min: ' . number_format($minStockLevel) . ' ' . htmlspecialchars($uom) . '</div>'
                    : '') . '
            </div>
        </td>
        <td class="px-6 py-5">
            <div class="space-y-1">
                <div class="text-sm font-bold text-gray-900">
                    RM ' . number_format($sellingPrice, 2) . '
                </div>
                <div class="text-xs text-gray-500">
                    Cost: RM ' . number_format($costPrice, 2) . '
                </div>
            </div>
        </td>
        <td class="px-6 py-5">' . $statusBadge . '</td>
        <td class="px-6 py-5">
            <div class="flex items-center space-x-2">
                <button class="inline-flex items-center px-3 py-2 text-sm font-medium text-gray-400 bg-gray-50 border border-gray-200 rounded-lg cursor-not-allowed" title="Editing disabled for synced products">
                    <i class="fas fa-edit mr-1"></i>
                    Edit
                </button>
                <button class="inline-flex items-center px-3 py-2 text-sm font-medium text-gray-400 bg-gray-50 border border-gray-200 rounded-lg cursor-not-allowed" title="Deleting disabled for synced products">
                    <i class="fas fa-trash mr-1"></i>
                    Delete
                </button>
            </div>
        </td>
    </tr>';

        $mobileHtml = '<div class="mobile-card p-4 bg-white/80 backdrop-blur-sm border-b border-gray-200/50 last:border-b-0">
        <div class="flex items-start justify-between mb-3">
            <div class="flex-1">
                <div class="flex items-center space-x-3 mb-2">
                    ' . ($hasImage
                        ? '<img src="' . htmlspecialchars($imagePath, ENT_QUOTES) . '" alt="' . htmlspecialchars($name, ENT_QUOTES) . '" class="w-12 h-12 rounded-xl object-cover border border-gray-200">'
                        : '<div class="w-12 h-12 bg-gradient-to-br from-blue-500 to-indigo-600 rounded-xl flex items-center justify-center">'
                            . '<i class="fas fa-box text-white text-sm"></i>'
                            . '</div>') . '
                    <div>
                        <h4 class="text-lg font-semibold text-gray-900">' . htmlspecialchars($name) . '</h4>
                        <p class="text-sm text-gray-600">' . htmlspecialchars($sku) . '</p>
                    </div>
                </div>
                <div class="space-y-1 mb-3">
                    <p class="text-sm text-gray-700">
                        <i class="fas fa-tag mr-1"></i>' . htmlspecialchars($categoryName) . '
                    </p>
                    ' . ($supplierName !== ''
                        ? '<p class="text-sm text-gray-600"><i class="fas fa-truck mr-1"></i>' . htmlspecialchars($supplierName) . '</p>'
                        : '') . '
                    ' . ($barcode !== ''
                        ? '<p class="text-sm text-gray-500"><i class="fas fa-qrcode mr-1"></i>' . htmlspecialchars($barcode) . '</p>'
                        : '') . '
                </div>
            </div>
            <div class="flex flex-col items-end space-y-2">
                ' . $statusBadge . '
                ' . $stockBadge . '
            </div>
        </div>
        <div class="grid grid-cols-2 gap-4 mb-3">
            <div class="text-center p-2 bg-gray-50 rounded-lg">
                <div class="text-sm font-semibold ' . $stockClass . '">
                    ' . number_format($stockQuantity) . ' ' . htmlspecialchars($uom) . '
                </div>
                <div class="text-xs text-gray-500">Stock</div>
            </div>
            <div class="text-center p-2 bg-gray-50 rounded-lg">
                <div class="text-sm font-bold text-gray-900">
                    RM ' . number_format($sellingPrice, 2) . '
                </div>
                <div class="text-xs text-gray-500">Price</div>
            </div>
        </div>
        <div class="flex items-center justify-between">
            <div class="text-xs text-gray-500">Cost: RM ' . number_format($costPrice, 2) . '</div>
            <div class="inline-flex items-center px-3 py-2 text-sm font-medium text-gray-400 bg-gray-50 border border-gray-200 rounded-lg cursor-not-allowed" title="Editing disabled for synced products">
                <i class="fas fa-edit mr-1"></i>View Only
            </div>
        </div>
    </div>';

        return [
            'desktop' => $desktopHtml,
            'mobile' => $mobileHtml,
        ];
    }
}

/**
 * Normalize product row coming from the mobile database so the renderer receives expected keys.
 *
 * @param array $row
 * @param int   $lowStockThreshold
 *
 * @return array
 */
if (!function_exists('normalize_mobile_product')) {
    function normalize_mobile_product(array $row, int $lowStockThreshold = 10): array
    {
        $id = (int)($row['id'] ?? 0);
        $price = isset($row['price']) ? (float)$row['price'] : 0.0;
        $salePrice = isset($row['sale_price']) && $row['sale_price'] !== null ? (float)$row['sale_price'] : null;
        $sellingPrice = $salePrice !== null && $salePrice > 0 ? $salePrice : $price;

        return array_merge($row, [
            'id' => $id,
            'name' => $row['name'] ?? 'Unnamed Product',
            'sku' => 'P' . str_pad((string)$id, 6, '0', STR_PAD_LEFT),
            'barcode' => '',
            'category_name' => $row['category_name'] ?? 'Uncategorized',
            'supplier_name' => '',
            'uom_abbr' => 'pcs',
            'stock_quantity' => isset($row['stock_quantity']) ? (int)$row['stock_quantity'] : 0,
            'min_stock_level' => $lowStockThreshold,
            'selling_price' => $sellingPrice,
            'cost_price' => $price,
            'is_active' => isset($row['is_active']) ? (int)$row['is_active'] : 0,
            'is_out_of_stock' => isset($row['is_out_of_stock']) ? (int)$row['is_out_of_stock'] : 0,
            'img' => '',
        ]);
    }
}


