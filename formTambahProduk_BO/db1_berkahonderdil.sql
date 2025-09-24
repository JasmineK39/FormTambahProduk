-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2025 at 01:32 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_berkahonderdil`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

-- --------------------------------------------------------
-- Table structure for table `admin`
-- --------------------------------------------------------
CREATE TABLE `admin` (
  `id_admin` INT(11) NOT NULL AUTO_INCREMENT,
  `nama_admin` VARCHAR(100) NOT NULL,
  `pass_admin` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `provinsi`
-- --------------------------------------------------------
CREATE TABLE `provinsi` (
  `id_provinsi` VARCHAR(2) NOT NULL,
  `nama_provinsi` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_provinsi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `kab`
-- --------------------------------------------------------
CREATE TABLE `kab` (
  `id_kab` VARCHAR(4) NOT NULL,
  `id_provinsi` VARCHAR(2) NOT NULL,
  `nama_kab` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_kab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `kec`
-- --------------------------------------------------------
CREATE TABLE `kec` (
  `id_kec` VARCHAR(6) NOT NULL,
  `id_kab` VARCHAR(4) NOT NULL,
  `nama_kec` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_kec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `id_kel`
-- --------------------------------------------------------
CREATE TABLE `id_kel` (
  `id_kel` VARCHAR(10) NOT NULL,
  `id_kec` VARCHAR(6) NOT NULL,
  `nama_kel` VARCHAR(100) NOT NULL,
  `kode_pos` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id_kel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `model`
-- --------------------------------------------------------
CREATE TABLE `model` (
  `id_mobil` INT(11) NOT NULL AUTO_INCREMENT,
  `brand` VARCHAR(50) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  `tahun` YEAR(4) NOT NULL,
  PRIMARY KEY (`id_mobil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `user`
-- --------------------------------------------------------
CREATE TABLE `user` (
  `id_user` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `no_telp` VARCHAR(15) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `alamat` TEXT NOT NULL,
  `id_provinsi` VARCHAR(2) NOT NULL,
  `id_kota` VARCHAR(4) NOT NULL,
  `id_kec` VARCHAR(6) NOT NULL,
  `id_kel` VARCHAR(10) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `sparepart`
-- --------------------------------------------------------
CREATE TABLE `sparepart` (
  `id_sparepart` INT(11) NOT NULL AUTO_INCREMENT,
  `id_mobil` INT(11) NOT NULL,
  `nama` VARCHAR(100) NOT NULL,
  `stock` INT(11) NOT NULL,
  `grade` ENUM('A','B','C') NOT NULL,
  `harga` DECIMAL(12,2) NOT NULL,
  `deskripsi` TEXT DEFAULT NULL,
  PRIMARY KEY (`id_sparepart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `request`
-- --------------------------------------------------------
CREATE TABLE `request` (
  `id_req` INT(11) NOT NULL AUTO_INCREMENT,
  `created_at` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  `id_user` INT(11) NOT NULL,
  `brand_req` VARCHAR(50) NOT NULL,
  `model_req` VARCHAR(100) NOT NULL,
  `tahun_req` YEAR(4) NOT NULL,
  `sparepart_req` VARCHAR(100) NOT NULL,
  `ket` TEXT DEFAULT NULL,
  `status` ENUM('Menunggu','Diproses','Selesai') NOT NULL DEFAULT 'Menunggu',
  PRIMARY KEY (`id_req`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `review`
-- --------------------------------------------------------
CREATE TABLE `review` (
  `id_review` INT(11) NOT NULL AUTO_INCREMENT,
  `id_sparepart` INT(11) NOT NULL,
  `id_user` INT(11) NOT NULL,
  `bintang` TINYINT(5) NOT NULL,
  `komentar` TEXT DEFAULT NULL,
  PRIMARY KEY (`id_review`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Data untuk tabel `model`
-- --------------------------------------------------------
INSERT INTO `model` (`brand`, `model`, `tahun`) VALUES
('Toyota', 'Avanza', 2020),
('Daihatsu', 'Xenia', 2020),
('Toyota', 'Kijang Innova', 2020),
('Honda', 'Civic', 2021),
('Toyota', 'Fortuner', 2021),
('Mitsubishi', 'Xpander', 2021),
('Honda', 'HR-V', 2021),
('Suzuki', 'Ertiga', 2020),
('Nissan', 'Livina', 2020),
('Mitsubishi', 'Pajero Sport', 2021),
('Honda', 'Brio', 2022),
('Toyota', 'Agya', 2022),
('Daihatsu', 'Ayla', 2022),
('Suzuki', 'XL7', 2021),
('Hyundai', 'Creta', 2022),
('Toyota', 'Raize', 2022),
('Daihatsu', 'Rocky', 2022),
('Wuling', 'Confero', 2021),
('Wuling', 'Almaz', 2021),
('Honda', 'CR-V', 2021),
('Mazda', 'CX-5', 2021),
('Toyota', 'Rush', 2021),
('Daihatsu', 'Terios', 2021),
('Isuzu', 'Panther', 2019),
('Toyota', 'Yaris', 2022);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
