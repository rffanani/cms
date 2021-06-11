-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2021 at 10:22 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projek`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `id_assignment` int(11) NOT NULL,
  `id_aunt` int(11) NOT NULL,
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`id_assignment`, `id_aunt`, `item_name`, `user_id`, `created_at`) VALUES
(1, 1, 'Admin', '1', '0000-00-00 00:00:00'),
(2, 2, 'Kasir', '2', NULL),
(3, 2, 'Kasir', '3', NULL),
(4, 2, 'Kasir', '4', NULL),
(5, 3, 'User', '9', '2020-08-23 21:51:43'),
(6, 2, 'Kasir', '10', '2020-08-23 22:13:02'),
(7, 2, 'Kasir', '12', '2020-09-09 11:20:29'),
(8, 6, 'siswa', '13', '2020-10-01 09:14:38');

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE `auth_item` (
  `id_aunt` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `tipe` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`id_aunt`, `name`, `tipe`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 1, 'hak akses admin', NULL, NULL),
(2, 'Kasir', 1, 'hak akses kasir', NULL, NULL),
(3, 'User', 1, 'Hak akses diatas admin', NULL, NULL),
(6, 'siswa', 1, 'hak akses siswa', '2020-10-01 09:13:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `idc` int(11) NOT NULL,
  `id_aunt` int(11) NOT NULL,
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`idc`, `id_aunt`, `parent`, `child`) VALUES
(1, 1, 'Admin', '15'),
(2, 1, 'Admin', '22'),
(3, 1, 'Admin', '33'),
(4, 1, 'Admin', '13'),
(15, 1, 'Admin', '47'),
(16, 1, 'Admin', '48'),
(28, 1, 'Admin', '40'),
(40, 1, 'Admin', '12'),
(42, 1, 'Admin', '41'),
(43, 2, 'Kasir', '12'),
(45, 1, 'Admin', '49'),
(46, 1, 'Admin', '50'),
(47, 1, 'Admin', '51'),
(48, 1, 'Admin', '52'),
(50, 1, 'Admin', '54'),
(51, 1, 'Admin', '56'),
(52, 1, 'Admin', '55'),
(53, 1, 'Admin', '57'),
(58, 1, 'Admin', '70'),
(68, 2, 'Kasir', '61'),
(69, 2, 'Kasir', '62'),
(70, 2, 'Kasir', '63'),
(77, 1, 'Admin', '78'),
(78, 1, 'Admin', '74'),
(79, 1, 'Admin', '79'),
(80, 6, 'siswa', '12');

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id_info` int(11) NOT NULL,
  `nama_web` varchar(100) NOT NULL,
  `tentang` text NOT NULL,
  `slogan` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `wa` varchar(18) NOT NULL,
  `logo_web` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id_info`, `nama_web`, `tentang`, `slogan`, `alamat`, `email`, `wa`, `logo_web`) VALUES
(1, 'Projek', 'Cafe dengan konsep Foodtruck', 'pickmeup', 'Jalan Ahmad Yani Gang Satria Lama No.6 Malang', 'pickup1me@gmail.com', '0813-3378-2544', '1file_09092020110940.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `deskrip` text NOT NULL,
  `icon` varchar(30) NOT NULL,
  `is_active` int(1) NOT NULL,
  `is_parent` int(1) NOT NULL,
  `tipe` enum('menu','link','pager') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `link`, `deskrip`, `icon`, `is_active`, `is_parent`, `tipe`) VALUES
(12, 'Dashboard', 'admin/dashboard', 'hak akses info desa', 'fa fa-laptop', 1, 0, 'link'),
(13, 'Admin', '#', '', 'fa fa-laptop', 1, 0, 'menu'),
(15, 'menu management', 'admin/menu', 'hak akses penuh Controler menu/*', 'fa fa-list-alt', 1, 13, 'menu'),
(22, 'GENERATOR', 'harviacode', 'hak akses penuh Controler harviacode/*', 'fa fa-laptop', 1, 13, 'menu'),
(40, 'data', '#', '', 'fa fa-laptop', 1, 0, 'menu'),
(41, 'Setting', '#', '', 'fa fa-laptop', 1, 0, 'menu'),
(47, 'Auth item', 'admin/auth_item', 'hak akses penuh Controler Auth_item/*', 'fa fa-laptop', 1, 13, 'menu'),
(48, 'Auth detail', 'admin/auth_item_child', 'hak akses penuh Controler Auth_item_child/*', 'fa fa-laptop', 1, 13, 'menu'),
(52, 'Info Web', 'admin/info', 'hak akses Info', 'fa fa-list-alt', 1, 41, 'menu'),
(61, 'users/update', 'admin/users/update', 'hak akses aksi users/update/', 'fa fa-laptop', 1, 0, 'pager'),
(62, 'users/update_pass', 'admin/users/update_pass', 'hak akses aksi users/read/', 'fa fa-laptop', 1, 0, 'pager'),
(63, 'users/read', 'admin/users/read', 'hak akses aksi users/read/', 'fa fa-laptop', 1, 0, 'pager'),
(70, 'data user', 'admin/users', 'Data users', 'fa fa-laptop', 1, 40, 'menu'),
(73, 'admin', 'admin', 'routing', '1', 1, 0, 'pager'),
(74, 'Dashboard', 'admin/dashboard', 'hak akses info desa', 'fa fa-laptop', 1, 0, 'link'),
(78, 'tema', 'admin/tema', 'hak akses', 'fa fa-list-alt', 1, 41, 'link');

-- --------------------------------------------------------

--
-- Table structure for table `tema`
--

CREATE TABLE `tema` (
  `id_tema` int(11) NOT NULL,
  `navbar_bg_color` varchar(100) NOT NULL,
  `navbar_font_color` varchar(100) NOT NULL,
  `sidebar_bg_color` varchar(50) NOT NULL,
  `sidebar_font_color` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tema`
