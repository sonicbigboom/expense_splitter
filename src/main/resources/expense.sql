-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.1.0 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for expense
CREATE DATABASE IF NOT EXISTS `expense` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `expense`;

-- Dumping structure for table expense.group
CREATE TABLE IF NOT EXISTS `group` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table expense.person
CREATE TABLE IF NOT EXISTS `person` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table expense.person_group
CREATE TABLE IF NOT EXISTS `person_group` (
  `person_id` int unsigned NOT NULL,
  `group_id` int unsigned NOT NULL,
  PRIMARY KEY (`person_id`,`group_id`) USING BTREE,
  KEY `person_group_group_id` (`group_id`),
  CONSTRAINT `person_group_group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`),
  CONSTRAINT `person_group_person_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table expense.receipt
CREATE TABLE IF NOT EXISTS `receipt` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int unsigned NOT NULL,
  `paid_by_person_id` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `discount` decimal(20,2) DEFAULT NULL,
  `tip` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receipt_group_id` (`group_id`) USING BTREE,
  KEY `receipt_paid_by_person_id` (`paid_by_person_id`) USING BTREE,
  CONSTRAINT `receipt_group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`),
  CONSTRAINT `receipt_paid_by_person_id` FOREIGN KEY (`paid_by_person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table expense.receipt_entry
CREATE TABLE IF NOT EXISTS `receipt_entry` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `receipt_id` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` decimal(20,2) unsigned NOT NULL,
  `tax` decimal(20,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `receipt_entry_receipt_id` (`receipt_id`),
  CONSTRAINT `receipt_entry_receipt_id` FOREIGN KEY (`receipt_id`) REFERENCES `receipt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table expense.receipt_entry_person
CREATE TABLE IF NOT EXISTS `receipt_entry_person` (
  `receipt_entry_id` int unsigned NOT NULL,
  `person_id` int unsigned NOT NULL,
  `shares` int unsigned NOT NULL,
  PRIMARY KEY (`receipt_entry_id`,`person_id`),
  KEY `receipt_entry_person_person_id` (`person_id`),
  CONSTRAINT `receipt_entry_person_person_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  CONSTRAINT `receipt_entry_person_receipt_entry_id` FOREIGN KEY (`receipt_entry_id`) REFERENCES `receipt_entry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table expense.settlement
CREATE TABLE IF NOT EXISTS `settlement` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `from_person_id` int unsigned NOT NULL,
  `to_person_id` int unsigned NOT NULL,
  `amount` decimal(20,2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `settlement_from_person_id` (`from_person_id`) USING BTREE,
  KEY `settlement_to_person_id` (`to_person_id`) USING BTREE,
  CONSTRAINT `settlement_from_person_id` FOREIGN KEY (`from_person_id`) REFERENCES `person` (`id`),
  CONSTRAINT `settlement_to_person_id` FOREIGN KEY (`to_person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
