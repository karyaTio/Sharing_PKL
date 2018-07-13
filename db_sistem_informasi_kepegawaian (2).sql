-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2018 at 01:46 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sistem_informasi_kepegawaian`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `sk_view`
-- (See below for the actual view)
--
CREATE TABLE `sk_view` (
`nama_sk` varchar(100)
,`peran` varchar(25)
,`tgl_awal` date
,`tgl_akhir` date
);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_absensi`
--

CREATE TABLE `tbl_absensi` (
  `id` int(11) NOT NULL,
  `nip_dosen` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `waktu_keterlambatan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_data_cuti`
--

CREATE TABLE `tbl_data_cuti` (
  `id` int(11) NOT NULL,
  `id_permohonan` int(11) DEFAULT NULL,
  `tgl_sah` date DEFAULT NULL,
  `catatan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_golongan`
--

CREATE TABLE `tbl_golongan` (
  `kd_golongan` varchar(10) NOT NULL,
  `nama_golongan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_golongan`
--

INSERT INTO `tbl_golongan` (`kd_golongan`, `nama_golongan`) VALUES
('golA', 'Golongan A yang A'),
('golB', 'Golongan B yang C'),
('golC', 'Golongan C yang S'),
('golD', 'Tidak Ada Golongan'),
('golE', 'Dosen Tidak Tetap');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jabatan_fungsional_akademik`
--

CREATE TABLE `tbl_jabatan_fungsional_akademik` (
  `id` int(11) NOT NULL,
  `nama_jabatan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_jabatan_fungsional_akademik`
--

INSERT INTO `tbl_jabatan_fungsional_akademik` (`id`, `nama_jabatan`) VALUES
(1, 'Tidak Ada'),
(2, 'Sebagai Pembimbing'),
(3, 'Sebagai Dekan'),
(4, 'Ketua Jurusan');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jabatan_struktural`
--

CREATE TABLE `tbl_jabatan_struktural` (
  `id` int(11) NOT NULL,
  `nama_jabatan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_jabatan_struktural`
--

INSERT INTO `tbl_jabatan_struktural` (`id`, `nama_jabatan`) VALUES
(1, 'Tidak Ada'),
(2, 'Struktural 2'),
(3, 'Struktural 3'),
(4, 'Struktural 1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jenis_cuti`
--

CREATE TABLE `tbl_jenis_cuti` (
  `kd_cuti` varchar(10) NOT NULL,
  `nama_cuti` varchar(255) DEFAULT NULL,
  `lama_cuti` int(11) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_jenis_cuti`
--

INSERT INTO `tbl_jenis_cuti` (`kd_cuti`, `nama_cuti`, `lama_cuti`, `keterangan`) VALUES
('kc001', 'Cuti Bersama', 20, 'Cuti Bersama'),
('kc002', 'Cuti Izin', 10, 'Cuti Izin'),
('kc003', 'Cuti Perintah', 15, 'Cuti Perintah');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pegawai`
--

CREATE TABLE `tbl_pegawai` (
  `NIP` varchar(255) NOT NULL,
  `nama_pegawai` varchar(255) DEFAULT NULL,
  `no_ktp` int(11) DEFAULT NULL,
  `no_telepon` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `jenis_kelamin` enum('Pria','Wanita') DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `status_kepegawaian` varchar(255) DEFAULT NULL,
  `kd_golongan` varchar(10) DEFAULT NULL,
  `id_pendidikan` int(11) DEFAULT NULL,
  `jab_fa` int(11) DEFAULT NULL,
  `jab_str` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pegawai`
--

INSERT INTO `tbl_pegawai` (`NIP`, `nama_pegawai`, `no_ktp`, `no_telepon`, `alamat`, `jenis_kelamin`, `tanggal_lahir`, `tempat_lahir`, `status_kepegawaian`, `kd_golongan`, `id_pendidikan`, `jab_fa`, `jab_str`) VALUES
('13541512', 'Arman', 2147483647, '1385135188541', 'Jl. Violet', 'Pria', '2018-06-11', 'Jdskafds', 'Sedang Bolos', 'golE', 5, 1, 1),
('15312360', 'Ragil Satrio', 1354863215, '156185130854', 'Jl. Mawar', 'Pria', '2018-03-12', 'Jalan Wicak Wicak', 'Aktif', 'golC', 2, 1, 1),
('15312371', 'Tio Saputra', 1515151515, '0895396914045', 'Jl. Cemara 2', 'Pria', '2018-06-13', 'Tanjung Karang', 'Sedang Cuti', 'golB', 1, 3, 2),
('15312644', 'Rizki', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('1535154', 'Riski Yulidar', 15318125, '1355815', 'Jl. Melati', 'Pria', '2018-07-09', 'Way Halim', 'Sedang Berlibur', 'golC', 4, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pendidikan`
--

CREATE TABLE `tbl_pendidikan` (
  `id` int(11) NOT NULL,
  `sd` varchar(100) DEFAULT NULL,
  `smp` varchar(100) DEFAULT NULL,
  `sma` varchar(100) DEFAULT NULL,
  `d3` varchar(100) DEFAULT NULL,
  `s1` varchar(100) DEFAULT NULL,
  `s2` varchar(100) DEFAULT NULL,
  `s3` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pendidikan`
--

INSERT INTO `tbl_pendidikan` (`id`, `sd`, `smp`, `sma`, `d3`, `s1`, `s2`, `s3`) VALUES
(1, 'SD WOW Balik Papan:tahun masuk/thaun lulus', 'Pernah Berlatih di A, Pernah Ikut Pelatihan B, Ikut Pelatihan C', '3', 'Universitas EFD', '2019', 'Teknik Informatika', NULL),
(2, 'SD Noob Gamer:1997, SMK Lumayan lah:2010', 'Berlatih sebagai feeder di game manapun', '10', 'Universitas ACD', '2015', 'Sistem Informatika', NULL),
(4, 'SD Susah Di Chat:1998, SMK Nice lah:1998', 'Pelatihan A, Pelatihan B', '40', 'Universitas Teknokrat Indonesia', '2540', 'Teknik Informatika', NULL),
(5, 'SD di mana ya:2000, SMK ACD:2010', 'Pelatihan A', '1', 'Universitas XYZ', '2003', 'Teknik Sipil', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permohonan_cuti`
--

CREATE TABLE `tbl_permohonan_cuti` (
  `id` int(11) NOT NULL,
  `tgl_pengajuan` date DEFAULT NULL,
  `tgl_mulai` date DEFAULT NULL,
  `tgl_akhir` date DEFAULT NULL,
  `alasan` varchar(255) DEFAULT NULL,
  `status_pengajuan` varchar(255) DEFAULT NULL,
  `nip_dosen` varchar(255) DEFAULT NULL,
  `kd_jenis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_permohonan_cuti`
--

INSERT INTO `tbl_permohonan_cuti` (`id`, `tgl_pengajuan`, `tgl_mulai`, `tgl_akhir`, `alasan`, `status_pengajuan`, `nip_dosen`, `kd_jenis`) VALUES
(6, '2018-09-11', '2018-07-28', '2018-09-14', 'Liburan aja', 'Pending', '15312644', 'kc002'),
(7, '2018-09-11', '2018-09-11', '2018-09-11', 'baru lahiaran', 'Pending', '15312644', 'kc001'),
(9, '2018-07-21', '2018-07-17', '2018-07-19', 'malas', 'Pending', '15312644', 'kc001');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sk`
--

CREATE TABLE `tbl_sk` (
  `id` int(11) NOT NULL,
  `nama_sk` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sk`
--

INSERT INTO `tbl_sk` (`id`, `nama_sk`) VALUES
(1, 'Pembina UKM'),
(2, 'Project Management Unit'),
(3, 'Pelaksana Kegiatan');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_skperan`
--

CREATE TABLE `tbl_skperan` (
  `id` int(11) NOT NULL,
  `id_sk` int(11) DEFAULT NULL,
  `peran` varchar(25) DEFAULT NULL,
  `point` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_skperan`
--

INSERT INTO `tbl_skperan` (`id`, `id_sk`, `peran`, `point`) VALUES
(1, 1, 'Individual', 0.4),
(2, 2, 'Ketua', 10),
(3, 2, 'Sekertaris', 9),
(4, 2, 'Anggota', 6),
(5, 2, 'Staf', 3),
(6, 3, 'Ketua', 0.3),
(7, 3, 'Sekertaris', 0.25),
(8, 3, 'Koordinator', 0.2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sk_dosen`
--

CREATE TABLE `tbl_sk_dosen` (
  `id` int(11) NOT NULL,
  `id_peran_sk` int(11) DEFAULT NULL,
  `nip_dosen` varchar(255) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `sk_fileurl` varchar(30) DEFAULT NULL,
  `tgl_awal` date DEFAULT NULL,
  `tgl_akhir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sk_dosen`
--

INSERT INTO `tbl_sk_dosen` (`id`, `id_peran_sk`, `nip_dosen`, `deskripsi`, `sk_fileurl`, `tgl_awal`, `tgl_akhir`) VALUES
(1, 2, '15312360', 'Ketua Project Management', 'file', '2018-07-02', '2018-07-12'),
(2, 1, '15312371', 'djfdksjflda', 'dsaf', '2018-07-10', '2018-07-13'),
(3, 1, '1535154', 'A', 'dfdsa', '2018-07-02', '2018-07-11'),
(4, 2, '15312371', 'hjhjk', '/juju/', '2018-07-09', '2018-07-13');

-- --------------------------------------------------------

--
-- Structure for view `sk_view`
--
DROP TABLE IF EXISTS `sk_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sk_view`  AS  (select `sk`.`nama_sk` AS `nama_sk`,`skp`.`peran` AS `peran`,`skd`.`tgl_awal` AS `tgl_awal`,`skd`.`tgl_akhir` AS `tgl_akhir` from ((`tbl_sk` `sk` join `tbl_skperan` `skp` on((`skp`.`id_sk` = `sk`.`id`))) join `tbl_sk_dosen` `skd` on((`skd`.`id_peran_sk` = `skp`.`id`))) group by `sk`.`id`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_absensi`
--
ALTER TABLE `tbl_absensi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nip_dosen` (`nip_dosen`);

--
-- Indexes for table `tbl_data_cuti`
--
ALTER TABLE `tbl_data_cuti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kd_permohonan` (`id_permohonan`);

--
-- Indexes for table `tbl_golongan`
--
ALTER TABLE `tbl_golongan`
  ADD PRIMARY KEY (`kd_golongan`);

--
-- Indexes for table `tbl_jabatan_fungsional_akademik`
--
ALTER TABLE `tbl_jabatan_fungsional_akademik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_jabatan_struktural`
--
ALTER TABLE `tbl_jabatan_struktural`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_jenis_cuti`
--
ALTER TABLE `tbl_jenis_cuti`
  ADD PRIMARY KEY (`kd_cuti`);

--
-- Indexes for table `tbl_pegawai`
--
ALTER TABLE `tbl_pegawai`
  ADD PRIMARY KEY (`NIP`),
  ADD KEY `jab_fa` (`jab_fa`),
  ADD KEY `jab_str` (`jab_str`),
  ADD KEY `id_pendidikan` (`id_pendidikan`),
  ADD KEY `kd_golongan` (`kd_golongan`);

--
-- Indexes for table `tbl_pendidikan`
--
ALTER TABLE `tbl_pendidikan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_permohonan_cuti`
--
ALTER TABLE `tbl_permohonan_cuti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nip_dosen` (`nip_dosen`),
  ADD KEY `id_jenis` (`kd_jenis`);

--
-- Indexes for table `tbl_sk`
--
ALTER TABLE `tbl_sk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_skperan`
--
ALTER TABLE `tbl_skperan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rubrik` (`id_sk`);

--
-- Indexes for table `tbl_sk_dosen`
--
ALTER TABLE `tbl_sk_dosen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nip_dosen` (`nip_dosen`),
  ADD KEY `id_peran_rubrik` (`id_peran_sk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_absensi`
--
ALTER TABLE `tbl_absensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_data_cuti`
--
ALTER TABLE `tbl_data_cuti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_jabatan_fungsional_akademik`
--
ALTER TABLE `tbl_jabatan_fungsional_akademik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_jabatan_struktural`
--
ALTER TABLE `tbl_jabatan_struktural`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_pendidikan`
--
ALTER TABLE `tbl_pendidikan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_permohonan_cuti`
--
ALTER TABLE `tbl_permohonan_cuti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_sk`
--
ALTER TABLE `tbl_sk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_skperan`
--
ALTER TABLE `tbl_skperan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_sk_dosen`
--
ALTER TABLE `tbl_sk_dosen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_absensi`
--
ALTER TABLE `tbl_absensi`
  ADD CONSTRAINT `tbl_absensi_ibfk_1` FOREIGN KEY (`id`) REFERENCES `tbl_pegawai` (`jab_fa`);

--
-- Constraints for table `tbl_data_cuti`
--
ALTER TABLE `tbl_data_cuti`
  ADD CONSTRAINT `tbl_data_cuti_ibfk_1` FOREIGN KEY (`id_permohonan`) REFERENCES `tbl_permohonan_cuti` (`id`);

--
-- Constraints for table `tbl_pegawai`
--
ALTER TABLE `tbl_pegawai`
  ADD CONSTRAINT `tbl_pegawai_ibfk_1` FOREIGN KEY (`jab_fa`) REFERENCES `tbl_jabatan_fungsional_akademik` (`id`),
  ADD CONSTRAINT `tbl_pegawai_ibfk_2` FOREIGN KEY (`jab_str`) REFERENCES `tbl_jabatan_struktural` (`id`),
  ADD CONSTRAINT `tbl_pegawai_ibfk_4` FOREIGN KEY (`id_pendidikan`) REFERENCES `tbl_pendidikan` (`id`),
  ADD CONSTRAINT `tbl_pegawai_ibfk_5` FOREIGN KEY (`kd_golongan`) REFERENCES `tbl_golongan` (`kd_golongan`);

--
-- Constraints for table `tbl_permohonan_cuti`
--
ALTER TABLE `tbl_permohonan_cuti`
  ADD CONSTRAINT `tbl_permohonan_cuti_ibfk_1` FOREIGN KEY (`nip_dosen`) REFERENCES `tbl_pegawai` (`NIP`),
  ADD CONSTRAINT `tbl_permohonan_cuti_ibfk_2` FOREIGN KEY (`kd_jenis`) REFERENCES `tbl_jenis_cuti` (`kd_cuti`);

--
-- Constraints for table `tbl_skperan`
--
ALTER TABLE `tbl_skperan`
  ADD CONSTRAINT `tbl_skperan_ibfk_1` FOREIGN KEY (`id_sk`) REFERENCES `tbl_sk` (`id`);

--
-- Constraints for table `tbl_sk_dosen`
--
ALTER TABLE `tbl_sk_dosen`
  ADD CONSTRAINT `tbl_sk_dosen_ibfk_1` FOREIGN KEY (`nip_dosen`) REFERENCES `tbl_pegawai` (`NIP`),
  ADD CONSTRAINT `tbl_sk_dosen_ibfk_2` FOREIGN KEY (`id_peran_sk`) REFERENCES `tbl_skperan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
