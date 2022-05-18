-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 18, 2022 at 11:23 AM
-- Server version: 5.7.34
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `EG`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(8) NOT NULL,
  `group_number` int(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `group_number`, `name`, `description`) VALUES
(1, 4740, 'Supplerende produkter', NULL),
(2, 3230, 'Trælast', NULL),
(3, 1660, 'VVS', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `local_location`
--

CREATE TABLE `local_location` (
  `id` int(6) NOT NULL,
  `location_value` int(5) NOT NULL,
  `zipcode` int(5) NOT NULL,
  `city` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `country` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `local_location`
--

INSERT INTO `local_location` (`id`, `location_value`, `zipcode`, `city`, `address`, `country`) VALUES
(1, 110, 6000, 'kolding', 'byggemarkedsvej 1', 'danmark'),
(2, 200, 6000, 'kolding', 'byggemarkedsvej 1', 'danmark'),
(3, 131, 6000, 'kolding', 'byggemarkedsvej 1', 'danmark'),
(4, 135, 6000, 'kolding', 'byggemarkedsvej 1', 'danmark');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(8) NOT NULL,
  `item_number` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(300) DEFAULT '-',
  `price` float NOT NULL DEFAULT '999.99',
  `currency` varchar(3) NOT NULL DEFAULT 'DKK',
  `unittype` enum('stk','fl','dås','sp','æsk','bæg','bøt','brv','dk','krt','lgd','m','pk','ps','ptr','rl','sk','tb') NOT NULL DEFAULT 'stk',
  `price_ex_vat` tinyint(1) NOT NULL DEFAULT '0',
  `discount` tinyint(1) NOT NULL DEFAULT '0',
  `note` varchar(300) DEFAULT NULL,
  `available_status` tinyint(1) NOT NULL,
  `inventory_quantity` int(6) DEFAULT NULL,
  `amount_in_order` int(10) DEFAULT NULL,
  `min_inventory` int(5) DEFAULT NULL,
  `total_buys` int(7) DEFAULT NULL,
  `supplier` varchar(25) NOT NULL,
  `category` int(6) NOT NULL,
  `local_location` int(6) DEFAULT NULL,
  `sequence_number` int(6) NOT NULL,
  `remote_location` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `item_number`, `title`, `description`, `price`, `currency`, `unittype`, `price_ex_vat`, `discount`, `note`, `available_status`, `inventory_quantity`, `amount_in_order`, `min_inventory`, `total_buys`, `supplier`, `category`, `local_location`, `sequence_number`, `remote_location`) VALUES
(1, 2017043, 'CARAMBA RENSESPRAY', '-', 12.99, 'DKK', 'stk', 0, 0, NULL, 0, 0, 20, 25, 118, 'DIYsupply', 4740, 110, 114, NULL),
(2, 1521026, 'MILLARCO SEKUNDLIM 30ML', '-', 23.99, 'DKK', 'fl', 0, 0, NULL, 1, 2, 31, 25, 64, 'DIYsupply', 4740, 200, 123, 193),
(3, 5063215, 'PLASTI KOTE FUGEPEN GRÅ 5ML', '-', 31.99, 'DKK', 'stk', 0, 0, NULL, 1, 26, 31, 100, 485, 'DIYsupply', 4740, 131, 36, NULL),
(4, 3701612, 'PLASTIC PADDING 100 0,56LT', '-', 36.99, 'DKK', 'dås', 0, 0, NULL, 1, 2, 20, 15, 286, 'DIYsupply', 4740, 135, 11, NULL),
(5, 8527673, 'DANA GLASBÅND KISO 141 SORT', '-', 89.99, 'DKK', 'rl', 0, 0, NULL, 1, 37, 40, 50, 466, 'DIYsupply', 4740, NULL, 3, 4123),
(6, 1992001, 'Terrassebrædde 17x40x480', '-', 78.99, 'DKK', 'm', 0, 0, NULL, 1, 250, 65, 300, 886, 'Din træmand', 3230, 135, 311, 256),
(7, 1992022, 'Terrasseskruer H.1212 8x160 400stk', '-', 166.99, 'DKK', 'pk', 0, 0, NULL, 1, 80, 20, 100, 77, 'Din træmand', 3230, 200, 64, 4123),
(8, 2030054, 'vandrør k54 Ø36x16x6000', '-', 73.99, 'DKK', 'm', 0, 0, NULL, 1, 56, 24, 80, 33, 'VVSXperten', 1660, 131, 775, NULL),
(10, 2030075, 'vandrørs fitting k54 han-hun 2\" rørgevind Ø35', '-', 35.99, 'DKK', 'stk', 0, 0, NULL, 1, 96, 4, 100, 23, 'VVSXperten', 1660, 131, 779, 256);

-- --------------------------------------------------------

--
-- Table structure for table `remote_location`
--

CREATE TABLE `remote_location` (
  `id` int(8) NOT NULL,
  `remote_location` int(5) DEFAULT NULL,
  `zipcode` int(5) NOT NULL,
  `city` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `country` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `remote_location`
--

INSERT INTO `remote_location` (`id`, `remote_location`, `zipcode`, `city`, `address`, `country`) VALUES
(1, 4123, 7000, 'vejle', 'fjernlagervej 1', 'danmark'),
(2, 193, 7000, 'vejle', 'fjernlagervej 1', 'danmark'),
(3, 256, 7000, 'vejle', 'fjernlagervej 1', 'danmark');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(8) NOT NULL,
  `name` varchar(75) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(75) NOT NULL,
  `zipcode` int(5) NOT NULL,
  `country` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `address`, `city`, `zipcode`, `country`) VALUES
(1, 'DIYsupply', 'suppliervejen 1', 'aalborg', 9000, 'danmark'),
(2, 'Din træmand', 'landevejen 18', 'silkeborg', 8800, 'danmark'),
(3, 'VVSXperten', 'havregade 18C', 'aarhus', 8600, 'danmark');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_contact`
--

CREATE TABLE `supplier_contact` (
  `id` int(4) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `phone` int(15) NOT NULL,
  `position` varchar(30) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier_contact`
--

INSERT INTO `supplier_contact` (`id`, `firstname`, `lastname`, `email`, `phone`, `position`, `supplier_id`) VALUES
(1, 'Jens', 'Jensen', 'jensjensen@diysupply.dk', 12345678, 'keyaccount manager', 1),
(2, 'bent', 'hansen', 'benth@dintraemand.dk', 88123456, 'saelger', 2),
(3, 'kris', 'kristensen', 'kk@vvsxperten.dk', 19233212, 'salesman', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(8) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password_hashed` varchar(64) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_number` (`group_number`) USING BTREE;

--
-- Indexes for table `local_location`
--
ALTER TABLE `local_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_value` (`location_value`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_number` (`item_number`),
  ADD KEY `belongs_to` (`category`),
  ADD KEY `remote_location` (`remote_location`) USING BTREE,
  ADD KEY `local_location` (`local_location`) USING BTREE,
  ADD KEY `supplier` (`supplier`) USING BTREE;

--
-- Indexes for table `remote_location`
--
ALTER TABLE `remote_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `remote_location` (`remote_location`) USING BTREE;

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `supplier_contact`
--
ALTER TABLE `supplier_contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_brand` (`supplier_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `local_location`
--
ALTER TABLE `local_location`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `remote_location`
--
ALTER TABLE `remote_location`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier_contact`
--
ALTER TABLE `supplier_contact`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `belongs_to` FOREIGN KEY (`category`) REFERENCES `category` (`group_number`),
  ADD CONSTRAINT `located_locally_at` FOREIGN KEY (`local_location`) REFERENCES `local_location` (`location_value`),
  ADD CONSTRAINT `located_remotely_at` FOREIGN KEY (`remote_location`) REFERENCES `remote_location` (`remote_location`),
  ADD CONSTRAINT `supplied_by` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`name`);

--
-- Constraints for table `supplier_contact`
--
ALTER TABLE `supplier_contact`
  ADD CONSTRAINT `supplier` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
