-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 18 Mei 2018 pada 16.24
-- Versi Server: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hari_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barangs`
--

CREATE TABLE `barangs` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_barang` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_beli` decimal(11,2) NOT NULL,
  `harga_jual` decimal(11,2) NOT NULL,
  `code_barang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `barangs`
--

INSERT INTO `barangs` (`id`, `nama_barang`, `harga_beli`, `harga_jual`, `code_barang`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nasi Putih', '2000.00', '5000.00', 'NS001', '2018-04-05 02:04:55', '2018-04-05 02:04:55', NULL),
(2, 'Ayam Goreng', '4000.00', '7000.00', 'AG001', '2018-04-05 02:05:36', '2018-04-05 02:05:36', NULL),
(3, 'Sayur Asem', '6000.00', '10000.00', 'SA001', '2018-04-05 02:06:11', '2018-04-05 02:06:11', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_11_01_144602_create_barangs_table', 1),
(4, '2017_11_03_154849_create_orders_table', 1),
(5, '2017_11_03_171447_create_order_items_table', 1),
(6, '2017_11_04_101523_create_shoppingcart_table', 1),
(7, '2017_11_28_151011_create_pembayarans_table', 1),
(8, '2017_12_26_014757_create_reports_table', 1),
(9, '2018_02_17_090347_create_purchases_table', 1),
(10, '2018_03_16_074416_laratrust_setup_tables', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_customer` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_order` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `total_laba` decimal(11,2) NOT NULL,
  `status` enum('cash','pending') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `nama_customer`, `code_order`, `jumlah_barang`, `total`, `total_laba`, `status`, `tanggal`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 'meja234', '005/ORD/V/2018', 5, '31000.00', '16000.00', 'cash', '2018-05-12', '2018-05-12 06:42:08', '2018-05-18 06:42:31', NULL),
(7, 'Meja23', '002/ORD/V/2018', 4, '24000.00', '12000.00', 'cash', '2018-05-18', '2018-05-18 06:41:49', '2018-05-18 06:43:58', NULL),
(8, 'meja78990', '003/ORD/V/2018', 3, '22000.00', '12000.00', 'cash', '2018-05-18', '2018-05-18 06:50:18', '2018-05-18 06:50:39', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `barang_id` int(10) UNSIGNED NOT NULL,
  `code_barang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` decimal(11,2) NOT NULL,
  `harga_beli` decimal(11,2) NOT NULL,
  `subtotal` decimal(11,2) NOT NULL,
  `laba` decimal(11,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `barang_id`, `code_barang`, `nama_barang`, `qty`, `harga`, `harga_beli`, `subtotal`, `laba`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 1, 2, 'AG001', 'Ayam Goreng', 2, '7000.00', '4000.00', '14000.00', '8000.00', '2018-04-05 02:06:55', '2018-04-05 02:06:55', NULL),
(10, 6, 2, 'AG001', 'Ayam Goreng', 3, '7000.00', '4000.00', '21000.00', '12000.00', '2018-05-12 06:42:08', '2018-05-12 06:50:09', NULL),
(11, 6, 1, 'NS001', 'Nasi Putih', 2, '5000.00', '2000.00', '10000.00', '4000.00', '2018-05-12 06:42:08', '2018-05-12 06:42:08', NULL),
(12, 7, 2, 'AG001', 'Ayam Goreng', 2, '7000.00', '4000.00', '14000.00', '8000.00', '2018-05-18 06:41:49', '2018-05-18 06:41:49', NULL),
(13, 7, 1, 'NS001', 'Nasi Putih', 2, '5000.00', '2000.00', '10000.00', '4000.00', '2018-05-18 06:41:49', '2018-05-18 06:41:49', NULL),
(14, 8, 1, 'NS001', 'Nasi Putih', 1, '5000.00', '2000.00', '5000.00', '2000.00', '2018-05-18 06:50:18', '2018-05-18 06:50:18', NULL),
(15, 8, 3, 'SA001', 'Sayur Asem', 1, '10000.00', '6000.00', '10000.00', '6000.00', '2018-05-18 06:50:18', '2018-05-18 06:50:18', NULL),
(16, 8, 2, 'AG001', 'Ayam Goreng', 1, '7000.00', '4000.00', '7000.00', '4000.00', '2018-05-18 06:50:18', '2018-05-18 06:50:18', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayarans`
--

CREATE TABLE `pembayarans` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `tipe_pembayaran` enum('tunai','debet') COLLATE utf8mb4_unicode_ci NOT NULL,
  `bayar` decimal(10,2) NOT NULL,
  `kembalian` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pembayarans`
--

INSERT INTO `pembayarans` (`id`, `order_id`, `tanggal`, `tipe_pembayaran`, `bayar`, `kembalian`, `total`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2018-04-05', 'tunai', '50000.00', '11000.00', '39000.00', '2018-04-05 02:22:51', '2018-04-05 02:22:51', NULL),
(2, 2, '2018-04-05', 'tunai', '20000.00', '8000.00', '12000.00', '2018-04-05 07:41:34', '2018-04-05 07:41:34', NULL),
(3, 4, '2018-05-12', 'tunai', '50000.00', '15000.00', '35000.00', '2018-05-12 06:19:23', '2018-05-12 06:19:23', NULL),
(4, 3, '2018-05-12', 'tunai', '50000.00', '4000.00', '46000.00', '2018-05-12 06:19:51', '2018-05-12 06:19:51', NULL),
(5, 6, '2018-05-18', 'tunai', '50000.00', '19000.00', '31000.00', '2018-05-18 06:42:31', '2018-05-18 06:42:31', NULL),
(6, 7, '2018-05-18', 'tunai', '30000.00', '6000.00', '24000.00', '2018-05-18 06:43:58', '2018-05-18 06:43:58', NULL),
(7, 8, '2018-05-18', 'tunai', '30000.00', '8000.00', '22000.00', '2018-05-18 06:50:40', '2018-05-18 06:50:40', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'create-users', 'Create Users', 'Create Users', '2018-04-05 02:03:45', '2018-04-05 02:03:45'),
(2, 'read-users', 'Read Users', 'Read Users', '2018-04-05 02:03:45', '2018-04-05 02:03:45'),
(3, 'update-users', 'Update Users', 'Update Users', '2018-04-05 02:03:45', '2018-04-05 02:03:45'),
(4, 'delete-users', 'Delete Users', 'Delete Users', '2018-04-05 02:03:45', '2018-04-05 02:03:45'),
(5, 'create-acl', 'Create Acl', 'Create Acl', '2018-04-05 02:03:45', '2018-04-05 02:03:45'),
(6, 'read-acl', 'Read Acl', 'Read Acl', '2018-04-05 02:03:45', '2018-04-05 02:03:45'),
(7, 'update-acl', 'Update Acl', 'Update Acl', '2018-04-05 02:03:45', '2018-04-05 02:03:45'),
(8, 'delete-acl', 'Delete Acl', 'Delete Acl', '2018-04-05 02:03:45', '2018-04-05 02:03:45'),
(9, 'read-profile', 'Read Profile', 'Read Profile', '2018-04-05 02:03:45', '2018-04-05 02:03:45'),
(10, 'update-profile', 'Update Profile', 'Update Profile', '2018-04-05 02:03:45', '2018-04-05 02:03:45'),
(11, 'create-profile', 'Create Profile', 'Create Profile', '2018-04-05 02:03:47', '2018-04-05 02:03:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(9, 2),
(9, 3),
(10, 1),
(10, 2),
(10, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permission_user`
--

INSERT INTO `permission_user` (`permission_id`, `user_id`, `user_type`) VALUES
(9, 4, 'App\\User'),
(10, 4, 'App\\User'),
(11, 4, 'App\\User');

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchases`
--

CREATE TABLE `purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_supplier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_supplier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('cash','pending') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `reports`
--

CREATE TABLE `reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `barang_id` int(10) UNSIGNED NOT NULL,
  `orderdetail_id` int(10) UNSIGNED NOT NULL,
  `pembayaran_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'superadministrator', 'Superadministrator', 'Superadministrator', '2018-04-05 02:03:45', '2018-04-05 02:03:45'),
(2, 'administrator', 'Administrator', 'Administrator', '2018-04-05 02:03:46', '2018-04-05 02:03:46'),
(3, 'user', 'User', 'User', '2018-04-05 02:03:47', '2018-04-05 02:03:47'),
(4, 'kasir', 'Kasir', 'kasir', '2018-05-12 15:14:52', '2018-05-12 15:14:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_user`
--

CREATE TABLE `role_user` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(1, 1, 'App\\User'),
(2, 2, 'App\\User'),
(3, 3, 'App\\User'),
(4, 5, 'App\\User'),
(4, 6, 'App\\User');

-- --------------------------------------------------------

--
-- Struktur dari tabel `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Superadministrator', 'superadministrator@app.com', '$2y$10$9A9D7poTQuiBt7KCv9DyTOwbiwxs/6BPKqhHd77sb/rMGtpTKL1AG', 'PZ5mlhUBdg1LnUDJ2ahNJYNcaaRGAMF3SbMOpyh3nRHpD8k5tUE9ZHZyiYSw', '2018-04-05 02:03:46', '2018-04-05 02:03:46'),
(2, 'Administrator', 'administrator@app.com', '$2y$10$MYHcRSuwfbHUBFzpXqyA.e2M6hW2QajCNTkPMNKn72zGnLc6SJvNO', NULL, '2018-04-05 02:03:46', '2018-04-05 02:03:46'),
(3, 'User', 'user@app.com', '$2y$10$iPk0j8kadeYoKNXr0N8dKeHiZEToLvOFuj.rtBzflxQgXdahpU9MC', NULL, '2018-04-05 02:03:47', '2018-04-05 02:03:47'),
(4, 'Cru User', 'cru_user@app.com', '$2y$10$XHV3cFgdMSXNEIGSALYik.meHuFkO/ym2OBpUUINPSHscMvX08Eeq', 'JGxGNEZ4M1', '2018-04-05 02:03:47', '2018-04-05 02:03:47'),
(5, 'Kasir', 'kasir@app.com', '$2y$10$XHV3cFgdMSXNEIGSALYik.meHuFkO/ym2OBpUUINPSHscMvX08Eeq', '4WxN8OjcQGmJejUuo3pHY5x3BDSbAYTt4qxdwnBt6qqfJUMjcCg2Ra4DYhfp', '2018-05-12 15:17:21', '2018-05-15 07:27:56'),
(6, 'TesKasir', 'tesk@app.com', '$2y$10$..zAOE60EeFKnBmDCgYm6eI6BT7YYpier8UTpsZQKfEmFiB4ghBt.', 'HvC9QCxjwViRYp1LQitLxwmPhfGMPQKtxP0GnTaVChgHknATtvL1nfJnW21o', '2018-05-18 07:14:12', '2018-05-18 07:14:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barangs`
--
ALTER TABLE `barangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pembayarans`
--
ALTER TABLE `pembayarans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barangs`
--
ALTER TABLE `barangs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `pembayarans`
--
ALTER TABLE `pembayarans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
