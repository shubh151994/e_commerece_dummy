# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.19)
# Database: e_commerce
# Generation Time: 2020-06-18 06:24:00 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table tb_carts
# ------------------------------------------------------------

CREATE TABLE `tb_carts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `status` int DEFAULT '0',
  `quantity` int DEFAULT NULL,
  `unit_price` decimal(10,4) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `tb_carts` WRITE;
/*!40000 ALTER TABLE `tb_carts` DISABLE KEYS */;

INSERT INTO `tb_carts` (`id`, `user_id`, `product_id`, `status`, `quantity`, `unit_price`, `created_at`, `updated_at`)
VALUES
	(1,1,1,1,2,125000.0000,'2020-06-16 17:20:10','2020-06-16 17:20:37'),
	(2,1,2,1,2,125000.0000,'2020-06-16 17:20:22','2020-06-16 17:20:22'),
	(3,1,3,1,2,125000.0000,'2020-06-18 11:44:42','2020-06-18 11:44:42');

/*!40000 ALTER TABLE `tb_carts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_products
# ------------------------------------------------------------

CREATE TABLE `tb_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `unit_price` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `tb_products` WRITE;
/*!40000 ALTER TABLE `tb_products` DISABLE KEYS */;

INSERT INTO `tb_products` (`id`, `name`, `category_id`, `created_at`, `updated_at`, `unit_price`)
VALUES
	(1,'TV',1,'2020-06-16 16:38:36','2020-06-16 16:38:36',12500.0000),
	(2,'TV2',2,'2020-06-16 17:12:19','2020-06-16 17:12:19',12500.0000),
	(3,'TV3',2,'2020-06-18 11:45:04','2020-06-18 11:45:04',12500.0000);

/*!40000 ALTER TABLE `tb_products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_users
# ------------------------------------------------------------

CREATE TABLE `tb_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `tb_users` WRITE;
/*!40000 ALTER TABLE `tb_users` DISABLE KEYS */;

INSERT INTO `tb_users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`)
VALUES
	(1,'shubham','shubham','$2b$10$lB7xPTjqbYXYlgojAHRJdOSfHy4JsTf90aNjqK045IEQROKJdNt6C','2020-06-18 10:33:56','2020-06-18 10:33:56');

/*!40000 ALTER TABLE `tb_users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
