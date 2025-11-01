<?php
include '../include/conn.php';

$query = mysqli_query($conn2, "SELECT id, name FROM categories WHERE is_active = 1 ORDER BY sort_order, name");

if (!$query) {
    echo '<option value="">No categories found</option>';
    exit;
}

echo '<option value="">Select Category</option>';

while ($category = mysqli_fetch_assoc($query)) {
    echo '<option value="' . $category['id'] . '">' . htmlspecialchars($category['name']) . '</option>';
}
?>
