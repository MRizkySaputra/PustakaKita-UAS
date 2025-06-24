-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2025 at 09:55 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pustakakita`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `kode_buku` char(6) NOT NULL,
  `kode_kategori` char(3) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `tahun_terbit` smallint(6) NOT NULL,
  `edisi` tinyint(4) NOT NULL,
  `tanggal_pengadaan` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`kode_buku`, `kode_kategori`, `judul`, `pengarang`, `penerbit`, `tahun_terbit`, `edisi`, `tanggal_pengadaan`) VALUES
('B00001', '700', 'Panduan Musik', 'Hana', 'Media Edukasi', 2007, 1, '2015-02-08'),
('B00002', '200', 'Analisis Teknik', 'Joko Dr.', 'Pustaka Ilmu', 2000, 5, '2017-10-05'),
('B00003', '200', 'Strategi Matematika', 'Citra S.', 'Pustaka Ilmu', 2010, 1, '2023-06-05'),
('B00004', '700', 'Dasar-Dasar Ekonomi', 'Eko Dr.', 'Media Edukasi', 2010, 2, '2022-10-13'),
('B00005', '900', 'Analisis Teknik', 'Joko S.', 'Pustaka Ilmu', 1992, 1, '2023-08-06'),
('B00006', '200', 'Analisis Bahasa', 'Fitri', 'Media Edukasi', 2018, 5, '2017-02-22'),
('B00007', '100', 'Pengenalan Sejarah', 'Fitri Dr.', 'Tiga Serangkai', 2004, 5, '2013-11-28'),
('B00008', '900', 'Praktik Musik', 'Dewi S.', 'Erlangga', 2011, 1, '2023-03-12'),
('B00009', '500', 'Studi Kasus Teknik', 'Citra S.', 'Gramedia', 2007, 1, '2021-11-24'),
('B00010', '300', 'Teori Sejarah', 'Fitri', 'Media Edukasi', 2014, 4, '2018-06-24'),
('B00011', '200', 'Analisis Agama', 'Citra', 'Erlangga', 2018, 2, '2024-07-07'),
('B00012', '200', 'Studi Kasus Matematika', 'Gilang M.', 'Erlangga', 2004, 3, '2018-08-15'),
('B00013', '700', 'Dasar-Dasar Ekonomi', 'Hana M.', 'Erlangga', 2006, 1, '2019-11-12'),
('B00014', '800', 'Studi Kasus Sastra', 'Hana M.', 'Gramedia', 2022, 4, '2010-07-16'),
('B00015', '700', 'Pengenalan Sejarah', 'Dewi Dr.', 'Erlangga', 2008, 1, '2010-07-26'),
('B00016', '900', 'Panduan Komputer', 'Gilang', 'Gramedia', 1992, 4, '2017-11-09'),
('B00017', '900', 'Panduan Sastra', 'Dewi Dr.', 'Pustaka Ilmu', 1991, 3, '2018-06-03'),
('B00018', '300', 'Analisis Filsafat', 'Andi M.', 'Gramedia', 2020, 4, '2020-01-07'),
('B00019', '500', 'Strategi Matematika', 'Imam Dr.', 'Pustaka Ilmu', 2005, 4, '2018-08-08'),
('B00020', '000', 'Teori Komputer', 'Hana', 'Pustaka Ilmu', 2004, 2, '2013-04-24'),
('B00021', '100', 'Dasar-Dasar Musik', 'Andi Dr.', 'Pustaka Ilmu', 2023, 3, '2019-05-27'),
('B00022', '900', 'Dasar-Dasar Sastra', 'Citra S.', 'Media Edukasi', 2000, 2, '2011-05-10'),
('B00023', '500', 'Studi Kasus Ekonomi', 'Gilang M.', 'Erlangga', 2006, 3, '2014-11-26'),
('B00024', '600', 'Pengenalan Filsafat', 'Eko M.', 'Media Edukasi', 2010, 2, '2019-06-10'),
('B00025', '900', 'Analisis Komputer', 'Gilang', 'Tiga Serangkai', 2001, 1, '2014-05-23'),
('B00026', '800', 'Analisis Ekonomi', 'Gilang', 'Tiga Serangkai', 2009, 1, '2021-07-07'),
('B00027', '100', 'Pengenalan Bahasa', 'Joko S.', 'Erlangga', 1997, 3, '2017-10-28'),
('B00028', '400', 'Strategi Komputer', 'Imam', 'Media Edukasi', 2023, 1, '2024-11-28'),
('B00029', '500', 'Praktik Ekonomi', 'Imam S.', 'Tiga Serangkai', 2022, 5, '2010-09-23'),
('B00030', '600', 'Panduan Bahasa', 'Joko Dr.', 'Pustaka Ilmu', 2018, 3, '2023-02-01'),
('B00031', '900', 'Pengenalan Sejarah', 'Citra S.', 'Erlangga', 1990, 3, '2024-08-13'),
('B00032', '300', 'Analisis Sejarah', 'Dewi Dr.', 'Tiga Serangkai', 1990, 3, '2010-05-22'),
('B00033', '800', 'Pengenalan Bahasa', 'Citra', 'Erlangga', 1990, 3, '2019-07-02'),
('B00034', '600', 'Studi Kasus Teknik', 'Joko S.', 'Erlangga', 2001, 5, '2011-06-23'),
('B00035', '500', 'Analisis Komputer', 'Andi Dr.', 'Media Edukasi', 2003, 4, '2021-01-24'),
('B00036', '700', 'Pengenalan Ekonomi', 'Dewi M.', 'Pustaka Ilmu', 1997, 3, '2019-11-01'),
('B00037', '700', 'Studi Kasus Filsafat', 'Citra S.', 'Pustaka Ilmu', 2012, 1, '2022-09-17'),
('B00038', '700', 'Strategi Sejarah', 'Imam M.', 'Erlangga', 1998, 5, '2023-04-23'),
('B00039', '000', 'Studi Kasus Filsafat', 'Hana M.', 'Gramedia', 1990, 2, '2012-05-09'),
('B00040', '100', 'Panduan Bahasa', 'Eko', 'Media Edukasi', 2011, 1, '2010-11-16'),
('B00041', '500', 'Dasar-Dasar Filsafat', 'Gilang S.', 'Erlangga', 1990, 3, '2015-03-17'),
('B00042', '000', 'Teori Bahasa', 'Dewi Dr.', 'Gramedia', 2020, 5, '2010-07-08'),
('B00043', '400', 'Strategi Sastra', 'Andi Dr.', 'Erlangga', 2008, 5, '2011-11-25'),
('B00044', '100', 'Teori Bahasa', 'Andi', 'Pustaka Ilmu', 2009, 4, '2012-09-24'),
('B00045', '500', 'Pengenalan Bahasa', 'Budi', 'Media Edukasi', 2022, 3, '2023-07-24'),
('B00046', '000', 'Strategi Agama', 'Imam S.', 'Media Edukasi', 2013, 2, '2011-04-03'),
('B00047', '500', 'Panduan Musik', 'Eko M.', 'Gramedia', 2023, 4, '2023-03-03'),
('B00048', '300', 'Analisis Teknik', 'Citra M.', 'Gramedia', 2006, 3, '2019-03-11'),
('B00049', '300', 'Teori Teknik', 'Gilang', 'Erlangga', 2021, 1, '2017-08-27'),
('B00050', '100', 'Pengenalan Musik', 'Joko Dr.', 'Gramedia', 2014, 3, '2016-03-25'),
('B00051', '400', 'Teori Agama', 'Andi S.', 'Gramedia', 2014, 3, '2011-11-05'),
('B00052', '700', 'Praktik Agama', 'Hana S.', 'Pustaka Ilmu', 2014, 2, '2023-05-08'),
('B00053', '100', 'Pengenalan Filsafat', 'Andi', 'Gramedia', 2005, 1, '2022-09-21'),
('B00054', '500', 'Studi Kasus Komputer', 'Dewi Dr.', 'Media Edukasi', 2003, 2, '2024-04-24'),
('B00055', '300', 'Analisis Agama', 'Gilang Dr.', 'Erlangga', 2023, 5, '2021-10-21'),
('B00056', '800', 'Praktik Komputer', 'Fitri M.', 'Tiga Serangkai', 1991, 2, '2021-11-18'),
('B00057', '600', 'Strategi Sastra', 'Gilang', 'Erlangga', 2008, 5, '2010-11-01'),
('B00058', '200', 'Studi Kasus Komputer', 'Imam M.', 'Erlangga', 1992, 4, '2012-10-24'),
('B00059', '800', 'Teori Bahasa', 'Hana S.', 'Gramedia', 2011, 1, '2019-07-10'),
('B00060', '700', 'Praktik Musik', 'Joko Dr.', 'Erlangga', 1990, 1, '2024-12-05'),
('B00061', '500', 'Panduan Matematika', 'Budi', 'Media Edukasi', 2000, 5, '2011-06-28'),
('B00062', '400', 'Panduan Agama', 'Eko S.', 'Gramedia', 2009, 1, '2019-01-02'),
('B00063', '800', 'Studi Kasus Matematika', 'Fitri M.', 'Media Edukasi', 2008, 2, '2016-12-04'),
('B00064', '200', 'Teori Bahasa', 'Imam M.', 'Gramedia', 2000, 1, '2014-05-23'),
('B00065', '500', 'Pengenalan Agama', 'Dewi', 'Tiga Serangkai', 1993, 4, '2022-06-27'),
('B00066', '000', 'Dasar-Dasar Bahasa', 'Joko M.', 'Gramedia', 2022, 4, '2012-09-24'),
('B00067', '500', 'Analisis Musik', 'Andi M.', 'Pustaka Ilmu', 1990, 4, '2017-04-07'),
('B00068', '100', 'Praktik Musik', 'Budi M.', 'Erlangga', 1993, 3, '2019-06-20'),
('B00069', '400', 'Pengenalan Musik', 'Joko M.', 'Tiga Serangkai', 2008, 4, '2021-08-21'),
('B00070', '100', 'Pengenalan Ekonomi', 'Hana Dr.', 'Erlangga', 1995, 3, '2020-01-25'),
('B00071', '200', 'Analisis Agama', 'Citra M.', 'Gramedia', 2011, 5, '2024-04-05'),
('B00072', '900', 'Analisis Filsafat', 'Joko Dr.', 'Tiga Serangkai', 2017, 5, '2022-09-23'),
('B00073', '000', 'Praktik Sastra', 'Citra Dr.', 'Pustaka Ilmu', 1996, 4, '2023-07-03'),
('B00074', '200', 'Pengenalan Musik', 'Eko', 'Pustaka Ilmu', 2013, 4, '2020-07-04'),
('B00075', '900', 'Analisis Filsafat', 'Fitri Dr.', 'Pustaka Ilmu', 2011, 5, '2020-10-20'),
('B00076', '000', 'Praktik Ekonomi', 'Hana Dr.', 'Media Edukasi', 2001, 4, '2012-06-02'),
('B00077', '300', 'Panduan Sastra', 'Citra S.', 'Pustaka Ilmu', 2004, 5, '2020-12-19'),
('B00078', '300', 'Panduan Sastra', 'Dewi Dr.', 'Gramedia', 1990, 2, '2012-12-21'),
('B00079', '500', 'Teori Bahasa', 'Hana', 'Pustaka Ilmu', 2011, 5, '2024-11-26'),
('B00080', '600', 'Dasar-Dasar Komputer', 'Eko Dr.', 'Gramedia', 2007, 4, '2021-11-16'),
('B00081', '200', 'Analisis Ekonomi', 'Budi Dr.', 'Tiga Serangkai', 1996, 4, '2010-04-15'),
('B00082', '900', 'Panduan Matematika', 'Eko Dr.', 'Media Edukasi', 2007, 2, '2010-06-21'),
('B00083', '900', 'Dasar-Dasar Ekonomi', 'Eko', 'Tiga Serangkai', 2020, 1, '2012-06-28'),
('B00084', '300', 'Strategi Bahasa', 'Joko S.', 'Tiga Serangkai', 2013, 3, '2021-11-13'),
('B00085', '500', 'Panduan Matematika', 'Hana Dr.', 'Erlangga', 1995, 1, '2017-04-09'),
('B00086', '500', 'Analisis Sastra', 'Imam Dr.', 'Pustaka Ilmu', 2012, 3, '2015-06-02'),
('B00087', '600', 'Teori Agama', 'Gilang S.', 'Tiga Serangkai', 2012, 4, '2022-03-24'),
('B00088', '900', 'Panduan Filsafat', 'Gilang M.', 'Media Edukasi', 2014, 3, '2011-01-12'),
('B00089', '100', 'Dasar-Dasar Bahasa', 'Joko', 'Tiga Serangkai', 1993, 1, '2019-09-06'),
('B00090', '000', 'Panduan Agama', 'Joko Dr.', 'Tiga Serangkai', 1996, 3, '2023-09-18'),
('B00091', '400', 'Dasar-Dasar Komputer', 'Andi S.', 'Pustaka Ilmu', 2014, 3, '2015-03-20'),
('B00092', '900', 'Teori Filsafat', 'Eko', 'Tiga Serangkai', 2023, 1, '2018-08-06'),
('B00093', '900', 'Panduan Filsafat', 'Citra M.', 'Pustaka Ilmu', 2001, 4, '2016-01-11'),
('B00094', '100', 'Dasar-Dasar Agama', 'Hana S.', 'Media Edukasi', 2021, 2, '2015-02-04'),
('B00095', '200', 'Panduan Bahasa', 'Citra Dr.', 'Tiga Serangkai', 1999, 3, '2017-03-06'),
('B00096', '400', 'Studi Kasus Bahasa', 'Joko S.', 'Erlangga', 2001, 1, '2018-04-04'),
('B00097', '000', 'Praktik Teknik', 'Fitri', 'Gramedia', 2003, 3, '2021-12-03'),
('B00098', '600', 'Pengenalan Sastra', 'Dewi', 'Erlangga', 2007, 4, '2012-06-18'),
('B00099', '200', 'Analisis Bahasa', 'Joko M.', 'Gramedia', 2020, 2, '2015-11-01'),
('B00100', '300', 'Pengenalan Sejarah', 'Fitri', 'Erlangga', 2023, 5, '2011-08-02');

-- --------------------------------------------------------

--
-- Table structure for table `buku_item`
--

CREATE TABLE `buku_item` (
  `id` int(11) NOT NULL,
  `kode_item` char(8) NOT NULL,
  `kode_buku` char(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_buku`
