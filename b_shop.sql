-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2022 at 04:57 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `b_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `brand_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `trash` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `alias`, `status`, `trash`) VALUES
(1, 'Casio', '', 1, 0),
(2, 'Citizen', '', 1, 0),
(3, 'Orient', '', 1, 0),
(4, 'Seiko', '', 1, 0),
(5, 'Sokolov', '', 1, 0),
(6, 'Tissot', '', 1, 0),
(7, 'Fossil', '', 1, 0),
(8, 'Skagen', '', 1, 0),
(9, 'Doxa', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `trash` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`, `alias`, `parent`, `status`, `trash`, `created_at`, `created_by`, `updated_at`, `updated_by`, `access`) VALUES
(1, 'Nam', NULL, 0, 1, 0, '2022-10-04 10:42:06', NULL, NULL, NULL, 0),
(2, 'Nữ', NULL, 0, 1, 0, '2022-10-04 10:42:06', NULL, NULL, NULL, 0),
(3, 'Cặp Đôi', NULL, 0, 1, 0, '2022-10-04 10:42:06', NULL, NULL, NULL, 0),
(4, 'Phụ Kiện', NULL, 0, 1, 0, '2022-10-04 10:42:06', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `menu_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `trash` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `modified_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `trash` tinyint(1) NOT NULL DEFAULT 1,
  `access` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivered` tinyint(4) DEFAULT NULL,
  `trash` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_code`, `customer_id`, `order_date`, `fullname`, `address`, `email`, `phone`, `delivered`, `trash`, `status`) VALUES
(1, '', 1, '2022-12-28 22:26:48', 'Ngô Gia Lộc', '42 Liên Phường, Q9, TP.HCM', 'gialoc@gmail.com', '0336981189', NULL, 0, 1),
(2, '', 1, '2022-12-28 22:32:41', 'Ngô Gia Lộc', '42 Liên Phường, Q9, TP.HCM', 'gialoc@gmail.com', '0336981189', NULL, 0, 1),
(3, '', 1, '2022-12-28 22:34:03', 'Ngô Gia Lộc', '42 Liên Phường, Q9, TP.HCM', 'gialoc@gmail.com', '0336981189', NULL, 0, 1),
(4, '', 2, '2022-12-28 22:39:17', 'Trần Minh Tâm', '61 Tăng Nhơn Phú, Q9, TP.HCM', 'minhtam@gmail.com', '0123456789', NULL, 0, 1),
(5, '', 2, '2022-12-28 22:39:44', 'Trần Minh Tâm', '61 Tăng Nhơn Phú, Q9, TP.HCM', 'minhtam@gmail.com', '0123456789', NULL, 0, 1),
(6, '', 2, '2022-12-28 22:40:17', 'Trần Minh Tâm', '61 Tăng Nhơn Phú, Q9, TP.HCM', 'minhtam@gmail.com', '0123456789', NULL, 0, 1),
(7, '', 3, '2022-12-28 22:42:13', 'Ngô Xuân Luân', '123 Đỗ Xuân Hợp, Q9, TP.HCM', 'xuanluan@gmail.com', '0987654321', NULL, 0, 1),
(8, '', 3, '2022-12-28 22:42:43', 'Ngô Xuân Luân', '123 Đỗ Xuân Hợp, Q9, TP.HCM', 'xuanluan@gmail.com', '0987654321', NULL, 0, 1),
(9, '', 3, '2022-12-28 22:44:37', 'Ngô Xuân Luân', '123 Đỗ Xuân Hợp, Q9, TP.HCM', 'xuanluan@gmail.com', '0987654321', NULL, 0, 1),
(10, '', 4, '2022-12-28 22:45:30', 'Nguyễn Đức Thành', '49 Nguyễn Duy Trinh, Q9, TP.HCM', 'ducthanh@gmail.com', '0147852369', NULL, 0, 1),
(11, '', 4, '2022-12-28 22:45:59', 'Nguyễn Đức Thành', '49 Nguyễn Duy Trinh, Q9, TP.HCM', 'ducthanh@gmail.com', '0147852369', NULL, 0, 1),
(12, '', 4, '2022-12-28 22:46:39', 'Nguyễn Đức Thành', '49 Nguyễn Duy Trinh, Q9, TP.HCM', 'ducthanh@gmail.com', '0147852369', NULL, 0, 1),
(13, '', 5, '2022-12-28 22:48:00', 'Trần Nguyên Vũ', '60 Dương Đình Hội, Q9, TP.HCM', 'nguyenvu@gmail.com', '0963258741', NULL, 0, 1),
(14, '', 5, '2022-12-28 22:48:37', 'Trần Nguyên Vũ', '60 Dương Đình Hội, Q9, TP.HCM', 'nguyenvu@gmail.com', '0963258741', NULL, 0, 1),
(15, '', 5, '2022-12-28 22:49:17', 'Trần Nguyên Vũ', '60 Dương Đình Hội, Q9, TP.HCM', 'nguyenvu@gmail.com', '0963258741', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trash` tinyint(1) DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_id`, `qty`, `trash`, `status`, `total`) VALUES
(1, 2, 1, 0, 1, 0),
(2, 1, 1, 0, 1, 0),
(3, 12, 1, 0, 1, 0),
(3, 34, 1, 0, 1, 0),
(4, 4, 1, 0, 1, 0),
(5, 3, 1, 0, 1, 0),
(6, 13, 1, 0, 1, 0),
(6, 35, 1, 0, 1, 0),
(7, 6, 1, 0, 1, 0),
(8, 5, 1, 0, 1, 0),
(9, 20, 1, 0, 1, 0),
(9, 36, 1, 0, 1, 0),
(10, 7, 1, 0, 1, 0),
(11, 9, 1, 0, 1, 0),
(12, 21, 1, 0, 1, 0),
(12, 37, 1, 0, 1, 0),
(13, 8, 1, 0, 1, 0),
(14, 10, 1, 0, 1, 0),
(15, 31, 1, 0, 1, 0),
(15, 38, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_category` int(11) NOT NULL,
  `brand_id` int(10) DEFAULT NULL,
  `product_detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `sale_price` int(11) DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trash` tinyint(1) NOT NULL DEFAULT 0,
  `access` tinyint(1) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL,
  `hot` tinyint(1) DEFAULT 0,
  `sale` tinyint(1) DEFAULT 0,
  `sale_date_begin` date DEFAULT NULL,
  `sale_date_end` date DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `article_number` int(11) NOT NULL,
  `insurance` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_time` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `availabity` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `origin` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `machine` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dial_thickness` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dial_diameter` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `glasses` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `strap` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waterproof` int(11) NOT NULL,
  `especially` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_detail1` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_detail2` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_detail3` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_detail4` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `image`, `product_category`, `brand_id`, `product_detail`, `price`, `sale_price`, `alias`, `avatar`, `trash`, `access`, `quantity`, `status`, `hot`, `sale`, `sale_date_begin`, `sale_date_end`, `created_at`, `created_by`, `updated_at`, `updated_by`, `article_number`, `insurance`, `delivery_time`, `availabity`, `address`, `origin`, `machine`, `dial_thickness`, `dial_diameter`, `glasses`, `strap`, `waterproof`, `especially`, `img_detail1`, `img_detail2`, `img_detail3`, `img_detail4`) VALUES
