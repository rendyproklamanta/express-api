-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 06, 2022 at 06:39 PM
-- Server version: 5.7.24
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `walleyum`
--

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `rateUsd` double DEFAULT '0',
  `ratefromApi` tinyint(1) DEFAULT '1',
  `crypto` tinyint(1) DEFAULT '0',
  `metadata` text,
  `active` tinyint(1) DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `icon`, `rateUsd`, `ratefromApi`, `crypto`, `metadata`, `active`, `createdAt`, `updatedAt`) VALUES
(1, 'US Dollar', 'USD', NULL, 1, 1, 0, NULL, 1, '2021-10-24 09:38:42', '2022-01-03 05:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_status` tinyint(1) DEFAULT '0',
  `amount` double DEFAULT '0',
  `currency` varchar(255) DEFAULT 'USD',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exchanges`
--

CREATE TABLE `exchanges` (
  `id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `exchangeRate` double DEFAULT '0',
  `amountFrom` double DEFAULT '0',
  `amountTo` double DEFAULT '0',
  `fee` double DEFAULT '0',
  `total` double DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `apiKey` varchar(255) DEFAULT NULL,
  `secretKey` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `isCrypto` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `isExchangePayment` tinyint(1) DEFAULT '0',
  `ex1` varchar(255) DEFAULT NULL,
  `ex2` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `name`, `value`, `apiKey`, `secretKey`, `email`, `isCrypto`, `active`, `isExchangePayment`, `ex1`, `ex2`, `createdAt`, `updatedAt`) VALUES
(1, 'Mollie', 'mollie', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, '2021-10-24 09:38:42', '2021-10-23 06:08:49'),
(2, 'Coinbase', 'coinbase', NULL, NULL, NULL, 1, 0, 0, NULL, NULL, '2021-10-24 09:38:42', '2021-09-26 11:54:26'),
(3, 'Coin Payments', 'coinpayments', NULL, NULL, NULL, 1, 0, 0, NULL, NULL, '2021-10-24 09:38:42', '2021-09-26 16:37:39'),
(4, 'Paypal', 'paypal', NULL, NULL, NULL, 0, 0, 0, 'live', NULL, '2021-10-24 09:38:42', '2021-09-10 15:17:54'),
(5, 'Stripe', 'stripe', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, '2021-10-24 09:38:42', '2021-09-24 19:09:34'),
(6, 'Coingate', 'coingate', NULL, NULL, NULL, 1, 0, 0, 'live', NULL, '2021-10-24 09:38:42', '2021-10-24 09:38:42'),
(7, 'Paystack', 'paystack', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, '2021-10-24 09:38:42', '2021-10-24 09:38:42'),
(8, 'VoguePay', 'voguepay', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, '2021-10-24 09:38:42', '2021-10-24 09:38:42');

-- --------------------------------------------------------

--
-- Table structure for table `kycs`
--

CREATE TABLE `kycs` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `front` varchar(255) DEFAULT NULL,
  `back` varchar(255) DEFAULT NULL,
  `selfie` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `linkeds`
--

