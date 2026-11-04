-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2026 at 01:39 PM
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
-- Database: `db_ukk_2026`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_guru`
--

CREATE TABLE `t_guru` (
  `id` int(11) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `status_aktif` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_guru`
--

INSERT INTO `t_guru` (`id`, `nip`, `nama`, `email`, `status_aktif`, `user_id`, `created_at`, `updated_at`) VALUES
(51, '342897402394293523', 'Ari Sandriana', 'arisandriana@gmail.com', 1, 101, '2026-11-04 10:34:13', '2026-11-04 10:34:13'),
(52, '642382345092375355', 'Aldi Maulana', 'aldimaulana@gmail.com', 1, 102, '2026-11-04 10:35:05', '2026-11-04 10:35:05');

-- --------------------------------------------------------

--
-- Table structure for table `t_kelas`
--

CREATE TABLE `t_kelas` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `tingkat` varchar(20) NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  `status_aktif` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_kelas_siswa`
--

CREATE TABLE `t_kelas_siswa` (
  `id` int(11) NOT NULL,
  `siswa_id` int(11) DEFAULT NULL,
  `tahun_ajaran_id` int(11) DEFAULT NULL,
  `kelas_id` int(11) DEFAULT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `status_aktif` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_pelanggaran`
--

CREATE TABLE `t_pelanggaran` (
  `id` int(11) NOT NULL,
  `pelanggaran_kategori_id` int(11) DEFAULT NULL,
  `kode` varchar(30) DEFAULT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `poin` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `status_aktif` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_pelanggaran_kategori`
--

CREATE TABLE `t_pelanggaran_kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `deskripsi` text NOT NULL,
  `status_aktif` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_pelanggaran_siswa`
--

CREATE TABLE `t_pelanggaran_siswa` (
  `id` int(11) NOT NULL,
  `tahun_ajaran_id` int(11) DEFAULT NULL,
  `siswa_id` int(11) DEFAULT NULL,
  `nama_siswa` varchar(150) NOT NULL,
  `kelas_id` int(11) DEFAULT NULL,
  `nama_kelas` varchar(100) NOT NULL,
  `pelanggaran_id` int(11) DEFAULT NULL,
  `nama_pelanggaran` varchar(150) NOT NULL,
  `pelanggaran_kategori_id` int(11) DEFAULT NULL,
  `guru_id` int(11) DEFAULT NULL,
  `nama_guru` varchar(150) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `keterangan` text NOT NULL,
  `poin` int(11) NOT NULL,
  `tindakan` text NOT NULL,
  `status` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_siswa`
--

CREATE TABLE `t_siswa` (
  `id` int(11) NOT NULL,
  `nis` varchar(30) DEFAULT NULL,
  `nisn` varchar(20) NOT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` text NOT NULL,
  `status_aktif` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_siswa`
--

INSERT INTO `t_siswa` (`id`, `nis`, `nisn`, `nama`, `jenis_kelamin`, `tanggal_lahir`, `alamat`, `status_aktif`, `created_at`, `updated_at`) VALUES
(101, '7634923863', '3465869654', 'Alfin Rahadian', 'L', '2008-08-03', 'Purbaratu', 1, '2026-11-04 10:04:12', '2026-11-04 10:04:12'),
(102, '3542654748', '2352376697', 'Alisa Ramadhani', 'P', '2008-09-28', 'Jln. Bale Kota', 1, '2026-11-04 10:05:11', '2026-11-04 10:05:11'),
(103, '7834259874', '2356762398', 'Alma Aura Livia', 'P', '2008-08-26', 'Sukaraja', 1, '2026-11-04 10:06:04', '2026-11-04 10:06:04'),
(104, '3759234753', '2543476595', 'Anis Khoerunnisa Nur Ramadani', 'P', '2008-09-25', 'Purbaratu', 1, '2026-11-04 10:07:31', '2026-11-04 10:07:31'),
(105, '6423986452', '2457091093', 'Azmil Amira', 'P', '2009-10-30', 'Mangkubumi', 1, '2026-11-04 10:08:12', '2026-11-04 10:08:12'),
(106, '6523952309', '3649218476', 'Azril Akbar Fawji Abdillah', 'L', '2008-08-21', 'Kawalu', 1, '2026-11-04 10:09:07', '2026-11-04 10:09:07'),
(107, '4872304923', '7326491826', 'Erlangga Saputra Hidayat', 'L', '2008-06-06', 'Kawalu', 1, '2026-11-04 10:10:02', '2026-11-04 10:10:02'),
(108, '7698763493', '6498235723', 'Hilma Himmatunnajah', 'P', '2009-03-25', 'Kp. Suka Sukur', 1, '2026-11-04 10:10:45', '2026-11-04 10:10:45'),
(109, '8794376509', '3984209589', 'Ilma Nazya', 'P', '2009-02-16', 'Kawalu', 1, '2026-11-04 10:11:50', '2026-11-04 10:11:50'),
(110, '2325347978', '3257587567', 'Julianda Dharma Pangestu', 'L', '2008-07-02', 'Mangkubumi', 1, '2026-11-04 10:12:36', '2026-11-04 10:12:36'),
(111, '7309263593', '7632985762', 'Kayila Nur Fadilah', 'P', '2009-07-15', 'Plang', 1, '2026-11-04 10:14:18', '2026-11-04 10:14:18'),
(112, '5235473474', '2342534767', 'Moza Dina Nabillah', 'P', '2008-11-21', 'Mancagar', 1, '2026-11-04 10:15:25', '2026-11-04 10:15:25'),
(113, '4759437849', '6236347869', 'Muhammad Alfarizi', 'L', '2008-11-13', 'Kawalu', 1, '2026-11-04 10:16:41', '2026-11-04 10:16:41'),
(114, '3245632985', '3652875296', 'Muhamad Fahrin Adam', 'L', '2008-12-20', 'Sukarame', 1, '2026-11-04 10:17:48', '2026-11-04 10:17:48'),
(115, '2847623865', '9864723987', 'Muhammad Zidane Maulidan', 'L', '2006-03-30', 'Jln. Siliwangi', 1, '2026-11-04 10:19:14', '2026-11-04 10:19:14'),
(116, '3436587078', '6754768768', 'Muhammad Zulfan Nuralfansyah', 'L', '2009-01-27', 'Mangkubumi', 1, '2026-11-04 10:20:48', '2026-11-04 10:20:48'),
(117, '7645765346', '3454675876', 'Raditya Jeti Prasetya', 'L', '2009-01-09', 'Purbaratu', 1, '2026-11-04 10:21:44', '2026-11-04 10:21:44'),
(118, '2435457669', '78845321', 'Rangga Ramadiyanto Nurhakim', 'L', '2008-05-21', 'Purbaratu', 1, '2026-11-04 10:22:36', '2026-11-04 10:22:36'),
(119, '2345477686', '6794634421', 'Natiya Nur Azkiya', 'P', '2008-12-26', 'Sambongpari', 1, '2026-11-04 10:23:35', '2026-11-04 10:23:35'),
(120, '3456476658', '5673452353', 'Novita Puspitasari', 'P', '2008-11-02', 'Sambongpari', 1, '2026-11-04 10:25:37', '2026-11-04 10:25:37'),
(121, '5434645765', '7685769870', 'Nucky Andreas Febrian', 'L', '2008-02-16', 'Gunung Sabelah', 1, '2026-11-04 10:26:52', '2026-11-04 10:26:52'),
(122, '6546576586', '6745364546', 'Risqi Muhamad Ihwani', 'L', '2009-07-22', 'Mangin', 1, '2026-11-04 10:27:57', '2026-11-04 10:27:57'),
(123, '4363476587', '5474653454', 'Salwa Sabilatul Barkah', 'P', '2008-09-24', 'Jlan. Cikanyere', 1, '2026-11-04 10:28:34', '2026-11-04 10:28:34'),
(124, '4645765766', '4573453432', 'Tazkia Zahra', 'P', '2009-01-09', 'Bantarsari', 1, '2026-11-04 10:29:20', '2026-11-04 10:29:20');

-- --------------------------------------------------------

--
-- Table structure for table `t_tahun_ajaran`
--

CREATE TABLE `t_tahun_ajaran` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) DEFAULT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `status_aktif` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_users`
--

CREATE TABLE `t_users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) NOT NULL,
  `role` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_users`
--

INSERT INTO `t_users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Ahmad Ramadhan', 'user001@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'admin', '2026-07-01 01:00:00', '2026-07-01 01:00:00'),
(2, 'Budi Permana', 'user002@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'admin', '2026-07-02 01:00:00', '2026-07-02 01:00:00'),
(3, 'Citra Hidayat', 'user003@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'admin', '2026-07-03 01:00:00', '2026-07-03 01:00:00'),
(4, 'Dimas Sari', 'user004@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'admin', '2026-07-04 01:00:00', '2026-07-04 01:00:00'),
(5, 'Eka Pangestu', 'user005@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'admin', '2026-07-05 01:00:00', '2026-07-05 01:00:00'),
(6, 'Fajar Aditya', 'user006@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-06 01:00:00', '2026-07-06 01:00:00'),
(7, 'Galih Pratama', 'user007@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-07 01:00:00', '2026-07-07 01:00:00'),
(8, 'Hana Maulana', 'user008@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-08 01:00:00', '2026-07-08 01:00:00'),
(9, 'Intan Setiawan', 'user009@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-09 01:00:00', '2026-07-09 01:00:00'),
(10, 'Joko Firmansyah', 'user010@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-10 01:00:00', '2026-07-10 01:00:00'),
(11, 'Kirana Anggraini', 'user011@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-11 01:00:00', '2026-07-11 01:00:00'),
(12, 'Lukman Permatasari', 'user012@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-12 01:00:00', '2026-07-12 01:00:00'),
(13, 'Maya Rizky', 'user013@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-13 01:00:00', '2026-07-13 01:00:00'),
(14, 'Nadia Saputra', 'user014@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-14 01:00:00', '2026-07-14 01:00:00'),
(15, 'Oki Nugraha', 'user015@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-15 01:00:00', '2026-07-15 01:00:00'),
(16, 'Putri Kurniawan', 'user016@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-16 01:00:00', '2026-07-16 01:00:00'),
(17, 'Raka Lestari', 'user017@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-17 01:00:00', '2026-07-17 01:00:00'),
(18, 'Salsa Wijaya', 'user018@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-18 01:00:00', '2026-07-18 01:00:00'),
(19, 'Taufik Fauzan', 'user019@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-19 01:00:00', '2026-07-19 01:00:00'),
(20, 'Vina Nabila', 'user020@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-20 01:00:00', '2026-07-20 01:00:00'),
(21, 'Wahyu Ramadhan', 'user021@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-21 01:00:00', '2026-07-21 01:00:00'),
(22, 'Yuni Permana', 'user022@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-22 01:00:00', '2026-07-22 01:00:00'),
(23, 'Zaki Hidayat', 'user023@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-23 01:00:00', '2026-07-23 01:00:00'),
(24, 'Alya Sari', 'user024@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-24 01:00:00', '2026-07-24 01:00:00'),
(25, 'Bagas Pangestu', 'user025@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-25 01:00:00', '2026-07-25 01:00:00'),
(26, 'Cahya Aditya', 'user026@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-26 01:00:00', '2026-07-26 01:00:00'),
(27, 'Daffa Pratama', 'user027@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-27 01:00:00', '2026-07-27 01:00:00'),
(28, 'Elsa Maulana', 'user028@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-28 01:00:00', '2026-07-28 01:00:00'),
(29, 'Farhan Setiawan', 'user029@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-29 01:00:00', '2026-07-29 01:00:00'),
(30, 'Gita Firmansyah', 'user030@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'guru', '2026-07-30 01:00:00', '2026-07-30 01:00:00'),
(31, 'Ahmad Anggraini', 'user031@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-31 01:00:00', '2026-07-31 01:00:00'),
(32, 'Budi Permatasari', 'user032@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-01 01:00:00', '2026-07-01 01:00:00'),
(33, 'Citra Rizky', 'user033@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-02 01:00:00', '2026-07-02 01:00:00'),
(34, 'Dimas Saputra', 'user034@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-03 01:00:00', '2026-07-03 01:00:00'),
(35, 'Eka Nugraha', 'user035@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-04 01:00:00', '2026-07-04 01:00:00'),
(36, 'Fajar Kurniawan', 'user036@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-05 01:00:00', '2026-07-05 01:00:00'),
(37, 'Galih Lestari', 'user037@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-06 01:00:00', '2026-07-06 01:00:00'),
(38, 'Hana Wijaya', 'user038@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-07 01:00:00', '2026-07-07 01:00:00'),
(39, 'Intan Fauzan', 'user039@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-08 01:00:00', '2026-07-08 01:00:00'),
(40, 'Joko Nabila', 'user040@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-09 01:00:00', '2026-07-09 01:00:00'),
(41, 'Kirana Ramadhan', 'user041@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-10 01:00:00', '2026-07-10 01:00:00'),
(42, 'Lukman Permana', 'user042@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-11 01:00:00', '2026-07-11 01:00:00'),
(43, 'Maya Hidayat', 'user043@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-12 01:00:00', '2026-07-12 01:00:00'),
(44, 'Nadia Sari', 'user044@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-13 01:00:00', '2026-07-13 01:00:00'),
(45, 'Oki Pangestu', 'user045@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-14 01:00:00', '2026-07-14 01:00:00'),
(46, 'Putri Aditya', 'user046@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-15 01:00:00', '2026-07-15 01:00:00'),
(47, 'Raka Pratama', 'user047@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-16 01:00:00', '2026-07-16 01:00:00'),
(48, 'Salsa Maulana', 'user048@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-17 01:00:00', '2026-07-17 01:00:00'),
(49, 'Taufik Setiawan', 'user049@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-18 01:00:00', '2026-07-18 01:00:00'),
(50, 'Vina Firmansyah', 'user050@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-19 01:00:00', '2026-07-19 01:00:00'),
(51, 'Wahyu Anggraini', 'user051@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-20 01:00:00', '2026-07-20 01:00:00'),
(52, 'Yuni Permatasari', 'user052@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-21 01:00:00', '2026-07-21 01:00:00'),
(53, 'Zaki Rizky', 'user053@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-22 01:00:00', '2026-07-22 01:00:00'),
(54, 'Alya Saputra', 'user054@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-23 01:00:00', '2026-07-23 01:00:00'),
(55, 'Bagas Nugraha', 'user055@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-24 01:00:00', '2026-07-24 01:00:00'),
(56, 'Cahya Kurniawan', 'user056@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-25 01:00:00', '2026-07-25 01:00:00'),
(57, 'Daffa Lestari', 'user057@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-26 01:00:00', '2026-07-26 01:00:00'),
(58, 'Elsa Wijaya', 'user058@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-27 01:00:00', '2026-07-27 01:00:00'),
(59, 'Farhan Fauzan', 'user059@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-28 01:00:00', '2026-07-28 01:00:00'),
(60, 'Gita Nabila', 'user060@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-29 01:00:00', '2026-07-29 01:00:00'),
(61, 'Ahmad Ramadhan', 'user061@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-30 01:00:00', '2026-07-30 01:00:00'),
(62, 'Budi Permana', 'user062@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-31 01:00:00', '2026-07-31 01:00:00'),
(63, 'Citra Hidayat', 'user063@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-01 01:00:00', '2026-07-01 01:00:00'),
(64, 'Dimas Sari', 'user064@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-02 01:00:00', '2026-07-02 01:00:00'),
(65, 'Eka Pangestu', 'user065@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-03 01:00:00', '2026-07-03 01:00:00'),
(66, 'Fajar Aditya', 'user066@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-04 01:00:00', '2026-07-04 01:00:00'),
(67, 'Galih Pratama', 'user067@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-05 01:00:00', '2026-07-05 01:00:00'),
(68, 'Hana Maulana', 'user068@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-06 01:00:00', '2026-07-06 01:00:00'),
(69, 'Intan Setiawan', 'user069@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-07 01:00:00', '2026-07-07 01:00:00'),
(70, 'Joko Firmansyah', 'user070@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-08 01:00:00', '2026-07-08 01:00:00'),
(71, 'Kirana Anggraini', 'user071@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-09 01:00:00', '2026-07-09 01:00:00'),
(72, 'Lukman Permatasari', 'user072@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-10 01:00:00', '2026-07-10 01:00:00'),
(73, 'Maya Rizky', 'user073@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-11 01:00:00', '2026-07-11 01:00:00'),
(74, 'Nadia Saputra', 'user074@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-12 01:00:00', '2026-07-12 01:00:00'),
(75, 'Oki Nugraha', 'user075@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-13 01:00:00', '2026-07-13 01:00:00'),
(76, 'Putri Kurniawan', 'user076@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-14 01:00:00', '2026-07-14 01:00:00'),
(77, 'Raka Lestari', 'user077@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-15 01:00:00', '2026-07-15 01:00:00'),
(78, 'Salsa Wijaya', 'user078@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-16 01:00:00', '2026-07-16 01:00:00'),
(79, 'Taufik Fauzan', 'user079@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-17 01:00:00', '2026-07-17 01:00:00'),
(80, 'Vina Nabila', 'user080@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-18 01:00:00', '2026-07-18 01:00:00'),
(81, 'Wahyu Ramadhan', 'user081@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-19 01:00:00', '2026-07-19 01:00:00'),
(82, 'Yuni Permana', 'user082@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-20 01:00:00', '2026-07-20 01:00:00'),
(83, 'Zaki Hidayat', 'user083@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-21 01:00:00', '2026-07-21 01:00:00'),
(84, 'Alya Sari', 'user084@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-22 01:00:00', '2026-07-22 01:00:00'),
(85, 'Bagas Pangestu', 'user085@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-23 01:00:00', '2026-07-23 01:00:00'),
(86, 'Cahya Aditya', 'user086@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-24 01:00:00', '2026-07-24 01:00:00'),
(87, 'Daffa Pratama', 'user087@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-25 01:00:00', '2026-07-25 01:00:00'),
(88, 'Elsa Maulana', 'user088@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-26 01:00:00', '2026-07-26 01:00:00'),
(89, 'Farhan Setiawan', 'user089@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-27 01:00:00', '2026-07-27 01:00:00'),
(90, 'Gita Firmansyah', 'user090@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-28 01:00:00', '2026-07-28 01:00:00'),
(91, 'Ahmad Anggraini', 'user091@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-29 01:00:00', '2026-07-29 01:00:00'),
(92, 'Budi Permatasari', 'user092@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-30 01:00:00', '2026-07-30 01:00:00'),
(93, 'Citra Rizky', 'user093@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-31 01:00:00', '2026-07-31 01:00:00'),
(94, 'Dimas Saputra', 'user094@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-01 01:00:00', '2026-07-01 01:00:00'),
(95, 'Eka Nugraha', 'user095@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-02 01:00:00', '2026-07-02 01:00:00'),
(96, 'Fajar Kurniawan', 'user096@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-03 01:00:00', '2026-07-03 01:00:00'),
(97, 'Galih Lestari', 'user097@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-04 01:00:00', '2026-07-04 01:00:00'),
(98, 'Hana Wijaya', 'user098@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-05 01:00:00', '2026-07-05 01:00:00'),
(99, 'Intan Fauzan', 'user099@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-06 01:00:00', '2026-07-06 01:00:00'),
(100, 'Joko Nabila', 'user100@sekolah.test', '2026-07-01 01:00:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCk0s3ZQmQxK9v7l3M6', '', 'petugas', '2026-07-07 01:00:00', '2026-07-07 01:00:00'),
(101, 'Ari Sandriana', 'arisandriana@gmail.com', '2026-11-04 10:34:13', '$2y$10$QrvJWgDzXjGidVZ2AMo9E.Je476Wir4a5.RoK1cZcA3vcQCNf8n8C', '', 'guru', '2026-11-04 10:34:13', '2026-11-04 10:34:13'),
(102, 'Aldi Maulana', 'aldimaulana@gmail.com', '2026-11-04 10:35:05', '$2y$10$8DKgea0p4VMyUQ/mqBMbnOvdVIIlo9obVcmo3euQJABz1pPxjNq/.', '', 'guru', '2026-11-04 10:35:05', '2026-11-04 10:35:05');

-- --------------------------------------------------------

--
-- Table structure for table `t_wali_kelas`
--

CREATE TABLE `t_wali_kelas` (
  `id` int(11) NOT NULL,
  `tahun_ajaran_id` int(11) DEFAULT NULL,
  `kelas_id` int(11) DEFAULT NULL,
  `guru_id` int(11) DEFAULT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `status_aktif` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_guru`
--
ALTER TABLE `t_guru`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `t_kelas`
--
ALTER TABLE `t_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_kelas_siswa`
--
ALTER TABLE `t_kelas_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siswa_id` (`siswa_id`),
  ADD KEY `tahun_ajaran_id` (`tahun_ajaran_id`),
  ADD KEY `kelas_id` (`kelas_id`);

--
-- Indexes for table `t_pelanggaran`
--
ALTER TABLE `t_pelanggaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelanggaran_kategori_id` (`pelanggaran_kategori_id`);

--
-- Indexes for table `t_pelanggaran_kategori`
--
ALTER TABLE `t_pelanggaran_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_pelanggaran_siswa`
--
ALTER TABLE `t_pelanggaran_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tahun_ajaran_id` (`tahun_ajaran_id`),
  ADD KEY `siswa_id` (`siswa_id`),
  ADD KEY `kelas_id` (`kelas_id`),
  ADD KEY `pelanggaran_id` (`pelanggaran_id`),
  ADD KEY `pelanggaran_kategori_id` (`pelanggaran_kategori_id`),
  ADD KEY `guru_id` (`guru_id`);

--
-- Indexes for table `t_siswa`
--
ALTER TABLE `t_siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_tahun_ajaran`
--
ALTER TABLE `t_tahun_ajaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_users`
--
ALTER TABLE `t_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_wali_kelas`
--
ALTER TABLE `t_wali_kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tahun_ajaran_id` (`tahun_ajaran_id`),
  ADD KEY `kelas_id` (`kelas_id`),
  ADD KEY `guru_id` (`guru_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_guru`
--
ALTER TABLE `t_guru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `t_kelas`
--
ALTER TABLE `t_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `t_kelas_siswa`
--
ALTER TABLE `t_kelas_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `t_pelanggaran`
--
ALTER TABLE `t_pelanggaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `t_pelanggaran_kategori`
--
ALTER TABLE `t_pelanggaran_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `t_pelanggaran_siswa`
--
ALTER TABLE `t_pelanggaran_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `t_siswa`
--
ALTER TABLE `t_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `t_tahun_ajaran`
--
ALTER TABLE `t_tahun_ajaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `t_users`
--
ALTER TABLE `t_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `t_wali_kelas`
--
ALTER TABLE `t_wali_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_guru`
--
ALTER TABLE `t_guru`
  ADD CONSTRAINT `t_guru_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `t_kelas_siswa`
--
ALTER TABLE `t_kelas_siswa`
  ADD CONSTRAINT `t_kelas_siswa_ibfk_1` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `t_tahun_ajaran` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `t_kelas_siswa_ibfk_2` FOREIGN KEY (`kelas_id`) REFERENCES `t_kelas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `t_kelas_siswa_ibfk_3` FOREIGN KEY (`siswa_id`) REFERENCES `t_siswa` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `t_pelanggaran`
--
ALTER TABLE `t_pelanggaran`
  ADD CONSTRAINT `t_pelanggaran_ibfk_1` FOREIGN KEY (`pelanggaran_kategori_id`) REFERENCES `t_pelanggaran_kategori` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `t_pelanggaran_siswa`
--
ALTER TABLE `t_pelanggaran_siswa`
  ADD CONSTRAINT `t_pelanggaran_siswa_ibfk_1` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `t_tahun_ajaran` (`id`),
  ADD CONSTRAINT `t_pelanggaran_siswa_ibfk_2` FOREIGN KEY (`guru_id`) REFERENCES `t_guru` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `t_pelanggaran_siswa_ibfk_3` FOREIGN KEY (`kelas_id`) REFERENCES `t_kelas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `t_pelanggaran_siswa_ibfk_4` FOREIGN KEY (`pelanggaran_kategori_id`) REFERENCES `t_pelanggaran_kategori` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `t_pelanggaran_siswa_ibfk_5` FOREIGN KEY (`pelanggaran_id`) REFERENCES `t_pelanggaran` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `t_pelanggaran_siswa_ibfk_6` FOREIGN KEY (`siswa_id`) REFERENCES `t_siswa` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `t_wali_kelas`
--
ALTER TABLE `t_wali_kelas`
  ADD CONSTRAINT `t_wali_kelas_ibfk_1` FOREIGN KEY (`guru_id`) REFERENCES `t_guru` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `t_wali_kelas_ibfk_2` FOREIGN KEY (`kelas_id`) REFERENCES `t_kelas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `t_wali_kelas_ibfk_3` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `t_tahun_ajaran` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
