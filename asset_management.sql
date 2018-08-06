-- phpMyAdmin SQL Dump
-- version 4.4.0
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 06, 2018 at 11:14 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `asset_management`
--
CREATE DATABASE IF NOT EXISTS `asset_management` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `asset_management`;

-- --------------------------------------------------------

--
-- Table structure for table `airports`
--

DROP TABLE IF EXISTS `airports`;
CREATE TABLE IF NOT EXISTS `airports` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_type_id` int(11) DEFAULT NULL,
  `device_category_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial_number` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `wall_outlet` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_switch_id` int(11) DEFAULT NULL,
  `switchport` int(11) DEFAULT NULL,
  `purchase_year` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `airports`:
--   `device_type_id`
--       `device_types` -> `id`
--   `device_category_id`
--       `device_categories` -> `id`
--   `location_id`
--       `locations` -> `id`
--   `to_switch_id`
--       `switches` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `id` int(11) NOT NULL,
  `name` varchar(22) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `classes`:
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(22) COLLATE utf8_unicode_ci NOT NULL,
  `label_convention` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `departments`:
--

-- --------------------------------------------------------

--
-- Table structure for table `device_categories`
--

DROP TABLE IF EXISTS `device_categories`;
CREATE TABLE IF NOT EXISTS `device_categories` (
  `id` int(22) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `device_categories`:
--

-- --------------------------------------------------------

--
-- Table structure for table `device_loans`
--

DROP TABLE IF EXISTS `device_loans`;
CREATE TABLE IF NOT EXISTS `device_loans` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `device_type` int(11) DEFAULT NULL,
  `user_device_id` int(11) DEFAULT NULL,
  `borrowed_on` date DEFAULT NULL,
  `returned_on` date DEFAULT NULL,
  `comments` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `device_loans`:
--   `staff_id`
--       `staff` -> `id`
--   `device_type`
--       `device_types` -> `id`
--   `user_device_id`
--       `user_devices` -> `id`
--   `student_id`
--       `students` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `device_types`
--

DROP TABLE IF EXISTS `device_types`;
CREATE TABLE IF NOT EXISTS `device_types` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `label_convention` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ies-dev_ty-dep-XX'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `device_types`:
--

-- --------------------------------------------------------

--
-- Table structure for table `ip_telephones`
--

DROP TABLE IF EXISTS `ip_telephones`;
CREATE TABLE IF NOT EXISTS `ip_telephones` (
  `id` int(11) NOT NULL,
  `extension` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `number` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `ip_telephones`:
--

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
CREATE TABLE IF NOT EXISTS `licenses` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendor` int(11) DEFAULT NULL,
  `license_type` enum('Yearly Subscription','Monthly Subscription','One time fee','Upgrade') COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_of_licenses` int(22) DEFAULT NULL,
  `cost` decimal(8,2) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `login` text COLLATE utf8_unicode_ci,
  `invoice` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- RELATIONS FOR TABLE `licenses`:
--   `vendor`
--       `vendors` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `locations`:
--

-- --------------------------------------------------------

--
-- Table structure for table `operative_systems`
--

DROP TABLE IF EXISTS `operative_systems`;
CREATE TABLE IF NOT EXISTS `operative_systems` (
  `id` int(11) NOT NULL,
  `name` varchar(22) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `operative_systems`:
--

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

DROP TABLE IF EXISTS `printers`;
CREATE TABLE IF NOT EXISTS `printers` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `device_type_id` int(11) DEFAULT NULL,
  `device_category_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial_number` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `wall_outlet` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_switch_id` int(11) DEFAULT NULL,
  `switchport` int(11) DEFAULT NULL,
  `purchase_year` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `printers`:
--   `device_type_id`
--       `device_types` -> `id`
--   `device_category_id`
--       `device_categories` -> `id`
--   `location_id`
--       `locations` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `print_report`
--

DROP TABLE IF EXISTS `print_report`;
CREATE TABLE IF NOT EXISTS `print_report` (
  `id` int(22) NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `user` varchar(22) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account` varchar(22) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(22) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `details` varchar(22) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pages` int(22) DEFAULT NULL,
  `cost` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `print_report`:
--

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `id` int(11) NOT NULL,
  `first_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `staff`:
--   `department_id`
--       `departments` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` int(11) NOT NULL,
  `first_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `students`:
--   `class_id`
--       `classes` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `student_devices`
--

DROP TABLE IF EXISTS `student_devices`;
CREATE TABLE IF NOT EXISTS `student_devices` (
  `id` int(22) NOT NULL,
  `device_type_id` int(22) DEFAULT '5',
  `device_category_id` int(22) DEFAULT '3',
  `serial_number` varchar(22) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_year` year(4) DEFAULT '2013',
  `status` enum('OK','Damaged','In Repair','Repaired','Borrowed','Replacement','Lost','Own') COLLATE utf8_unicode_ci DEFAULT 'OK',
  `student_id` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `student_devices`:
--   `device_category_id`
--       `device_categories` -> `id`
--   `device_type_id`
--       `device_types` -> `id`
--   `student_id`
--       `students` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `switches`
--

DROP TABLE IF EXISTS `switches`;
CREATE TABLE IF NOT EXISTS `switches` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `device_type_id` int(11) DEFAULT NULL,
  `device_category_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial_number` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `wall_outlet` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_switch_id` int(11) DEFAULT NULL,
  `switchport` int(11) DEFAULT NULL,
  `purchase_year` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `switches`:
--   `device_type_id`
--       `device_types` -> `id`
--   `device_category_id`
--       `device_categories` -> `id`
--   `location_id`
--       `locations` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_devices`
--

DROP TABLE IF EXISTS `user_devices`;
CREATE TABLE IF NOT EXISTS `user_devices` (
  `id` int(11) NOT NULL,
  `label` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_type_id` int(11) DEFAULT NULL,
  `device_category_id` int(22) DEFAULT NULL,
  `os_id` int(11) DEFAULT NULL,
  `serial_number` varchar(22) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_year` year(4) DEFAULT NULL,
  `status` enum('OK','Damaged','In Repair','Repaired','Borrowed','Replacement','Lost','Retired') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'OK',
  `staff_id` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `user_devices`:
--   `staff_id`
--       `staff` -> `id`
--   `device_type_id`
--       `device_types` -> `id`
--   `device_category_id`
--       `device_categories` -> `id`
--   `os_id`
--       `operative_systems` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
CREATE TABLE IF NOT EXISTS `vendors` (
  `id` int(11) NOT NULL,
  `name` varchar(225) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(225) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `vendors`:
--

-- --------------------------------------------------------

--
-- Table structure for table `years`
--

DROP TABLE IF EXISTS `years`;
CREATE TABLE IF NOT EXISTS `years` (
  `id` int(11) NOT NULL,
  `name` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `years`:
--

-- --------------------------------------------------------

--
-- Table structure for table `_staff_device_dump`
--

DROP TABLE IF EXISTS `_staff_device_dump`;
CREATE TABLE IF NOT EXISTS `_staff_device_dump` (
  `id` int(11) NOT NULL,
  `first_name` varchar(22) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(22) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `computer_type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `computer_serial` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ipad_type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ipad_serial` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `_staff_device_dump`:
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_network_devices_1_idx` (`device_type_id`),
  ADD KEY `fk_network_devices_2_idx` (`device_category_id`),
  ADD KEY `fk_network_devices_3_idx` (`location_id`),
  ADD KEY `fk_network_devices_4_idx` (`to_switch_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD UNIQUE KEY `label_convention` (`label_convention`);

--
-- Indexes for table `device_categories`
--
ALTER TABLE `device_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `device_loans`
--
ALTER TABLE `device_loans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_device_id` (`user_device_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `user_devices` (`device_type`);

--
-- Indexes for table `device_types`
--
ALTER TABLE `device_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `idx_device_types_name` (`name`);

--
-- Indexes for table `ip_telephones`
--
ALTER TABLE `ip_telephones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor` (`vendor`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `operative_systems`
--
ALTER TABLE `operative_systems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_network_devices_1_idx` (`device_type_id`),
  ADD KEY `fk_network_devices_2_idx` (`device_category_id`),
  ADD KEY `fk_network_devices_3_idx` (`location_id`),
  ADD KEY `fk_network_devices_4_idx` (`to_switch_id`);

--
-- Indexes for table `print_report`
--
ALTER TABLE `print_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `fk_staff_1_idx` (`department_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `stud_fk_1_idx` (`class_id`);

--
-- Indexes for table `student_devices`
--
ALTER TABLE `student_devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `serial__number_UNIQUE` (`serial_number`),
  ADD UNIQUE KEY `student_id_2` (`student_id`),
  ADD KEY `fk_student_devices_1_idx` (`device_category_id`),
  ADD KEY `device_type_id` (`device_type_id`);

--
-- Indexes for table `switches`
--
ALTER TABLE `switches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_network_devices_1_idx` (`device_type_id`),
  ADD KEY `fk_network_devices_2_idx` (`device_category_id`),
  ADD KEY `fk_network_devices_3_idx` (`location_id`),
  ADD KEY `fk_network_devices_4_idx` (`to_switch_id`);

--
-- Indexes for table `user_devices`
--
ALTER TABLE `user_devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `device_serial_number_UNIQUE` (`serial_number`),
  ADD UNIQUE KEY `label` (`label`),
  ADD KEY `devices_ibfk_1_idx` (`device_type_id`),
  ADD KEY `device_category_id` (`device_category_id`),
  ADD KEY `fk_staff_devices_1_idx` (`staff_id`),
  ADD KEY `os_id` (`os_id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `years`
--
ALTER TABLE `years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_staff_device_dump`
--
ALTER TABLE `_staff_device_dump`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airports`
--
ALTER TABLE `airports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `device_categories`
--
ALTER TABLE `device_categories`
  MODIFY `id` int(22) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `device_loans`
--
ALTER TABLE `device_loans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `device_types`
--
ALTER TABLE `device_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ip_telephones`
--
ALTER TABLE `ip_telephones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `licenses`
--
ALTER TABLE `licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `operative_systems`
--
ALTER TABLE `operative_systems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `print_report`
--
ALTER TABLE `print_report`
  MODIFY `id` int(22) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_devices`
--
ALTER TABLE `student_devices`
  MODIFY `id` int(22) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `switches`
--
ALTER TABLE `switches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_devices`
--
ALTER TABLE `user_devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `years`
--
ALTER TABLE `years`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `_staff_device_dump`
--
ALTER TABLE `_staff_device_dump`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `airports`
--
ALTER TABLE `airports`
  ADD CONSTRAINT `airports_ibfk_1` FOREIGN KEY (`device_type_id`) REFERENCES `device_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `airports_ibfk_2` FOREIGN KEY (`device_category_id`) REFERENCES `device_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `airports_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `airports_ibfk_4` FOREIGN KEY (`to_switch_id`) REFERENCES `switches` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `device_loans`
--
ALTER TABLE `device_loans`
  ADD CONSTRAINT `device_loans_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `device_loans_ibfk_5` FOREIGN KEY (`device_type`) REFERENCES `device_types` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `device_loans_ibfk_6` FOREIGN KEY (`user_device_id`) REFERENCES `user_devices` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `device_loans_ibfk_7` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `licenses`
--
ALTER TABLE `licenses`
  ADD CONSTRAINT `licenses_ibfk_1` FOREIGN KEY (`vendor`) REFERENCES `vendors` (`id`);

--
-- Constraints for table `printers`
--
ALTER TABLE `printers`
  ADD CONSTRAINT `printers_ibfk_1` FOREIGN KEY (`device_type_id`) REFERENCES `device_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `printers_ibfk_2` FOREIGN KEY (`device_category_id`) REFERENCES `device_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `printers_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `stud_fk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_devices`
--
ALTER TABLE `student_devices`
  ADD CONSTRAINT `fk_student_devices_1` FOREIGN KEY (`device_category_id`) REFERENCES `device_categories` (`id`),
  ADD CONSTRAINT `student_devices_ibfk_1` FOREIGN KEY (`device_type_id`) REFERENCES `device_types` (`id`),
  ADD CONSTRAINT `student_devices_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `switches`
--
ALTER TABLE `switches`
  ADD CONSTRAINT `fk_network_devices_1` FOREIGN KEY (`device_type_id`) REFERENCES `device_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_network_devices_2` FOREIGN KEY (`device_category_id`) REFERENCES `device_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_network_devices_3` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_devices`
--
ALTER TABLE `user_devices`
  ADD CONSTRAINT `fk_staff_devices_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_devices_ibfk_1` FOREIGN KEY (`device_type_id`) REFERENCES `device_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_devices_ibfk_2` FOREIGN KEY (`device_category_id`) REFERENCES `device_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_devices_ibfk_3` FOREIGN KEY (`os_id`) REFERENCES `operative_systems` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
