-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: universitydb
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `studentid` int NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `dateofbirth` date NOT NULL,
  `major` varchar(45) NOT NULL,
  `advisorid` int NOT NULL,
  `email` (45) NOT NULL,
  `gpa` decimal(10,0) NOT NULL,
  PRIMARY KEY (`studentid`),
  FOREIGN KEY (`advisorid`) REFERENCES `staff`(`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `enrollmentid` int NOT NULL,
  `studentid` int NOT NULL,
  `classid` int NOT NULL,
  `semesterid` int NOT NULL,
  `enrollmentdate` Date NOT NULL,
  `grade` char NOT NULL,
  `count` smallint NOT NULL,
  PRIMARY KEY (`enrollmentid`),
  FOREIGN KEY (`studentid`) REFERENCES `students`(`studentid`),
  FOREIGN KEY (`classid`) REFERENCES `classes`(`classid`),
  FOREIGN KEY (`semesterid`) REFERENCES `semester`(`semesterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE TABLE `classes` (
  `classid` int NOT NULL,
  `name` varchar(25) NOT NULL,
  `professorid` int NOT NULL,
  `capacity` smallint NOT NULL,
  `departmentid` int NOT NULL,
  `credits` smallint NOT NULL,
  `description` varchar(100),
  PRIMARY KEY (`classid`),
  FOREIGN KEY (`professsorid`) REFERENCES `professors`(`professorid`),
  FOREIGN KEY (`departmentid`) REFERENCES `department`(`departmentid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `semester` (
  `semesterid` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `startdate` DATE NOT NULL,
  `enddate` DATE NOT NULL,
  `academicyear` YEAR NOT NULL,
  PRIMARY KEY (`semesterid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `staff`(
  `staffid` int NOT NULL,
  `fname` varchar(40) NOT NULL,
  `lname` varchar(40) NOT NULL,
  `role` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `departmentid` int NOT NULL,
  PRIMARY KEY (`staffid`),
  FOREIGN KEY (`departmentid`) REFERENCES `department`(`departmentid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `professors`(
  `professorid` int NOT NULL,
  `fname` varchar(40) NOT NULL,
  `lanme` varchar(40) NOT NULL,
  `departmentid` int NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`professorid`),
  FOREIGN KEY (`departmentid`) REFERENCES `department`(`departmentid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `department`(
  `departmentid` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `departmentheadid` int NOT NULL,
  `location` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`departmentid`),
  FOREIGN KEY (`departmentheadid`) REFERENCES `professors`(`professorid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `students`
--

LOCK TABLE `semester` WRITE;
LOCK TABLE `classes` WRITE;
LOCK TABLE `enrollment` WRITE;
LOCK TABLE `students` WRITE;
LOCK TABLE `staff` WRITE;
LOCK TABLE `professor` WRITE;
LOCK TABLE `department` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLE `classes`;
UNLOCK TABLE `enrollment`;
UNLOCK TABLE `students`;
UNLOCK TABLE `semester`;
UNLOCK TABLE `staff`;
UNLOCK TABLE `professor`;
UNLOCK TABLE `department`; 
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-27  9:50:05
