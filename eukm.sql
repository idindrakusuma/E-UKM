/*
SQLyog Ultimate v10.42 
MySQL - 5.6.26 : Database - db_eukm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_eukm` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_eukm`;

/*Table structure for table `anggota` */

DROP TABLE IF EXISTS `anggota`;

CREATE TABLE `anggota` (
  `nim` varchar(16) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nomor_hp` varchar(14) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL COMMENT 'alamat jalan',
  `kota` varchar(40) DEFAULT NULL,
  `status_id` varchar(40) DEFAULT NULL COMMENT 'relasi ke table status anggota',
  `divisi` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `anggota` */

insert  into `anggota`(`nim`,`nama`,`tgl_lahir`,`jenis_kelamin`,`email`,`nomor_hp`,`alamat`,`kota`,`status_id`,`divisi`) values ('A11.2011.08122','Abdul Ghofar','1995-06-15','LAKI-LAKI','ghofar@gmail.com','08912122312','Tembalang','Semarang','BTNG','Pemrograman Web'),('A11.2012.02387','Anissa Muza','1994-09-08','PEREMPUAN','anisa@gmail.com','087129127312','Semarang tengah','Semarang','Alumni','Pemrograman Dekstop'),('A11.2012.03891','Muh Rizqiawan','1993-08-13','LAKI-LAKI','rizqi@gmail.com','089234441234','Patebon','Kendal','Senior','Multimedia'),('A11.2012.076381','Yohan Niskala','1992-08-08','LAKI-LAKI','yohan@gmail.com','08912341123','Sampangan Timur 2','Semarang','Senior','Multimedia'),('A11.2013.08761','Fauzi Arianto','1995-05-11','LAKI-LAKI','fauzy@gmail.com','0891282612','Semarang Barat','Semarang','Aktif','Jaringan Komputer'),('A11.2014.08316','Indra Kusuma','1997-05-13','LAKI-LAKI','indrakusuma.udinus@gmail.com','089522248642','Pusponjolo Dalam 14','Semarang','Aktif','Pemrograman Web'),('A11.2014.08651','Riyaman','1994-09-09','LAKI-LAKI','riyaman@gmail.com','082912731221','Kendal Atas','Kendal','Pengurus','Jaringan Komputer'),('A11.2015.08923','Rizka Afif Nailufar','1997-09-19','PEREMPUAN','rizka.nailufar@gmail.com','08127336283','Gringsing','Pekalongan','BTNG','Multimedia'),('A12.2014.07261','Dita Afida','1995-06-15','PEREMPUAN','dita@gmail.com','08912712612','Boja Kendal','Kendal','Pengurus','Radio');

/*Table structure for table `divisi` */

DROP TABLE IF EXISTS `divisi`;

CREATE TABLE `divisi` (
  `divisi_id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `nama_devisi` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`divisi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `divisi` */

insert  into `divisi`(`divisi_id`,`nama_devisi`) values (0,'Multimedia'),(1,'Jaringan Komputer'),(2,'Pemrograman Dekstop'),(3,'Pemrograman Web'),(4,'Radio');

/*Table structure for table `event` */

DROP TABLE IF EXISTS `event`;

CREATE TABLE `event` (
  `kode_ev` tinyint(3) NOT NULL AUTO_INCREMENT,
  `nama_ev` varchar(40) DEFAULT NULL,
  `jenis_ev` varchar(20) DEFAULT NULL,
  `lokasi_ev` varchar(100) DEFAULT NULL,
  `peserta_ev` varchar(30) DEFAULT NULL,
  `tanggal_ev` date DEFAULT NULL,
  PRIMARY KEY (`kode_ev`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `event` */

insert  into `event`(`kode_ev`,`nama_ev`,`jenis_ev`,`lokasi_ev`,`peserta_ev`,`tanggal_ev`) values (2,'DINACOM 2017','Kondisional','Aula gedung E, UDINUS','UMUM','2017-01-28'),(4,'BNTG','RKT','udinus','MAHASISWA','2016-06-09'),(5,'AFG 2016','RKT','Boja','MAHASISWA','2016-09-10');

/*Table structure for table `inventori` */

DROP TABLE IF EXISTS `inventori`;

CREATE TABLE `inventori` (
  `inventori_id` varchar(5) NOT NULL,
  `merek` varchar(20) DEFAULT NULL,
  `nama_inv` varchar(20) DEFAULT NULL,
  `kondisi` varchar(20) DEFAULT NULL,
  `tahun_pembelian` varchar(4) DEFAULT NULL,
  `penempatan_id` varchar(5) DEFAULT NULL,
  `stok` tinyint(3) DEFAULT NULL,
  `satuan` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`inventori_id`),
  KEY `penempatan_id` (`penempatan_id`),
  CONSTRAINT `inventori_ibfk_1` FOREIGN KEY (`penempatan_id`) REFERENCES `penempatan` (`penempatan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `inventori` */

insert  into `inventori`(`inventori_id`,`merek`,`nama_inv`,`kondisi`,`tahun_pembelian`,`penempatan_id`,`stok`,`satuan`) values ('CPU14','Power Logic','CPU Komputer','BEKAS','2014','R1',3,'BUAH'),('DVD','GTPro','DVD','BARU','2014','LO3',33,'BUAH'),('JMIK1','Mikrotik','Router','BARU','2015','LO3',1,'BUAH'),('KUN11','Sinar Dunia','Buku Undangan','BARU','2015','LO1',1,'LUSIN'),('MOU14','Logitech','Mouse Komputer','BEKAS','2014','R1',3,'BUAH'),('MTRLC','LG','Monitor LCD','BEKAS','2014','R1',1,'BUAH'),('TCRIM','AMP2','Tang Crimping','BEKAS','2014','LO3',1,'BUAH');

/*Table structure for table `penempatan` */

DROP TABLE IF EXISTS `penempatan`;

CREATE TABLE `penempatan` (
  `penempatan_id` varchar(4) NOT NULL,
  `keterangan` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`penempatan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `penempatan` */

insert  into `penempatan`(`penempatan_id`,`keterangan`) values ('LM11','Lemari Meja atas'),('LM12','Lemari atas 2'),('LM13','Lemari meja atas 3'),('LM21','Lemari bawah 1'),('LM22','Lemari Meja bawah 2'),('LM23','Lemari bawah Tiga'),('LO1','Loker 1'),('LO2','Loker 2'),('LO3','Loker 3'),('R1','Rak 1'),('R2','Rak 2');

/*Table structure for table `pinjam` */

DROP TABLE IF EXISTS `pinjam`;

CREATE TABLE `pinjam` (
  `pinjam_id` int(4) NOT NULL AUTO_INCREMENT,
  `inventori_id` varchar(5) DEFAULT NULL,
  `nama_pem` varchar(40) DEFAULT NULL,
  `instansi_pem` varchar(40) DEFAULT NULL,
  `no_hp` varchar(14) DEFAULT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `status_pin` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`pinjam_id`),
  KEY `inventori_id` (`inventori_id`),
  CONSTRAINT `pinjam_ibfk_1` FOREIGN KEY (`inventori_id`) REFERENCES `inventori` (`inventori_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `pinjam` */

insert  into `pinjam`(`pinjam_id`,`inventori_id`,`nama_pem`,`instansi_pem`,`no_hp`,`tgl_pinjam`,`tgl_kembali`,`status_pin`) values (2,'CPU14','Indra Kusuma','DNCC','087512221','2016-06-08','2016-06-08','0'),(3,'DVD','Abdul Ghofar','Career Center','089827231','2016-06-09','2016-06-09','1'),(5,'MOU14','Dani','DNCC','098765654','2016-06-08','2016-06-08','1'),(6,'DVD','indra','DNCC','1223444','2016-06-10','2016-06-10','0'),(7,'DVD','indra2','DNCC','1223444','2016-06-10','2016-06-10','0'),(8,'DVD','indra3','DNCC','1223444','2016-06-10','2016-06-10','0'),(9,'DVD','Dewi','Career center','02949121','2016-06-15','2016-06-15','1');

/*Table structure for table `status` */

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `status_id` int(3) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `status` */

insert  into `status`(`status_id`,`jenis`) values (1,'BTNG'),(2,'Aktif'),(3,'Pengurus'),(4,'Senior'),(5,'Pengurus');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `level` enum('admin','operator') NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`user_id`,`username`,`password`,`nama_lengkap`,`level`) values (1,'indrakusuma','36188ecdc431470c69ece61e925c158a','Indra Kusuma','admin'),(2,'indra','e24f6e3ce19ee0728ff1c443e4ff488d','indra','admin');

/*Table structure for table `v_alumni` */

DROP TABLE IF EXISTS `v_alumni`;

/*!50001 DROP VIEW IF EXISTS `v_alumni` */;
/*!50001 DROP TABLE IF EXISTS `v_alumni` */;

/*!50001 CREATE TABLE  `v_alumni`(
 `nim` varchar(16) ,
 `nama` varchar(100) ,
 `nomor_hp` varchar(14) ,
 `kota` varchar(40) ,
 `status_id` varchar(40) 
)*/;

/*Table structure for table `v_inventori` */

DROP TABLE IF EXISTS `v_inventori`;

/*!50001 DROP VIEW IF EXISTS `v_inventori` */;
/*!50001 DROP TABLE IF EXISTS `v_inventori` */;

/*!50001 CREATE TABLE  `v_inventori`(
 `inventori_id` varchar(5) ,
 `merek` varchar(20) ,
 `nama_inv` varchar(20) ,
 `kondisi` varchar(20) ,
 `tahun_pembelian` varchar(4) ,
 `stok` tinyint(3) ,
 `satuan` varchar(10) ,
 `keterangan` varchar(80) 
)*/;

/*Table structure for table `v_pengurus` */

DROP TABLE IF EXISTS `v_pengurus`;

/*!50001 DROP VIEW IF EXISTS `v_pengurus` */;
/*!50001 DROP TABLE IF EXISTS `v_pengurus` */;

/*!50001 CREATE TABLE  `v_pengurus`(
 `nim` varchar(16) ,
 `nama` varchar(100) ,
 `divisi` varchar(40) ,
 `nomor_hp` varchar(14) ,
 `status_id` varchar(40) ,
 `kota` varchar(40) 
)*/;

/*View structure for view v_alumni */

/*!50001 DROP TABLE IF EXISTS `v_alumni` */;
/*!50001 DROP VIEW IF EXISTS `v_alumni` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_alumni` AS (select `anggota`.`nim` AS `nim`,`anggota`.`nama` AS `nama`,`anggota`.`nomor_hp` AS `nomor_hp`,`anggota`.`kota` AS `kota`,`anggota`.`status_id` AS `status_id` from `anggota` where ((`anggota`.`status_id` = 'Senior') or (`anggota`.`status_id` = 'Alumni'))) */;

/*View structure for view v_inventori */

/*!50001 DROP TABLE IF EXISTS `v_inventori` */;
/*!50001 DROP VIEW IF EXISTS `v_inventori` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_inventori` AS (select `inventori`.`inventori_id` AS `inventori_id`,`inventori`.`merek` AS `merek`,`inventori`.`nama_inv` AS `nama_inv`,`inventori`.`kondisi` AS `kondisi`,`inventori`.`tahun_pembelian` AS `tahun_pembelian`,`inventori`.`stok` AS `stok`,`inventori`.`satuan` AS `satuan`,`penempatan`.`keterangan` AS `keterangan` from (`inventori` join `penempatan`) where (`inventori`.`penempatan_id` = `penempatan`.`penempatan_id`)) */;

/*View structure for view v_pengurus */

/*!50001 DROP TABLE IF EXISTS `v_pengurus` */;
/*!50001 DROP VIEW IF EXISTS `v_pengurus` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pengurus` AS (select `anggota`.`nim` AS `nim`,`anggota`.`nama` AS `nama`,`anggota`.`divisi` AS `divisi`,`anggota`.`nomor_hp` AS `nomor_hp`,`anggota`.`status_id` AS `status_id`,`anggota`.`kota` AS `kota` from `anggota` where ((`anggota`.`status_id` = 'Aktif') or (`anggota`.`status_id` = 'Pengurus'))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
