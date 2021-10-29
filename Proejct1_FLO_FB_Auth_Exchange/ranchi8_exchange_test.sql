-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 29, 2021 at 03:22 AM
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
-- Table structure for table `active_buy_list`
--

CREATE TABLE `active_buy_list` (
  `price` decimal(36,2) NOT NULL,
  `orderId` int(11) NOT NULL,
  `quantity` decimal(36,10) NOT NULL,
  `customerId` int(11) NOT NULL,
  `insertDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `active_buy_list`
--

INSERT INTO `active_buy_list` (`price`, `orderId`, `quantity`, `customerId`, `insertDate`) VALUES
(3.00, 1, 0.9899989989, 2, '2018-02-05 13:53:50'),
(2.99, 3, 10.2435446630, 2, '2017-12-11 08:42:28');

-- --------------------------------------------------------

--
-- Table structure for table `active_selling_list`
--

CREATE TABLE `active_selling_list` (
  `price` decimal(36,2) NOT NULL,
  `orderId` int(11) NOT NULL,
  `quantity` decimal(36,10) NOT NULL,
  `customerId` int(11) NOT NULL,
  `insertDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assetbalance`
--

CREATE TABLE `assetbalance` (
  `sr_no` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `AssetTypeId` enum('btc','traditional') NOT NULL,
  `Balance` decimal(36,10) NOT NULL,
  `FrozenBalance` decimal(36,10) NOT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `InsertDate` datetime DEFAULT NULL,
  `SaveDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assetbalance`
--

INSERT INTO `assetbalance` (`sr_no`, `CustomerId`, `AssetTypeId`, `Balance`, `FrozenBalance`, `UpdateDate`, `InsertDate`, `SaveDate`) VALUES
(1, 1, 'btc', 1.1195667999, 0.0000000000, '2018-06-09 13:56:26', '2017-12-11 07:31:17', '2017-12-11 07:31:17'),
(2, 1, 'traditional', 103.4887908970, 0.0000000000, '2018-02-05 13:53:50', '2017-12-11 07:31:17', '2017-12-11 07:31:17'),
(3, 2, 'btc', 10.4500000001, 0.0000000000, '2018-02-05 13:53:50', '2017-12-11 07:36:48', '2017-12-11 07:36:48'),
(4, 2, 'traditional', 97.4199970000, 0.0000000000, '2018-02-05 13:53:50', '2017-12-11 07:36:48', '2017-12-11 07:36:48'),
(5, 3, 'btc', 2.0050000000, 0.0000000000, '2018-02-09 18:03:26', '2018-02-09 18:00:56', '2018-02-09 18:00:56'),
(6, 3, 'traditional', 0.0000000000, 0.0000000000, NULL, '2018-02-09 18:00:56', '2018-02-09 18:00:56'),
(7, 4, 'btc', 100.0000000000, 0.0000000000, '2018-06-11 01:23:58', '2018-06-11 00:49:29', '2018-06-11 00:49:29'),
(8, 4, 'traditional', 100000.0000000000, 0.0000000000, '2018-06-11 01:24:47', '2018-06-11 00:49:29', '2018-06-11 00:49:29');

-- --------------------------------------------------------

--
-- Table structure for table `bal_history`
--

CREATE TABLE `bal_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `balance` decimal(36,10) NOT NULL,
  `AssetType` varchar(30) NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bal_history`
--

INSERT INTO `bal_history` (`id`, `user_id`, `balance`, `AssetType`, `datetime`) VALUES
(1, 1, 10.2345678800, 'btc', '2017-12-11 07:37:28'),
(2, 1, 100.4587878970, 'traditional', '2017-12-11 07:37:51'),
(3, 2, 10.2435436630, 'btc', '2017-12-11 07:41:27'),
(4, 2, 100.4500000000, 'traditional', '2017-12-11 07:41:44'),
(5, 2, 10.2435446630, 'btc', '2017-12-11 08:35:27'),
(6, 1, 100.4587908970, 'traditional', '2017-12-11 08:35:27'),
(7, 1, 10.2345668800, 'btc', '2017-12-11 08:35:27'),
(8, 2, 100.4499970000, 'traditional', '2017-12-11 08:35:27'),
(9, 2, 11.2535446630, 'btc', '2017-12-11 08:53:25'),
(10, 1, 103.4887908970, 'traditional', '2017-12-11 08:53:25'),
(11, 1, 9.2245668800, 'btc', '2017-12-11 08:53:25'),
(12, 2, 97.4199970000, 'traditional', '2017-12-11 08:53:25'),
(13, 2, 100.0000000000, 'btc', '2017-12-11 09:36:45'),
(14, 2, 25.1234567900, 'btc', '2017-12-11 09:38:09'),
(15, 2, 54.2123212321, 'btc', '2017-12-11 09:41:27'),
(16, 2, 10.4500000000, 'btc', '2017-12-11 09:42:19'),
(17, 1, 9.2245668100, 'btc', '2018-01-29 17:48:57'),
(18, 1, 9.1245668100, 'btc', '2018-01-29 17:53:15'),
(19, 1, 9.1245668000, 'btc', '2018-01-29 17:55:41'),
(20, 2, 10.4500000001, 'btc', '2018-02-05 13:53:50'),
(21, 1, 103.4887908970, 'traditional', '2018-02-05 13:53:50'),
(22, 1, 9.1245667999, 'btc', '2018-02-05 13:53:50'),
(23, 2, 97.4199970000, 'traditional', '2018-02-05 13:53:50'),
(24, 1, 7.1195667999, 'btc', '2018-02-09 18:03:26'),
(25, 3, 2.0050000000, 'btc', '2018-02-09 18:03:26'),
(26, 1, 7.1195667999, 'btc', '2018-06-04 21:02:14'),
(27, 1, 7.1195667999, 'btc', '2018-06-04 21:02:44'),
(28, 1, 7.0195667999, 'btc', '2018-06-04 21:23:16'),
(29, 1, 6.9195667999, 'btc', '2018-06-04 21:24:52'),
(30, 1, 6.9095667999, 'btc', '2018-06-04 21:26:24'),
(31, 1, 6.8995667999, 'btc', '2018-06-04 21:28:39'),
(32, 1, 6.8895667999, 'btc', '2018-06-04 22:16:05'),
(33, 1, 6.0095667999, 'btc', '2018-06-09 12:22:16'),
(34, 1, 5.1295667999, 'btc', '2018-06-09 13:25:33'),
(35, 1, 4.2495667999, 'btc', '2018-06-09 13:29:19'),
(36, 1, 3.3695667999, 'btc', '2018-06-09 13:31:59'),
(37, 1, 2.3695667999, 'btc', '2018-06-09 13:44:29'),
(38, 1, 2.2695667999, 'btc', '2018-06-09 13:45:43'),
(39, 1, 2.1195667999, 'btc', '2018-06-09 13:51:15'),
(40, 1, 1.1195667999, 'btc', '2018-06-09 13:56:26'),
(41, 4, 100.0000000000, 'btc', '2018-06-11 01:23:58'),
(42, 4, 11.0000000000, 'traditional', '2018-06-11 01:24:14'),
(43, 4, 100000.0000000000, 'traditional', '2018-06-11 01:24:47');

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `acc_holder` varchar(256) NOT NULL,
  `bank_name` varchar(256) NOT NULL,
  `acc_num` varchar(256) NOT NULL,
  `branch_name` varchar(256) NOT NULL,
  `bank_addr` text NOT NULL,
  `bank_ctry` varchar(256) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Table structure for table `fund_transfer`
--

CREATE TABLE `fund_transfer` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fund_type` varchar(256) NOT NULL,
  `tr_from` varchar(256) NOT NULL,
  `tr_to` varchar(256) NOT NULL,
  `fund_amount` decimal(36,10) NOT NULL,
  `remarks` text DEFAULT NULL,
  `datetime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fund_transfer`
--

INSERT INTO `fund_transfer` (`id`, `user_id`, `fund_type`, `tr_from`, `tr_to`, `fund_amount`, `remarks`, `datetime`) VALUES
(1, 1, 'E2W', 'Exchange', 'FHxmaXYSGdrqj3mWrTWFcKFruKMVG78tSs', 0.0000000700, 'Please ignore this mail', '2018-01-29 17:48:57'),
(2, 1, 'E2W', 'Exchange', 'FHxmaXYSGdrqj3mWrTWFcKFruKMVG78tSs', 0.1000000000, 'Please ignore this mail 1', '2018-01-29 17:53:15'),
(3, 1, 'E2W', 'Exchange', 'FHxmaXYSGdrqj3mWrTWFcKFruKMVG78tSs', 0.0000000100, 'Please ignore this mail 2', '2018-01-29 17:55:41');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `username_key` int(11) DEFAULT NULL,
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `messages` text DEFAULT NULL,
  `datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `order_id`, `username_key`, `username`, `messages`, `datetime`) VALUES
(1, 1, 2, 'अभिषेक1512958008', 'You entered a buy order for 1.999999999 token at $ 2.999999999 per token for $ 5.999999995', '2017-12-11 07:42:37'),
(2, 2, 1, 'Abhishek1512957677', 'You entered a sell order for 1.0E-6 token at $ 3 per token for $ 3.0E-6', '2017-12-11 08:35:27'),
(3, 1, 2, 'अभिषेक1512958008', 'Transaction successful: You bought 1.0E-6 RMT for $ 3.0E-6 at the rate of $ 3.00 per token.', '2017-12-11 08:35:27'),
(4, 2, 1, 'Abhishek1512957677', 'Transaction successful: You sold 1.0E-6 RMT for $ 3.0E-6 at the rate of $ 3.00 per token.', '2017-12-11 08:35:27'),
(5, 3, 2, 'अभिषेक1512958008', 'You entered a buy order for 10.243544663 token at $ 2.99 per token for $ 30.6281985424', '2017-12-11 08:42:28'),
(6, 4, 1, 'Abhishek1512957677', 'You entered a sell order for 1.01 token at $ 3 per token for $ 3.03', '2017-12-11 08:53:25'),
(7, 1, 2, 'अभिषेक1512958008', 'Transaction successful: You bought 1.01 RMT for $ 3.03 at the rate of $ 3.00 per token.', '2017-12-11 08:53:25'),
(8, 4, 1, 'Abhishek1512957677', 'Transaction successful: You sold 1.01 RMT for $ 3.03 at the rate of $ 3.00 per token.', '2017-12-11 08:53:25'),
(9, 5, 1, 'Abhishek1512957677', 'You entered a sell order for 1.01 token at $ 4.234 per token for $ 4.27634', '2017-12-11 08:54:10'),
(10, 6, 1, 'Abhishek1512957677', 'You entered a buy order for 2 token at $ 2 per token for $ 4', '2017-12-11 10:52:54'),
(11, 7, 1, 'Abhishek1512957677', 'You entered a buy order for 2 token at $ 2 per token for $ 4', '2017-12-11 10:53:23'),
(12, 5, 1, '', 'Order number 5 was deleted by user id 1', '2017-12-11 10:53:34'),
(13, 5, 1, 'Abhishek1512957677', 'Order number 5 was deleted by Admin.', '2017-12-11 10:53:34'),
(14, 6, 1, '', 'Order number 6 was deleted by user id 1', '2017-12-11 10:53:35'),
(15, 6, 1, 'Abhishek1512957677', 'Order number 6 was deleted by Admin.', '2017-12-11 10:53:35'),
(16, 7, 1, '', 'Order number 7 was deleted by user id 1', '2017-12-11 10:53:36'),
(17, 7, 1, 'Abhishek1512957677', 'Order number 7 was deleted by Admin.', '2017-12-11 10:53:36'),
(18, 8, 1, 'Abhishek1512957677', 'You entered a buy order for 1.999999 token at $ 1.99 per token for $ 3.97999801', '2017-12-11 10:55:47'),
(19, 9, 1, 'Abhishek1512957677', 'You entered a buy order for 20.9999999999 token at $ 1.99 per token for $ 41.7899999998', '2017-12-11 10:56:17'),
(20, 8, 1, '', 'Order number 8 was deleted by user id 1', '2017-12-12 05:26:39'),
(21, 8, 1, 'Abhishek1512957677', 'Order number 8 was deleted by Admin.', '2017-12-12 05:26:39'),
(22, 9, 1, '', 'Order number 9 was deleted by user id 1', '2017-12-12 05:26:40'),
(23, 9, 1, 'Abhishek1512957677', 'Order number 9 was deleted by Admin.', '2017-12-12 05:26:40'),
(24, NULL, 1, 'Abhishek1512957677', 'E2BTC error: Invalid Bitcoin address!', '2018-01-29 17:46:24'),
(25, NULL, 1, 'Abhishek1512957677', 'E2W error: Only alphanumeric characters are allowed in remarks!', '2018-01-29 17:48:42'),
(26, NULL, 1, 'Abhishek1512957677', 'You have requested to transfer RTM 7.0E-8 to account FHxmaXYSGdrqj3mWrTWFcKFruKMVG78tSs.', '2018-01-29 17:48:57'),
(27, NULL, 1, 'Abhishek1512957677', 'E2W Transaction Success: Your request has been recorded and will be processed very soon by our team.', '2018-01-29 17:48:57'),
(28, NULL, 1, 'Abhishek1512957677', 'You have requested to transfer RTM 0.1 to account FHxmaXYSGdrqj3mWrTWFcKFruKMVG78tSs.', '2018-01-29 17:53:15'),
(29, NULL, 1, 'Abhishek1512957677', 'E2W Transaction Success: Your request has been recorded and will be processed very soon by our team.', '2018-01-29 17:53:15'),
(30, NULL, 1, 'Abhishek1512957677', 'You have requested to transfer RTM 1.0E-8 to account FHxmaXYSGdrqj3mWrTWFcKFruKMVG78tSs.', '2018-01-29 17:55:41'),
(31, NULL, 1, 'Abhishek1512957677', 'E2W Transaction Success: Your request has been recorded and will be processed very soon by our team.', '2018-01-29 17:55:41'),
(32, 10, 1, 'Abhishek1512957677', 'You entered a sell order for 1.0E-10 token at $ 0.1 per token for $ 1.0E-11', '2018-02-05 13:53:48'),
(33, 1, 2, 'अभिषेक1512958008', 'Transaction successful: You bought 1.0E-10 RMT for $ 1.0E-11 at the rate of $ 0.10 per token.', '2018-02-05 13:53:50'),
(34, 10, 1, 'Abhishek1512957677', 'Transaction successful: You sold 1.0E-10 RMT for $ 1.0E-11 at the rate of $ 0.10 per token.', '2018-02-05 13:53:50'),
(35, NULL, 3, 'Ranchi1518179456', 'RMT transfer for user id 1 and 3 was processed successfully.', '2018-02-09 18:03:26'),
(36, NULL, 1, 'Abhishek1512957677', 'Your 2.0050000000 RMTs were transferred by Admin to user 3.', '2018-02-09 18:03:26'),
(37, NULL, 3, 'Ranchi1518179456', 'You received 2.0050000000 RMTs from user 1 transferred by Admin.', '2018-02-09 18:03:26'),
(38, NULL, 1, 'Abhishek1512957677', 'Array', '2018-06-04 20:59:33'),
(39, NULL, 1, 'Abhishek1512957677', 'Array', '2018-06-04 21:00:40'),
(40, NULL, 3, 'Ranchi1518179456', 'RMT2BCX Warning: Failed to transfer RMT to BC Exchange. User id: 1', '2018-06-04 21:02:17'),
(41, NULL, 1, 'Abhishek1512957677', 'RMT2BCX Warning: Failed to transfer RMT to BC Exchange. User id: 1', '2018-06-04 21:02:17'),
(42, NULL, 3, 'Ranchi1518179456', 'RMT2BCX Warning: Failed to transfer RMT to BC Exchange. User id: 1', '2018-06-04 21:02:47'),
(43, NULL, 1, 'Abhishek1512957677', 'RMT2BCX Warning: Failed to transfer RMT to BC Exchange. User id: 1', '2018-06-04 21:02:47'),
(44, NULL, 1, 'Abhishek1512957677', 'Array Balance: 7.1195667999.', '2018-06-04 21:21:04'),
(45, NULL, 3, 'Ranchi1518179456', 'RMT2BCX Warning: Failed to transfer RMT to BC Exchange. User id: 1', '2018-06-04 21:21:34'),
(46, NULL, 1, 'Abhishek1512957677', 'RMT2BCX Warning: Failed to transfer RMT to BC Exchange. User id: 1', '2018-06-04 21:21:34'),
(47, NULL, 3, 'Ranchi1518179456', 'RMT2BCX Warning: Failed to transfer RMT to BC Exchange. User id: 1', '2018-06-04 21:23:20'),
(48, NULL, 1, 'Abhishek1512957677', 'RMT2BCX Warning: Failed to transfer RMT to BC Exchange. User id: 1', '2018-06-04 21:23:20'),
(49, NULL, 3, 'Ranchi1518179456', 'RMT2BCX Warning: Failed to transfer RMT to BC Exchange. User id: 1', '2018-06-04 21:24:55'),
(50, NULL, 1, 'Abhishek1512957677', 'RMT2BCX Warning: Failed to transfer RMT to BC Exchange. User id: 1', '2018-06-04 21:24:55'),
(51, NULL, 3, 'Ranchi1518179456', 'RMT2BCX Warning: Failed to transfer RMT to BC Exchange. User id: ', '2018-06-04 21:26:27'),
(52, NULL, 1, 'Abhishek1512957677', 'RMT2BCX Warning: Failed to transfer RMT to BC Exchange. User id: ', '2018-06-04 21:26:27'),
(53, NULL, 3, 'Ranchi1518179456', 'RMT2BCX Warning: Failed to transfer RMT to BC Exchange. User id: 1', '2018-06-04 22:16:08'),
(54, NULL, 1, 'Abhishek1512957677', 'RMT2BCX Warning: Failed to transfer RMT to BC Exchange. User id: 1', '2018-06-04 22:16:08'),
(55, NULL, 1, 'Abhishek1512957677', 'Array Balance: 6.8895667999.', '2018-06-09 11:48:16'),
(56, NULL, 1, 'Abhishek1512957677', 'Array Balance: 6.8895667999.', '2018-06-09 12:19:05'),
(57, NULL, 1, 'Abhishek1512957677', 'Array Balance: 6.8895667999.', '2018-06-09 12:21:49'),
(58, NULL, 3, 'Ranchi1518179456', 'RMT2BCX FATAL ERROR: Failed to transfer RMT to BC Exchange. User id: 1. Report admin as soon as possible.', '2018-06-09 12:22:19'),
(59, NULL, 1, 'Abhishek1512957677', 'RMT2BCX FATAL ERROR: Failed to transfer RMT to BC Exchange. User id: 1. Report admin as soon as possible.', '2018-06-09 12:22:19'),
(60, NULL, 3, 'Ranchi1518179456', 'RMT2BCX FATAL ERROR: Failed to transfer RMT to BC Exchange. User id: 1. Report admin as soon as possible.', '2018-06-09 13:25:36'),
(61, NULL, 1, 'Abhishek1512957677', 'RMT2BCX FATAL ERROR: Failed to transfer RMT to BC Exchange. User id: 1. Report admin as soon as possible.', '2018-06-09 13:25:36'),
(62, NULL, 3, 'Ranchi1518179456', 'RMT2BCX FATAL ERROR: Failed to transfer RMT to BC Exchange. User id: 1. Report admin as soon as possible.', '2018-06-09 13:29:22'),
(63, NULL, 1, 'Abhishek1512957677', 'RMT2BCX FATAL ERROR: Failed to transfer RMT to BC Exchange. User id: 1. Report admin as soon as possible.', '2018-06-09 13:29:22'),
(64, NULL, 1, 'Abhishek1512957677', '0.88 RMTs transfer from RMT Exchange to BC Exchange was processed successfully. Your new balance is RMT 3.3695667999', '2018-06-09 13:32:02'),
(65, NULL, 1, 'Abhishek1512957677', '1 RMTs transfer from RMT Exchange to BC Exchange was processed successfully. Your new balance is RMT 2.3695667999', '2018-06-09 13:44:32'),
(66, NULL, 1, 'Abhishek1512957677', 'Array Balance: 2.3695667999.', '2018-06-09 13:44:46'),
(67, NULL, 1, 'Abhishek1512957677', '0.1 RMTs transfer from RMT Exchange to BC Exchange was processed successfully. Your new balance is RMT 2.2695667999', '2018-06-09 13:45:47'),
(68, NULL, 1, 'Abhishek1512957677', '0.15 RMTs transfer from RMT Exchange to BC Exchange was processed successfully. Your new balance is RMT 2.1195667999', '2018-06-09 13:51:18'),
(69, NULL, 1, 'Abhishek1512957677', '1 RMTs transfer from RMT Exchange to BC Exchange was processed successfully. Your new balance is RMT 1.1195667999', '2018-06-09 13:56:30'),
(70, NULL, 1, 'Abhishek1512957677', 'Array Balance: 1.1195667999.', '2018-06-09 13:56:57');

-- --------------------------------------------------------

--
-- Table structure for table `orderbook`
--

CREATE TABLE `orderbook` (
  `OrderId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `OrderTypeId` tinyint(1) UNSIGNED NOT NULL,
  `OfferAssetTypeId` varchar(11) DEFAULT NULL,
  `WantAssetTypeId` varchar(11) DEFAULT NULL,
  `Quantity` decimal(36,10) NOT NULL,
  `Price` decimal(36,2) NOT NULL,
  `OrderStatusId` tinyint(1) UNSIGNED NOT NULL,
  `OriginalOrderId` int(11) DEFAULT NULL,
  `MarketOrder` bit(1) DEFAULT NULL,
  `ExpirationDate` datetime DEFAULT NULL,
  `TakeProfitOrderId` int(11) DEFAULT NULL,
  `StopLossOrderId` int(11) DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `InsertDate` datetime DEFAULT NULL,
  `SaveDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderbook`
--

INSERT INTO `orderbook` (`OrderId`, `CustomerId`, `OrderTypeId`, `OfferAssetTypeId`, `WantAssetTypeId`, `Quantity`, `Price`, `OrderStatusId`, `OriginalOrderId`, `MarketOrder`, `ExpirationDate`, `TakeProfitOrderId`, `StopLossOrderId`, `UpdateDate`, `InsertDate`, `SaveDate`) VALUES
(1, 2, 0, 'USD', 'RMT', 1.9999999990, 3.00, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2017-12-11 07:42:37', NULL),
(2, 1, 1, 'RMT', 'USD', 0.0000010000, 3.00, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2017-12-11 08:35:27', NULL),
(3, 2, 0, 'USD', 'RMT', 10.2435446630, 2.99, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2017-12-11 08:42:28', NULL),
(4, 1, 1, 'RMT', 'USD', 1.0100000000, 3.00, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2017-12-11 08:53:25', NULL),
(5, 1, 1, 'RMT', 'USD', 1.0100000000, 4.23, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2017-12-11 08:54:10', NULL),
(6, 1, 0, 'USD', 'RMT', 2.0000000000, 2.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2017-12-11 10:52:54', NULL),
(7, 1, 0, 'USD', 'RMT', 2.0000000000, 2.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2017-12-11 10:53:23', NULL),
(8, 1, 0, 'USD', 'RMT', 1.9999990000, 1.99, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2017-12-11 10:55:47', NULL),
(9, 1, 0, 'USD', 'RMT', 20.9999999999, 1.99, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2017-12-11 10:56:17', NULL),
(10, 1, 1, 'RMT', 'USD', 0.0000000001, 0.10, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2018-02-05 13:53:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `root_bal_updates`
--

CREATE TABLE `root_bal_updates` (
  `BalStatusHistoryId` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bal_prev` decimal(36,10) NOT NULL,
  `bal_now` decimal(36,10) NOT NULL,
  `type` varchar(30) NOT NULL,
  `root_id` int(11) NOT NULL,
  `UpdateDate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `root_bal_updates`
--

INSERT INTO `root_bal_updates` (`BalStatusHistoryId`, `user_id`, `bal_prev`, `bal_now`, `type`, `root_id`, `UpdateDate`) VALUES
(1, 1, 0.0000000000, 10.2345678800, 'btc', 1, '2017-12-11 07:37:28'),
(2, 1, 0.0000000000, 100.4587878970, 'traditional', 1, '2017-12-11 07:37:51'),
(3, 2, 0.0000000000, 10.2435436630, 'btc', 1, '2017-12-11 07:41:27'),
(4, 2, 0.0000000000, 100.4500000000, 'traditional', 1, '2017-12-11 07:41:44'),
(5, 2, 11.2535446630, 100.0000000000, 'btc', 1, '2017-12-11 09:36:45'),
(6, 2, 100.0000000000, 25.1234567900, 'btc', 1, '2017-12-11 09:38:09'),
(7, 2, 25.1234567900, 54.2123212321, 'btc', 1, '2017-12-11 09:41:27'),
(8, 2, 54.2123212321, 10.4500000000, 'btc', 1, '2017-12-11 09:42:19'),
(9, 1, 9.1245667999, 7.1195667999, 'btc', 3, '2018-02-09 18:03:26'),
(10, 3, 0.0000000000, 2.0050000000, 'btc', 3, '2018-02-09 18:03:26'),
(11, 1, 4.2495667999, 3.3695667999, 'btc', 1, '2018-06-09 13:32:02'),
(12, 1, 3.3695667999, 2.3695667999, 'btc', 1, '2018-06-09 13:44:32'),
(13, 1, 2.3695667999, 2.2695667999, 'btc', 1, '2018-06-09 13:45:47'),
(14, 1, 2.2695667999, 2.1195667999, 'btc', 1, '2018-06-09 13:51:18'),
(15, 1, 2.1195667999, 1.1195667999, 'btc', 1, '2018-06-09 13:56:30'),
(16, 4, 0.0000000000, 100.0000000000, 'btc', 3, '2018-06-11 01:23:58'),
(17, 4, 0.0000000000, 11.0000000000, 'traditional', 3, '2018-06-11 01:24:14'),
(18, 4, 11.0000000000, 100000.0000000000, 'traditional', 3, '2018-06-11 01:24:47');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `TransactionId` int(11) NOT NULL,
  `a_buyer` varchar(256) DEFAULT NULL,
  `A_OrderId` int(11) NOT NULL,
  `A_Amount` varchar(40) NOT NULL,
  `A_Commission` varchar(40) NOT NULL,
  `b_seller` varchar(256) DEFAULT NULL,
  `B_OrderId` int(11) NOT NULL,
  `B_Amount` varchar(40) NOT NULL,
  `B_Commission` varchar(40) NOT NULL,
  `qty_traded` varchar(256) NOT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `InsertDate` datetime DEFAULT NULL,
  `SaveDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`TransactionId`, `a_buyer`, `A_OrderId`, `A_Amount`, `A_Commission`, `b_seller`, `B_OrderId`, `B_Amount`, `B_Commission`, `qty_traded`, `UpdateDate`, `InsertDate`, `SaveDate`) VALUES
(1, '2', 1, '3.00', '0', '1', 2, '3.00', '0', '1.0E-6', NULL, '2017-12-11 08:35:27', '2017-12-11 08:35:27'),
(2, '2', 1, '3.00', '0', '1', 4, '3.00', '0', '1.01', NULL, '2017-12-11 08:53:25', '2017-12-11 08:53:25'),
(3, '2', 1, '3.00', '0', '1', 10, '0.10', '0', '1.0E-10', NULL, '2018-02-05 13:53:50', '2018-02-05 13:53:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assetbalance`
--
ALTER TABLE `assetbalance`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `bal_history`
--
ALTER TABLE `bal_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `acc_num` (`acc_num`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerId`),
  ADD UNIQUE KEY `fb_id` (`fb_id`);

--
-- Indexes for table `fund_transfer`
--
ALTER TABLE `fund_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderbook`
--
ALTER TABLE `orderbook`
  ADD PRIMARY KEY (`OrderId`);

--
-- Indexes for table `root_bal_updates`
--
ALTER TABLE `root_bal_updates`
  ADD PRIMARY KEY (`BalStatusHistoryId`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`TransactionId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assetbalance`
--
ALTER TABLE `assetbalance`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bal_history`
--
ALTER TABLE `bal_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fund_transfer`
--
ALTER TABLE `fund_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `orderbook`
--
ALTER TABLE `orderbook`
  MODIFY `OrderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `root_bal_updates`
--
ALTER TABLE `root_bal_updates`
  MODIFY `BalStatusHistoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `TransactionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
