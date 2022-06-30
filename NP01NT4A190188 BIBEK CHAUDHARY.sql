-- MariaDB dump 10.17  Distrib 10.4.10-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: college
-- ------------------------------------------------------
-- Server version	10.4.10-MariaDB

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
-- Table structure for table `attendences`
--

DROP TABLE IF EXISTS `attendences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendences` (
  `attendenceID` int(11) NOT NULL,
  `student` int(11) DEFAULT NULL,
  `offering` int(11) DEFAULT NULL,
  PRIMARY KEY (`attendenceID`),
  KEY `student` (`student`),
  KEY `offering` (`offering`),
  CONSTRAINT `attendences_ibfk_1` FOREIGN KEY (`student`) REFERENCES `students` (`studentID`),
  CONSTRAINT `attendences_ibfk_2` FOREIGN KEY (`offering`) REFERENCES `offerings` (`offeringID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendences`
--

LOCK TABLES `attendences` WRITE;
/*!40000 ALTER TABLE `attendences` DISABLE KEYS */;
INSERT INTO `attendences` VALUES (123,2,5),(321,1,2),(456,5,1),(654,4,3),(789,3,4);
/*!40000 ALTER TABLE `attendences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `courseID` int(11) NOT NULL,
  `cost` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'5000','BBA','aacounting'),(2,'6000','enginering','computer'),(3,'7000','IT','networking'),(4,'8000','engineering','civil'),(5,'9000','BBS','economics');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructors`
--

DROP TABLE IF EXISTS `instructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructors` (
  `instructorID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `salary` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  PRIMARY KEY (`instructorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructors`
--

LOCK TABLES `instructors` WRITE;
/*!40000 ALTER TABLE `instructors` DISABLE KEYS */;
INSERT INTO `instructors` VALUES (1,'tony stark',5000,'nepal'),(2,'hari khadka',6000,'nepal'),(3,'kris wuo',7000,'china'),(4,'bijay sethupati',800,'india'),(5,'adithya verma',9000,'india');
/*!40000 ALTER TABLE `instructors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offerings`
--

DROP TABLE IF EXISTS `offerings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offerings` (
  `offeringID` int(11) NOT NULL,
  `startdate` date NOT NULL,
  `instructor` int(11) DEFAULT NULL,
  `course` int(11) DEFAULT NULL,
  PRIMARY KEY (`offeringID`),
  KEY `instructor` (`instructor`),
  KEY `course` (`course`),
  CONSTRAINT `offerings_ibfk_1` FOREIGN KEY (`instructor`) REFERENCES `instructors` (`instructorID`),
  CONSTRAINT `offerings_ibfk_2` FOREIGN KEY (`course`) REFERENCES `courses` (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offerings`
--

LOCK TABLES `offerings` WRITE;
/*!40000 ALTER TABLE `offerings` DISABLE KEYS */;
INSERT INTO `offerings` VALUES (1,'2019-01-10',4,1),(2,'2019-03-12',5,3),(3,'2019-02-15',1,5),(4,'2019-05-15',3,2),(5,'2019-08-20',2,4);
/*!40000 ALTER TABLE `offerings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `studentID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contactnumber` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  PRIMARY KEY (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'monali thakur','445689','sarlahi','female'),(2,'abhinav sigh','456899','mahotori','male'),(3,'aashish chaudhary','423678','kathmandu','male'),(4,'shusmita thakuri','436654','pokhara','female'),(5,'saroj munal','447688','mustang','male');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-17 17:58:47
