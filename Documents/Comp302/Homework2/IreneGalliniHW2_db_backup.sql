/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: igallini
-- ------------------------------------------------------
-- Server version	10.11.13-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookingAgency`
--

DROP TABLE IF EXISTS `bookingAgency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookingAgency` (
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `contactPerson` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookingAgency`
--

LOCK TABLES `bookingAgency` WRITE;
/*!40000 ALTER TABLE `bookingAgency` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookingAgency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance`
--

DROP TABLE IF EXISTS `performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance` (
  `show_relation_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`show_relation_id`,`date`,`time`),
  CONSTRAINT `performance_ibfk_1` FOREIGN KEY (`show_relation_id`) REFERENCES `show_relation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance`
--

LOCK TABLES `performance` WRITE;
/*!40000 ALTER TABLE `performance` DISABLE KEYS */;
/*!40000 ALTER TABLE `performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performer`
--

DROP TABLE IF EXISTS `performer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `performer` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `bookingAgency_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookingAgency_name` (`bookingAgency_name`),
  CONSTRAINT `performer_ibfk_1` FOREIGN KEY (`bookingAgency_name`) REFERENCES `bookingAgency` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performer`
--

LOCK TABLES `performer` WRITE;
/*!40000 ALTER TABLE `performer` DISABLE KEYS */;
/*!40000 ALTER TABLE `performer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `section_id` varchar(10) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`section_id`,`number`),
  CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `id` varchar(10) NOT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_relation`
--

DROP TABLE IF EXISTS `show_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `show_relation` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `performer_id` int(11) DEFAULT NULL,
  `opening_performer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `performer_id` (`performer_id`),
  KEY `opening_performer_id` (`opening_performer_id`),
  CONSTRAINT `show_relation_ibfk_1` FOREIGN KEY (`performer_id`) REFERENCES `performer` (`id`),
  CONSTRAINT `show_relation_ibfk_2` FOREIGN KEY (`opening_performer_id`) REFERENCES `performer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_relation`
--

LOCK TABLES `show_relation` WRITE;
/*!40000 ALTER TABLE `show_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `show_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sold_ticket`
--

DROP TABLE IF EXISTS `sold_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sold_ticket` (
  `ticket_number` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`ticket_number`,`customer_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `sold_ticket_ibfk_1` FOREIGN KEY (`ticket_number`) REFERENCES `ticket` (`number`),
  CONSTRAINT `sold_ticket_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sold_ticket`
--

LOCK TABLES `sold_ticket` WRITE;
/*!40000 ALTER TABLE `sold_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `sold_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `number` int(11) NOT NULL,
  `show_relation_id` int(11) DEFAULT NULL,
  `performance_date` date DEFAULT NULL,
  `performance_time` time DEFAULT NULL,
  `section_id` varchar(10) DEFAULT NULL,
  `seat_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`number`),
  KEY `ticket_ibfk_1` (`show_relation_id`,`performance_date`,`performance_time`),
  KEY `ticket_ibfk_2` (`section_id`,`seat_number`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`show_relation_id`, `performance_date`, `performance_time`) REFERENCES `performance` (`show_relation_id`, `date`, `time`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`section_id`, `seat_number`) REFERENCES `seat` (`section_id`, `number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-14  0:06:08
