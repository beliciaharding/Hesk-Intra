-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.6.2-MariaDB-1:10.6.2+maria~focal - mariadb.org binary distribution
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping database structure for hesk
CREATE DATABASE IF NOT EXISTS `hesk` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `hesk`;

CREATE USER 'heskDBUser'@'%' IDENTIFIED BY 'Qqf-S4Ka8!KB5u93_Ty3y$EgNdN9@nfu';

GRANT ALL PRIVILEGES  ON hesk.* TO 'heskDBUser'@'%';
