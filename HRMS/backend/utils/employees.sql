-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2024 at 03:59 PM
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
-- Database: `employees`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(140) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`) VALUES
(1, 'hassan@gmail.com', 'abcd123'),
(2, 'hr@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'IT', 'The department of IT in Crescent Technologies is well established with an active and agile team of creative and innovative individuals.'),
(2, 'Web Development', 'The department of Web Development in Crescent Technologies is well established with an active and agile team of creative and innovative individuals.'),
(3, 'Data Science', 'The department of Data Science in Crescent Technologies is well established with an active and agile team of creative and innovative individuals.'),
(4, 'AI/Machine Learning', 'The department of AI/Machine Learning in Crescent Technologies is well established with an active and agile team of creative and innovative individuals.'),
(5, 'Database Administrator', 'The DBA department in Crescent Technologies is well established and houses top database engineers from all over the country.'),
(6, 'Graphic Designing', 'An entertaining new department in Crescent technologies.');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salary` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `email`, `password`, `salary`, `address`, `image`, `category_id`) VALUES
(4, 'shuja', 'sj@gmail.com', '$2b$10$o5awCUZ6ioI0R3X3VHk/bO/qGQ3EII8f5Q3iPnhRG2DqSuS2VQTjC', 65000, '1234 Main ST', 'image_1722168069803.jpg', 1),
(6, 'zaheer', 'zr@gmail.com', '$2b$10$vmn4BZ9MPvMf4CkcIv0P5up2y/YgOVeJjnVDiUUzYO0vFk4g0jm/y', 40000, 'university road', 'image_1722176860490.png', 4),
(19, 'Waqas', 'ws@gmail.com', '$2b$10$qZU28gy/XPMbenuEJWpaQ.orYzgw738FgqkuXZJoe3ePoQn8kpG5m', 75000, 'Shahrah-e-faisal main street abc', 'image_1722431428482.jpg', 3),
(21, 'Babar', 'br@gmail.com', '$2b$10$YJ8ttZ1drTe0Selz3zGiHOSyek6ONLh9C1RQEbJE4BufTUGp2Iu8O', 50000, 'Uni road main street abc', 'image_1722431772662.jpg', 1),
(22, 'Abbas', 'ab@gmail.com', '$2b$10$RiCaDmNiV833l3HyadWL6uuP3KVTZa8xsua3A.vUiC/qLojiAokuy', 40000, 'Kausar town road street 123', 'image_1722431859693.jpg', 2),
(23, 'Hassan', 'hn@gmail.com', '$2b$10$7mvP116.8pVe7l3xhHP9cuJu3NXv742EPIdUKnc5D1mpz2xSsJ0z2', 60000, 'Main Uni road street 123', 'image_1722432505754.jpg', 5),
(24, 'Ahsan', 'an@gmail.com', '$2b$10$EDTovQPufZXN9ZCHkXBaoOVlwcGPcx4JIxR9FzS87bpcPKlXID70y', 45000, 'abc st', 'image_1722432923340.jpg', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
