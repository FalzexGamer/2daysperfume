-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 30, 2025 at 12:02 AM
-- Server version: 8.4.6-cll-lve
-- PHP Version: 8.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `igoldser_perfume2days`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `role` enum('admin','owner','manager') DEFAULT 'admin',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `email`, `password_hash`, `full_name`, `role`, `is_active`, `created_at`, `updated_at`) VALUES
(2, '2daysparfumtunjong@admin.com', 'test@gmail.com', 'test123', 'Admin Tunjong', 'admin', 1, '2025-10-26 03:29:56', '2025-10-26 03:31:49');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `session_id` varchar(50) DEFAULT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `size` varchar(50) DEFAULT NULL,
  `version` varchar(20) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `session_id`, `product_id`, `quantity`, `size`, `version`, `price`, `created_at`, `updated_at`) VALUES
(109, 10, 'q167m4hslluta9oar2ee5535kh', 36, 1, '10ml', 'EDP / LIGHT', 14.90, '2025-10-15 05:42:24', '2025-10-15 05:42:24'),
(108, 10, 'q167m4hslluta9oar2ee5535kh', 32, 1, '10ml', 'EDP / LIGHT', 14.90, '2025-10-15 05:38:33', '2025-10-15 05:38:33'),
(110, 11, 'tk3fflg20e6v4t8c0me9rj6dlq', 36, 1, '10ml', 'EDP / LIGHT', 14.90, '2025-10-16 01:39:14', '2025-10-16 01:39:14'),
(100, 9, 'ahmj5blllo1kn5fqj71kdqa3mb', 39, 1, '20ml', 'PARFUM / MEDIUM', 32.30, '2025-10-12 07:31:21', '2025-10-12 07:31:21'),
(114, 2, 'qh2ahg2v63mih29c5rd214t26k', 36, 1, '10ml', 'EXTRAIT / STRONG', 11.49, '2025-10-27 04:34:32', '2025-10-27 04:34:32'),
(113, 2, 'qh2ahg2v63mih29c5rd214t26k', 36, 1, '10ml', 'EDP / LIGHT', 14.90, '2025-10-26 07:43:46', '2025-10-26 07:43:46');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text,
  `image` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sort_order` int DEFAULT '0' COMMENT 'Custom sort order for categories'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image`, `is_active`, `created_at`, `sort_order`) VALUES
(1, 'Women', 'women', 'Elegant and feminine fragrances for women', NULL, 1, '2025-09-19 11:17:09', 1),
(2, 'Men', 'men', 'Bold and masculine fragrances for men', NULL, 1, '2025-09-19 11:17:09', 2),
(3, 'Unisex', 'unisex', 'Versatile fragrances for everyone', NULL, 1, '2025-09-19 11:17:09', 3),
(7, 'Kids', 'kids', 'Soft and gentle fragrance specially made for kids.', '', 1, '2025-10-09 04:24:11', 0),
(8, 'oldman', 'old', 'soft and cinammon powder', '', 1, '2025-10-11 13:42:35', 0),
(9, 'hybrid', 'hybrid', '', '', 1, '2025-10-12 07:28:58', 0);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_feedback`
--

CREATE TABLE `delivery_feedback` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `rating` int NOT NULL,
  `feedback` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `delivery_feedback`
--

INSERT INTO `delivery_feedback` (`id`, `order_id`, `user_id`, `rating`, `feedback`, `created_at`) VALUES
(7, 58, 2, 5, 'Mantab terbaik saya wak tubik ng gewe saya lepastu yo tanyo pakai minyok wangi gapo pasalnyo yo nk beli ko jate lain ciss', '2025-10-03 04:08:42'),
(8, 61, 2, 5, '', '2025-10-12 07:46:32'),
(9, 60, 2, 5, '', '2025-10-12 07:46:59'),
(10, 66, 2, 5, '', '2025-10-13 08:10:37'),
(11, 78, 2, 5, 'Mantab', '2025-10-14 03:38:59'),
(12, 71, 2, 5, '', '2025-10-14 04:00:54'),
(13, 67, 2, 5, '', '2025-10-14 04:01:23');

-- --------------------------------------------------------

--
-- Table structure for table `digital_stamps`
--

CREATE TABLE `digital_stamps` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `stamps_collected` int DEFAULT '0',
  `stamps_required` int DEFAULT '10',
  `is_completed` tinyint(1) DEFAULT '0',
  `reward_claimed` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `digital_stamps`
--

INSERT INTO `digital_stamps` (`id`, `user_id`, `stamps_collected`, `stamps_required`, `is_completed`, `reward_claimed`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 10, 0, 0, '2025-09-23 04:31:52', '2025-09-23 04:31:52'),
(2, 1, 3, 10, 0, 0, '2025-09-23 04:32:37', '2025-09-23 04:32:37');

-- --------------------------------------------------------

--
-- Table structure for table `notification_logs`
--

CREATE TABLE `notification_logs` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'all, user_id, or group',
  `admin_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Admin who sent the notification',
  `success` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 for success, 0 for failure',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Response message from API',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_logs`
--

INSERT INTO `notification_logs` (`id`, `title`, `body`, `target`, `admin_name`, `success`, `message`, `created_at`) VALUES
(1, 'test', 'test', 'all', 'Admin', 1, 'Notification sent successfully', '2025-10-01 03:47:42'),
(2, 'hi', 'azfar', '2', 'Admin', 1, 'Notification sent successfully', '2025-10-05 01:07:45'),
(3, 'azsdsad', 'asdasdas', 'all', 'Admin', 1, 'Notification sent successfully', '2025-10-05 01:08:25'),
(4, 'test', 'test', 'all', 'Admin', 1, 'Notification sent successfully', '2025-10-05 01:14:14'),
(5, 'test', 'tss', '2', 'Admin', 1, 'Notification sent successfully', '2025-10-05 01:15:49'),
(6, 'test', 'azfar', '2', 'Admin', 1, 'Notification sent successfully', '2025-10-05 02:58:57'),
(7, 'PROMOTION', 'Join our contest rightnow!', '2', 'Admin', 1, 'Notification sent successfully', '2025-10-06 02:18:35'),
(8, '.', '.', '2', 'Admin', 1, 'Notification sent successfully', '2025-10-07 04:24:15'),
(9, 'BOSS', 'SALAM', '8', 'Admin', 1, 'Notification sent successfully', '2025-10-12 07:53:13'),
(10, 'TEST', 'TESTINGG', '6', 'Admin', 1, 'Notification sent successfully', '2025-10-12 07:53:38'),
(11, 'wak gpo tu', 'test', '6', 'Admin', 1, 'Notification sent successfully', '2025-10-12 07:54:11'),
(12, 'test', 'test specific user', '1', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-13 01:26:09'),
(13, 'test', 'test', '1', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-13 01:33:03'),
(14, 'specific user test', 'testing', '1', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-13 01:33:34'),
(15, 'salam', 'test', 'all', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-13 01:34:06'),
(16, 'salam', 'test', '1', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-13 01:34:17'),
(17, 'salam', 'ini untuk azfar sahaja', '2', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-13 01:34:32'),
(18, '<?php require_once __DIR__ . \'/../config/database.php\';  class FirebaseNotification {     private $conn;          // Android/Web Keys     private $androidAppKey;     private $androidApiKey;          // iOS Keys     private $iosAppKey;     private $iosApiK', '<?php\r\nrequire_once __DIR__ . \'/../config/database.php\';\r\n\r\nclass FirebaseNotification {\r\n    private $conn;\r\n    \r\n    // Android/Web Keys\r\n    private $androidAppKey;\r\n    private $androidApiKey;\r\n    \r\n    // iOS Keys\r\n    private $iosAppKey;\r\n    private $iosApiKey;\r\n    \r\n    private $apiUrl = \'https://appilix.com/api/push-notification\';\r\n    \r\n    public function __construct() {\r\n        $this->conn = getDB();\r\n        \r\n        // Android/Web Keys (Original)\r\n        $this->androidAppKey = \'0rb8jz9ktl4cl18i4702dixcya3rf72q5tq3mnhh\';\r\n        $this->androidApiKey = \'ypsbicz6mt1hue5g4do2\';\r\n        \r\n        // iOS Keys (New)\r\n        $this->iosAppKey = \'sq59rjjalqf715dvybdscahmzf27ickwo0goehgi\';\r\n        $this->iosApiKey = \'uwreh1o0dmxt32q5i7jz\';\r\n    }\r\n    \r\n    /**\r\n     * Send push notification to all users (Both iOS and Android)\r\n     */\r\n    public function sendNotificationToAll($title, $body, $adminName = null) {\r\n        try {\r\n            $results = [];\r\n            $successCount = 0;\r\n            $failCo', '2', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-13 01:34:56'),
(19, 'test', 'test', '2', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-13 01:38:01'),
(20, 'test', 'test', '2', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-13 01:48:37'),
(21, 'test', 'test', '1', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-13 01:48:45'),
(22, 'test semua', 'test semua', 'all', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-13 01:49:12'),
(23, 'test', 'untuk cik irfan', '6', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-13 01:49:33'),
(24, 'Complete Your Purchase! 🛍️', 'Hey Azim! We see you added contoh to your cart. Complete your checkout now and enjoy your favorite perfume! 💝', '9', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-13 02:03:35'),
(25, 'Complete Your Purchase! 🛍️', 'Hey AZFAR! We see you added 2DAYS SEXY FOR WOMEN to your cart. Complete your checkout now and enjoy your favorite perfume! 💝', '2', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-13 02:03:43'),
(26, 'Complete Your Purchase! 🛍️', 'Hey AZFAR! We see you added 2DAYS SEXY FOR WOMEN to your cart. Complete your checkout now and enjoy your favorite perfume! 💝', '2', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-13 02:03:58'),
(27, 'Complete Your Purchase! 🛍️', 'Hey Nur! We see you added 2DAYS SEXY FOR WOMEN to your cart. Complete your checkout now and enjoy your favorite perfume! 💝', '11', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-16 01:39:44'),
(28, 'test', 'test', '11', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-16 02:07:20'),
(29, 'Complete Your Purchase! 🛍️', 'Hey AZFAR! We see you added 2DAYS SEXY FOR WOMEN to your cart. Complete your checkout now and enjoy your favorite perfume! 💝', '2', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-16 02:31:00'),
(30, 'Complete Your Purchase! 🛍️', 'Hey AZFAR! We see you added 2DAYS SEXY FOR WOMEN to your cart. Complete your checkout now and enjoy your favorite perfume! 💝', '2', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-16 02:31:23'),
(31, 'harini ada promosi', 'beli 2 percuma 1', 'all', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-16 02:46:12'),
(32, 'wano dewmo wak', 'rest', '2', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-16 02:46:51'),
(33, 'Complete Your Purchase! 🛍️', 'Hey AZFAR! We see you added 2DAYS MAN BORN IN ROMA INTENSE FOR MEN to your cart. Complete your checkout now and enjoy your favorite perfume! 💝', '2', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-17 02:40:39'),
(34, 'test', 'test', '14', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-22 01:40:00'),
(35, 'test', 'test', '2', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-22 02:12:36'),
(36, 'test', 'test', '15', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-22 02:13:12'),
(37, 'salam jumaat', 'salam jumaat', '2', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-24 05:41:22'),
(38, 'Order Status Update', 'Hi AZFAR, great news! Your order #ORD202510154653 has been shipped. Tracking number: 012348327321', '2', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-26 01:45:57'),
(39, 'Order Status Update', 'Hi AZFAR, great news! Your order #ORD202510154870 has been shipped. Tracking number: 1234', '2', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-26 01:46:47'),
(40, 'farouq', 'farouq dapat x chat ni?', '14', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-26 01:49:46'),
(41, 'Order Status Update', 'Hi AZFAR, great news! Your order #ORD202510154870 has been shipped. Tracking number: 1234', '2', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-26 01:52:43'),
(42, 'Order Status Update', 'Hi AZFAR, your order #ORD202510154653 has been delivered. Thank you for your purchase!', '2', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-26 01:56:24'),
(43, 'dapat x', 'farouq', '14', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-26 02:00:24'),
(44, 'test', 'test', '2', 'Admin', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-26 02:04:42'),
(45, 'Order Status Update', 'Hi AZFAR, your order #ORD202510154653 has been delivered. Thank you for your purchase!', '2', 'Admin Tunjong', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-26 04:30:40'),
(46, 'Order Status Update', 'Hi AZFAR, great news! Your order #ORD202510134306 has been shipped. Tracking number: 12345', '2', 'Admin Tunjong', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-26 07:43:07'),
(47, 'Complete Your Purchase! 🛍️', 'Hey AZFAR! We see you added 2DAYS SEXY FOR WOMEN to your cart. Complete your checkout now and enjoy your favorite perfume! 💝', '2', 'Admin Tunjong', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-26 07:44:08'),
(48, 'CLEARANCE STOCK PERFUME 99% DISCOUNT', 'BUY PARFUME TEST TEST TEST', 'all', 'Admin Tunjong', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-26 08:23:03'),
(49, 'Complete Your Purchase! 🛍️', 'Hey AZFAR! We see you added 2DAYS SEXY FOR WOMEN to your cart. Complete your checkout now and enjoy your favorite perfume! 💝', '2', 'Admin Tunjong', 1, 'Sent to 2 platform(s). ✓ Android/Web, ✓ iOS', '2025-10-26 08:24:57');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `order_number` varchar(50) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `currency` varchar(3) DEFAULT 'RM',
  `status` enum('pending','awaiting_payment','processing','shipped','delivered','cancelled') DEFAULT 'pending',
  `shipping_address` text,
  `billing_address` text,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` enum('pending','paid','failed','refunded') DEFAULT 'pending',
  `notes` text,
  `voucher_id` int DEFAULT NULL,
  `voucher_discount_amount` decimal(10,2) DEFAULT '0.00',
  `voucher_discount_type` varchar(50) DEFAULT NULL,
  `voucher_discount_value` decimal(10,2) DEFAULT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bill_code` varchar(50) DEFAULT NULL,
  `payment_reference` varchar(100) DEFAULT NULL,
  `shipping_method_id` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_number`, `total_amount`, `currency`, `status`, `shipping_address`, `billing_address`, `payment_method`, `payment_status`, `notes`, `voucher_id`, `voucher_discount_amount`, `voucher_discount_type`, `voucher_discount_value`, `tracking_number`, `created_at`, `updated_at`, `bill_code`, `payment_reference`, `shipping_method_id`) VALUES
