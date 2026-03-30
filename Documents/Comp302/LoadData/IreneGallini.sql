/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: igallini
-- ------------------------------------------------------
-- Server version       10.11.13-MariaDB-0ubuntu0.24.04.1

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
-- Table structure for table `Assignment`
--

DROP TABLE IF EXISTS `Assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Assignment` (
  `Name` varchar(50) NOT NULL,
  `TotalScore` int(11) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assignment`
--

LOCK TABLES `Assignment` WRITE;
/*!40000 ALTER TABLE `Assignment` DISABLE KEYS */;
INSERT INTO `Assignment` VALUES
('Activity 1 ',20,'activity\r'),
('Activity 2 ',30,'activity'),
('HW 1 ',45,'homework\r'),
('HW2 ',50,'homework\r'),
('HW3 ',53,'homework\r'),
('Project Phase 1',10,'project'),
('Project Phase 2',100,'project'),
('Project Phase 3',100,'project');
/*!40000 ALTER TABLE `Assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IndividualAssignment`
--

DROP TABLE IF EXISTS `IndividualAssignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `IndividualAssignment` (
  `StudentID` int(11) NOT NULL,
  `AssignmentName` varchar(50) NOT NULL,
  `IA_Score` int(11) DEFAULT NULL,
  PRIMARY KEY (`StudentID`,`AssignmentName`),
  KEY `AssignmentName` (`AssignmentName`),
  CONSTRAINT `IndividualAssignment_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`ID`),
  CONSTRAINT `IndividualAssignment_ibfk_2` FOREIGN KEY (`AssignmentName`) REFERENCES `Assignment` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IndividualAssignment`
--

LOCK TABLES `IndividualAssignment` WRITE;
/*!40000 ALTER TABLE `IndividualAssignment` DISABLE KEYS */;
INSERT INTO `IndividualAssignment` VALUES
(102550,'Activity 1',19),
(102550,'Activity 2',28),
(102550,'HW 1',38),
(102550,'HW2',44),
(102550,'HW3',53),
(102551,'Activity 1',19),
(102551,'Activity 2',28),
(102551,'HW 1',38),
(102551,'HW2',47),
(102551,'HW3',53),
(102552,'Activity 1',19),
(102552,'Activity 2',28),
(102552,'HW 1',38),
(102552,'HW2',38),
(102552,'HW3',53),
(102553,'Activity 1',16),
(102553,'Activity 2',30),
(102553,'HW 1',42),
(102553,'HW2',44),
(102553,'HW3',43),
(102554,'Activity 1',16),
(102554,'Activity 2',30),
(102554,'HW 1',42),
(102554,'HW2',48),
(102554,'HW3',43),
(102555,'Activity 1',16),
(102555,'Activity 2',30),
(102555,'HW 1',42),
(102555,'HW2',50),
(102555,'HW3',43);
/*!40000 ALTER TABLE `IndividualAssignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProjectPhase`
--

DROP TABLE IF EXISTS `ProjectPhase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProjectPhase` (
  `ID` int(11) NOT NULL,
  `TotalScore` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProjectPhase`
--

LOCK TABLES `ProjectPhase` WRITE;
/*!40000 ALTER TABLE `ProjectPhase` DISABLE KEYS */;
INSERT INTO `ProjectPhase` VALUES
(1,10),
(2,100),
(3,100);
/*!40000 ALTER TABLE `ProjectPhase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Student` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `GraduatingYear` varchar(50) DEFAULT NULL,
  `teamNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `teamNumber` (`teamNumber`),
  CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`teamNumber`) REFERENCES `Team` (`Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES
(102550,'George Washington Carver','Senior',1),
(102551,'Shirley Jackson','Senior',1),
(102552,'Lewis Latimer','Junior',1),
(102553,'Marie Van Brittan Brown','Sophomore',2),
(102554,'Otis Boykin','Sophomore',2),
(102555,'Marian R. Croak','Junior',2);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Team`
--

DROP TABLE IF EXISTS `Team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Team` (
  `Number` int(11) NOT NULL,
  PRIMARY KEY (`Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Team`
--

LOCK TABLES `Team` WRITE;
/*!40000 ALTER TABLE `Team` DISABLE KEYS */;
INSERT INTO `Team` VALUES
(1),
(2);
/*!40000 ALTER TABLE `Team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TeamAssignment`
--

DROP TABLE IF EXISTS `TeamAssignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TeamAssignment` (
  `TeamNumber` int(11) NOT NULL,
  `AssignmentName` varchar(50) NOT NULL,
  `TA_Score` int(11) DEFAULT NULL,
  PRIMARY KEY (`TeamNumber`,`AssignmentName`),
  KEY `AssignmentName` (`AssignmentName`),
  CONSTRAINT `TeamAssignment_ibfk_1` FOREIGN KEY (`TeamNumber`) REFERENCES `Team` (`Number`),
  CONSTRAINT `TeamAssignment_ibfk_2` FOREIGN KEY (`AssignmentName`) REFERENCES `Assignment` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TeamAssignment`
--

LOCK TABLES `TeamAssignment` WRITE;
/*!40000 ALTER TABLE `TeamAssignment` DISABLE KEYS */;
INSERT INTO `TeamAssignment` VALUES
(1,'Project Phase 1',8),
(1,'Project Phase 2',90),
(1,'Project Phase 3',100),
(2,'Project Phase 1',6),
(2,'Project Phase 2',100),
(2,'Project Phase 3',95);
/*!40000 ALTER TABLE `TeamAssignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TeamProjectPhase`
--

DROP TABLE IF EXISTS `TeamProjectPhase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TeamProjectPhase` (
  `TeamNumber` int(11) NOT NULL,
  `PhaseID` int(11) NOT NULL,
  PRIMARY KEY (`TeamNumber`,`PhaseID`),
  KEY `PhaseID` (`PhaseID`),
  CONSTRAINT `TeamProjectPhase_ibfk_1` FOREIGN KEY (`TeamNumber`) REFERENCES `Team` (`Number`),
  CONSTRAINT `TeamProjectPhase_ibfk_2` FOREIGN KEY (`PhaseID`) REFERENCES `ProjectPhase` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TeamProjectPhase`
--

LOCK TABLES `TeamProjectPhase` WRITE;
/*!40000 ALTER TABLE `TeamProjectPhase` DISABLE KEYS */;
INSERT INTO `TeamProjectPhase` VALUES
(1,1),
(1,2),
(1,3),
(2,1),
(2,2),
(2,3);
/*!40000 ALTER TABLE `TeamProjectPhase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `birth_mother`
--

DROP TABLE IF EXISTS `birth_mother`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `birth_mother` (
  `ID` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birth_mother`
--

LOCK TABLES `birth_mother` WRITE;
/*!40000 ALTER TABLE `birth_mother` DISABLE KEYS */;
/*!40000 ALTER TABLE `birth_mother` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `child`
--

DROP TABLE IF EXISTS `child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `child` (
  `mother_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`mother_id`,`first_name`),
  CONSTRAINT `fk_mother` FOREIGN KEY (`mother_id`) REFERENCES `birth_mother` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `child`
--

LOCK TABLES `child` WRITE;
/*!40000 ALTER TABLE `child` DISABLE KEYS */;
/*!40000 ALTER TABLE `child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `division` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `region_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`,`region_ID`),
  KEY `region_ID` (`region_ID`),
  CONSTRAINT `division_ibfk_1` FOREIGN KEY (`region_ID`) REFERENCES `region` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES
(1,'\"Macalester\"',1),
(2,'\"St Catherine\"',1),
(3,'\"University of Minnesota\"',2);
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `ID` int(11) NOT NULL,
  `budget` decimal(13,4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES
(1,200000.0000),
(2,6000000.0000),
(3,12000000.0000);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-21  4:56:28