--

CREATE TABLE `kategori_buku` (
  `kode_kategori` char(3) NOT NULL,
  `nama_kategori` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_buku`
--

INSERT INTO `kategori_buku` (`kode_kategori`, `nama_kategori`) VALUES
('000', 'Karya Umum'),
('100', 'Filsafat dan Psikolo'),
('200', 'Agama'),
('300', 'Ilmu-ilmu Sosial'),
('400', 'Bahasa'),
('500', 'Ilmu Pengetahuan Alam dan Matematika'),
('600', 'Teknologi dan Ilmu-ilmu Terapan'),
('700', 'Seni, Hiburan, dan Olahraga'),
('800', 'Sastra'),
('900', 'Geografi dan Sejarah');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `session_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `role` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`session_id`, `username`, `password`, `fullname`, `role`, `created_at`) VALUES
('02d02383-41b7-405b-a0d3-14b206bbe007', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-20 15:16:46'),
('05eb5831-8b80-4d12-aa79-d08ee3f19c9f', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 03:03:02'),
('08112031-c791-4eb1-9a64-6ca6dd24c2ad', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 03:05:18'),
('0a811e9b-4df0-4a2a-a235-1a19acdb727f', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-21 14:43:55'),
('132a1ded-18f4-442e-bfed-f29f1a5a6d5b', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-21 14:53:32'),
('18013a5a-468d-4d06-ac43-0d10848a3de3', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 03:48:25'),
('1df7e465-211a-4561-8e5a-0b50a704a78b', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 03:07:39'),
('1e7c6253-058c-4328-9014-43a314b53889', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 05:40:21'),
('20c481ea-3ea0-42c8-b503-76bc344329b6', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 03:36:02'),
('282fe78c-71f1-4f8c-aba9-e70d7787de8e', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-21 10:33:07'),
('298e3d18-5cee-48c6-9d6f-548d5e60bf37', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 03:55:42'),
('2e48aad1-9d83-4669-ba56-94adb35a0bd8', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-20 14:55:49'),
('2ee060e2-45b4-4fbb-a732-1f8996fb25b6', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-21 14:58:40'),
('30943f71-123e-42b4-8e93-765af961ed62', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-20 15:07:15'),
('444e51ff-be77-4733-979a-e649ece92ceb', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 03:06:19'),
('46cf799b-8918-4735-b1c3-264805102779', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 02:43:58'),
('46f68fc4-e74f-4de8-898b-4a0019126214', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 04:19:54'),
('493634e7-ae7a-4409-8132-c4780bdbf693', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 06:00:20'),
('4a48de27-edfb-44f4-ba67-c5668870eb4c', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 02:39:20'),
('4e3fd5a5-b1e7-4d85-a973-329a2c6768b4', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-21 09:42:15'),
('55c44da4-130a-4813-8ee1-1b2f48c1f3ee', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-20 14:34:38'),
('570042a6-d77f-4374-8c89-1eb5aac67811', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-20 16:03:12'),
('5aceacbb-5290-4a56-960e-2927565618eb', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 05:44:16'),
('5b98476c-75d7-4428-8781-6196da6d79d0', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 03:37:42'),
('5be22ede-ac23-401e-bd78-e58fcf2f4928', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 03:44:16'),
('5bed843d-255a-430c-8026-5cb04790dc5b', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-21 14:46:17'),
('648ce22a-c0c3-4ab7-8991-2df8d3043661', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-20 16:07:42'),
('6495c7c8-15dc-460b-995d-850328090cbc', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 04:15:20'),
('653d0171-6e2a-4523-9110-09f23567568f', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-20 14:43:18'),
('72090553-35af-46cd-9892-9f67c5d084c4', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 04:01:34'),
('75afee83-b1f8-48f2-affc-c1c99dee699d', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-21 14:51:42'),
('7cc1223d-8c16-44d7-a57c-cd89cf0b6c51', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 03:38:55'),
('8748703e-b65a-4001-971c-7663616b0146', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 05:28:47'),
('8b50fe2b-594e-40a8-b060-426c4ef54deb', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-21 14:55:40'),
('8ce89ed6-54c7-4fb8-bc1e-9b1300e8af9b', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 03:20:29'),
('911b8bfa-153f-49c6-b112-d28cf586d07a', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-20 15:50:17'),
('98b2c69b-1ea7-4719-95a3-33439dfb7bd1', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 03:14:17'),
('9d207057-9661-4b76-9194-027c7a43ff45', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 03:25:44'),
('a457fdc0-6238-4bd0-9e89-46e01882be96', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 03:52:40'),
('aaa29117-d401-4e40-9512-1825f33993a0', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-20 15:56:18'),
('ada43ed0-9a31-4302-ac45-31ca2fb85d01', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 04:18:47'),
('ae2b7d2e-40e2-430e-97ce-5d13a8d2b266', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-21 03:33:13'),
('b0404b93-c501-4773-becb-171a0d2f3245', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 02:34:58'),
('bb7e5d5f-2a6b-4e13-8365-037f4248bffe', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-21 15:16:58'),
('bdad6fe4-09a9-4a0f-ab97-4a477c0c667e', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-21 14:47:01'),
('be317792-f9e4-492a-a460-e9c31e84ec54', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-20 14:35:50'),
('c0f47a73-7190-47a3-b53c-0dda8c8a4ff9', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-20 16:06:39'),
('c1668f1f-6b4e-4a08-bff5-20c4d0dae3d9', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 05:37:17'),
('c5ef31c5-51e6-4dc8-ba67-db7751b3fb86', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 05:49:48'),
('d2c91d3f-493d-4a50-a3a5-69b47513b832', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-20 15:43:29'),
('d3975455-5a8e-43ec-9433-15e8e9e43492', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 03:12:11'),
('d3b61b88-f7b2-468d-80a5-cce703fdf9e4', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-21 15:18:33'),
('dd1f2d4d-9bbf-4fe5-8d2d-815c090643b3', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 02:36:04'),
('e2e3530d-e517-4678-808a-011ffef7b655', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-20 15:40:18'),
('e7f221ab-5624-4769-88d7-0ecac23b4b91', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-20 15:51:49'),
('e9943d06-d682-4eac-aaba-26254d7fb3b1', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 04:08:30'),
('ed306601-9a46-4a08-be9e-2f9fb3b25446', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 05:54:30'),
('ef6dcfde-085e-4066-886f-f3672a57f7ea', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 06:02:24'),
('f287b5aa-c435-4c61-a896-a10ce8b11a0a', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 03:21:44'),
('f4b9c74a-4fd4-45f6-a5c8-53b718d297e5', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 05:29:49'),
('fa67a0ea-ba58-42a6-8697-bb219271dbec', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-21 06:22:14'),
('fa9753fd-90eb-4a07-b4ac-32aac752de90', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-21 13:33:17'),
('fc7b6a31-6fe1-426b-b65c-da397a3bc5bf', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 02:32:26'),
('fcfc7cd0-e232-4e74-9bd4-82918966b085', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-20 15:03:31'),
('fd3f38da-32e2-44ab-9d1d-db42ecfc3a0f', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-21 14:54:17'),
('ff2ec788-cfbe-46e1-b961-d506d24e68fb', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-06-23 03:56:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `fullname`, `role`) VALUES
('admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin'),
('user1', '202cb962ac59075b964b07152d234b70', 'Staff 1', 'staff');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`kode_buku`);

--
-- Indexes for table `buku_item`
--
ALTER TABLE `buku_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_buku`
--
ALTER TABLE `kategori_buku`
  ADD PRIMARY KEY (`kode_kategori`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku_item`
--
ALTER TABLE `buku_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