--

INSERT INTO `tema` (`id_tema`, `navbar_bg_color`, `navbar_font_color`, `sidebar_bg_color`, `sidebar_font_color`) VALUES
(1, 'red', 'dark', 'dark', 'secondary');

-- --------------------------------------------------------

--
-- Table structure for table `tes`
--

CREATE TABLE `tes` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `deskripsi` date NOT NULL,
  `images` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tes`
--

INSERT INTO `tes` (`id`, `judul`, `deskripsi`, `images`) VALUES
(3, 'Amazing Ta', '2020-08-04', 'fgdhdfhd');

-- --------------------------------------------------------

--
-- Table structure for table `tes2`
--

CREATE TABLE `tes2` (
  `id` int(11) NOT NULL,
  `nama_ketua` varchar(100) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tes2`
--

INSERT INTO `tes2` (`id`, `nama_ketua`, `time`) VALUES
(3, 'fgdg', 34),
(4, 'fdsfsd 4t3ter', 343244543);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nokartuidentitas` varchar(30) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `foto` varchar(100) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `nokartuidentitas`, `first_name`, `last_name`, `alamat`, `phone`, `foto`, `active`) VALUES
(1, 'admin1', 'e10adc3949ba59abbe56e057f20f883e', 'admin@gmail.com', '', 'admin1', NULL, NULL, '083834558876', '1file_09092020122247.png', 1),
(2, 'kasir1', 'e10adc3949ba59abbe56e057f20f883e', 'kasir1@gmail.com', '', 'raka', NULL, NULL, '082122314141', 'default.png', 1),
(3, 'kasir2', 'e10adc3949ba59abbe56e057f20f883e', 'kasir2@gmail.com', '', 'andi', NULL, NULL, '08888', 'default.png', 0),
(4, 'kasir42', 'e10adc3949ba59abbe56e057f20f883e', 'kasir42@mail.com', '', 'kasir 1', NULL, 'ewfrew', '08942141241', 'default.png', 1),
(9, 'joni2', 'e10adc3949ba59abbe56e057f20f883e', 'joni@gmail.com', NULL, 'joni', NULL, NULL, '08942141241', '9file_09092020122100.png', 1),
(10, 'kasir43', 'e10adc3949ba59abbe56e057f20f883e', 'khodirotulu@gmail.com', NULL, 'kasir widodo', NULL, 'ngojel from hell', '08942141242', '10file_09092020122005.png', 0),
(12, 'rffanani97', 'e10adc3949ba59abbe56e057f20f883e', 'rffanani97@mail.com', NULL, 'joni', NULL, 'ngojel from hell', '08942141241', '12file_09092020121929.jpg', 0),
(13, 'yayan123', 'e10adc3949ba59abbe56e057f20f883e', 'yayan123@mail.com', NULL, 'yayan', NULL, 'gh', '08942141241', 'default.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_detail`
--

CREATE TABLE `users_detail` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` datetime DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_detail`
--