(64, 2, 'ORD202510138168', 18.57, 'RM', 'processing', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', NULL, NULL, 0.00, NULL, NULL, NULL, '2025-10-13 07:14:38', '2025-10-13 07:33:00', NULL, 'TP2510134301203434', NULL),
(63, 2, 'ORD202510135566', 18.57, 'RM', 'processing', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', 'Salam saya nk minyak wangi ni 3 walaupun saya beli 1', NULL, 0.00, NULL, NULL, NULL, '2025-10-13 02:11:31', '2025-10-13 02:11:56', NULL, 'TP2510130313551311', NULL),
(62, 6, 'ORD202510126277', 23.67, 'RM', 'cancelled', '{\"first_name\":\"Irfan\",\"last_name\":\"Hashim\",\"email\":\"irfanhashim94@gmail.com\",\"phone\":\"0139032053\",\"address\":\"Lot 408\",\"city\":\"Kota bharu\",\"state\":\"Kelantan\",\"zip_code\":\"160160\",\"country\":\"Malaysia\"}', '{\"first_name\":\"Irfan\",\"last_name\":\"Hashim\",\"email\":\"irfanhashim94@gmail.com\",\"phone\":\"0139032053\",\"address\":\"Lot 408\",\"city\":\"Kota bharu\",\"state\":\"Kelantan\",\"zip_code\":\"160160\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'failed', NULL, NULL, 0.00, NULL, NULL, NULL, '2025-10-12 07:42:56', '2025-10-12 07:44:35', NULL, 'TP2510120893854094', NULL),
(61, 2, 'ORD202510127599', 21.47, 'RM', 'delivered', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', NULL, NULL, 0.00, NULL, NULL, '732132', '2025-10-12 07:42:42', '2025-10-12 07:46:25', NULL, 'TP2510121118951714', NULL),
(58, 2, 'ORD202510031376', 15.25, 'RM', 'processing', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', NULL, NULL, 0.00, NULL, NULL, NULL, '2025-10-03 04:07:12', '2025-10-13 06:36:12', NULL, 'TP2510130313749034', NULL),
(60, 2, 'ORD202510073019', 18.82, 'RM', 'delivered', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', NULL, NULL, 0.00, NULL, NULL, 'QUENSERASERA3425', '2025-10-07 04:44:20', '2025-10-12 07:46:56', NULL, 'TP2510072671675131', NULL),
(59, 2, 'ORD202510033465', 15.25, 'RM', 'processing', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', NULL, NULL, 0.00, NULL, NULL, '012348327321', '2025-10-03 07:51:33', '2025-10-13 06:42:48', NULL, 'TP2510134267934003', NULL),
(65, 2, 'ORD202510137957', 39.00, 'RM', 'awaiting_payment', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'pending', NULL, NULL, 0.00, NULL, NULL, NULL, '2025-10-13 07:48:41', '2025-10-13 07:48:41', NULL, NULL, 11),
(66, 2, 'ORD202510134143', 39.00, 'RM', 'delivered', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', NULL, NULL, 0.00, NULL, NULL, NULL, '2025-10-13 07:48:52', '2025-10-13 08:10:34', NULL, 'TP2510132838896300', 11),
(67, 2, 'ORD202510134247', 17.00, 'RM', 'delivered', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', NULL, 5, 1.70, 'percentage', 10.00, NULL, '2025-10-13 07:54:48', '2025-10-14 04:01:20', NULL, 'TP2510134503589614', 12),
(68, 2, 'ORD202510136158', 14.90, 'RM', 'processing', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', 'Jodi', NULL, 0.00, NULL, NULL, NULL, '2025-10-13 08:43:09', '2025-10-13 08:43:28', NULL, 'TP2510132891580678', 11),
(69, 2, 'ORD202510134202', 17.90, 'RM', 'processing', '{\"first_name\":\"SADAS\",\"last_name\":\"DSADAS\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"0123456789\",\"address\":\"DASDASDSADSA\",\"city\":\"SADDSA\",\"state\":\"DSADSA\",\"zip_code\":\"12390\",\"country\":\"Malaysia\"}', '{\"first_name\":\"SADAS\",\"last_name\":\"DSADAS\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"0123456789\",\"address\":\"DASDASDSADSA\",\"city\":\"SADDSA\",\"state\":\"DSADSA\",\"zip_code\":\"12390\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', NULL, NULL, 0.00, NULL, NULL, NULL, '2025-10-13 08:44:01', '2025-10-13 08:44:18', NULL, 'TP2510133275609819', 12),
(70, 2, 'ORD202510132668', 15.90, 'RM', 'processing', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', NULL, NULL, 0.00, NULL, NULL, NULL, '2025-10-13 08:44:39', '2025-10-13 08:44:55', NULL, 'TP2510131448454181', 11),
(71, 2, 'ORD202510132184', 15.74, 'RM', 'delivered', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', NULL, 10, 0.16, 'percentage', 1.00, NULL, '2025-10-13 08:47:08', '2025-10-14 04:00:50', NULL, 'TP2510133158718868', 11),
(72, 2, 'ORD202510137593', 23.67, 'RM', 'processing', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', NULL, NULL, 0.00, NULL, NULL, NULL, '2025-10-13 08:48:21', '2025-10-16 02:26:45', NULL, 'TP2510163307062846', 1),
(73, 2, 'ORD202510135085', 20.00, 'RM', 'processing', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', NULL, NULL, 0.00, NULL, NULL, NULL, '2025-10-13 08:51:19', '2025-10-26 01:35:03', NULL, 'TP2510262745566076', 11),
(74, 2, 'ORD202510139574', 23.00, 'RM', 'processing', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', NULL, NULL, 0.00, NULL, NULL, NULL, '2025-10-13 08:52:28', '2025-10-13 08:52:50', NULL, 'TP2510130103108239', 12),
(75, 2, 'ORD202510130196', 20.00, 'RM', 'processing', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', NULL, NULL, 0.00, NULL, NULL, NULL, '2025-10-13 08:54:47', '2025-10-13 08:55:08', NULL, 'TP2510130192240155', 11),
(76, 2, 'ORD202510134306', 43.67, 'RM', 'shipped', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', NULL, NULL, 0.00, NULL, NULL, '12345', '2025-10-13 08:55:42', '2025-10-26 07:43:06', NULL, 'TP2510132530002830', 1),
(77, 2, 'ORD202510134881', 20.00, 'RM', 'processing', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', NULL, NULL, 0.00, NULL, NULL, NULL, '2025-10-13 08:58:06', '2025-10-13 08:58:21', NULL, 'TP2510134488122560', 11),
(78, 2, 'ORD202510135436', 17.90, 'RM', 'delivered', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', NULL, NULL, 0.00, NULL, NULL, NULL, '2025-10-13 09:31:31', '2025-10-14 03:38:55', NULL, 'TP2510133393947271', 12),
(79, 2, 'ORD202510154870', 17.90, 'RM', 'shipped', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', NULL, NULL, 0.00, NULL, NULL, '1234', '2025-10-15 10:10:01', '2025-10-26 01:52:42', NULL, 'TP2510151118672554', 12),
(80, 2, 'ORD202510154653', 32.80, 'RM', 'delivered', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', NULL, NULL, 0.00, NULL, NULL, '012348327321', '2025-10-15 10:10:55', '2025-10-26 04:30:39', NULL, 'TP2510153067061471', 12),
(81, 2, 'ORD202510162919', 14.90, 'RM', 'delivered', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', 'pickup 430', NULL, 0.00, NULL, NULL, NULL, '2025-10-16 02:33:53', '2025-10-16 02:36:43', NULL, 'TP2510160378404591', 11),
(82, 2, 'ORD202510263353', 59.00, 'RM', 'processing', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', '{\"first_name\":\"AZFAR\",\"last_name\":\"BIN ASRI\",\"email\":\"azfarirfan7767@gmail.com\",\"phone\":\"+60179853875\",\"address\":\"Kg Surau Bator\",\"city\":\"Bachok\",\"state\":\"Kelantan\",\"zip_code\":\"16070\",\"country\":\"Malaysia\"}', 'toyyibpay_fpx', 'paid', '4pm', NULL, 0.00, NULL, NULL, NULL, '2025-10-26 01:37:19', '2025-10-26 01:37:37', NULL, 'TP2510261508191490', 11);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(191) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  `size` varchar(50) DEFAULT NULL,
  `version` varchar(20) DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `product_price`, `quantity`, `size`, `version`, `total_price`, `created_at`) VALUES
(1, 1, 22, 'SUAVE', 0.01, 1, '30ml', NULL, 0.01, '2025-09-25 02:29:15'),
(2, 2, 22, 'SUAVE', 0.01, 1, '30ml', NULL, 0.01, '2025-09-25 02:30:17'),
(3, 3, 22, 'SUAVE', 0.01, 1, '30ml', NULL, 0.01, '2025-09-25 02:30:58'),
(4, 4, 22, 'SUAVE', 0.01, 1, '30ml', NULL, 0.01, '2025-09-25 02:33:24'),
(5, 5, 22, 'SUAVE', 0.01, 1, '30ml', NULL, 0.01, '2025-09-25 03:16:55'),
(6, 6, 22, 'SUAVE', 0.01, 1, '30ml', NULL, 0.01, '2025-09-25 03:20:55'),
(7, 7, 21, 'ANGEL SPIRIT', 66.00, 1, '30ml', NULL, 66.00, '2025-09-25 03:55:25'),
(8, 7, 22, 'SUAVE', 0.01, 1, '30ml', NULL, 0.01, '2025-09-25 03:55:25'),
(9, 8, 22, 'SUAVE', 0.01, 1, '30ml', NULL, 0.01, '2025-09-28 06:08:37'),
(10, 8, 4, 'Chopard Happy Bigaradia', 60.00, 2, '100ml', NULL, 120.00, '2025-09-28 06:08:37'),
(11, 8, 21, 'ANGEL SPIRIT', 100.00, 1, '35ml', NULL, 100.00, '2025-09-28 06:08:37'),
(12, 9, 22, 'SUAVE', 1.00, 3, '30ml', NULL, 3.00, '2025-09-30 03:50:16'),
(13, 9, 21, 'ANGEL SPIRIT', 66.00, 1, '30ml', NULL, 66.00, '2025-09-30 03:50:16'),
(14, 10, 22, 'SUAVE', 1.00, 1, '30ml', NULL, 1.00, '2025-09-30 03:50:37'),
(15, 11, 22, 'SUAVE', 1.00, 1, '30ml', NULL, 1.00, '2025-09-30 03:52:39'),
(16, 12, 22, 'SUAVE', 1.00, 1, '30ml', NULL, 1.00, '2025-09-30 03:53:01'),
(17, 13, 22, 'SUAVE', 1.00, 1, '30ml', NULL, 1.00, '2025-09-30 04:00:37'),
(18, 14, 22, 'SUAVE', 1.00, 1, '30ml', NULL, 1.00, '2025-09-30 04:03:16'),
(19, 15, 22, 'SUAVE', 1.00, 1, '30ml', NULL, 1.00, '2025-09-30 04:04:03'),
(20, 16, 22, 'SUAVE', 1.00, 1, '30ml', NULL, 1.00, '2025-09-30 04:09:59'),
(21, 17, 22, 'SUAVE', 1.00, 1, '30ml', NULL, 1.00, '2025-09-30 04:21:00'),
(22, 18, 22, 'SUAVE', 1.00, 1, '30ml', NULL, 1.00, '2025-09-30 04:59:01'),
(23, 19, 22, 'SUAVE', 1.00, 1, '30ml', NULL, 1.00, '2025-09-30 05:03:31'),
(24, 20, 22, 'SUAVE', 1.00, 1, '30ml', NULL, 1.00, '2025-09-30 05:04:09'),
(25, 21, 21, 'ANGEL SPIRIT', 100.00, 2, '35ml', NULL, 200.00, '2025-09-30 06:32:14'),
(26, 22, 21, 'ANGEL SPIRIT', 100.00, 2, '35ml', NULL, 200.00, '2025-09-30 06:32:24'),
(27, 23, 21, 'ANGEL SPIRIT', 100.00, 1, '35ml', NULL, 100.00, '2025-09-30 06:34:34'),
(28, 24, 21, 'ANGEL SPIRIT', 100.00, 1, '35ml', NULL, 100.00, '2025-09-30 06:37:58'),
(29, 25, 4, 'Chopard Happy Bigaradia', 60.00, 1, '100ml', NULL, 60.00, '2025-09-30 06:41:10'),
(30, 26, 22, 'SUAVE', 1.00, 1, '30ml', NULL, 1.00, '2025-09-30 06:45:04'),
(31, 27, 22, 'SUAVE', 1.00, 1, '30ml', NULL, 1.00, '2025-09-30 06:52:17'),
(32, 28, 22, 'SUAVE', 1.00, 1, '30ml', NULL, 1.00, '2025-09-30 06:55:41'),
(33, 29, 22, 'SUAVE', 1.00, 1, '30ml', NULL, 1.00, '2025-09-30 07:00:17'),
(34, 30, 22, 'SUAVE', 1.00, 1, '30ml', NULL, 1.00, '2025-09-30 07:21:16'),
(35, 31, 22, 'SUAVE', 1.00, 1, '30ml', NULL, 1.00, '2025-09-30 07:53:28'),
(36, 32, 21, 'ANGEL SPIRIT', 100.00, 1, '35ml', NULL, 100.00, '2025-09-30 07:56:13'),
(37, 33, 3, 'BVLGARI Rose Goldea', 50.00, 1, '100ml', NULL, 50.00, '2025-09-30 07:59:38'),
(38, 34, 22, 'SUAVE', 20.00, 1, '30ml', NULL, 20.00, '2025-10-01 02:34:45'),
(39, 35, 22, 'SUAVE', 23.00, 2, '30ml', NULL, 46.00, '2025-10-01 02:40:34'),
(40, 36, 22, 'SUAVE', 23.00, 1, '30ml', NULL, 23.00, '2025-10-01 02:43:46'),
(41, 37, 22, 'SUAVE', 20.00, 1, '30ml', NULL, 20.00, '2025-10-01 02:47:20'),
(42, 38, 22, 'SUAVE', 20.00, 2, '30ml', NULL, 40.00, '2025-10-01 04:06:57'),
(43, 39, 22, 'SUAVE', 20.00, 1, '30ml', 'PARFUM / MEDIUM', 20.00, '2025-10-01 04:29:51'),
(44, 40, 22, 'SUAVE', 22.00, 1, '50ml', 'EDP / LIGHT', 22.00, '2025-10-01 07:28:11'),
(45, 41, 22, 'SUAVE', 22.00, 1, '50ml', 'EDP / LIGHT', 22.00, '2025-10-01 07:35:12'),
(46, 42, 22, 'SUAVE', 22.00, 1, '50ml', 'EDP / LIGHT', 22.00, '2025-10-01 07:38:58'),
(47, 43, 22, 'SUAVE', 23.00, 1, '30ml', 'EDP / LIGHT', 23.00, '2025-10-01 07:44:15'),
(48, 44, 22, 'SUAVE', 23.00, 2, '30ml', 'EDP / LIGHT', 46.00, '2025-10-01 07:49:07'),
(49, 45, 22, 'SUAVE', 23.00, 1, '30ml', 'EDP / LIGHT', 23.00, '2025-10-01 07:51:40'),
(50, 46, 22, 'SUAVE', 23.00, 1, '30ml', 'EDP / LIGHT', 23.00, '2025-10-01 08:17:57'),
(51, 47, 22, 'SUAVE', 33.00, 3, '50ml', 'EXTRAIT / STRONG', 99.00, '2025-10-02 01:19:08'),
(52, 48, 22, 'SUAVE', 33.00, 1, '50ml', 'EXTRAIT / STRONG', 33.00, '2025-10-02 01:27:13'),
(53, 49, 22, 'SUAVE', 33.00, 1, '50ml', 'EXTRAIT / STRONG', 33.00, '2025-10-02 01:27:48'),
(54, 50, 22, 'SUAVE', 33.00, 1, '50ml', 'EXTRAIT / STRONG', 33.00, '2025-10-02 01:28:00'),
(55, 51, 22, 'SUAVE', 33.00, 1, '50ml', 'EXTRAIT / STRONG', 33.00, '2025-10-02 01:28:08'),
(56, 52, 21, 'ANGEL SPIRIT', 23.00, 1, '30ml', 'EDP / LIGHT', 23.00, '2025-10-02 05:38:41'),
(57, 53, 32, '2DAYS MAN BORN IN ROMA INTENSE FOR MEN', 14.90, 1, '10ml', 'EDP / LIGHT', 14.90, '2025-10-03 03:47:11'),
(58, 54, 32, '2DAYS MAN BORN IN ROMA INTENSE FOR MEN', 17.00, 1, '20ml', 'EDP / LIGHT', 17.00, '2025-10-03 03:55:32'),
(59, 55, 32, '2DAYS MAN BORN IN ROMA INTENSE FOR MEN', 14.90, 1, '10ml', 'EDP / LIGHT', 14.90, '2025-10-03 04:00:42'),
(60, 56, 32, '2DAYS MAN BORN IN ROMA INTENSE FOR MEN', 14.90, 1, '10ml', 'EDP / LIGHT', 14.90, '2025-10-03 04:02:04'),
(61, 57, 33, '[NEW RELEASE] 2DAYS BLUE TALISMAN FOR UNISEX', 16.90, 1, '10ml', 'EDP / LIGHT', 16.90, '2025-10-03 04:02:52'),
(62, 58, 32, '2DAYS MAN BORN IN ROMA INTENSE FOR MEN', 14.90, 1, '10ml', 'EDP / LIGHT', 14.90, '2025-10-03 04:07:12'),
(63, 59, 32, '2DAYS MAN BORN IN ROMA INTENSE FOR MEN', 14.90, 1, '10ml', 'EDP / LIGHT', 14.90, '2025-10-03 07:51:33'),
(64, 60, 32, '2DAYS MAN BORN IN ROMA INTENSE FOR MEN', 14.90, 1, '10ml', 'EDP / LIGHT', 14.90, '2025-10-07 04:44:20'),
(65, 61, 40, 'AFNINE 9PM REBEL', 17.80, 1, '10ml', 'EDP / LIGHT', 17.80, '2025-10-12 07:42:42'),
(66, 62, 40, 'AFNINE 9PM REBEL', 20.00, 1, '20ml', 'EDP / LIGHT', 20.00, '2025-10-12 07:42:56'),
(67, 63, 36, '2DAYS SEXY FOR WOMEN', 14.90, 1, '10ml', 'EDP / LIGHT', 14.90, '2025-10-13 02:11:31'),
(68, 64, 36, '2DAYS SEXY FOR WOMEN', 14.90, 1, '10ml', 'EDP / LIGHT', 14.90, '2025-10-13 07:14:38'),
(69, 65, 36, '2DAYS SEXY FOR WOMEN', 39.00, 1, '40ml', 'EDP / LIGHT', 39.00, '2025-10-13 07:48:41'),
(70, 66, 36, '2DAYS SEXY FOR WOMEN', 39.00, 1, '40ml', 'EDP / LIGHT', 39.00, '2025-10-13 07:48:52'),
(71, 67, 32, '2DAYS MAN BORN IN ROMA INTENSE FOR MEN', 17.00, 1, '20ml', 'EDP / LIGHT', 17.00, '2025-10-13 07:54:48'),
(72, 68, 36, '2DAYS SEXY FOR WOMEN', 14.90, 1, '10ml', 'EDP / LIGHT', 14.90, '2025-10-13 08:43:09'),
(73, 69, 36, '2DAYS SEXY FOR WOMEN', 14.90, 1, '10ml', 'EDP / LIGHT', 14.90, '2025-10-13 08:44:01'),
(74, 70, 36, '2DAYS SEXY FOR WOMEN', 15.90, 1, '10ml', 'PARFUM / MEDIUM', 15.90, '2025-10-13 08:44:39'),
(75, 71, 36, '2DAYS SEXY FOR WOMEN', 15.90, 1, '10ml', 'PARFUM / MEDIUM', 15.90, '2025-10-13 08:47:08'),
(76, 72, 40, 'AFNINE 9PM REBEL', 20.00, 1, '20ml', 'EDP / LIGHT', 20.00, '2025-10-13 08:48:21'),
(77, 73, 40, 'AFNINE 9PM REBEL', 20.00, 1, '20ml', 'EDP / LIGHT', 20.00, '2025-10-13 08:51:19'),
(78, 74, 40, 'AFNINE 9PM REBEL', 20.00, 1, '20ml', 'EDP / LIGHT', 20.00, '2025-10-13 08:52:28'),
(79, 75, 40, 'AFNINE 9PM REBEL', 20.00, 1, '20ml', 'EDP / LIGHT', 20.00, '2025-10-13 08:54:47'),
(80, 76, 40, 'AFNINE 9PM REBEL', 20.00, 2, '20ml', 'EDP / LIGHT', 40.00, '2025-10-13 08:55:42'),
(81, 77, 40, 'AFNINE 9PM REBEL', 20.00, 1, '20ml', 'EDP / LIGHT', 20.00, '2025-10-13 08:58:06'),
(82, 78, 36, '2DAYS SEXY FOR WOMEN', 14.90, 1, '10ml', 'EDP / LIGHT', 14.90, '2025-10-13 09:31:31'),
(83, 79, 36, '2DAYS SEXY FOR WOMEN', 14.90, 1, '10ml', 'EDP / LIGHT', 14.90, '2025-10-15 10:10:01'),
(84, 80, 36, '2DAYS SEXY FOR WOMEN', 14.90, 2, '10ml', 'EDP / LIGHT', 29.80, '2025-10-15 10:10:55'),
(85, 81, 36, '2DAYS SEXY FOR WOMEN', 14.90, 1, '10ml', 'EDP / LIGHT', 14.90, '2025-10-16 02:33:53'),
(86, 82, 44, 'VL APOE', 59.00, 1, '40ml', 'EXTRAIT / STRONG', 59.00, '2025-10-26 01:37:19');

-- --------------------------------------------------------

--
-- Table structure for table `points_transactions`
--

CREATE TABLE `points_transactions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `points` int NOT NULL,
  `transaction_type` enum('earned','redeemed','expired','bonus') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'redeemed',
  `description` varchar(255) NOT NULL,
  `order_id` int DEFAULT NULL,
  `reference_id` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `points_transactions`
--

INSERT INTO `points_transactions` (`id`, `user_id`, `points`, `transaction_type`, `description`, `order_id`, `reference_id`, `created_at`) VALUES
(1, 1, 56, 'earned', 'Purchase at Perfume Store', NULL, 'ORDER001', '2025-09-23 04:31:52'),
(2, 1, 123, 'earned', 'Purchase at Perfume Store', NULL, 'ORDER002', '2025-09-23 04:31:52'),
(3, 1, 89, 'earned', 'Purchase at Perfume Store', NULL, 'ORDER003', '2025-09-23 04:31:52'),
(4, 1, 56, 'earned', 'Purchase at Perfume Store', NULL, 'ORDER001', '2025-09-23 04:32:37'),
(5, 1, 123, 'earned', 'Purchase at Perfume Store', NULL, 'ORDER002', '2025-09-23 04:32:37'),
(6, 1, 89, 'earned', 'Purchase at Perfume Store', NULL, 'ORDER003', '2025-09-23 04:32:37'),
(7, 2, -500, '', 'Voucher redemption: Free Shipping', NULL, NULL, '2025-09-30 03:19:06'),
(8, 2, -1000, '', 'Voucher redemption: RM 20 Off', NULL, NULL, '2025-10-01 04:06:07'),
(9, 2, 35, 'earned', 'Delivery confirmation reward for Order #46', 46, 'DELIVERY46', '2025-10-01 08:44:01'),
(10, 2, 105, 'earned', 'Delivery confirmation reward for Order #47', 47, 'DELIVERY47', '2025-10-02 01:19:52'),
(11, 2, 15, 'earned', 'Purchase reward for Order #58', 58, 'ORDER58', '2025-10-03 04:07:24'),
(12, 2, 15, 'earned', 'Delivery confirmation reward for Order #58', 58, 'DELIVERY58', '2025-10-03 04:08:03'),
(13, 2, 15, 'earned', 'Purchase reward for Order #59', 59, 'ORDER59', '2025-10-03 07:51:49'),
(14, 2, 15, 'earned', 'Purchase reward for Order #60', 60, 'ORDER60', '2025-10-07 04:44:42'),
(15, 2, 12, 'earned', 'Purchase reward for Order #61', 61, 'ORDER61', '2025-10-12 07:43:09'),
(16, 2, 12, 'earned', 'Delivery confirmation reward for Order #61', 61, 'DELIVERY61', '2025-10-12 07:46:25'),
(17, 2, 15, 'earned', 'Delivery confirmation reward for Order #60', 60, 'DELIVERY60', '2025-10-12 07:46:56'),
(18, 2, -1, 'redeemed', 'Voucher redemption: test', NULL, NULL, '2025-10-13 01:21:35'),
(19, 2, 15, 'earned', 'Purchase reward for Order #58', 58, 'ORDER58', '2025-10-13 06:36:10'),
(20, 2, 15, 'earned', 'Purchase reward for Order #59', 59, 'ORDER59', '2025-10-13 06:40:18'),
(21, 2, 15, 'earned', 'Purchase reward for Order #67', 67, 'ORDER67', '2025-10-13 07:55:11'),
(22, 2, 12, 'earned', 'Purchase reward for Order #72', 72, 'ORDER72', '2025-10-13 08:48:37'),
(23, 2, 12, 'earned', 'Purchase reward for Order #73', 73, 'ORDER73', '2025-10-13 08:51:37'),
(24, 2, 12, 'earned', 'Purchase reward for Order #74', 74, 'ORDER74', '2025-10-13 08:52:49'),
(25, 2, 12, 'earned', 'Purchase reward for Order #75', 75, 'ORDER75', '2025-10-13 08:55:07'),
(26, 2, 24, 'earned', 'Purchase reward for Order #76', 76, 'ORDER76', '2025-10-13 08:55:55'),
(27, 2, 12, 'earned', 'Purchase reward for Order #77', 77, 'ORDER77', '2025-10-13 08:58:20'),
(28, 2, 15, 'earned', 'Delivery confirmation reward for Order #67', 67, 'DELIVERY67', '2025-10-14 04:01:20'),
(29, 2, 12, 'earned', 'Purchase reward for Order #72', 72, 'ORDER72', '2025-10-16 02:19:13'),
(30, 2, 12, 'earned', 'Purchase reward for Order #73', 73, 'ORDER73', '2025-10-26 01:30:47'),
(31, 2, -1, 'redeemed', 'Voucher redemption: first time order', NULL, NULL, '2025-10-26 07:54:47'),
(32, 2, 10, 'bonus', 'Point code: WELCOME10 - Welcome bonus code', NULL, '1', '2025-10-27 04:21:49'),
(33, 2, 10, 'bonus', 'Point code: WELCOME10 - Welcome bonus code', NULL, '1', '2025-10-27 04:21:51'),
(34, 2, 10, 'bonus', 'Point code: WELCOME10 - Welcome bonus code', NULL, '1', '2025-10-27 04:21:55'),
(35, 2, 10, 'bonus', 'Point code: WELCOME10 - Welcome bonus code', NULL, '1', '2025-10-27 04:21:58'),
(36, 2, 10, 'bonus', 'Point code: WELCOME10 - Welcome bonus code', NULL, '1', '2025-10-27 04:27:10'),
(37, 2, 10, 'bonus', 'Point code: WELCOME10 - Welcome bonus code', NULL, '1', '2025-10-27 04:27:11'),
(38, 2, 10, 'bonus', 'Point code: WELCOME10 - Welcome bonus code', NULL, '1', '2025-10-27 04:27:11'),
(39, 2, 10, 'bonus', 'Point code: WELCOME10 - Welcome bonus code', NULL, '1', '2025-10-27 04:27:11'),
(40, 2, 10, 'bonus', 'Point code: WELCOME10 - Welcome bonus code', NULL, '1', '2025-10-27 04:27:12'),
(41, 2, 10, 'bonus', 'Point code: WELCOME10 - Welcome bonus code', NULL, '1', '2025-10-27 04:27:12'),
(42, 2, 10, 'bonus', 'Point code: WELCOME10 - Welcome bonus code', NULL, '1', '2025-10-27 04:27:15'),
(43, 2, 10, 'bonus', 'Point code: WELCOME10 - Welcome bonus code', NULL, '1', '2025-10-27 04:39:19'),
(44, 2, 10, 'bonus', 'Point code: WELCOME10 - Welcome bonus code', NULL, '1', '2025-10-27 04:44:46'),
(45, 2, 10, 'bonus', 'Point code: WELCOME10 - Welcome bonus code', NULL, '1', '2025-10-27 04:44:48'),
(46, 2, 10, 'bonus', 'Point code: WELCOME10 - Welcome bonus code', NULL, '1', '2025-10-27 04:46:53'),
(47, 2, 10, 'bonus', 'Point code: WELCOME10 - Welcome bonus code', NULL, '1', '2025-10-27 04:55:25'),
(48, 2, 10, 'bonus', 'Point code: WELCOME10 - Welcome bonus code', NULL, '1', '2025-10-27 04:57:14'),
(49, 2, 10, 'bonus', 'Point code: WELCOME10 - Welcome bonus code', NULL, '1', '2025-10-27 04:57:33'),
(50, 2, 10, 'bonus', 'Point code: WELCOME10 - Welcome bonus code', NULL, '1', '2025-10-27 04:57:40'),
(51, 2, 10, 'bonus', 'Point code: WELCOME10 - Welcome bonus code', NULL, '1', '2025-10-27 05:01:13');

-- --------------------------------------------------------

--
-- Table structure for table `point_codes`
--

CREATE TABLE `point_codes` (
  `id` int NOT NULL,
  `code` varchar(50) NOT NULL,
  `points` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `max_uses` int DEFAULT NULL,
  `current_uses` int DEFAULT '0',
  `valid_from` date NOT NULL,
  `valid_until` date NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `point_codes`
--

INSERT INTO `point_codes` (`id`, `code`, `points`, `description`, `max_uses`, `current_uses`, `valid_from`, `valid_until`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'WELCOME10', 10, 'Welcome bonus code', 1000, 1, '2025-10-27', '2026-10-27', 1, NULL, '2025-10-27 05:00:53', '2025-10-27 05:01:13'),
(2, 'FIRST50', 50, 'First time user bonus', 500, 0, '2025-10-27', '2026-04-27', 1, NULL, '2025-10-27 05:00:53', '2025-10-27 05:00:53'),
(3, 'BONUS100', 100, 'Special bonus code', 200, 0, '2025-10-27', '2026-01-27', 1, NULL, '2025-10-27 05:00:53', '2025-10-27 05:00:53'),
(4, 'REWARD200', 200, 'Reward code for loyal customers', 100, 0, '2025-10-27', '2026-10-27', 1, NULL, '2025-10-27 05:00:53', '2025-10-27 05:00:53');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(191) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `version_type` varchar(50) DEFAULT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `sale_price` decimal(10,2) DEFAULT NULL,
  `is_on_sale` tinyint(1) DEFAULT '0',
  `sale_start_date` datetime DEFAULT NULL,
  `sale_end_date` datetime DEFAULT NULL,
  `is_flash_sale` tinyint(1) DEFAULT '0',
  `flash_sale_duration_hours` int DEFAULT '24',
  `flash_sale_variations` json DEFAULT NULL,
  `flash_sale_started_at` datetime DEFAULT NULL,
  `currency` varchar(3) DEFAULT 'RM',
  `volume` varchar(50) DEFAULT NULL,
  `scent` varchar(100) DEFAULT NULL,
  `notes` varchar(100) DEFAULT NULL,
  `season` varchar(100) DEFAULT NULL,
  `recommendation` varchar(100) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `image_2` varchar(191) DEFAULT NULL,
  `image_3` varchar(191) DEFAULT NULL,
  `image_4` varchar(191) DEFAULT NULL,
  `image_5` varchar(191) DEFAULT NULL,
  `image_6` varchar(191) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT '0.0',
  `review_count` int DEFAULT '0',
  `stock_quantity` int DEFAULT '0',
  `is_bestseller` tinyint(1) DEFAULT '0',
  `is_new_arrival` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `is_out_of_stock` tinyint(1) DEFAULT '0',
  `restock_date` datetime DEFAULT NULL,
  `restock_message` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `display_price_mode` enum('range','single') DEFAULT 'range' COMMENT 'Controls price display: range shows min-max, single shows min price only',
  `point_rewards` int DEFAULT '0' COMMENT 'Loyalty points earned per purchase of this product'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `brand`, `version_type`, `description`, `price`, `sale_price`, `is_on_sale`, `sale_start_date`, `sale_end_date`, `is_flash_sale`, `flash_sale_duration_hours`, `flash_sale_variations`, `flash_sale_started_at`, `currency`, `volume`, `scent`, `notes`, `season`, `recommendation`, `image`, `image_2`, `image_3`, `image_4`, `image_5`, `image_6`, `category_id`, `rating`, `review_count`, `stock_quantity`, `is_bestseller`, `is_new_arrival`, `is_active`, `is_out_of_stock`, `restock_date`, `restock_message`, `created_at`, `updated_at`, `display_price_mode`, `point_rewards`) VALUES
(36, '2DAYS SEXY FOR WOMEN', '2Daysparfum', NULL, '', 0.00, 10.81, 1, NULL, NULL, 1, 1, '[{\"size\": \"10ml\", \"sale_price\": 10.812, \"version_type\": \"PARFUM / MEDIUM\", \"original_price\": \"15.9\"}, {\"size\": \"10ml\", \"sale_price\": 11.492, \"version_type\": \"EXTRAIT / STRONG\", \"original_price\": \"16.9\"}]', '2025-10-27 12:31:27', 'RM', NULL, 'semerbak harum', 'test', 'untuk baking', 'for office', 'images/product_1759634372_Screenshot2025-10-05111725.png', 'images/product_1759634372_Screenshot2025-10-05111737.png', 'images/product_1759634372_Screenshot2025-10-05111743.png', '', '', '', 1, 0.0, 0, 100, 1, 1, 1, 0, NULL, NULL, '2025-10-05 03:19:33', '2025-10-27 04:32:54', 'single', 0),
(39, 'contoh', '2Daysparfum', NULL, '', 0.00, NULL, 0, NULL, NULL, 0, 24, NULL, NULL, 'RM', NULL, 'semerbak harum', 'test', 'musim panas', 'for office', 'images/product_1760254220_s.png', '', '', '', '', '', 9, 0.0, 0, 63, 0, 0, 0, 0, NULL, NULL, '2025-10-12 07:30:20', '2025-10-12 07:32:55', 'single', 15),
(40, 'AFNINE 9PM REBEL', '2Daysparfum', NULL, '', 0.00, NULL, 0, NULL, NULL, 0, 24, NULL, NULL, 'RM', NULL, 'semerbak harum', 'test', 'musim panas', 'for office', 'images/product_1760254464_WhatsAppImage2025-10-12at15.32.33_83185fc4.jpg', 'images/product_1760254464_WhatsAppImage2025-10-12at15.31.33_86c3010f.jpg', 'images/product_1760254464_WhatsAppImage2025-10-12at15.31.34_d744c6cf.jpg', 'images/product_1760254464_WhatsAppImage2025-10-12at15.31.34_b24cff83.jpg', 'images/product_1760254464_WhatsAppImage2025-10-12at15.31.34_fadab314.jpg', '', 9, 0.0, 0, 126, 0, 1, 1, 0, NULL, NULL, '2025-10-12 07:34:24', '2025-10-13 08:55:42', 'single', 12),
(41, 'AFNINE 9PM REBEL', '2Daysparfum', NULL, '', 0.00, NULL, 0, NULL, NULL, 0, 24, NULL, NULL, 'RM', NULL, 'semerbak harum', 'test', 'untuk baking', 'for office', '', '', '', '', '', '', 9, 0.0, 0, 22, 0, 0, 0, 0, NULL, NULL, '2025-10-12 08:12:46', '2025-10-12 08:13:00', 'single', 0),
(42, 'AFNINE 9PM REBEL', '2Daysparfum', NULL, '', 0.00, NULL, 0, NULL, NULL, 0, 24, NULL, NULL, 'RM', NULL, 'semerbak harum', 'test', 'untuk baking', 'for office', '', '', '', '', '', '', 9, 0.0, 0, 22, 0, 0, 0, 0, NULL, NULL, '2025-10-12 08:12:47', '2025-10-12 08:13:24', 'single', 0),
(43, 'TESTING', 'TEST', NULL, 'TESTING', 0.00, NULL, 0, NULL, NULL, 0, 24, NULL, NULL, 'RM', NULL, 'semerbak harum', 'test', 'untuk baking', 'for office', 'images/product_1760581755_WhatsAppImage2025-10-12at15.31.34_fadab314.jpg', '', '', '', '', '', 9, 0.0, 0, 30, 0, 0, 0, 1, '2025-10-16 11:30:00', NULL, '2025-10-16 02:29:15', '2025-10-26 07:38:58', 'single', 0),
(31, '', '', NULL, NULL, 0.00, NULL, 0, NULL, NULL, 0, 24, NULL, NULL, 'RM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2025-10-02 07:36:14', '2025-10-02 07:36:32', 'range', 0),
(32, '2DAYS MAN BORN IN ROMA INTENSE FOR MEN', '2Daysparfum', NULL, '', 0.00, NULL, 0, NULL, NULL, 0, 24, NULL, NULL, 'RM', NULL, 'semerbak harum', 'test', 'musim panas', 'tubik nga gewe', 'images/product_1759390585_Screenshot2025-10-02153318.png', '', '', '', '', '', 2, 0.0, 0, 40, 1, 1, 1, 0, NULL, NULL, '2025-10-02 07:36:25', '2025-10-02 07:36:25', 'single', 15),
(33, '[NEW RELEASE] 2DAYS BLUE TALISMAN FOR UNISEX', '2Daysparfum', NULL, '', 0.00, NULL, 0, NULL, NULL, 0, 24, NULL, NULL, 'RM', NULL, 'semerbak harum', 'test', 'musim panas', 'tubik nga gewe', 'images/product_1759390903_Screenshot2025-10-02154022.png', 'images/product_1759390903_Screenshot2025-10-02154030.png', 'images/product_1759390903_Screenshot2025-10-02154038.png', '', '', '', 3, 0.0, 0, 30, 0, 1, 1, 0, NULL, NULL, '2025-10-02 07:41:43', '2025-10-02 08:13:33', 'single', 10),
(34, '2DAYS AFNINE 9PM REBEL FOR UNISEX', '2Daysparfum', NULL, '', 0.00, NULL, 0, NULL, NULL, 0, 24, NULL, NULL, 'RM', NULL, 'semerbak harum', 'test', 'musim panas', 'tubik nga gewe', 'images/product_1759632988_Screenshot2025-10-05104955.png', '', '', '', '', '', 3, 0.0, 0, 113, 0, 0, 1, 0, NULL, NULL, '2025-10-05 02:56:28', '2025-10-05 02:56:28', 'single', 0),
(35, '2DAYS LE GUY ELIXIR ABSOLU FOR MEN ( READY STOCK )', '2Daysparfum', NULL, '', 0.00, NULL, 0, NULL, NULL, 0, 24, NULL, NULL, 'RM', NULL, 'semerbak harum', 'test', 'musim panas', 'tubik nga gewe', 'images/product_1759633987_Screenshot2025-10-05111227.png', '', '', '', '', '', 2, 0.0, 0, 44, 0, 0, 1, 0, NULL, NULL, '2025-10-05 03:13:07', '2025-10-05 03:13:07', 'single', 5),
(37, '2day Be Together', '2Daysparfum', NULL, '', 0.00, 70.00, 0, '2025-10-10 20:00:00', '2025-10-15 23:00:00', 0, 24, NULL, NULL, 'RM', NULL, 'semerbak harum', 'test', 'musim panas', 'untuk kerja', '', '', '', '', '', '', 1, 0.0, 0, 10, 0, 0, 1, 1, '2025-10-10 12:00:00', 'Back in stok soon', '2025-10-07 08:15:33', '2025-10-07 08:19:37', 'range', 10),
(38, 'kasih perfume', '2Daysparfum', NULL, '', 0.00, 0.08, 0, '2025-10-13 23:18:00', '2025-10-15 12:18:00', 1, 24, NULL, NULL, 'RM', NULL, 'semerbak harum', 'test', 'musim panas', 'untuk kerja', '', '', '', '', '', '', 1, 0.0, 0, 2, 0, 1, 0, 1, '2025-10-25 21:21:00', 'Back in stok soon', '2025-10-11 13:22:01', '2025-10-12 02:10:57', 'range', 3),
(44, 'VL APOE', '2Daysparfum', NULL, 'PEMAKAIAN PERFUME INI SESUAI UTK DIGUNAKAN PADA TEMPAT SEJUK DAN INDOOR SAHAJA. ', 0.00, NULL, 0, NULL, NULL, 0, 24, NULL, NULL, 'RM', NULL, 'semerbak harum', 'test', 'untuk baking', 'for office', 'images/product_1760761688_BOTTLE10ML.jpg', 'images/product_1760761688_BOTTLE40ML.jpg', 'images/product_1760761688_BOTTLE60ML.jpg', 'images/product_1760761688_BOTTLE120ML.jpg', 'images/product_1760761688_DISCLAIMER.jpg', '', 1, 0.0, 0, 29, 0, 0, 1, 0, NULL, NULL, '2025-10-16 08:32:48', '2025-10-26 01:37:19', 'range', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_analytics`
--

CREATE TABLE `product_analytics` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `event_type` enum('view','click','add_to_cart','purchase') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `session_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_analytics`
--

INSERT INTO `product_analytics` (`id`, `product_id`, `event_type`, `user_id`, `session_id`, `user_agent`, `ip_address`, `referrer`, `created_at`) VALUES
(1, 36, 'click', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/index.php', '2025-10-06 02:13:01'),
(2, 36, 'view', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/product-detail.php?id=36', '2025-10-06 02:13:01'),
(3, 36, 'add_to_cart', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/product-detail.php?id=36', '2025-10-06 02:13:08'),
(4, 32, 'click', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/index.php', '2025-10-06 02:13:19'),
(5, 32, 'view', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/product-detail.php?id=32', '2025-10-06 02:13:19'),
(6, 33, 'click', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/index.php', '2025-10-06 02:13:22'),
(7, 33, 'view', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/product-detail.php?id=33', '2025-10-06 02:13:22'),
(8, 36, 'click', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/index.php', '2025-10-06 02:13:24'),
(9, 36, 'view', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/product-detail.php?id=36', '2025-10-06 02:13:25'),
(10, 32, 'click', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/index.php', '2025-10-06 02:13:26'),
(11, 32, 'view', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/product-detail.php?id=32', '2025-10-06 02:13:26'),
(12, 36, 'click', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/index.php', '2025-10-06 02:13:28'),
(13, 36, 'view', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/product-detail.php?id=36', '2025-10-06 02:13:28'),
(14, 35, 'view', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/product-detail.php?id=35', '2025-10-06 02:13:34'),
(15, 34, 'view', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/product-detail.php?id=34', '2025-10-06 02:13:41'),
(16, 32, 'view', NULL, 'sess_68e36607235f02.15761992', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '113.211.112.18', 'https://2dayparfum.com/apps/product-detail.php?id=32', '2025-10-06 06:47:35'),
(17, 32, 'view', NULL, 'sess_68e36607235f02.15761992', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '113.211.112.18', 'https://2dayparfum.com/apps/product-detail.php?id=32', '2025-10-06 06:47:36'),
(18, 36, 'click', 2, 'sess_68e36607235f02.15761992', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '113.211.112.18', 'https://2dayparfum.com/apps/index.php', '2025-10-06 07:09:16'),
(19, 36, 'view', 2, 'sess_68e36607235f02.15761992', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '113.211.112.18', 'https://2dayparfum.com/apps/product-detail.php?id=36', '2025-10-06 07:09:16'),
(20, 32, 'click', 2, 'sess_68e36607235f02.15761992', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '113.211.112.18', 'https://2dayparfum.com/apps/index.php', '2025-10-06 07:13:36'),
(21, 32, 'view', 2, 'sess_68e36607235f02.15761992', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '113.211.112.18', 'https://2dayparfum.com/apps/product-detail.php?id=32', '2025-10-06 07:13:37'),
(22, 32, 'add_to_cart', 2, 'sess_68e36607235f02.15761992', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '113.211.112.18', 'https://2dayparfum.com/apps/product-detail.php?id=32', '2025-10-06 07:13:56');

-- --------------------------------------------------------

--
-- Table structure for table `product_analytics_simple`
--

CREATE TABLE `product_analytics_simple` (
  `product_id` int NOT NULL,
  `views` int DEFAULT '0',
  `favorites` int DEFAULT '0',
  `add_to_cart` int DEFAULT '0',
  `revenue` decimal(10,2) DEFAULT '0.00',
  `conversion_rate` decimal(5,2) DEFAULT '0.00',
  `last_viewed` timestamp NULL DEFAULT NULL,
  `last_favorited` timestamp NULL DEFAULT NULL,
  `last_added_to_cart` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_analytics_simple`
--

INSERT INTO `product_analytics_simple` (`product_id`, `views`, `favorites`, `add_to_cart`, `revenue`, `conversion_rate`, `last_viewed`, `last_favorited`, `last_added_to_cart`, `updated_at`) VALUES
(22, 18, 4, 4, 0.00, 22.22, '2025-10-06 07:51:14', '2025-10-06 07:17:30', '2025-10-06 07:17:30', '2025-10-06 07:51:14'),
(32, 72, 1, 13, 0.00, 18.06, '2025-10-26 14:19:49', '2025-10-06 07:57:06', '2025-10-17 02:40:28', '2025-10-26 14:19:49'),
(33, 20, 1, 2, 0.00, 10.00, '2025-10-27 05:35:18', '2025-10-06 07:20:22', '2025-10-27 05:33:38', '2025-10-27 05:35:18'),
(34, 8, 1, 1, 0.00, 12.50, '2025-10-26 14:19:39', '2025-10-07 03:11:39', '2025-10-07 03:11:44', '2025-10-26 14:19:39'),
(35, 4, 0, 0, 0.00, 0.00, '2025-10-16 02:28:06', NULL, NULL, '2025-10-16 02:28:06'),
(36, 112, 4, 11, 0.00, 9.82, '2025-10-27 04:55:50', '2025-10-06 07:56:57', '2025-10-27 04:34:32', '2025-10-27 04:55:50'),
(37, 9, 0, 0, 0.00, 0.00, '2025-10-16 21:12:50', NULL, NULL, '2025-10-16 21:12:50'),
(38, 2, 0, 0, 0.00, 0.00, '2025-10-11 15:32:09', NULL, NULL, '2025-10-11 15:32:09'),
(39, 2, 0, 1, 0.00, 50.00, '2025-10-12 07:31:57', NULL, '2025-10-12 07:31:21', '2025-10-12 07:31:57'),
(40, 45, 2, 2, 0.00, 4.44, '2025-10-27 04:51:03', '2025-10-12 07:56:02', '2025-10-13 08:52:10', '2025-10-27 04:51:03'),
(43, 5, 0, 0, 0.00, 0.00, '2025-10-19 15:23:26', NULL, NULL, '2025-10-19 15:23:26'),
(44, 8, 0, 0, 0.00, 0.00, '2025-10-26 14:19:33', NULL, NULL, '2025-10-26 14:19:33');

-- --------------------------------------------------------

--
-- Table structure for table `product_field_presets`
--

CREATE TABLE `product_field_presets` (
  `id` int NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_type` enum('brand','volume','size','category','season','notes','scent','recommendation') NOT NULL,
  `preset_value` varchar(100) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `sort_order` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_field_presets`
--

INSERT INTO `product_field_presets` (`id`, `field_name`, `field_type`, `preset_value`, `is_active`, `sort_order`, `created_at`, `updated_at`) VALUES
(80, 'recommendation', 'recommendation', 'for office', 1, 0, '2025-10-12 07:27:11', '2025-10-12 07:27:11'),
(76, 'size', 'size', '60ml', 1, 0, '2025-10-07 08:22:55', '2025-10-16 08:33:35'),
(75, 'recommendation', 'recommendation', 'untuk kerja', 1, 0, '2025-10-07 04:42:19', '2025-10-07 08:03:55'),
(74, 'size', 'size', '50ml', 1, 0, '2025-10-05 02:53:10', '2025-10-05 02:53:10'),
(73, 'size', 'size', '40ml', 1, 0, '2025-10-05 02:53:05', '2025-10-05 02:53:05'),
(72, 'size', 'size', '30ml', 1, 0, '2025-10-05 02:53:02', '2025-10-05 02:53:02'),
(71, 'size', 'size', '20ml', 1, 0, '2025-10-05 02:52:57', '2025-10-05 02:52:57'),
(68, 'volume', 'volume', '40ml', 1, 0, '2025-10-05 02:50:24', '2025-10-05 02:50:24'),
(67, 'volume', 'volume', '30ml', 1, 0, '2025-10-05 02:50:18', '2025-10-05 02:50:18'),
(79, 'season', 'season', 'untuk baking', 1, 0, '2025-10-11 13:24:10', '2025-10-11 13:24:10'),
(65, 'scent', 'scent', 'semerbak harum', 1, 0, '2025-10-02 07:30:40', '2025-10-02 07:30:40'),
(82, 'notes', 'notes', 'test', 1, 0, '2025-10-26 08:29:31', '2025-10-26 08:29:31'),
(62, 'category', 'category', 'Men', 1, 0, '2025-10-02 07:30:02', '2025-10-02 07:30:02'),
(61, 'brand', 'brand', '2Daysparfum', 1, 0, '2025-10-02 07:29:46', '2025-10-02 07:29:46'),
(60, 'volume', 'volume', '10 ml', 1, 0, '2025-10-02 07:29:34', '2025-10-02 07:29:34'),
(69, 'volume', 'volume', '50ml', 1, 0, '2025-10-05 02:50:50', '2025-10-05 02:50:50'),
(70, 'size', 'size', '10ml', 1, 0, '2025-10-05 02:52:35', '2025-10-05 02:52:35');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `image_order` int DEFAULT '0',
  `is_primary` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `size` varchar(50) NOT NULL,
  `price_adjustment` decimal(10,2) DEFAULT '0.00',
  `stock_quantity` int DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `product_id`, `size`, `price_adjustment`, `stock_quantity`, `is_active`, `created_at`) VALUES
(1, 1, '30ml', 0.00, 50, 1, '2025-09-19 11:17:09'),
(2, 1, '50ml', 20.00, 30, 1, '2025-09-19 11:17:09'),
(3, 2, '35ml', 0.00, 30, 1, '2025-09-19 11:17:09'),
(4, 2, '50ml', 15.00, 25, 1, '2025-09-19 11:17:09'),
(5, 3, '50ml', 0.00, 25, 1, '2025-09-19 11:17:09'),
(6, 3, '100ml', 50.00, 15, 1, '2025-09-19 11:17:09'),
(7, 4, '50ml', 0.00, 20, 1, '2025-09-19 11:17:09'),
(8, 4, '100ml', 60.00, 10, 1, '2025-09-19 11:17:09'),
(9, 5, '50ml', 0.00, 35, 1, '2025-09-19 11:17:09'),
(10, 5, '100ml', 45.00, 20, 1, '2025-09-19 11:17:09'),
(11, 6, '50ml', 0.00, 40, 1, '2025-09-19 11:17:09'),
(12, 6, '100ml', 40.00, 25, 1, '2025-09-19 11:17:09'),
(13, 7, '50ml', 0.00, 15, 1, '2025-09-19 11:17:09'),
(14, 7, '100ml', 80.00, 8, 1, '2025-09-19 11:17:09'),
(15, 8, '50ml', 0.00, 60, 1, '2025-09-19 11:17:09'),
(16, 8, '100ml', 70.00, 30, 1, '2025-09-19 11:17:09'),
(17, 9, '60ml', 0.00, 45, 1, '2025-09-19 11:17:09'),
(18, 9, '100ml', 50.00, 25, 1, '2025-09-19 11:17:09'),
(19, 10, '50ml', 0.00, 30, 1, '2025-09-19 11:17:09'),
(20, 10, '100ml', 40.00, 15, 1, '2025-09-19 11:17:09'),
(21, 1, '30ml', 0.00, 50, 1, '2025-09-23 04:31:52'),
(22, 1, '50ml', 20.00, 30, 1, '2025-09-23 04:31:52'),
(23, 2, '35ml', 0.00, 30, 1, '2025-09-23 04:31:52'),
(24, 2, '50ml', 15.00, 25, 1, '2025-09-23 04:31:52'),
(25, 3, '50ml', 0.00, 25, 1, '2025-09-23 04:31:52'),
(26, 3, '100ml', 50.00, 15, 1, '2025-09-23 04:31:52'),
(27, 4, '50ml', 0.00, 20, 1, '2025-09-23 04:31:52'),
(28, 4, '100ml', 60.00, 10, 1, '2025-09-23 04:31:52'),
(29, 5, '50ml', 0.00, 35, 1, '2025-09-23 04:31:52'),
(30, 5, '100ml', 45.00, 20, 1, '2025-09-23 04:31:52'),
(31, 6, '50ml', 0.00, 40, 1, '2025-09-23 04:31:52'),
(32, 6, '100ml', 40.00, 25, 1, '2025-09-23 04:31:52'),
(33, 7, '50ml', 0.00, 15, 1, '2025-09-23 04:31:52'),
(34, 7, '100ml', 80.00, 8, 1, '2025-09-23 04:31:52'),
(35, 8, '50ml', 0.00, 60, 1, '2025-09-23 04:31:52'),
(36, 8, '100ml', 70.00, 30, 1, '2025-09-23 04:31:52'),
(37, 9, '60ml', 0.00, 45, 1, '2025-09-23 04:31:52'),
(38, 9, '100ml', 50.00, 25, 1, '2025-09-23 04:31:52'),
(39, 10, '50ml', 0.00, 30, 1, '2025-09-23 04:31:52'),
(40, 10, '100ml', 40.00, 15, 1, '2025-09-23 04:31:52'),
(41, 1, '30ml', 0.00, 50, 1, '2025-09-23 04:32:37'),
(42, 1, '50ml', 20.00, 30, 1, '2025-09-23 04:32:37'),
(43, 2, '35ml', 0.00, 30, 1, '2025-09-23 04:32:37'),
(44, 2, '50ml', 15.00, 25, 1, '2025-09-23 04:32:37'),
(45, 3, '50ml', 0.00, 25, 1, '2025-09-23 04:32:37'),
(46, 3, '100ml', 50.00, 15, 1, '2025-09-23 04:32:37'),
(47, 4, '50ml', 0.00, 20, 1, '2025-09-23 04:32:37'),
(48, 4, '100ml', 60.00, 10, 1, '2025-09-23 04:32:37'),
(49, 5, '50ml', 0.00, 35, 1, '2025-09-23 04:32:37'),
(50, 5, '100ml', 45.00, 20, 1, '2025-09-23 04:32:37'),
(51, 6, '50ml', 0.00, 40, 1, '2025-09-23 04:32:37'),
(52, 6, '100ml', 40.00, 25, 1, '2025-09-23 04:32:37'),
(53, 7, '50ml', 0.00, 15, 1, '2025-09-23 04:32:37'),
(54, 7, '100ml', 80.00, 8, 1, '2025-09-23 04:32:37'),
(55, 8, '50ml', 0.00, 60, 1, '2025-09-23 04:32:37'),
(56, 8, '100ml', 70.00, 30, 1, '2025-09-23 04:32:37'),
(57, 9, '60ml', 0.00, 45, 1, '2025-09-23 04:32:37'),
(58, 9, '100ml', 50.00, 25, 1, '2025-09-23 04:32:37'),
(59, 10, '50ml', 0.00, 30, 1, '2025-09-23 04:32:37'),
(60, 10, '100ml', 40.00, 15, 1, '2025-09-23 04:32:37'),
(86, 21, '35ml', 100.00, 30, 1, '2025-09-30 01:12:11'),
(85, 21, '30ml', 66.00, 33, 1, '2025-09-30 01:12:11'),
(111, 22, '30ml', 1.00, 20, 1, '2025-10-01 02:00:15');

-- --------------------------------------------------------

--
-- Table structure for table `referral_codes`
--

CREATE TABLE `referral_codes` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `referral_code` varchar(20) NOT NULL,
  `points_earned` int DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `referral_codes`
--

INSERT INTO `referral_codes` (`id`, `user_id`, `referral_code`, `points_earned`, `is_active`, `created_at`) VALUES
(1, 2, 'AB2025', 0, 1, '2025-09-19 13:32:04'),
(2, 1, 'JD2025', 0, 1, '2025-09-20 03:49:47'),
(3, 4, 'GU2025', 0, 1, '2025-09-21 01:51:28'),
(4, 1, 'JOHN2024', 0, 1, '2025-09-23 04:31:52'),
(5, 6, 'IH2025', 0, 1, '2025-10-05 05:35:42'),
(6, 7, 'HM2025', 0, 1, '2025-10-12 07:23:25'),
(7, 11, 'NH2025', 0, 1, '2025-10-16 02:09:56'),
(8, 15, 'HR2025', 0, 1, '2025-10-23 07:44:42');

-- --------------------------------------------------------

--
-- Table structure for table `referral_usage`
--

CREATE TABLE `referral_usage` (
  `id` int NOT NULL,
  `referrer_id` int NOT NULL,
  `referred_user_id` int NOT NULL,
  `referral_code` varchar(20) NOT NULL,
  `points_awarded` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `remember_tokens`
--

CREATE TABLE `remember_tokens` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `remember_tokens`
--

INSERT INTO `remember_tokens` (`id`, `user_id`, `token`, `expires_at`, `created_at`, `updated_at`) VALUES
(6, 2, '128915dc544bc95ea253c47483bdc2ef6031da058efbd3e4e0235674151e15e6', '2025-11-01 00:45:01', '2025-10-02 08:45:01', '2025-10-02 08:45:01'),
(7, 6, 'cc8fade1d7a6ea255ee19160864c9db2154d1456916515c0826f35aee014acd3', '2025-11-03 21:35:04', '2025-10-05 05:35:04', '2025-10-05 05:35:04'),
(8, 2, 'e55991cf1e5034d329fd6f112ba9dbdaa005d46ed8a7fbccce4d35d1f7fb95c0', '2025-11-06 01:12:38', '2025-10-07 09:12:38', '2025-10-07 09:12:38'),
(14, 2, '2451f10a9f225546791a41a72c4b7a10451ba0e709785d554c7409f72f0ebab8', '2025-11-25 00:24:21', '2025-10-26 08:24:21', '2025-10-26 08:24:21'),
(10, 2, '407540293af952144734ada0c2c440f87ab4f9cde2bb26ccbb7cddfdba3888c6', '2025-11-10 07:31:37', '2025-10-11 15:31:37', '2025-10-11 15:31:37'),
(11, 6, 'd19349f562ac6b7c154e744f3b63ede4e7b55ff2886ab41b84a5eaefa6fa8cb3', '2025-11-11 06:46:53', '2025-10-12 14:46:53', '2025-10-12 14:46:53'),
(12, 15, '7b12e4b88ac42912bd1e9235b616116aa1749568a962b8a68b1c80731e67159b', '2025-11-21 23:44:25', '2025-10-23 07:44:25', '2025-10-23 07:44:25'),
(13, 7, '4f4c1394bb537f8eb7f42f59b8a864c6dd9e04cad9e817ee965ed2f755839283', '2025-11-24 23:09:49', '2025-10-26 07:09:49', '2025-10-26 07:09:49'),
(15, 2, '4e3eb38122f5a1430fbece2599bcafa7959528eb4092d914be9789b1e1502c23', '2025-11-25 20:38:47', '2025-10-27 04:38:47', '2025-10-27 04:38:47');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `rating` int NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `comment` text,
  `is_verified` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `royal_tiers`
--

CREATE TABLE `royal_tiers` (
  `id` int NOT NULL,
  `tier_name` varchar(50) NOT NULL,
  `tier_level` int NOT NULL,
  `min_points` int NOT NULL,
  `max_points` int DEFAULT NULL,
  `tier_color` varchar(7) DEFAULT '#D4AF37',
  `tier_icon` varchar(50) DEFAULT 'fas fa-crown',
  `benefits` text,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `royal_tiers`
--

INSERT INTO `royal_tiers` (`id`, `tier_name`, `tier_level`, `min_points`, `max_points`, `tier_color`, `tier_icon`, `benefits`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Bronze', 1, 0, 999, '#CD7F32', 'fas fa-medal', 'Basic rewards and standard shipping', 1, '2025-09-30 01:41:40', '2025-09-30 01:41:40'),
(2, 'Silver', 2, 1000, 4999, '#C0C0C0', 'fas fa-medal', 'Priority support and faster shipping', 1, '2025-09-30 01:41:40', '2025-09-30 01:41:40'),
(3, 'Gold', 3, 5000, 9999, '#FFD700', 'fas fa-crown', 'Exclusive products and free shipping', 1, '2025-09-30 01:41:40', '2025-09-30 01:41:40'),
(4, 'Platinum', 4, 10000, 19999, '#E5E4E2', 'fas fa-gem', 'VIP treatment and early access', 1, '2025-09-30 01:41:40', '2025-09-30 01:41:40'),
(5, 'Diamond', 5, 20000, NULL, '#B9F2FF', 'fas fa-diamond', 'Ultimate luxury experience and personal concierge', 1, '2025-09-30 01:41:40', '2025-09-30 01:41:40');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `address_name` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `country` varchar(100) DEFAULT 'Malaysia',
  `is_default` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `user_id`, `address_name`, `first_name`, `last_name`, `phone`, `address`, `city`, `state`, `zip_code`, `country`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 2, 'Kg Surau Bator', 'AZFAR', 'BIN ASRI', '+60179853875', 'Kg Surau Bator', 'Bachok', 'Kelantan', '16070', 'Malaysia', 1, '2025-09-28 06:02:18', '2025-09-28 06:32:50'),
(2, 2, 'TEST', 'SADAS', 'DSADAS', '0123456789', 'DASDASDSADSA', 'SADDSA', 'DSADSA', '12390', 'Malaysia', 0, '2025-09-28 06:32:36', '2025-09-28 06:32:50'),
(3, 15, 'Home', 'Nik Hariz', 'Nik Rohimi', '0148279126', 'LOT 350 TANJUNG CHAT', 'KOTA BHARU', 'KELANTAN', '15300', 'Malaysia', 1, '2025-10-26 07:10:45', '2025-10-26 07:10:45');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_fees`
--

CREATE TABLE `shipping_fees` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `fee_type` enum('weight_based','free_shipping_threshold','pickup') NOT NULL DEFAULT 'weight_based',
  `base_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee_value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `min_order_amount` decimal(10,2) DEFAULT '0.00',
  `max_order_amount` decimal(10,2) DEFAULT NULL,
  `delivery_days_min` int DEFAULT '1',
  `delivery_days_max` int DEFAULT '3',
  `is_active` tinyint(1) DEFAULT '1',
  `sort_order` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `per_kg_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `min_weight` decimal(5,2) DEFAULT '0.00',
  `max_weight` decimal(5,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `shipping_fees`
--

INSERT INTO `shipping_fees` (`id`, `name`, `description`, `fee_type`, `base_fee`, `fee_value`, `min_order_amount`, `max_order_amount`, `delivery_days_min`, `delivery_days_max`, `is_active`, `sort_order`, `created_at`, `updated_at`, `per_kg_fee`, `min_weight`, `max_weight`) VALUES
(1, 'ezparcel', '', 'weight_based', 3.67, 8.00, 0.00, NULL, 2, 3, 1, 1, '2025-09-24 07:18:29', '2025-10-05 02:48:14', 2.50, 0.00, 10.00),
(9, 'free', '', 'free_shipping_threshold', 0.00, 0.00, 100.00, NULL, 2, 4, 1, 0, '2025-09-28 06:38:06', '2025-09-28 06:38:06', 0.00, 0.00, NULL),
(11, 'Pickup Order', 'Self collection from store (free shipping)', 'pickup', 0.00, 0.00, 0.00, NULL, 0, 0, 1, 0, '2025-10-13 07:37:58', '2025-10-13 07:37:58', 0.00, 0.00, NULL),
(12, 'jnt', '', 'weight_based', 3.00, 0.00, 1.00, NULL, 3, 4, 1, 0, '2025-10-13 07:44:05', '2025-10-13 07:44:05', 0.00, 0.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `site_analytics`
--

CREATE TABLE `site_analytics` (
  `id` int NOT NULL,
  `page_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_type` enum('home','product','category','cart','checkout','other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `session_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visit_duration` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_analytics`
--

INSERT INTO `site_analytics` (`id`, `page_url`, `page_type`, `user_id`, `session_id`, `user_agent`, `ip_address`, `referrer`, `visit_duration`, `created_at`) VALUES
(1, 'https://2dayparfum.com/apps/', 'other', NULL, 'sess_68e325424b89d1.85681048', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/', 0, '2025-10-06 02:11:14'),
(2, 'https://2dayparfum.com/apps/index.php', 'other', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/index.php', 0, '2025-10-06 02:12:59'),
(3, 'https://2dayparfum.com/apps/product-detail.php?id=36', 'product', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/product-detail.php?id=36', 0, '2025-10-06 02:13:01'),
(4, 'https://2dayparfum.com/apps/index.php', 'other', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/index.php', 0, '2025-10-06 02:13:18'),
(5, 'https://2dayparfum.com/apps/product-detail.php?id=32', 'product', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/product-detail.php?id=32', 0, '2025-10-06 02:13:19'),
(6, 'https://2dayparfum.com/apps/index.php', 'other', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/index.php', 0, '2025-10-06 02:13:21'),
(7, 'https://2dayparfum.com/apps/product-detail.php?id=33', 'product', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/product-detail.php?id=33', 0, '2025-10-06 02:13:22'),
(8, 'https://2dayparfum.com/apps/index.php', 'other', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/index.php', 0, '2025-10-06 02:13:23'),
(9, 'https://2dayparfum.com/apps/product-detail.php?id=36', 'product', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/product-detail.php?id=36', 0, '2025-10-06 02:13:25'),
(10, 'https://2dayparfum.com/apps/index.php', 'other', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/index.php', 0, '2025-10-06 02:13:25'),
(11, 'https://2dayparfum.com/apps/product-detail.php?id=32', 'product', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/product-detail.php?id=32', 0, '2025-10-06 02:13:26'),
(12, 'https://2dayparfum.com/apps/index.php', 'other', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/index.php', 0, '2025-10-06 02:13:27'),
(13, 'https://2dayparfum.com/apps/product-detail.php?id=36', 'product', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/product-detail.php?id=36', 0, '2025-10-06 02:13:28'),
(14, 'https://2dayparfum.com/apps/index.php', 'other', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/index.php', 0, '2025-10-06 02:13:29'),
(15, 'https://2dayparfum.com/apps/product-detail.php?id=35', 'product', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/product-detail.php?id=35', 0, '2025-10-06 02:13:34'),
(16, 'https://2dayparfum.com/apps/product-detail.php?id=34', 'product', 2, 'sess_68e325ab8bbce4.88077405', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '124.13.12.78', 'https://2dayparfum.com/apps/product-detail.php?id=34', 0, '2025-10-06 02:13:41'),
(17, 'https://2dayparfum.com/apps/product-detail.php?id=32', 'product', NULL, 'sess_68e36607235f02.15761992', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '113.211.112.18', 'https://2dayparfum.com/apps/product-detail.php?id=32', 0, '2025-10-06 06:47:35'),
(18, 'https://2dayparfum.com/apps/product-detail.php?id=32', 'product', NULL, 'sess_68e36607235f02.15761992', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '113.211.112.18', 'https://2dayparfum.com/apps/product-detail.php?id=32', 0, '2025-10-06 06:47:36'),
(19, 'https://2dayparfum.com/apps/index.php', 'other', 2, 'sess_68e36607235f02.15761992', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '113.211.112.18', 'https://2dayparfum.com/apps/index.php', 0, '2025-10-06 06:47:46'),
(20, 'https://2dayparfum.com/apps/index.php', 'other', 2, 'sess_68e36607235f02.15761992', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '113.211.112.18', 'https://2dayparfum.com/apps/index.php', 0, '2025-10-06 07:09:14'),
(21, 'https://2dayparfum.com/apps/index.php', 'other', 2, 'sess_68e36607235f02.15761992', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '113.211.112.18', 'https://2dayparfum.com/apps/index.php', 0, '2025-10-06 07:09:15'),
(22, 'https://2dayparfum.com/apps/product-detail.php?id=36', 'product', 2, 'sess_68e36607235f02.15761992', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '113.211.112.18', 'https://2dayparfum.com/apps/product-detail.php?id=36', 0, '2025-10-06 07:09:16'),
(23, 'https://2dayparfum.com/apps/index.php', 'other', 2, 'sess_68e36607235f02.15761992', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '113.211.112.18', 'https://2dayparfum.com/apps/index.php', 0, '2025-10-06 07:09:20'),
(24, 'https://2dayparfum.com/apps/index.php', 'other', 2, 'sess_68e36607235f02.15761992', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '113.211.112.18', 'https://2dayparfum.com/apps/index.php', 0, '2025-10-06 07:13:29'),
(25, 'https://2dayparfum.com/apps/product-detail.php?id=32', 'product', 2, 'sess_68e36607235f02.15761992', 'Mozilla/5.0 (Linux; Android; K) App8 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36', '113.211.112.18', 'https://2dayparfum.com/apps/product-detail.php?id=32', 0, '2025-10-06 07:13:36');

-- --------------------------------------------------------

--
-- Table structure for table `traffic_sources`
--

CREATE TABLE `traffic_sources` (
  `id` int NOT NULL,
  `session_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_type` enum('direct','search','social','email','referral','other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_source` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_medium` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_campaign` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `traffic_sources`
--

INSERT INTO `traffic_sources` (`id`, `session_id`, `source_type`, `source_name`, `utm_source`, `utm_medium`, `utm_campaign`, `landing_page`, `created_at`) VALUES
(1, 'sess_68e325424b89d1.85681048', 'referral', '2dayparfum.com', NULL, NULL, NULL, '/apps/', '2025-10-06 02:11:14'),
(2, 'sess_68e325ab8bbce4.88077405', 'referral', '2dayparfum.com', NULL, NULL, NULL, '/apps/index.php', '2025-10-06 02:12:59'),
(3, 'sess_68e36607235f02.15761992', 'referral', '2dayparfum.com', NULL, NULL, NULL, '/apps/index.php', '2025-10-06 07:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(191) NOT NULL,
  `google_id` varchar(191) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email_verified` tinyint(1) DEFAULT '0',
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT 'Malaysia',
  `is_guest` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remember_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `google_id`, `password`, `email_verified`, `first_name`, `last_name`, `avatar`, `phone`, `address`, `city`, `state`, `zip_code`, `country`, `is_guest`, `created_at`, `updated_at`, `remember_token`) VALUES
(2, 'azfarirfan7767@gmail.com', NULL, '$2y$10$Eg6ZmM95t7sNsruuyFPlVeCtcZPI0K3LuL/SrEEZ0b10tP.LOyGGG', 1, 'AZFAR', 'BIN ASRI', 'uploads/avatars/avatar_2_1759300738.jpg', '0179853875', NULL, NULL, NULL, NULL, 'Malaysia', 0, '2025-09-19 11:18:35', '2025-10-27 04:38:47', '4e3eb38122f5a1430fbece2599bcafa7959528eb4092d914be9789b1e1502c23'),
(6, 'irfanhashim94@gmail.com', NULL, '$2y$10$C7GYIqqC.6aZEsa/KujljezGWtEAm6xP5LqQth9uumN0XN339Wdqi', 1, 'Irfan', 'Hashim', NULL, '0139032053', NULL, NULL, NULL, NULL, 'Malaysia', 0, '2025-10-02 05:37:30', '2025-10-12 14:46:53', 'd19349f562ac6b7c154e744f3b63ede4e7b55ff2886ab41b84a5eaefa6fa8cb3'),
(7, 'husninafarzana@gmail.com', NULL, '$2y$10$DQxkqGZSnyqZxTtELhiUheBSF82UAfBEnQYdZzF0NWnxLBSuPGhA6', 0, 'Husnina', 'Maraie', NULL, '0139938504', NULL, NULL, NULL, NULL, 'Malaysia', 0, '2025-10-12 07:09:26', '2025-10-26 07:09:49', '4f4c1394bb537f8eb7f42f59b8a864c6dd9e04cad9e817ee965ed2f755839283'),
(8, 'ikmal_hisham90@yahoo.com', NULL, '$2y$10$AfaS038FeshfAyDOMFTIRe0F3Od..e7fBPUjPaiyJ1IJmtCSRJf8y', 0, 'Ikmal', 'Hisyam', NULL, '0175424011', NULL, NULL, NULL, NULL, 'Malaysia', 0, '2025-10-12 07:21:09', '2025-10-12 07:21:09', NULL),
(9, 'azimfenzes.af2@gmail.com', NULL, '$2y$10$aM4KcEqerTSwiNvPfgX.muC3kuT0EZeRhlxZsUR1w4vT.4kD45i6W', 0, 'Azim', 'Mohd', NULL, '0189064169', NULL, NULL, NULL, NULL, 'Malaysia', 0, '2025-10-12 07:28:19', '2025-10-12 07:28:19', NULL),
(10, 'amirulresources@gmail.com', NULL, '$2y$10$4KAAmOVzBqk8wJJHEBDAmOAz2D3ikyFErE71Yw49pAI7V1KtCrnT2', 0, 'Amirul', 'Hakkim', NULL, '01119807850', NULL, NULL, NULL, NULL, 'Malaysia', 0, '2025-10-15 05:23:48', '2025-10-15 05:23:48', NULL),
(11, 'hazy56@gmail.com', NULL, '$2y$10$9eUKBYjiZnCd4ImVqGRt1exB.x7w7xQ66PNeEQ69PlFVcjVVnr8L6', 0, 'Nur', 'Hazali', NULL, '0125364894', '', '', '', '', 'Malaysia', 0, '2025-10-16 01:36:31', '2025-10-16 01:38:04', NULL),
(12, 'marga.w14ifnb.paid@icloud.com', NULL, '$2y$10$XPxnADSi4vbcMTTM3E5W4e0/ZPu9ZCSgopAKVMS8sXjm9ltoEzBti', 0, 'Mar', 'Ga', NULL, '', NULL, NULL, NULL, NULL, 'Malaysia', 0, '2025-10-21 09:13:34', '2025-10-21 09:13:34', NULL),
(13, 'bibiainun95@gmail.com', NULL, '$2y$10$F4O.kCooThQbQrkiTmev.uddavWFV4Ige4bIp7KqH.9UsAhpoghyC', 0, 'Bibi', 'Ainun', NULL, '0139477020', NULL, NULL, NULL, NULL, 'Malaysia', 0, '2025-10-21 12:02:34', '2025-10-21 12:02:34', NULL),
(14, 'farouqzakaria7890@gmail.com', NULL, '$2y$10$gjrXtBe8D4U4zLiA7P0VDe9wWTxciYVfxppMqN3oUaHmeAzUvv9ri', 0, 'Farouq', 'Zakaria', NULL, '01162753504', NULL, NULL, NULL, NULL, 'Malaysia', 0, '2025-10-22 01:38:33', '2025-10-22 01:38:33', NULL),
(15, 'hariz1012@gmail.com', NULL, '$2y$10$243Lq4hjfX0PUKIYpyIA5ulfyaJVjKnRlN1WT./pviBAO76yeCMdS', 0, 'HARIZ', 'ROHIMI', NULL, '0148279126', NULL, NULL, NULL, NULL, 'Malaysia', 0, '2025-10-22 01:46:16', '2025-10-23 07:44:25', '7b12e4b88ac42912bd1e9235b616116aa1749568a962b8a68b1c80731e67159b'),
(16, 'test@gmail.com', NULL, '$2y$10$fZwt5hefakSOQivTQwPkv.fvKfbC4O3pzosWEtexE3zzDGd8.o1aW', 0, 'Test', 'test', NULL, '', NULL, NULL, NULL, NULL, 'Malaysia', 0, '2025-10-22 01:51:22', '2025-10-22 01:51:22', NULL),
(17, 'olivierarlette@gmail.com', NULL, '$2y$10$UURXpwLvAshNnO4qksa11.qgjJRz/v2Wpu/ykEiGNZWPXQu4saQRW', 0, 'Arlette', 'Olivier', NULL, '+32495544607', NULL, NULL, NULL, NULL, 'Malaysia', 0, '2025-10-25 17:58:13', '2025-10-25 17:58:13', NULL),
(18, 'nas793@gmail.com', NULL, '$2y$10$v6Sue1Kqd0ZnVwNj.ZAOuOUjsdDQWAqtwEqatpjJhY1Cew/RDydBC', 0, 'MOHAMAD NASHRUL', 'BIN SUAIB', NULL, '0139845536', NULL, NULL, NULL, NULL, 'Malaysia', 0, '2025-10-27 05:31:48', '2025-10-27 05:31:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_loyalty_points`
--

CREATE TABLE `user_loyalty_points` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `points` int DEFAULT '0',
  `tier` enum('bronze','silver','gold') DEFAULT 'bronze',
  `total_spent` decimal(10,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_loyalty_points`
--

INSERT INTO `user_loyalty_points` (`id`, `user_id`, `points`, `tier`, `total_spent`, `created_at`, `updated_at`) VALUES
(1, 2, 994, 'bronze', 607.00, '2025-09-19 13:32:04', '2025-10-27 05:01:13'),
(3, 4, 0, 'bronze', 0.00, '2025-09-21 01:51:28', '2025-09-21 01:51:28'),
(4, 1, 1240, 'silver', 1240.00, '2025-09-23 04:31:52', '2025-09-23 04:31:52'),
(6, 6, 0, 'bronze', 0.00, '2025-10-05 05:35:42', '2025-10-05 05:35:42'),
(7, 7, 0, 'bronze', 0.00, '2025-10-12 07:23:25', '2025-10-12 07:23:25'),
(8, 11, 0, 'bronze', 0.00, '2025-10-16 02:09:56', '2025-10-16 02:09:56'),
(9, 15, 0, 'bronze', 0.00, '2025-10-23 07:44:42', '2025-10-23 07:44:42');

-- --------------------------------------------------------

--
-- Table structure for table `user_point_code_usage`
--

CREATE TABLE `user_point_code_usage` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `code_id` int NOT NULL,
  `code` varchar(50) NOT NULL,
  `points_awarded` int NOT NULL,
  `used_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_point_code_usage`
--

INSERT INTO `user_point_code_usage` (`id`, `user_id`, `code_id`, `code`, `points_awarded`, `used_at`) VALUES
(1, 2, 1, 'WELCOME10', 10, '2025-10-27 05:01:13');

-- --------------------------------------------------------

--
-- Table structure for table `user_voucher_redemptions`
--

CREATE TABLE `user_voucher_redemptions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `voucher_id` int NOT NULL,
  `redeemed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `order_id` int DEFAULT NULL,
  `points_used` int NOT NULL,
  `status` enum('active','used','expired') DEFAULT 'active'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_voucher_redemptions`
--

INSERT INTO `user_voucher_redemptions` (`id`, `user_id`, `voucher_id`, `redeemed_at`, `order_id`, `points_used`, `status`) VALUES
(4, 2, 7, '2025-10-01 04:06:07', NULL, 1000, 'used'),
(3, 2, 6, '2025-09-30 03:19:06', NULL, 500, 'used'),
(5, 2, 8, '2025-10-12 07:47:52', NULL, 10, 'active'),
(6, 2, 5, '2025-10-12 07:54:58', NULL, 100, 'used'),
(7, 2, 9, '2025-10-13 01:13:15', NULL, 1, 'active'),
(8, 2, 4, '2025-10-13 01:14:35', NULL, 2000, 'active'),
(9, 2, 10, '2025-10-13 01:21:35', NULL, 1, 'used'),
(10, 2, 12, '2025-10-26 07:54:47', NULL, 1, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `version_variations`
--

CREATE TABLE `version_variations` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `version_type` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `version_variations`
--

INSERT INTO `version_variations` (`id`, `product_id`, `version_type`, `size`, `price`, `stock_quantity`, `is_active`, `created_at`, `updated_at`) VALUES
(52, 22, 'EDP / LIGHT', '30ml', 23.00, 0, 1, '2025-10-02 02:32:24', '2025-10-02 02:32:24'),
(53, 22, 'EDP / LIGHT', '50ml', 22.00, 0, 1, '2025-10-02 02:32:24', '2025-10-02 02:32:24'),
(54, 22, 'EXTRAIT / STRONG', '50ml', 33.00, 20, 1, '2025-10-02 02:32:24', '2025-10-02 02:32:24'),
(55, 22, 'PARFUM / MEDIUM', '30ml', 20.00, 0, 1, '2025-10-02 02:32:24', '2025-10-02 02:32:24'),
(50, 21, 'EDP / LIGHT', '30ml', 23.00, 3, 1, '2025-10-02 01:45:06', '2025-10-02 01:45:06'),
(51, 23, 'PARFUM / MEDIUM', '30ml', 23.00, 0, 1, '2025-10-02 01:45:49', '2025-10-02 01:45:49'),
(56, 32, 'EDP / LIGHT', '10ml', 14.90, 8, 1, '2025-10-02 07:36:25', '2025-10-13 06:42:48'),
(57, 32, 'EDP / LIGHT', '20ml', 17.00, 18, 1, '2025-10-02 07:36:25', '2025-10-13 07:55:12'),
(60, 33, 'EDP / LIGHT', '10ml', 16.90, 30, 1, '2025-10-02 08:13:33', '2025-10-02 08:13:33'),
(61, 34, 'EDP / LIGHT', '10ml', 14.90, 20, 1, '2025-10-05 02:56:28', '2025-10-05 02:56:28'),
(62, 34, 'EDP / LIGHT', '40ml', 39.00, 30, 1, '2025-10-05 02:56:28', '2025-10-05 02:56:28'),
(63, 34, 'PARFUM / MEDIUM', '10ml', 15.90, 30, 1, '2025-10-05 02:56:28', '2025-10-05 02:56:28'),
(64, 34, 'PARFUM / MEDIUM', '40ml', 49.00, 33, 1, '2025-10-05 02:56:28', '2025-10-05 02:56:28'),
(65, 35, 'EDP / LIGHT', '10ml', 14.90, 32, 1, '2025-10-05 03:13:07', '2025-10-05 03:13:07'),
(66, 35, 'EDP / LIGHT', '40ml', 39.00, 12, 1, '2025-10-05 03:13:07', '2025-10-05 03:13:07'),
(145, 36, 'PARFUM / MEDIUM', '10ml', 15.90, 29, 1, '2025-10-27 04:32:54', '2025-10-27 04:32:54'),
(144, 36, 'EXTRAIT / STRONG', '10ml', 16.90, 23, 1, '2025-10-27 04:32:54', '2025-10-27 04:32:54'),
(143, 36, 'EDP / LIGHT', '40ml', 39.00, 31, 1, '2025-10-27 04:32:54', '2025-10-27 04:32:54'),
(142, 36, 'EDP / LIGHT', '10ml', 14.90, 17, 1, '2025-10-27 04:32:54', '2025-10-27 04:32:54'),
(85, 37, 'EDP / LIGHT', '20ml', 97.00, 10, 1, '2025-10-07 08:19:37', '2025-10-07 08:19:37'),
(87, 38, 'EDP / LIGHT', '10ml', 1000.00, 2, 1, '2025-10-12 02:10:27', '2025-10-12 02:10:27'),
(96, 39, 'EDP / LIGHT', '10ml', 30.00, 30, 1, '2025-10-12 07:30:20', '2025-10-12 07:30:20'),
(97, 39, 'PARFUM / MEDIUM', '20ml', 32.30, 33, 1, '2025-10-12 07:30:20', '2025-10-12 07:30:20'),
(101, 40, 'EDP / LIGHT', '20ml', 20.00, 74, 1, '2025-10-12 07:34:43', '2025-10-26 01:30:47'),
(100, 40, 'EDP / LIGHT', '10ml', 17.80, 38, 1, '2025-10-12 07:34:43', '2025-10-12 07:43:11'),
(102, 41, 'EDP / LIGHT', '10ml', 21.00, 22, 1, '2025-10-12 08:12:46', '2025-10-12 08:12:46'),
(103, 42, 'EDP / LIGHT', '10ml', 21.00, 22, 1, '2025-10-12 08:12:47', '2025-10-12 08:12:47'),
(107, 43, 'EDP / LIGHT', '20ml', 15.00, 20, 1, '2025-10-16 02:30:04', '2025-10-16 02:30:04'),
(106, 43, 'EDP / LIGHT', '10ml', 13.00, 10, 1, '2025-10-16 02:30:04', '2025-10-16 02:30:04'),
(132, 44, 'EDP / LIGHT', '10ml', 14.90, 5, 1, '2025-10-18 04:28:08', '2025-10-18 04:28:08'),
(137, 44, 'PARFUM / MEDIUM', '40ml', 49.00, 5, 1, '2025-10-18 04:28:08', '2025-10-18 04:28:08'),
(136, 44, 'PARFUM / MEDIUM', '10ml', 16.90, 5, 1, '2025-10-18 04:28:08', '2025-10-18 04:28:08'),
(135, 44, 'EXTRAIT / STRONG', '40ml', 59.00, 4, 1, '2025-10-18 04:28:08', '2025-10-26 01:37:35'),
(134, 44, 'EXTRAIT / STRONG', '10ml', 21.90, 5, 1, '2025-10-18 04:28:08', '2025-10-18 04:28:08'),
(133, 44, 'EDP / LIGHT', '40ml', 39.00, 5, 1, '2025-10-18 04:28:08', '2025-10-18 04:28:08');

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int NOT NULL,
  `voucher_name` varchar(100) NOT NULL,
  `voucher_description` text,
  `voucher_image` varchar(255) DEFAULT NULL,
  `points_required` int NOT NULL,
  `discount_type` enum('percentage','fixed_amount','free_shipping','free_product') NOT NULL,
  `discount_value` decimal(10,2) DEFAULT NULL,
  `max_redemptions` int DEFAULT NULL,
  `current_redemptions` int DEFAULT '0',
  `valid_from` date NOT NULL,
  `valid_until` date NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`id`, `voucher_name`, `voucher_description`, `voucher_image`, `points_required`, `discount_type`, `discount_value`, `max_redemptions`, `current_redemptions`, `valid_from`, `valid_until`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(6, 'Free Shipping', 'Enjoy free shipping on your order', 'images/vouchers/voucher_1759199773_1.jpg', 500, 'free_shipping', 0.00, 500, 2, '2025-09-30', '2026-03-30', 1, 1, '2025-09-30 02:36:13', '2025-09-30 03:19:06'),
(4, 'Premium Sample', 'Free premium perfume sample', NULL, 2000, 'free_product', 0.00, 100, 1, '2025-09-30', '2026-09-30', 1, NULL, '2025-09-30 01:41:40', '2025-10-13 01:14:35'),
(5, 'Welcome Bonus', 'Get 10% off your first purchase', 'images/vouchers/voucher_1759197712_1.jpg', 100, 'percentage', 10.00, 1000, 2, '2025-09-30', '2026-09-30', 1, 1, '2025-09-30 02:01:52', '2025-10-12 07:54:58'),
(7, 'RM 20 Off', 'Get RM 20 off your purchase', 'images/vouchers/voucher_1759288154_Screenshot2025-01-04183645.png', 1000, 'fixed_amount', 20.00, 200, 1, '2025-09-30', '2025-12-30', 1, 1, '2025-10-01 03:09:14', '2025-10-01 04:06:07'),
(12, 'first time order', 'customer for first time ', 'images/vouchers/voucher_1761465266_section1-iklinik.png', 1, 'percentage', 20.00, 100, 1, '2025-10-26', '2026-10-26', 1, 2, '2025-10-26 07:54:26', '2025-10-26 07:54:47');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `created_at`) VALUES
(1, 2, 22, '2025-10-01 06:47:58'),
(2, 2, 23, '2025-10-02 04:27:39'),
(6, 2, 36, '2025-10-06 07:56:57'),
(7, 2, 32, '2025-10-06 07:57:06'),
(8, 2, 34, '2025-10-07 03:11:39'),
(9, 9, 40, '2025-10-12 07:35:49'),
(10, 2, 40, '2025-10-12 07:56:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_cart_item` (`user_id`,`product_id`,`size`,`version`),
  ADD UNIQUE KEY `unique_session_cart_item` (`session_id`,`product_id`,`size`,`version`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `idx_cart_user` (`user_id`),
  ADD KEY `idx_cart_session` (`session_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `delivery_feedback`
--
ALTER TABLE `delivery_feedback`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_order_feedback` (`order_id`);

--
-- Indexes for table `digital_stamps`
--
ALTER TABLE `digital_stamps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_created_at` (`created_at`),
  ADD KEY `idx_admin_name` (`admin_name`),
  ADD KEY `idx_success` (`success`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `idx_orders_user` (`user_id`),
  ADD KEY `idx_orders_status` (`status`),
  ADD KEY `idx_tracking_number` (`tracking_number`),
  ADD KEY `fk_orders_voucher` (`voucher_id`),
  ADD KEY `idx_orders_shipping_method` (`shipping_method_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `points_transactions`
--
ALTER TABLE `points_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `point_codes`
--
ALTER TABLE `point_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `idx_code` (`code`),
  ADD KEY `idx_active` (`is_active`),
  ADD KEY `idx_valid_dates` (`valid_from`,`valid_until`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_products_category` (`category_id`),
  ADD KEY `idx_products_bestseller` (`is_bestseller`),
  ADD KEY `idx_products_new_arrival` (`is_new_arrival`),
  ADD KEY `idx_products_active` (`is_active`),
  ADD KEY `idx_products_point_rewards` (`point_rewards`),
  ADD KEY `idx_products_out_of_stock` (`is_out_of_stock`),
  ADD KEY `idx_products_restock_date` (`restock_date`);

--
-- Indexes for table `product_analytics`
--
ALTER TABLE `product_analytics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_product_event` (`product_id`,`event_type`),
  ADD KEY `idx_created_at` (`created_at`),
  ADD KEY `idx_session` (`session_id`);

--
-- Indexes for table `product_analytics_simple`
--
ALTER TABLE `product_analytics_simple`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_views` (`views`),
  ADD KEY `idx_clicks` (`favorites`),
  ADD KEY `idx_add_to_cart` (`add_to_cart`),
  ADD KEY `idx_updated` (`updated_at`);

--
-- Indexes for table `product_field_presets`
--
ALTER TABLE `product_field_presets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field_preset` (`field_type`,`preset_value`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_image_order` (`image_order`),
  ADD KEY `idx_product_primary_image` (`product_id`,`is_primary`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `referral_codes`
--
ALTER TABLE `referral_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `referral_code` (`referral_code`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `referral_usage`
--
ALTER TABLE `referral_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referrer_id` (`referrer_id`),
  ADD KEY `referred_user_id` (`referred_user_id`);

--
-- Indexes for table `remember_tokens`
--
ALTER TABLE `remember_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_token` (`token`(250)),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_expires_at` (`expires_at`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_product_review` (`user_id`,`product_id`),
  ADD KEY `idx_reviews_product` (`product_id`);

--
-- Indexes for table `royal_tiers`
--
ALTER TABLE `royal_tiers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tier_level` (`tier_level`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_is_default` (`is_default`);

--
-- Indexes for table `shipping_fees`
--
ALTER TABLE `shipping_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_shipping_fees_active` (`is_active`),
  ADD KEY `idx_shipping_fees_sort` (`sort_order`),
  ADD KEY `idx_shipping_fees_min_amount` (`min_order_amount`);

--
-- Indexes for table `site_analytics`
--
ALTER TABLE `site_analytics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_page_type` (`page_type`),
  ADD KEY `idx_created_at` (`created_at`),
  ADD KEY `idx_session` (`session_id`);

--
-- Indexes for table `traffic_sources`
--
ALTER TABLE `traffic_sources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_session` (`session_id`),
  ADD KEY `idx_source_type` (`source_type`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `google_id` (`google_id`),
  ADD KEY `idx_users_google_id` (`google_id`);

--
-- Indexes for table `user_loyalty_points`
--
ALTER TABLE `user_loyalty_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_point_code_usage`
--
ALTER TABLE `user_point_code_usage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_code` (`user_id`,`code_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_code_id` (`code_id`);

--
-- Indexes for table `user_voucher_redemptions`
--
ALTER TABLE `user_voucher_redemptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_voucher_id` (`voucher_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `version_variations`
--
ALTER TABLE `version_variations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_version_size` (`product_id`,`version_type`,`size`),
  ADD KEY `idx_version_variations_product` (`product_id`),
  ADD KEY `idx_version_variations_version` (`version_type`),
  ADD KEY `idx_version_variations_active` (`is_active`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_points_required` (`points_required`),
  ADD KEY `idx_valid_dates` (`valid_from`,`valid_until`),
  ADD KEY `idx_active` (`is_active`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_wishlist_item` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `idx_wishlist_user` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `delivery_feedback`
--
ALTER TABLE `delivery_feedback`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `digital_stamps`
--
ALTER TABLE `digital_stamps`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notification_logs`
--
ALTER TABLE `notification_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `points_transactions`
--
ALTER TABLE `points_transactions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `point_codes`
--
ALTER TABLE `point_codes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `product_analytics`
--
ALTER TABLE `product_analytics`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `product_field_presets`
--
ALTER TABLE `product_field_presets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `referral_codes`
--
ALTER TABLE `referral_codes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `referral_usage`
--
ALTER TABLE `referral_usage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `remember_tokens`
--
ALTER TABLE `remember_tokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `royal_tiers`
--
ALTER TABLE `royal_tiers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipping_fees`
--
ALTER TABLE `shipping_fees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `site_analytics`
--
ALTER TABLE `site_analytics`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `traffic_sources`
--
ALTER TABLE `traffic_sources`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user_loyalty_points`
--
ALTER TABLE `user_loyalty_points`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_point_code_usage`
--
ALTER TABLE `user_point_code_usage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_voucher_redemptions`
--
ALTER TABLE `user_voucher_redemptions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `version_variations`
--
ALTER TABLE `version_variations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