(1, 'SEIKO SRZ520P1', 'SEIKO SRZ520P1.png', 2, 3, 'Phiên bản Seiko SRZ520P1 vẻ ngoài thời trang với thiết kế mỏng máy pin 7mm, sang trọng nổi bật dành cho phái đẹp với phần dây vỏ kim loại mạ vàng.', 6840000, 6740000, NULL, NULL, 0, NULL, 1, 1, 0, 1, NULL, NULL, '2022-10-04 10:34:47', NULL, NULL, NULL, 123, '6 tháng', '3 - 4 ngày', 'còn hàng', 'Hà Nội', 'Nhật Bản', 'Quartz (Pin)', '7.3 mm', '29 mm', 'Hardlex Crystal', 'Thép không gỉ', 5, '', 'SEIKO-SRZ520P1-1.png', 'SEIKO-SRZ520P1-2.png', 'SEIKO-SRZ520P1-3.png', 'SEIKO-SRZ520P1-4.png'),
(2, 'ORIENT RA-AR0001S10B', 'ORIENT RA-AR0001S10B.png', 1, 4, 'Mẫu Orient RA-AR0001S10B thiết kế đặc trưng Open Heart với ô chân kính lộ ra 1 phần của bô máy cơ tạo nên vẻ độc đáo trước mặt kính Sapphire.', 10170000, 10070000, NULL, NULL, 0, NULL, 1, 1, 0, 1, NULL, NULL, '2022-10-04 10:34:47', NULL, NULL, NULL, 321, '1 năm', '7 ngày', 'còn hàng', 'TP.HCM', 'Nhật Bản', 'Automatic (Tự động)', '11 mm', '40.8 mm', 'Sapphire', 'Thép không gỉ', 5, 'Open Heart', 'ORIENT-RA-AR0001S10B-1.png', 'ORIENT-RA-AR0001S10B-2.png', 'ORIENT-RA-AR0001S10B-1.png', 'ORIENT-RA-AR0001S10B-2.png'),
(3, 'SOKOLOV 106.30.00.001.06.01.2', 'SOKOLOV 106.30.00.001.06.01.2.png', 2, 5, 'Mẫu Sokolov 106.30.00.001.06.01.2 vẻ ngoài sang trọng với 12 viên pha lê đính tương ứng với 12 múi giờ hiện thị trên nền mặt số kích thước 34mm được phối tone màu xà cừ thời trang.', 11530000, 11430000, NULL, NULL, 0, NULL, 1, 1, 0, 1, NULL, NULL, '2022-10-04 10:42:20', NULL, NULL, NULL, 456, '2 năm', '14 ngày', 'còn hàng', 'Hải Phòng', 'Nga', 'Quartz (Pin)', '5.4 mm', '34 mm', 'Sapphire', 'Dây da chính hãng', 3, '', 'SOKOLOV 106.30.00.001.06.01.2.png', 'SOKOLOV 106.30.00.001.06.01.2-1.png', 'SOKOLOV 106.30.00.001.06.01.2.png', 'SOKOLOV 106.30.00.001.06.01.2-1.png'),
(4, 'TISSOT T063.637.36.037.00', 'TISSOT T063.637.36.037.00.png', 1, 6, 'Đồng hồ Tissot T063.637.36.037.00 với thiết kế mặt số màu trắng, kim chỉ và gạch số được mạ đồng, mang cảm giác cổ điển, dây đeo da màu nâu tạo nét lịch lãm, sang trọng.', 14060000, 13960000, NULL, NULL, 0, NULL, 1, 1, 0, 1, NULL, NULL, '2022-10-04 10:42:20', NULL, NULL, NULL, 654, '6 tháng', '3 - 4 ngày', 'còn hàng', 'Đà Nẵng', 'Thụy Sỹ', 'Quartz (Pin)', '11.07 mm', '42 mm', 'Sapphire', 'Dây da chính hãng', 3, 'Lịch tháng – Lịch ngày – Lịch thứ', 'TISSOT-T063.637.36.037.00-1.png', 'TISSOT-T063.637.36.037.00-2.png', 'TISSOT-T063.637.36.037.00-3.png', 'TISSOT-T063.637.36.037.00-4.png'),
(5, 'FOSSIL ES4571', 'FOSSIL ES4571.png', 2, 7, 'Mẫu Fossil ES4571 chi tiết kế kim chỉ cùng cọc vạch số tạo nét thanh mảnh nữ tính phối tone màu vàng hồng trẻ trung sang trọng cho phái đẹp.', 3940000, 3840000, NULL, NULL, 0, NULL, 1, 1, 0, 1, NULL, NULL, '2022-10-04 10:42:20', NULL, NULL, '', 789, '1 năm', '7 ngày', 'còn hàng', 'Cần Thơ', 'Mỹ', 'Quartz (Pin)', '7 mm', '36 mm', 'Mineral Crystal', 'Thép không gỉ', 3, '', 'FOSSIL ES4571.png', 'FOSSIL ES4571-1.png', 'FOSSIL ES4571.png', 'FOSSIL ES4571-1.png'),
(6, 'CASIO MTP-1381D-1AVDF', 'CASIO MTP-1381D-1AVDF.png', 1, 1, 'Đồng hồ Casio MTP-1381D-1AVDF có vỏ và dây đeo kim loại phủ bạc sáng bóng, nền số màu đen mạnh mẽ với kim chỉ và vạch số được phủ phản quang nổi bật, lịch thứ vị trí 12h và lịch ngày vị trí 6h.', 1629000, 1529000, NULL, NULL, 0, NULL, 1, 1, 0, 1, NULL, '0000-00-00', '2022-10-04 11:08:44', NULL, NULL, '', 987, '2 năm', '14 ngày', 'còn hàng', 'Hà Nội', 'Nhật Bản', 'Quartz (Pin)', '8.9 mm', '39.9mm', 'Mineral Crystal', 'Dây kim loại', 5, 'Lịch ngày – Lịch thứ', 'CASIO-MTP-1381D-1AVDF-1.png', 'CASIO-MTP-1381D-1AVDF-2.png', 'CASIO-MTP-1381D-1AVDF-3.png', 'CASIO-MTP-1381D-1AVDF-4.png'),
(7, 'CASIO EFV-550L-1AVUDF', 'CASIO EFV-550L-1AVUDF.png', 1, 1, 'Mẫu Casio EFV-550L-1AVUDF mang đến cho phái mạnh vẻ ngoài lịch lãm nhưng cũng không kém phần trẻ trung đặc trưng thuộc dòng Edifice với kiểu dáng đồng hồ 6 kim đi kèm tính năng đo thời gian Chronograph.', 3529000, 3429000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-10-04 11:08:44', NULL, NULL, NULL, 147, '6 tháng', '3 - 4 ngày', 'còn hàng', 'TP.HCM', 'Nhật Bản', 'Quartz (Pin)', '12.1 mm', '47 mm', 'Mineral Crystal', 'Dây da chính hãng', 10, 'Lịch Ngày – Chronograph', 'CASIO-EFV-550L-1AVUDF-1.png', 'CASIO-EFV-550L-1AVUDF-2.png', 'CASIO-EFV-550L-1AVUDF-3.png', 'CASIO-EFV-550L-1AVUDF-4.png'),
(8, 'CASIO A158WA-1DF', 'CASIO A158WA-1DF.png', 1, 1, 'Mẫu đồng hồ nam Casio A158WA-1DF với kiểu dáng vuông huyền thoại, mặt số điện tử hiện thị nhiều chức năng tiện ích cho người dùng, vỏ máy cùng dây đeo kim loại màu bạc tạo nên sự chắc chắn mạnh mẽ.', 815000, 800000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-10-04 11:08:44', NULL, NULL, NULL, 741, '1 năm', '7 ngày', 'còn hàng', 'Hải Phòng', 'Nhật Bản', 'Quartz (Pin)', '8.2 mm', '36.8 mm x 33.2 mm', 'Resin Glass', 'Dây kim loại', 3, 'Lịch – Bộ bấm giờ – Giờ kép – Đèn led', 'CASIO-A158WA-1DF-1.png', 'CASIO-A158WA-1DF-2.png', 'CASIO-A158WA-1DF-3.png', 'CASIO-A158WA-1DF-4.png'),
(9, 'CASIO LTP-1095Q-9A', 'CASIO LTP-1095Q-9A.png', 2, 1, 'Mẫu Casio LTP-1095Q-9A mang đến cho phái đẹp một vẻ ngoài thanh lịch với phiên bản dây da nâu với thiết kế giản dị kiểu dáng 3 kim cùng các chi tiết đồng hồ tạo nét thanh mảnh đầy trẻ trung.', 864000, 800000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-10-04 11:08:44', NULL, NULL, NULL, 258, '2 năm', '14 ngày', 'còn hàng', 'Đà Nẵng', 'Nhật Bản', 'Quartz (Pin)', '8 mm', '24 mm', 'Mineral Crystal', 'Dây da chính hãng', 3, '', 'CASIO LTP-1095Q-9A.png', 'CASIO LTP-1095Q-9A-1.png', 'CASIO LTP-1095Q-9A.png', 'CASIO LTP-1095Q-9A-1.png'),
(10, 'CASIO A159WGED-1DF', 'CASIO A159WGED-1DF.png', 2, 1, 'Mẫu đồng hồ Casio A159WGED-1DF vẻ ngoài giản dị nhưng không kém phần cuốn hút cùng thiết kế tinh xảo được đính viên kim cương tạo nên vẻ thời trang quyến rũ cho phái đẹp trên nền mặt số vuông điện tử.', 2591000, 2491000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-10-04 11:08:44', NULL, NULL, NULL, 852, '6 tháng', '3 - 4 ngày', 'còn hàng', 'Cần Thơ', 'Nhật Bản', 'Quartz (Pin)', '9.7 mm', '36.6 mm x 33.2 mm', 'Resin Glass', 'Thép không gỉ', 3, 'Báo thức – Bộ bấm giờ – Giờ kép – Đèn led', 'CASIO-AW-159WGED-1DF-1.png', 'CASIO-AW-159WGED-1DF-2.png', 'CASIO-AW-159WGED-1DF-3.png', 'CASIO-AW-159WGED-1DF-4.png'),
(11, 'CASIO B640WB-1ADF', 'CASIO B640WB-1ADF.png', 2, 1, 'Mẫu đồng hồ Casio B640WB-1ADF mặt đồng hồ bầu vuông đen dành cho nữ với thiết kế mặt số điện tử kèm theo nhiều chức năng tiện ích cho người dùng, vỏ máy cùng dây đeo được phối tông màu đen huyền bí cho phái nữ.', 1826000, 1726000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-10-04 11:08:44', NULL, NULL, NULL, 369, '1 năm', '7 ngày', 'còn hàng', 'Hà Nội', 'Nhật Bản', 'Quartz (Pin)', '9.4 mm', '38.9 x 35 mm', 'Resin Glass', 'Dây kim loại', 5, 'Lịch – Bộ bấm giờ – Giờ kép – Đèn led', 'Casio-B640WB-1ADF-1.png', 'Casio-B640WB-1ADF-2.png', 'Casio-B640WB-1ADF-3.png', 'Casio-B640WB-1ADF-4.png'),
(12, 'CASIO MTP-1183G-7ADF-LTP', 'CASIO MTP-1183G-7ADF-LTP-1183G-7ADF.png', 3, 1, 'Mẫu Casio đôi dây đeo vàng demi phiên bản thời trang cùng với thiết kế mỏng vỏ máy pin chỉ dày 8mm.', 2962000, 2862000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-10-04 11:08:44', NULL, NULL, NULL, 963, '2 năm', '14 ngày', 'còn hàng', 'TP.HCM', 'Nhật Bản', 'Quartz (Pin)', '8.7 mm (Nam) – 8.7 mm (Nữ)', '38.5 mm (Nam) – 28 mm (Nữ)', 'Mineral Crystal', 'Dây kim loại', 3, 'Lịch ngày', 'CASIO-MTP-1183G-7ADF-1.png', 'CASIO-MTP-1183G-7ADF-2.png', 'CASIO-MTP-1183G-7ADF-3.png', 'CASIO-MTP-1183G-7ADF-4.png'),
(13, 'CASIO MTP-V300L-7A2UDF-LTP', 'CASIO MTP-V300L-7A2UDF-LTP-V300L-7A2UDF.png', 3, 1, 'Mẫu Casio đôi dây da nâu phiên bản da trơn thời trang, 3 ô sô gồm chức năng lịch tạo nên thiết kế 6 kim độc đáo trên nền mặt số.', 2914000, 2814000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-10-04 11:12:24', NULL, NULL, NULL, 159, '6 tháng', '3 - 4 ngày', 'còn hàng', 'Hải Phòng', 'Nhật Bản', 'Quartz (Pin)', '8.6 mm (Nam) – 8.2 mm (Nữ)', '41.5 mm (Nam) – 33.2 mm (Nữ)', 'Mineral Crystal', 'Dây da chính hãng', 3, 'Lịch Ngày – Lịch Thứ – Đồng Hồ 24 Giờ', 'CASIO MTP-V300L-7A2UDF-LTP-V300L-7A2UDF.png', 'CASIO MTP-V300L-7A2UDF-LTP-V300L-7A2UDF-1.png', 'CASIO MTP-V300L-7A2UDF-LTP-V300L-7A2UDF.png', 'CASIO MTP-V300L-7A2UDF-LTP-V300L-7A2UDF-1.png'),
(14, 'CITIZEN BI1050-81A', 'CITIZEN BI1050-81A.png', 1, 2, 'Mẫu Citizen BI1050-81A mặt số tròn to nam tính, các vạch số cùng kim chỉ kiểu dáng mỏng tinh tế, chức năng lịch ngày được sắp xếp tạo nên vẻ độc đáo.', 3000000, 2900000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-10-04 11:27:41', NULL, NULL, NULL, 951, '1 năm ', '7 ngày', 'còn hàng', 'Đà Nẵng', 'Nhật Bản', 'Quartz (Pin)', '10 mm', '40 mm', 'Mineral Crystal', 'Thép không gỉ', 5, 'Lịch Ngày ', 'CITIZEN-BI1050-81A-1.png', 'CITIZEN-BI1050-81A-2.png', 'CITIZEN-BI1050-81A-3.png', 'CITIZEN-BI1050-81A-4.png'),
(15, 'CITIZEN NH8394-70H', 'CITIZEN NH8394-70H.png', 1, 2, 'Mẫu Citizen C7 NH8394-70H phiên bản dây đeo demi thời trang phối cùng các chi tiết kim chỉ cùng cọc vạch số mạ vàng hồng sang trọng trên nền mặt số 40mm với họa tiết trải tia nhẹ.', 9177000, 9077000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-10-04 11:27:41', NULL, NULL, '', 357, '2 năm', '14 ngày', 'còn hàng', 'Cần Thơ', 'Nhật Bản', 'Automatic (Tự động)', '13.1 mm', '40.2 mm', 'Mineral Crystal', 'Thép không gỉ', 5, 'Lịch Ngày – Lịch Thứ', 'CITIZEN-NH8394-70H-1.png', 'CITIZEN-NH8394-70H-2.png', 'CITIZEN-NH8394-70H-3.png', 'CITIZEN-NH8394-70H-4.png'),
(16, 'CITIZEN NH8390-11X', 'CITIZEN NH8390-11X.png', 1, 2, 'Mẫu Citizen C7 NH8390-11X phiên bản da nâu trơn lịch lãm trẻ trung kết hợp cùng thiết kế đơn giản 3 kim trên nền mặt số size 40mm phối tone màu đỏ nổi bật.', 8177000, 8077000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-10-04 11:27:41', NULL, NULL, NULL, 753, '6 tháng', '3 - 4 ngày', 'còn hàng', 'Hà Nội', 'Nhật Bản', 'Automatic (Tự động)', '13.1 mm', '40.2 mm', 'Mineral Crystal', 'Dây da chính hãng', 5, 'Lịch Ngày – Lịch Thứ', 'CITIZEN-NH8390-11X-1.png', 'CITIZEN-NH8390-11X-2.png', 'CITIZEN-NH8390-11X-3.png', 'CITIZEN-NH8390-11X-4.png'),
(17, 'CITIZEN EW9822-83D', 'CITIZEN EW9822-83D.png', 2, 2, 'Mẫu  Citizen EW9822-83D ấn tượng với đồng hồ được trang bị Pin sử dụng công nghệ hiện đại Eco-Drive (Năng Lượng Ánh Sáng), ngoài ra sự cuốn hút đến từ phần thiết kế vỏ viền ngoài được gia công tinh xảo đính pha lê.', 8200000, 8100000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-10-04 11:27:41', NULL, NULL, NULL, 1397, '1 năm', '7 ngày', 'còn hàng', 'TP.HCM', 'Nhật Bản', 'Eco-Drive (Năng lượng ánh sáng)', '6 mm', '23 mm', 'Mineral Crystal', 'Thép không gỉ', 3, '', 'CITIZEN-EW9822-83D-1.png', 'CITIZEN-EW9822-83D-2.png', 'CITIZEN-EW9822-83D-3.png', 'CITIZEN-EW9822-83D-4.png'),
(18, 'CITIZEN EW2230-56E', 'CITIZEN EW2230-56E.png', 2, 2, 'Đồng hồ nữ Citizen EW2230-56E thiết kế nhỏ gọn nữ tính, vỏ máy bằng thép không gỉ sáng bóng, mặt đồng hồ tròn cổ điển kết hợp với dây đeo kim loại được mạ bạc tạo nên 1 phụ kiện thời trang cho các bạn nữ.', 7000000, 6900000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-10-04 11:27:41', NULL, NULL, NULL, 7931, '2 năm', '14 ngày', 'còn hàng', 'Hải Phòng', 'Nhật Bản', 'Eco-Drive (Năng lượng ánh sáng)', '8 mm', '28 mm', 'Sapphire', 'Thép không gỉ', 5, 'Lịch Ngày', 'CITIZEN EW2230-56E.png', 'CITIZEN EW2230-56E-1.png', 'CITIZEN EW2230-56E.png', 'CITIZEN EW2230-56E-1.png'),
(19, 'CITIZEN EJ6112-52D', 'CITIZEN EJ6112-52D.png', 2, 2, 'Mẫu đồng hồ nữ Citizen EJ6112-52D ấn tượng với kiểu thiết kế thời thượng với vỏ mày vuông bầu kết hợp cùng dây đeo bằng kim loại được mạ vàng ánh lên vẻ đẹp quyến rủ đầy sang trọng dành cho các phái nữ.', 3700000, 3600000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-10-04 11:27:41', NULL, NULL, NULL, 2684, '6 tháng', '3 - 4 ngày', 'còn hàng', 'Đà Nẵng', 'Nhật Bản', 'Quartz (Pin)', '7 mm', '19 mm x 32 mm', 'Mineral Crystal', 'Thép không gỉ', 3, '', 'CITIZEN-EJ6112-52D-1.png', 'CITIZEN-EJ6112-52D-2.png', 'CITIZEN-EJ6112-52D-3.png', 'CITIZEN-EJ6112-52D-4.png'),
(20, 'Citizen AW1211-12A - FE6011-14A', 'Citizen AW1211-12A - FE6011-14A.png', 3, 2, 'Mẫu Citizen đôi với nền cọc số học trò tạo hình mỏng trên nền mặt số trắng trẻ trung lịch lãm phối cùng bộ dây da nâu có vân.', 9400000, 9300000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-10-04 11:27:41', NULL, NULL, NULL, 4862, '1 năm', '7 ngày', 'còn hàng', 'Cần Thơ', 'Nhật Bản', 'Eco-Drive (Năng lượng ánh sáng)', '9 mm (Nam) – 8.2 mm (Nữ)', '42 mm (Nam) – 33 mm (Nữ)', 'Mineral Crystal', 'Dây da chính hãng', 5, 'Lịch Ngày', 'Citizen AW1211-12A - FE6011-14A.png', 'Citizen AW1211-12A - FE6011-14A-1.png', 'Citizen AW1211-12A - FE6011-14A.png', 'Citizen AW1211-12A - FE6011-14A-1.png'),
(21, 'Citizen BF2005-54L - EQ0595-55L', 'Citizen BF2005-54L - EQ0595-55L.png', 3, 2, 'Mẫu Citizen đôi mặt số xanh tone màu thời trang nổi bật lên nền cọc số học trò mạ vàng, tạo nên vẻ sang trọng trẻ trung.', 8200000, 8100000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-10-04 11:27:41', NULL, NULL, NULL, 157, '2 năm', '14 ngày', 'còn hàng', 'Hà Nội', 'Nhật Bản', 'Quartz (Pin)', '8.8 mm (Nam) – 7.7 mm (Nữ)', '41 mm (Nam) – 28 mm (Nữ)', 'Mineral Crystal', 'Thép không gỉ', 5, 'Lịch Ngày – Lịch Thứ', 'Citizen BF2005-54L - EQ0595-55L.png', 'Citizen BF2005-54L - EQ0595-55L-1.png', 'Citizen BF2005-54L - EQ0595-55L.png', 'Citizen BF2005-54L - EQ0595-55L-1.png'),
(22, 'CASIO MTP-VD02B-3EUDF', 'CASIO MTP-VD02B-3EUDF.png', 1, 1, 'Mẫu Casio MTP-VD02B-3EUDF phiên bản dây vỏ đồng hồ được phối cùng tone màu đen nam tính, cọc vạch số tạo hình dày dặn phủ dạ quang nổi bật trên nền mặt số kích thước 41mm.', 1555000, 1455000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-10-04 11:40:52', NULL, NULL, NULL, 751, '6 tháng', '3 - 4 ngày', 'còn hàng', 'TP.HCM', 'Nhật Bản', 'Quartz (Pin)', '9.6 mm', '41 mm', 'Mineral Crystal', 'Dây kim loại', 3, 'Lịch Ngày', 'CASIO MTP-VD02B-3EUDF.png', 'CASIO MTP-VD02B-3EUDF-1.png', 'CASIO MTP-VD02B-3EUDF.png', 'CASIO MTP-VD02B-3EUDF-1.png'),
(23, 'CITIZEN NK5000-98E', 'CITIZEN NK5000-98E.png', 1, 2, 'Mẫu Citizen NK5000-98E phiên bản kim giây được thiết kế không đồng trục tạo nên vẻ độc đáo nổi bật trên nền mặt số đen kích thước 41mm.', 15210000, 15110000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-10-04 11:40:52', NULL, NULL, NULL, 359, '1 năm', '7 ngày', 'còn hàng', 'Hải Phòng', 'Nhật Bản', 'Automatic (Tự động)', '12.5 mm', '41 mm', 'Mineral Crystal', 'Thép không gỉ', 5, 'Lịch Ngày', 'CITIZEN NK5000-98E.png', 'CITIZEN NK5000-98E-1.png', 'CITIZEN NK5000-98E.png', 'CITIZEN NK5000-98E-1.png'),
(24, 'SEIKO SSB361P1', 'SEIKO SSB361P1.png', 1, 3, 'Mẫu Seiko SSB361P1 thiết kế 3 núm vặn điều chỉnh các tính năng Chronograph (đo thời gian) tạo nên kiểu dáng đồng hồ 6 kim trên nền mặt số lớn kích thước 43.9mm.', 6625000, 6525000, NULL, NULL, 0, NULL, 1, 1, 1, 0, NULL, NULL, '2022-10-04 11:40:52', NULL, NULL, NULL, 953, '2 năm', '14 ngày', 'còn hàng', 'Đà Nẵng', 'Nhật Bản', 'Quartz (Pin)', '14.1 mm', '45.2 mm', 'Mineral Crystal', 'Dây da chính hãng', 10, 'Lịch Ngày – Chronograph', 'SEIKO SSB361P1.png', 'SEIKO SSB361P1-1.png', 'SEIKO SSB361P1.png', 'SEIKO SSB361P1-1.png'),
(25, 'ORIENT RE-AT0205L00B', 'ORIENT RE-AT0205L00B.png', 1, 4, 'Mẫu Orient RE-AT0205L00B thiết kế Open Heart (máy cơ lộ tim) tạo nên vẻ độc đáo nổi bật trên nền mặt số xanh với kích thước lớn 40mm.', 13710000, 13610000, NULL, NULL, 0, NULL, 1, 1, 1, 0, NULL, NULL, '2022-10-04 11:40:52', NULL, NULL, NULL, 248, '6 tháng', '3 - 4 ngày', 'còn hàng', 'Cần Thơ', 'Nhật Bản', 'Automatic (Tự động)', '12.8 mm', '40 mm', 'Mineral Crystal', 'Dây da chính hãng', 5, '', 'ORIENT RE-AT0205L00B.png', 'ORIENT RE-AT0205L00B-1.png', 'ORIENT RE-AT0205L00B.png', 'ORIENT RE-AT0205L00B-1.png'),
(26, 'SOKOLOV 140.01.71.000.02.01.2', 'SOKOLOV 140.01.71.000.02.01.2.png', 2, 5, 'Mẫu Sokolov 140.01.71.000.02.01.2 phiên bản sang trọng với 12 viên kim cương được đính tương ứng với 12 múi giờ tạo nên điểm nhấn nổi bật trên nền mặt số với kích thước 31mm.', 24700000, 24600000, NULL, NULL, 0, NULL, 1, 1, 1, 0, NULL, NULL, '2022-10-04 11:40:52', NULL, NULL, NULL, 842, '1 năm', '7 ngày', 'còn hàng', 'Hà Nội', 'Nga', 'Quartz (Pin)', '7 mm', '31 mm', 'Sapphire', 'Thép không gỉ', 5, '', 'SOKOLOV 140.01.71.000.02.01.2.png', 'SOKOLOV 140.01.71.000.02.01.2-1.png', 'SOKOLOV 140.01.71.000.02.01.2.png', 'SOKOLOV 140.01.71.000.02.01.2-1.png'),
(27, 'TISSOT T129.210.11.053.00', 'TISSOT T129.210.11.053.00.png', 2, 6, 'Mẫu Tissot T129.210.11.053.00 phiên bản nền cọc số la mã tạo nét thanh mảnh thời trang trên nền mặt số với kích thước 28mm phù hợp cho phái đẹp cổ tay nhỏ.', 7630000, 7530000, NULL, NULL, 0, NULL, 1, 1, 1, 0, NULL, NULL, '2022-10-04 11:40:52', NULL, NULL, NULL, 268, '2 năm', '14 ngày', 'còn hàng', 'TP.HCM', 'Thụy Sỹ', 'Quartz (Pin)', '7.1 mm', '28 mm', 'Sapphire', 'Thép không gỉ', 5, 'Lịch Ngày', 'TISSOT T129.210.11.053.00.png', 'TISSOT T129.210.11.053.00-1.png', 'TISSOT T129.210.11.053.00-2.png', 'TISSOT T129.210.11.053.00-3.png'),
(28, 'FOSSIL ME3184', 'FOSSIL ME3184.png', 1, 7, 'Mẫu Fossil ME3184 phiên bản máy cơ với thiết kế Skeleton (cơ lộ máy) tạo nên vẻ độc đáo trên nền mặt số kích thước lớn 44mm.', 6780000, 6680000, NULL, NULL, 0, NULL, 1, 1, 1, 0, NULL, NULL, '2022-12-01 10:43:52', NULL, NULL, NULL, 862, '6 tháng', '3 - 4 ngày', 'còn hàng1 n', 'Hải Phòng', 'Mỹ', 'Automatic (Tự động)', '11 mm', '44 mm', 'Mineral Crystal', 'Dây da chính hãng', 5, '', 'FOSSIL ME3184.png', 'FOSSIL ME3184-1.png', 'FOSSIL ME3184-2.png', 'FOSSIL ME3184-3.png'),
(29, 'SKAGEN SKW2907', 'SKAGEN SKW2907.png', 2, 8, 'Mẫu Skagen SKW2907 dây đeo kim loại phiên bản dây lưới phối tone vàng hồng thời trang kết hợp cùng lối thiết kế tối giản chức năng 3 kim trên nền mặt số với kich thước nhỏ 30mm.', 4520000, 4420000, NULL, NULL, 0, NULL, 1, 1, 1, 0, NULL, NULL, '2022-12-01 10:44:52', NULL, NULL, NULL, 153, '1 năm', '7 ngày', 'còn hàng', 'Đà Nẵng', 'Đan Mạch', 'Quartz (Pin)', '6 mm', '30 mm', 'Mineral Crystal', 'Thép không gỉ', 3, '', 'SKAGEN SKW2907.png', 'SKAGEN SKW2907-1.png', 'SKAGEN SKW2907-2.png', 'SKAGEN SKW2907-3.png'),
(30, 'G-SHOCK DW-5600MW-7DR', 'G-SHOCK DW-5600MW-7DR.png', 1, 9, 'Mẫu G-Shock DW-5600MW-7DR phiên bản dây vỏ nhựa chịu va đập phối tone màu trắng năng động, mặt số điện tử đa chức năng kết hợp cùng khả năng chịu nước lên đến 20atm.', 3368000, 3268000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-12-01 10:45:16', NULL, NULL, NULL, 351, '2 năm', '14 ngày', 'còn hàng', 'Cần Thơ', 'Nhật Bản', 'Quartz (Pin)', '13.4 mm', '48.9 mm x 42.8 mm', 'Mineral Crystal', 'Dây cao su', 20, 'Lịch – Bộ Bấm Giờ – Giờ Kép – Đèn Led', 'G-SHOCK DW-5600MW-7DR.png', 'G-SHOCK DW-5600MW-7DR-1.png', 'G-SHOCK DW-5600MW-7DR.png', 'G-SHOCK DW-5600MW-7DR-1.png'),
(31, 'Citizen BF2001-12A - EQ0591-21A', 'Citizen BF2001-12A - EQ0591-21A.png', 3, 2, 'Mẫu Citizen đôi dây da tạo hình vân phiên bản lịch lãm, thiết kế đơn giản chức năng 3 kim cùng với cọc vạch số tạo nét mỏng trẻ trung.', 6720000, 6620000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-12-01 10:46:16', NULL, NULL, NULL, 759, '6 tháng', '3 - 4 ngày', 'còn hàng', 'Hà Nội', 'Nhật Bản', 'Quartz (Pin)', '9 mm (Nam) – 8 mm (Nữ)', '41 mm (Nam) – 27 mm (Nữ)', 'Mineral Crystal', 'Dây da chính hãng', 5, 'Lịch Ngày – Lịch Thứ', 'Citizen BF2001-12A - EQ0591-21A-1.png', 'Citizen BF2001-12A - EQ0591-21A-2.png', 'Citizen BF2001-12A - EQ0591-21A-3.png', 'Citizen BF2001-12A - EQ0591-21A-4.png'),
(32, 'Tissot T101.410.11.051.00', 'Tissot T101.410.11.051.00.png', 3, 6, 'Mẫu Tissot đôi vỏ máy pin mạ bạc tone màu sang trọng với thiết kế vượt trội khả năng chịu nước lên đến 10atm.', 16230000, 15230000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-12-01 10:47:16', NULL, NULL, NULL, 957, '1 năm', '7 ngày', 'còn hàng', 'TP.HCM', 'Thụy Sỹ', 'Quartz (Pin)', '9 mm (Nam) – 6.8 mm (Nữ) ', '39 mm (Nam) – 25 mm (Nữ)', 'Sapphire', 'Thép không gỉ', 10, 'Lịch Ngày', 'Tissot T101.410.11.051.00-1.png', 'Tissot T101.410.11.051.00-2.png', 'Tissot T101.410.11.051.00-3.png', 'Tissot T101.410.11.051.00-4.png'),
(33, 'Seiko SUR303P1', 'Seiko SUR303P1.png', 3, 3, 'Mẫu Seiko đôi phiên bản mặt kính Sapphire nổi bật với nền cọc số trò tạo hình cách điệu trẻ trung trên nền mặt số trắng.', 9540000, 9440000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-12-01 10:48:10', NULL, NULL, NULL, 759, '2 năm', '14 ngày', 'còn hàng', 'Cần Thơ', 'Nhật Bản', 'Quartz (Pin)', '8mm (Nam) – 8mm (Nữ)', '39 mm (Nam) – 29 mm (Nữ)', 'Sapphire', 'Dây da chính hãng', 5, 'Lịch Ngày', 'Seiko SUR303P1-1.png', 'Seiko SUR303P1-2.png', 'Seiko SUR303P1-3.png', 'Seiko SUR303P1-4.png'),
(34, 'Dây da HIRSCH STONE', 'HIRSCH STONE.png', 4, NULL, 'Mẫu dây da Hirsch STONE thiết kế kiểu dáng độc đáo, được làm từ cao su thiên nhiên phủ đá phiên hạt mịn, khả năng chịu nước 300m', 4796000, 4696000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-11-30 23:45:28', NULL, NULL, NULL, 142, '6 tháng', '3 - 4 ngày', 'còn hàng', 'Hà Nội', 'Ý', '', '', '', '', 'Dây da chính hãng', 0, 'Lõi cao su cao cấp', 'HIRSCH STONE-1.png', 'HIRSCH STONE-2.png', 'HIRSCH STONE-3.png', 'HIRSCH STONE-4.png'),
(35, 'Dây da HIRSCH MASSAI OSTRICH', 'HIRSCH MASSAI OSTRICH.png', 4, NULL, 'Dây da Hirsch Massai Ostrich được làm từ da đà điểu châu Phi chính hãng. Mẫu dây da này cũng có khả năng kháng nước cơ bản cho người dùng.', 4152000, 4052000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-12-01 10:31:15', NULL, NULL, NULL, 241, '1 năm', '7 ngày', 'còn hàng', 'TP.HCM', 'Ý', '', '', '', '', 'Dây da chính hãng', 0, 'Lớp da lót mềm công nghệ HIRSCH Softglove.', 'HIRSCH MASSAI OSTRICH-1.png', 'HIRSCH MASSAI OSTRICH-2.png', 'HIRSCH MASSAI OSTRICH-3.png', 'HIRSCH MASSAI OSTRICH-4.png'),
(36, 'Dây kim loại MASAMU STEEL PETITE', 'MASAMU STEEL PETITE.png', 4, NULL, 'Mẫu dây đeo Masamu Steel Petite', 800000, 700000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-12-01 10:31:15', NULL, NULL, NULL, 176, '2 năm', '14 ngày', 'còn hàng', 'Hải Phòng', 'Việt Nam', '', '', '', '', 'Dây kim loại', 0, '', 'MASAMU STEEL PETITE.png', 'MASAMU STEEL PETITE.png', 'MASAMU STEEL PETITE.png', 'MASAMU STEEL PETITE.png'),
(37, 'Dây kim loại MASAMU MESH', 'MASAMU MESH.png', 4, NULL, 'Mẫu dây đeo Masamu Mesh (Gold)', 600000, 500000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-12-01 10:31:15', NULL, NULL, NULL, 671, '6 tháng', '3 - 4 ngày', 'còn hàng', 'Đà Nẵng', 'Việt Nam', '', '', '', '', 'Dây kim loại', 0, '', 'MASAMU MESH.png', 'MASAMU MESH.png', 'MASAMU MESH.png', 'MASAMU MESH.png'),
(38, 'Dây kim loại MASAMU STEEL FIT', 'MASAMU STEEL FIT.png', 4, NULL, 'Mẫu dây đeo Masamu Steel Fit', 600000, 500000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-12-01 10:31:15', NULL, NULL, NULL, 275, '1 năm', '7 ngày', 'còn hàng', 'Cần Thơ', 'Việt Nam', '', '', '', '', 'Dây kim loại', 0, '', 'MASAMU STEEL FIT.png', 'MASAMU STEEL FIT.png', 'MASAMU STEEL FIT.png', 'MASAMU STEEL FIT.png'),
(39, 'Pin Renata SR43SW', 'Pin Renata SR43SW.png', 4, NULL, 'Pin đồng hồ đeo tay 1.55V Pin SR43SW silver – Pin 301 vỉ 1 viên chính hãng', 70000, 60000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-12-01 10:42:21', NULL, NULL, NULL, 572, '2 năm', '14 ngày', 'còn hàng', 'Hà Nội', 'Thụy Sỹ', '', '', '', '', '', 0, 'Điện thế: 1.55 V', 'Pin Renata SR43SW.png', 'Pin Renata SR43SW.png', 'Pin Renata SR43SW.png', 'Pin Renata SR43SW.png'),
(40, 'Pin Sony SR927SW', 'Pin Sony SR927SW.png', 4, NULL, 'Pin đồng hồ Sony SR927SW hay còn gọi là pin 395 chuyên sử dụng thay cho đồng hồ đeo tay. Chất liệu oxit bạc cao cấp giúp đảm bảo cho thiết bị sử dụng không bị hư hỏng.', 50000, 40000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-12-01 10:42:21', NULL, NULL, NULL, 106, '6 tháng', '3 - 4 ngày', 'còn hàng', 'TP.HCM', 'Thụy Sỹ', '', '', '', '', '', 0, 'Chất liệu: Oxide/ axit bạc', 'Pin Sony SR927SW.png', 'Pin Sony SR927SW.png', 'Pin Sony SR927SW.png', 'Pin Sony SR927SW.png'),
(41, 'Pin Maxell SR712SW', 'Pin Maxell SR712SW.png', 4, NULL, 'Pin đồng hồ Maxell SR712SW hay còn gọi là pin 346 được làm từ chất liệu Oxit bạc cao cấp. Có khả năng lưu trữ điện cao, đảm bảo an toàn cho đồng hồ.', 60000, 50000, NULL, NULL, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2022-12-01 10:42:21', NULL, NULL, NULL, 601, '1 năm', '7 ngày', 'còn hàng', 'Hải Phòng', 'Nhật Bản', '', '', '', '', '', 0, 'Điện áp: 1.55V', 'Pin Maxell SR712SW.png', 'Pin Maxell SR712SW.png', 'Pin Maxell SR712SW.png', 'Pin Maxell SR712SW.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `trash` tinyint(1) NOT NULL,
  `access` tinyint(1) NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `fakeid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user`, `password`, `name`, `email`, `phone`, `address`, `avatar`, `created_at`, `status`, `trash`, `access`, `role`, `modified_at`, `fakeid`) VALUES
(1, '', '2cc637a3819ef45cdb0d5b97adf46358a6fd560f', 'Ngô Gia Lộc', 'gialoc@gmail.com', '0336981189', '42 Liên Phường, Q9, TP.HCM', NULL, '2022-12-28 22:14:29', 1, 0, 0, '', NULL, 0),
(2, '', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Trần Minh Tâm', 'minhtam@gmail.com', '0123456789', '61 Tăng Nhơn Phú, Q9, TP.HCM', NULL, '2022-12-28 22:15:58', 1, 0, 0, '', NULL, 0),
(3, '', 'dd5fef9c1c1da1394d6d34b248c51be2ad740840', 'Ngô Xuân Luân', 'xuanluan@gmail.com', '0987654321', '123 Đỗ Xuân Hợp, Q9, TP.HCM', NULL, '2022-12-28 22:18:28', 1, 0, 0, '', NULL, 0),
(4, '', '444528fc68f99ea0f4fe027cb6cbd262f2a707fe', 'Nguyễn Đức Thành', 'ducthanh@gmail.com', '0147852369', '49 Nguyễn Duy Trinh, Q9, TP.HCM', NULL, '2022-12-28 22:20:51', 1, 0, 0, '', NULL, 0),
(5, '', 'c0d3a89ecd225fe6bdc0a190b14db0013bd30b01', 'Trần Nguyên Vũ', 'nguyenvu@gmail.com', '0963258741', '60 Dương Đình Hội, Q9, TP.HCM', NULL, '2022-12-28 22:23:19', 1, 0, 0, '', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_id`,`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
