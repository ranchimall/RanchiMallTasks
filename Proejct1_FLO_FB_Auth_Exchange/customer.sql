-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 29, 2021 at 03:21 AM
-- Server version: 10.3.31-MariaDB-log
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ranchi8_exchange_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerId` int(11) NOT NULL,
  `fb_id` varchar(255) NOT NULL,
  `Username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `Name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `InsertDate` datetime DEFAULT NULL,
  `SaveDate` datetime DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerId`, `fb_id`, `Username`, `Email`, `Name`, `UpdateDate`, `InsertDate`, `SaveDate`, `is_active`) VALUES
(1, '913296835436553', 'Abhishek1512957677', 'avishkarabhishek786@gmail.com', 'Abhishek Sinha', NULL, '2017-12-11 07:31:17', '2019-02-09 15:46:31', b'1'),
(2, '1391075160942781', 'अभिषेक1512958008', 'avishkarabhishek896@gmail.com', 'अभिषेक कुमार', NULL, '2017-12-11 07:36:48', '2017-12-11 07:41:56', b'1'),
(3, '197045221041608', 'Ranchi1518179456', 'dev@ranchimall.net', 'Ranchi Mall', NULL, '2018-02-09 18:00:56', '2018-06-11 01:24:48', b'1'),
(4, '10155672288552348', 'Rohit1528658369', 'rohit.tripathy@gmail.com', 'Rohit Tripathy', NULL, '2018-06-11 00:49:29', '2018-06-11 00:49:29', b'1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerId`),
  ADD UNIQUE KEY `fb_id` (`fb_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