INSERT INTO `users_detail` (`id`, `ip_address`, `activation_code`, `forgotten_password_time`, `created_on`, `last_login`) VALUES
(1, '109.109.109.109', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(2, '::1', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(3, '::1', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(4, '::1', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(9, '::1', NULL, NULL, '2020-08-23 21:51:43', NULL),
(10, '::1', NULL, NULL, '2020-08-23 22:13:02', NULL),
(12, '::1', NULL, NULL, '2020-09-09 11:20:29', NULL),
(13, '::1', NULL, NULL, '2020-10-01 09:14:38', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_akses`
-- (See below for the actual view)
--
CREATE TABLE `view_akses` (
`id` int(11) unsigned
,`username` varchar(100)
,`first_name` varchar(50)
,`name_level` varchar(64)
,`id_aunt` int(11)
,`id_child` int(11)
,`name` varchar(50)
,`link` varchar(50)
,`deskrip` text
,`icon` varchar(30)
,`is_active` int(1)
,`is_parent` int(1)
,`tipe` enum('menu','link','pager')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_auth_child`
-- (See below for the actual view)
--
CREATE TABLE `view_auth_child` (
`idc` int(11)
,`parent` varchar(64)
,`child` varchar(64)
,`name` varchar(50)
,`link` varchar(50)
,`deskrip` text
,`icon` varchar(30)
,`is_parent` int(1)
,`is_active` int(1)
,`tipe` enum('menu','link','pager')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_hk`
-- (See below for the actual view)
--
CREATE TABLE `view_hk` (
`id` int(11) unsigned
,`username` varchar(100)
,`id_assignment` int(11)
,`id_aunt` int(11)
,`item_name` varchar(64)
,`created_at` datetime
,`idc` int(11)
,`child` varchar(64)
);

-- --------------------------------------------------------

--
-- Structure for view `view_akses`
--
DROP TABLE IF EXISTS `view_akses`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_akses`  AS  select `users`.`id` AS `id`,`users`.`username` AS `username`,`users`.`first_name` AS `first_name`,`auth_item`.`name` AS `name_level`,`auth_item`.`id_aunt` AS `id_aunt`,`menu`.`id` AS `id_child`,`menu`.`name` AS `name`,`menu`.`link` AS `link`,`menu`.`deskrip` AS `deskrip`,`menu`.`icon` AS `icon`,`menu`.`is_active` AS `is_active`,`menu`.`is_parent` AS `is_parent`,`menu`.`tipe` AS `tipe` from ((((`users` join `auth_assignment` on(`users`.`id` = `auth_assignment`.`user_id`)) join `auth_item` on(`auth_item`.`id_aunt` = `auth_assignment`.`id_aunt`)) join `auth_item_child` on(`auth_item`.`id_aunt` = `auth_item_child`.`id_aunt`)) join `menu` on(`menu`.`id` = `auth_item_child`.`child`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_auth_child`
--
DROP TABLE IF EXISTS `view_auth_child`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_auth_child`  AS  select `auth_item_child`.`idc` AS `idc`,`auth_item_child`.`parent` AS `parent`,`auth_item_child`.`child` AS `child`,`menu`.`name` AS `name`,`menu`.`link` AS `link`,`menu`.`deskrip` AS `deskrip`,`menu`.`icon` AS `icon`,`menu`.`is_parent` AS `is_parent`,`menu`.`is_active` AS `is_active`,`menu`.`tipe` AS `tipe` from (`auth_item_child` join `menu` on(`menu`.`id` = `auth_item_child`.`child`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_hk`
--
DROP TABLE IF EXISTS `view_hk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_hk`  AS  select `users`.`id` AS `id`,`users`.`username` AS `username`,`auth_assignment`.`id_assignment` AS `id_assignment`,`auth_assignment`.`id_aunt` AS `id_aunt`,`auth_assignment`.`item_name` AS `item_name`,`auth_assignment`.`created_at` AS `created_at`,`auth_item_child`.`idc` AS `idc`,`auth_item_child`.`child` AS `child` from ((`auth_assignment` join `users` on(`users`.`id` = `auth_assignment`.`user_id`)) join `auth_item_child` on(`auth_item_child`.`id_aunt` = `auth_assignment`.`id_aunt`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`id_assignment`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`id_aunt`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`idc`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id_info`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`id_tema`);

--
-- Indexes for table `tes`
--
ALTER TABLE `tes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tes2`
--
ALTER TABLE `tes2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_detail`
--
ALTER TABLE `users_detail`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  MODIFY `id_assignment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `auth_item`
--
ALTER TABLE `auth_item`
  MODIFY `id_aunt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  MODIFY `idc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id_info` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `tema`
--
ALTER TABLE `tema`
  MODIFY `id_tema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tes`
--
ALTER TABLE `tes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tes2`
--
ALTER TABLE `tes2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
