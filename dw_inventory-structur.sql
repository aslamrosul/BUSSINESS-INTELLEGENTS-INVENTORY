-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 28, 2025 at 04:50 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dw_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `dim_gudang`
--

CREATE TABLE `dim_gudang` (
  `id_gudang` int NOT NULL,
  `alamat_gudang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dim_produk`
--

CREATE TABLE `dim_produk` (
  `id_produk` varchar(255) NOT NULL,
  `nama_produk` varchar(255) DEFAULT NULL,
  `kategori` varchar(100) DEFAULT NULL,
  `harga_satuan` decimal(15,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dim_supplier`
--

CREATE TABLE `dim_supplier` (
  `id_supplier` varchar(255) NOT NULL,
  `nama_supplier` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dim_waktu`
--

CREATE TABLE `dim_waktu` (
  `date_key` varchar(8) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `tahun` int DEFAULT NULL,
  `bulan` tinyint DEFAULT NULL,
  `hari` tinyint DEFAULT NULL,
  `kuartal` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fact_inventaris`
--

CREATE TABLE `fact_inventaris` (
  `id_produk` varchar(255) DEFAULT NULL,
  `id_supplier` varchar(255) DEFAULT NULL,
  `id_gudang` int DEFAULT NULL,
  `key_tgl_terima` varchar(8) DEFAULT NULL,
  `key_tgl_order` varchar(8) DEFAULT NULL,
  `key_tgl_kadaluwarsa` varchar(8) DEFAULT NULL,
  `jumlah_stok` int DEFAULT NULL,
  `level_reorder` int DEFAULT NULL,
  `jumlah_reorder` int DEFAULT NULL,
  `volume_penjualan` int DEFAULT NULL,
  `rasio_perputaran` int DEFAULT NULL,
  `estimasi_nilai_stok` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dim_gudang`
--
ALTER TABLE `dim_gudang`
  ADD PRIMARY KEY (`id_gudang`);

--
-- Indexes for table `dim_produk`
--
ALTER TABLE `dim_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `dim_supplier`
--
ALTER TABLE `dim_supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `dim_waktu`
--
ALTER TABLE `dim_waktu`
  ADD PRIMARY KEY (`date_key`);

--
-- Indexes for table `fact_inventaris`
--
ALTER TABLE `fact_inventaris`
  ADD KEY `fk_produk` (`id_produk`),
  ADD KEY `fk_supplier` (`id_supplier`),
  ADD KEY `fk_gudang` (`id_gudang`),
  ADD KEY `fk_tgl_terima` (`key_tgl_terima`),
  ADD KEY `fk_tgl_order` (`key_tgl_order`),
  ADD KEY `fk_tgl_kadaluwarsa` (`key_tgl_kadaluwarsa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dim_gudang`
--
ALTER TABLE `dim_gudang`
  MODIFY `id_gudang` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fact_inventaris`
--
ALTER TABLE `fact_inventaris`
  ADD CONSTRAINT `fk_gudang` FOREIGN KEY (`id_gudang`) REFERENCES `dim_gudang` (`id_gudang`),
  ADD CONSTRAINT `fk_produk` FOREIGN KEY (`id_produk`) REFERENCES `dim_produk` (`id_produk`),
  ADD CONSTRAINT `fk_supplier` FOREIGN KEY (`id_supplier`) REFERENCES `dim_supplier` (`id_supplier`),
  ADD CONSTRAINT `fk_tgl_kadaluwarsa` FOREIGN KEY (`key_tgl_kadaluwarsa`) REFERENCES `dim_waktu` (`date_key`),
  ADD CONSTRAINT `fk_tgl_order` FOREIGN KEY (`key_tgl_order`) REFERENCES `dim_waktu` (`date_key`),
  ADD CONSTRAINT `fk_tgl_terima` FOREIGN KEY (`key_tgl_terima`) REFERENCES `dim_waktu` (`date_key`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
