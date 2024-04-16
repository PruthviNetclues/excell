-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 15, 2024 at 02:29 PM
-- Server version: 5.7.14
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task11`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryid`, `categoryname`) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books'),
(4, 'Home & Kitchen'),
(5, 'Sports');

-- --------------------------------------------------------

--
-- Table structure for table `emailcounter`
--

DROP TABLE IF EXISTS `emailcounter`;
CREATE TABLE IF NOT EXISTS `emailcounter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `counter` bigint(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emailcounter`
--

INSERT INTO `emailcounter` (`id`, `counter`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 1),
(8, 1),
(9, 2),
(10, 1),
(11, 1),
(12, 1),
(13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(100) DEFAULT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `variantid` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `discountpercentage` decimal(5,2) DEFAULT NULL,
  `description` text,
  `categoryid` int(11) DEFAULT NULL,
  PRIMARY KEY (`productid`),
  KEY `categoryid` (`categoryid`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productid`, `productname`, `sku`, `variantid`, `price`, `discountpercentage`, `description`, `categoryid`) VALUES
(1, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(2, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(3, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(4, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(5, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(6, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(7, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(8, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(9, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(10, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(11, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(12, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(13, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(14, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(15, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(16, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(17, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(18, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(19, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(20, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(22, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(23, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(24, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(25, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(26, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(27, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(28, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(29, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(30, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(31, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(32, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(33, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(34, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(35, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(36, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(37, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(38, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(39, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(40, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(41, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(42, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(43, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(44, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(45, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(46, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(47, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(48, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(49, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(50, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(51, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2),
(52, 'mobile', 'cd', 1, 3500.00, 20.00, 'good phone', 1),
(53, 'car ', 'gh', 2, 4500.00, 15.00, 'good car', 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
