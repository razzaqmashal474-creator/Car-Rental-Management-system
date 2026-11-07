-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2026 at 06:27 AM
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
-- Database: `car_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `price_per_hour` double NOT NULL,
  `min_hours` int(11) DEFAULT 1,
  `max_hours` int(11) DEFAULT 360,
  `total_qty` int(11) DEFAULT 1,
  `available_qty` int(11) DEFAULT 1,
  `img_path` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `name`, `model`, `price_per_hour`, `min_hours`, `max_hours`, `total_qty`, `available_qty`, `img_path`) VALUES
(1, 'Suzuki Alto', 'VX', 50, 1, 360, 5, 0, 'Suzuki Alto.jpg'),
(2, 'Suzuki Alto', 'VXR', 65, 1, 360, 5, 0, 'Suzuki Alto.jpg'),
(3, 'Toyota Corolla', '2024 GLi', 120, 1, 360, 5, 5, 'Toyota Corolla.jpg'),
(4, 'Toyota Corolla', '2024 XLi', 140, 1, 360, 5, 5, 'Toyota Corolla.jpg'),
(5, 'Honda City', 'Aspire', 150, 1, 360, 5, 5, 'Honda City.jpg'),
(6, 'Toyota Yaris', 'ATIV X', 130, 1, 360, 5, 5, 'Toyota Yaris.jpg'),
(7, 'Toyota Yaris', 'ATIV S', 150, 1, 360, 5, 5, 'Toyota Yaris.jpg'),
(8, 'Honda Civic', '2024 Oriel', 200, 1, 360, 5, 5, 'Honda Civic.jpg'),
(9, 'Honda Civic', '2024 Turbo', 230, 1, 360, 5, 5, 'Honda Civic.jpg'),
(10, 'Kia Sportage', 'Alpha', 250, 1, 360, 3, 3, 'Kia Sportage.jpg'),
(11, 'Hyundai Tucson', 'GLS', 280, 1, 360, 3, 3, 'Hyundai Tucson.jpg'),
(12, 'Audi', 'A6', 400, 1, 360, 3, 3, 'Audi A6.jpg'),
(13, 'Mercedes', 'C200', 400, 1, 360, 2, 2, 'Mercedes C-Class.jpg'),
(14, 'Mercedes', 'C300', 500, 1, 360, 2, 2, 'Mercedes C-Class.jpg'),
(15, 'BMW', 'M4', 500, 1, 360, 3, 0, 'BMW M4.jpg'),
(16, 'Tesla', 'Model S', 600, 2, 360, 2, 2, 'Tesla model s.jpg'),
(17, 'Ferrari', '488', 1000, 2, 360, 2, 2, 'Ferrari488.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `rentals`
--

CREATE TABLE `rentals` (
  `id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `rent_start` datetime NOT NULL,
  `rent_end` datetime NOT NULL,
  `actual_return` datetime DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `late_fee` double DEFAULT 0,
  `has_driver` tinyint(1) DEFAULT 0,
  `quantity` int(11) DEFAULT 1,
  `status` varchar(20) DEFAULT 'Active',
  `payment_method` varchar(50) DEFAULT 'Cash on Pickup',
  `payment_status` varchar(20) DEFAULT 'Pending',
  `payer_account` varchar(50) DEFAULT '',
  `transaction_ref` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rentals`
--

INSERT INTO `rentals` (`id`, `car_id`, `user_id`, `customer_name`, `contact`, `rent_start`, `rent_end`, `actual_return`, `total_price`, `late_fee`, `has_driver`, `quantity`, `status`, `payment_method`, `payment_status`, `payer_account`, `transaction_ref`) VALUES
(1, 6, 2, 'eshmal', '07645343433', '2026-05-13 00:00:00', '2026-05-13 23:59:00', '2026-05-13 07:26:37', 5980, 0, 0, 2, 'Returned', 'Cash on Pickup', 'Pending', '', ''),
(2, 12, 3, 'asma', '08745554343', '2026-05-13 00:00:00', '2026-05-14 23:59:00', '2026-05-15 13:07:05', 21150, 7800, 1, 1, 'Returned', 'Cash on Pickup', 'Pending', '', ''),
(3, 2, 2, 'eshmal', '07645343433', '2026-05-14 00:00:00', '2026-05-14 23:59:00', NULL, 1495, 0, 0, 1, 'Active', 'Cash on Pickup', 'Pending', '', ''),
(4, 15, 4, 'Maryam', '04534245657', '2026-05-16 00:00:00', '2026-05-17 23:59:00', NULL, 25850, 0, 1, 1, 'Active', 'Cash on Pickup', 'Pending', '', ''),
(5, 2, 2, 'eshmal', '07645343433', '2026-05-16 00:00:00', '2026-05-19 23:59:00', NULL, 6175, 0, 0, 1, 'Active', 'JazzCash', 'Pending', '', ''),
(6, 1, 3, 'asma', '08745554343', '2026-05-19 13:18:46', '2026-05-21 23:59:00', NULL, 5800, 0, 1, 1, 'Active', 'JazzCash', 'Pending', '', ''),
(7, 1, 2, 'eshmal', '07645343433', '2026-05-19 22:34:17', '2026-05-20 23:59:00', NULL, 5000, 0, 1, 2, 'Active', 'JazzCash', 'Pending', '0767567546456', '56363'),
(8, 15, 2, 'eshmal', '07645343433', '2026-05-19 22:37:30', '2026-05-20 23:59:00', NULL, 27500, 0, 1, 2, 'Active', 'Cash on Pickup', 'Pending', '', ''),
(9, 1, 2, 'eshmal', '07645343433', '2026-05-20 11:31:43', '2026-05-21 23:59:00', NULL, 3600, 0, 0, 2, 'Active', 'JazzCash', 'Pending', '1234567891234', '12345'),
(10, 2, 2, 'eshmal', '07645343433', '2026-05-21 00:00:00', '2026-05-22 23:59:00', NULL, 16215, 0, 1, 3, 'Active', 'JazzCash', 'Pending', '1234567891111', '123131'),
(11, 14, 5, 'hina', '1234567891', '2026-08-20 00:00:00', '2026-08-24 23:59:00', '2026-08-15 09:46:14', 59500, 0, 0, 1, 'Returned', 'JazzCash', 'Pending', '1234567891231', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(20) DEFAULT 'Customer',
  `contact` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `role`, `contact`) VALUES
(1, 'Mashal Razzaq', 'admin@eliterental.com', 'MashalRazzaq', '123456', 'Admin', '03001234567'),
(2, 'eshmal', 'eshmal@gmail.com', 'eshmal', '1234@Abcd', 'Customer', '07645343433'),
(3, 'asma', 'asma\'@GMAIL.COM', 'Asma', '1234@Abcd', 'Customer', '08745554343'),
(4, 'Maryam', 'maryam@gmail.com', 'Maryam', '1234@Abcd', 'Customer', '04534245657'),
(5, 'hina', 'hina@123gmail.com', 'hina', 'Hina@123', 'Customer', '1234567891');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rentals`
--
ALTER TABLE `rentals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `rentals`
--
ALTER TABLE `rentals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rentals`
--
ALTER TABLE `rentals`
  ADD CONSTRAINT `rentals_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rentals_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
