-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 17, 2026 at 08:20 AM
-- Server version: 11.4.9-MariaDB
-- PHP Version: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vehicle_rental_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `driving_license` varchar(50) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `driving_license` (`driving_license`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `full_name`, `phone`, `email`, `address`, `driving_license`) VALUES
(1, 'Rahul Patil', '9876543210', 'rahul@gmail.com', 'Nashik', 'DL10001'),
(2, 'Amit Sharma', '9876543211', 'amit@gmail.com', 'Pune', 'DL10002'),
(3, 'Sneha Joshi', '9876543212', 'sneha@gmail.com', 'Mumbai', 'DL10003'),
(4, 'PRANAV BORSE', '9561405197', 'pranavborse2006@gmail.com', 'nashik', 'NK00001'),
(5, 'ADITYA BARVE', '9322161722', 'aditya9322@gmail.com', 'chandori', 'CH0034'),
(6, 'NARENDRA MODI', '1234567890', 'narendra@bjp.com', 'india', 'NM0076');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `rental_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(30) NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'PAID',
  PRIMARY KEY (`payment_id`),
  KEY `rental_id` (`rental_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `rental_id`, `payment_date`, `amount`, `payment_method`, `payment_status`) VALUES
(1, 1, '2026-09-17', 5400.00, 'CASH', 'PAID');

-- --------------------------------------------------------

--
-- Table structure for table `rentals`
--

DROP TABLE IF EXISTS `rentals`;
CREATE TABLE IF NOT EXISTS `rentals` (
  `rental_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `rental_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `number_of_days` int(11) NOT NULL,
  `rental_amount` decimal(10,2) NOT NULL,
  `late_fee` decimal(10,2) DEFAULT 0.00,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`rental_id`),
  KEY `customer_id` (`customer_id`),
  KEY `vehicle_id` (`vehicle_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rentals`
--

INSERT INTO `rentals` (`rental_id`, `customer_id`, `vehicle_id`, `rental_date`, `return_date`, `number_of_days`, `rental_amount`, `late_fee`, `total_amount`, `status`) VALUES
(1, 1, 1, '2026-09-17', '2026-09-17', 3, 5400.00, 0.00, 5400.00, 'COMPLETED'),
(2, 1, 2, '2026-09-17', '2026-09-17', 5, 6000.00, 0.00, 6000.00, 'COMPLETED'),
(3, 1, 1, '2026-09-17', NULL, 2, 3600.00, 0.00, 3600.00, 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`) VALUES
(1, 'admin', 'admin123', 'ADMIN'),
(2, 'BERLIN', 'Pranav@22', 'ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE IF NOT EXISTS `vehicles` (
  `vehicle_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_number` varchar(20) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `category` varchar(30) NOT NULL,
  `rental_rate` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'AVAILABLE',
  PRIMARY KEY (`vehicle_id`),
  UNIQUE KEY `vehicle_number` (`vehicle_number`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`vehicle_id`, `vehicle_number`, `brand`, `model`, `category`, `rental_rate`, `status`) VALUES
(1, 'MH15AB1234', 'Hyundai', 'Creta', 'SUV', 1800.00, 'RENTED'),
(2, 'MH12CD5678', 'Maruti', 'Swift', 'HATCHBACK', 1200.00, 'AVAILABLE'),
(3, 'MH14EF9012', 'Toyota', 'Innova', 'SUV', 2200.00, 'AVAILABLE'),
(4, 'MH15GH3456', 'Honda', 'City', 'SEDAN', 1700.00, 'AVAILABLE'),
(5, 'MH12IJ7890', 'Royal Enfield', 'Classic 350', 'BIKE', 800.00, 'AVAILABLE'),
(6, 'MH 15 BZ 0001', 'HONDA', 'UNICORN', '2 WHEELER', 50.00, 'AVAILABLE'),
(7, 'MH 15 AN 0001', 'TOYOTA', 'LEGENDER', '4x4', 15000.00, 'AVAILABLE'),
(8, 'MH 19 BR 1212', 'VOLVO', 'XC90', 'LUXARY', 25000.00, 'AVAILABLE');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