CREATE TABLE `linkeds` (
  `id` int(11) NOT NULL,
  `params` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `methodId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `message` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `merchants`
--

CREATE TABLE `merchants` (
  `id` int(11) NOT NULL,
  `merId` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text,
  `status` varchar(255) DEFAULT 'pending',
  `proof` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `methods`
--

CREATE TABLE `methods` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `params` text,
  `minAmount` double DEFAULT '0',
  `maxAmount` double DEFAULT '20000',
  `currency` varchar(255) DEFAULT 'USD',
  `fixedCharge` double DEFAULT '0',
  `percentageCharge` double DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT 'landing',
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `type`, `name`, `slug`, `content`, `createdAt`, `updatedAt`) VALUES
(1, 'landing', 'Home', 'home', '[]', '2021-10-24 09:38:42', '2022-01-02 10:55:46');

-- --------------------------------------------------------

--
-- Table structure for table `pays`
--

CREATE TABLE `pays` (
  `id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT 'success',
  `trxId` varchar(255) DEFAULT NULL,
  `merchant` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT '0',
  `currency` varchar(255) DEFAULT 'USD',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `trxId` varchar(255) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT '0',
  `currency` varchar(255) DEFAULT 'USD',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `merchantId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `param1` text,
  `param2` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `value`, `param1`, `param2`, `createdAt`, `updatedAt`) VALUES
(1, 'refferal', '10', 'USD', '2021-10-24 09:38:42', '2021-10-24 09:38:42'),
(2, 'site', 'Walleyum', 'walleyum@tdevs.co', '2021-10-24 09:38:42', '2021-10-23 08:24:59'),
(3, 'appUrl', 'https://walleyum.tdevs.co', NULL, '2021-10-24 09:38:42', '2021-10-23 08:24:59'),
(4, 'apiUrl', 'http://localhost:3000', NULL, '2021-10-24 09:38:42', '2021-10-23 08:24:59'),
(5, 'freecurrencyapi', NULL, NULL, '2021-10-24 09:38:42', '2021-10-24 09:38:42'),
(6, 'adjustments', '2.5', '0', '2021-10-24 09:38:42', '2021-10-24 09:56:50'),
(7, 'mainmenu', '[]', NULL, '2021-10-24 09:38:42', '2021-10-27 11:23:11'),
(8, 'footermenu', '[]', NULL, '2021-10-24 09:38:42', '2021-12-22 12:37:34'),
(9, 'tagline', 'Wallet, Exchanger, Cryptocurrency', NULL, '2021-10-24 09:38:42', '2021-10-24 09:38:42'),
(10, 'logo', NULL, NULL, '2021-10-24 09:38:42', '2021-10-27 09:25:44'),
(11, 'services', '[]', NULL, '2021-10-24 09:38:42', '2021-12-23 10:13:33'),
(12, 'solutions', '[]', NULL, '2021-10-24 09:38:42', '2021-12-22 17:10:46'),
(13, 'work', '[]', NULL, '2021-10-24 09:38:42', '2021-10-24 09:38:42'),
(14, 'faq', '[]', NULL, '2021-10-24 09:38:42', '2021-12-23 10:12:26');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `currency` varchar(255) DEFAULT 'USD',
  `trxId` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text,
  `password` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT '1',
  `active` tinyint(1) DEFAULT '0',
  `kyc` tinyint(1) DEFAULT '0',
  `refferedBy` int(11) DEFAULT NULL,
  `reset` varchar(255) DEFAULT NULL,
  `passUpdate` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `password`, `role`, `active`, `kyc`, `refferedBy`, `reset`, `passUpdate`, `createdAt`, `updatedAt`) VALUES
(1, 'admin', 'admin@mail.com', NULL, NULL, '$2a$10$HiQYm45.Mowy.WJESmfEF.00GMTBJ0YVWJB8FhBQ1qCwPOaWlSOuy', 0, 1, 0, NULL, '13237e0b-8bbf-42d8-97b1-8e29d42b18b5', NULL, '2022-08-05 10:50:04', '2022-08-05 10:50:04'),
(2, 'test', 'test@mail.com', NULL, NULL, '$2a$10$k5czTb/o4KpwEUqaxjEk0emoxUwly7gYLIuHZ1ZNV5MmHfCxlNskG', 1, 1, 0, NULL, '13237e0b-8bbf-42d8-97b1-8e29d42b18b5', 1659702223, '2022-08-05 10:50:04', '2022-08-05 12:23:43');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` int(11) NOT NULL,
  `balance` double DEFAULT '0',
  `currency` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `method` varchar(255) DEFAULT NULL,
  `params` text,
  `currency` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `fee` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `exchanges`
--
ALTER TABLE `exchanges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kycs`
--
ALTER TABLE `kycs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `linkeds`
--
ALTER TABLE `linkeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `methodId` (`methodId`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merchants`
--
ALTER TABLE `merchants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `merId` (`merId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `methods`
--
ALTER TABLE `methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merchantId` (`merchantId`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exchanges`
--
ALTER TABLE `exchanges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `kycs`
--
ALTER TABLE `kycs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `linkeds`
--
ALTER TABLE `linkeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `merchants`
--
ALTER TABLE `merchants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `methods`
--
ALTER TABLE `methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pays`
--
ALTER TABLE `pays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deposits`
--
ALTER TABLE `deposits`
  ADD CONSTRAINT `deposits_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `exchanges`
--
ALTER TABLE `exchanges`
  ADD CONSTRAINT `exchanges_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `kycs`
--
ALTER TABLE `kycs`
  ADD CONSTRAINT `kycs_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `linkeds`
--
ALTER TABLE `linkeds`
  ADD CONSTRAINT `linkeds_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `linkeds_ibfk_2` FOREIGN KEY (`methodId`) REFERENCES `methods` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `merchants`
--
ALTER TABLE `merchants`
  ADD CONSTRAINT `merchants_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `pays`
--
ALTER TABLE `pays`
  ADD CONSTRAINT `pays_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`merchantId`) REFERENCES `merchants` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD CONSTRAINT `withdraws_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
