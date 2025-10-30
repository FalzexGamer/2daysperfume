<?php
include 'include/conn.php';

$invoice_number = $_GET['invoice'] ?? '';

if (empty($invoice_number)) {
    die('Invoice number required');
}

// Get sale details
$query_sale = mysqli_query($conn, "
    SELECT s.*, s.member_id, s.user_id, cs.company_name, cs.address, cs.phone
    FROM sales s 
    LEFT JOIN company_settings cs ON 1=1
    WHERE s.invoice_number = '$invoice_number'
");
$sale = mysqli_fetch_array($query_sale);

// Get member details from conn2 database
$member_name = '';
$member_code = '';
if ($sale['member_id'] > 0) {
    $member_query = mysqli_query($conn2, "SELECT CONCAT(first_name, ' ', last_name) as full_name, id FROM users WHERE id = " . $sale['member_id']);
    if ($member_result = mysqli_fetch_array($member_query)) {
        $member_name = $member_result['full_name'];
        $member_code = 'M' . str_pad($member_result['id'], 4, '0', STR_PAD_LEFT); // Generate member code
    }
}

// Get cashier details from conn2 database
$cashier_name = 'Unknown';
if ($sale['user_id'] > 0) {
    $cashier_query = mysqli_query($conn2, "SELECT CONCAT(first_name, ' ', last_name) as full_name FROM users WHERE id = " . $sale['user_id']);
    if ($cashier_result = mysqli_fetch_array($cashier_query)) {
        $cashier_name = $cashier_result['full_name'];
    }
}

if (!$sale) {
    die('Sale not found');
}

// Get sale items
$query_items = mysqli_query($conn, "
    SELECT si.*, p.name as product_name, p.sku, u.abbreviation as uom_abbr
    FROM sale_items si 
    JOIN products p ON si.product_id = p.id 
    LEFT JOIN uom u ON p.uom_id = u.id
    WHERE si.sale_id = " . $sale['id']
);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Receipt - <?= $invoice_number ?></title>
    <style>
        @media print {
            body { margin: 0; }
            .no-print { display: none !important; }
        }
        
        body {
            font-family: 'Courier New', monospace;
            font-size: 12px;
            line-height: 1.2;
            margin: 0;
            padding: 10px;
            background: white;
        }
        
        .receipt {
            max-width: 300px;
            margin: 0 auto;
            background: white;
        }
        
        .header {
            text-align: center;
            border-bottom: 1px dashed #000;
            padding-bottom: 10px;
            margin-bottom: 10px;
        }
        
        .company-name {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 5px;
        }
        
        .company-address {
            font-size: 10px;
            margin-bottom: 5px;
        }
        
        .company-phone {
            font-size: 10px;
            margin-bottom: 5px;
        }
        
        .invoice-info {
            margin-bottom: 10px;
        }
        
        .invoice-number {
            font-weight: bold;
            margin-bottom: 5px;
        }
        
        .date-time {
            font-size: 10px;
            margin-bottom: 5px;
        }
        
        .cashier {
            font-size: 10px;
            margin-bottom: 10px;
        }
        
        .items {
            margin-bottom: 10px;
        }
        
        .item {
            margin-bottom: 5px;
            border-bottom: 1px dotted #ccc;
            padding-bottom: 5px;
        }
        
        .item-name {
            font-weight: bold;
        }
        
        .item-details {
            font-size: 10px;
            color: #666;
        }
        
        .item-note {
            font-size: 9px;
            color: #888;
            font-style: italic;
            margin-top: 2px;
            padding-left: 10px;
            border-left: 2px solid #ddd;
        }
        
        .item-total {
            text-align: right;
            font-weight: bold;
        }
        
        .totals {
            border-top: 1px dashed #000;
            padding-top: 10px;
            margin-bottom: 10px;
        }
        
        .total-line {
            display: flex;
            justify-content: space-between;
            margin-bottom: 3px;
        }
        
        .total-line.final {
            font-weight: bold;
            font-size: 14px;
            border-top: 1px solid #000;
            padding-top: 5px;
            margin-top: 5px;
        }
        
        .footer {
            text-align: center;
            font-size: 10px;
            margin-top: 20px;
            border-top: 1px dashed #000;
            padding-top: 10px;
        }
        
        .print-button {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        
        .print-button:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <button class="print-button no-print" onclick="window.print()">
        <i class="fas fa-print"></i> Print Receipt
    </button>
    
    <div class="receipt">
        <!-- Header -->
        <div class="header">
            <div class="company-name"><?= $sale['company_name'] ?? 'POS System' ?></div>
            <div class="company-address"><?= $sale['address'] ?? '123 Main Street' ?></div>
            <div class="company-phone"><?= $sale['phone'] ?? '+60 12-345 6789' ?></div>
        </div>
        
        <!-- Invoice Info -->
        <div class="invoice-info">
            <div class="invoice-number">Invoice: <?= $invoice_number ?></div>
            <div class="date-time">Date: <?= date('d/m/Y H:i', strtotime($sale['created_at'])) ?></div>
            <div class="cashier">Cashier: <?= $cashier_name ?></div>
            <?php if ($member_name): ?>
            <div class="member">Member: <?= $member_name ?> (<?= $member_code ?>)</div>
            <?php endif; ?>
        </div>
        
        <!-- Items -->
        <div class="items">
            <?php while ($item = mysqli_fetch_array($query_items)): ?>
            <div class="item">
                <div class="item-name"><?= $item['product_name'] ?></div>
                <div class="item-details">
                    <?= $item['sku'] ?> | Qty: <?= $item['quantity'] ?> <?= $item['uom_abbr'] ?> | 
                    RM <?= number_format($item['unit_price'], 2) ?> each
                </div>
                <?php if (!empty($item['notes'])): ?>
                <div class="item-note">Note: <?= htmlspecialchars($item['notes']) ?></div>
                <?php endif; ?>
                <div class="item-total">RM <?= number_format($item['total_price'], 2) ?></div>
            </div>
            <?php endwhile; ?>
        </div>
        
        <!-- Totals -->
        <div class="totals">
            <div class="total-line">
                <span>Subtotal:</span>
                <span>RM <?= number_format($sale['subtotal'], 2) ?></span>
            </div>
            <?php if ($sale['discount_amount'] > 0): ?>
            <div class="total-line">
                <span>Discount:</span>
                <span>-RM <?= number_format($sale['discount_amount'], 2) ?></span>
            </div>
            <?php endif; ?>
            <div class="total-line">
                <span>Tax (6%):</span>
                <span>RM <?= number_format($sale['tax_amount'], 2) ?></span>
            </div>
            <div class="total-line final">
                <span>TOTAL:</span>
                <span>RM <?= number_format($sale['total_amount'], 2) ?></span>
            </div>
        </div>
        
        <!-- Payment Info -->
        <div class="payment-info">
            <div>Payment Method: <?= strtoupper($sale['payment_method']) ?></div>
            <div>Status: <?= strtoupper($sale['payment_status']) ?></div>
        </div>
        
        <!-- Footer -->
        <div class="footer">
            <div>Thank you for your purchase!</div>
            <div>Please keep this receipt for your records</div>
            <div style="margin-top: 10px;">
                <?= date('d/m/Y H:i:s') ?>
            </div>
        </div>
    </div>
    
    <script>
        // Auto print on load
        window.onload = function() {
            setTimeout(function() {
                window.print();
            }, 500);
        };
    </script>
</body>
</html>
