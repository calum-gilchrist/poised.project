-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: sql8.freemysqlhosting.net    Database: sql8587615
-- ------------------------------------------------------
-- Server version	5.5.62-0ubuntu0.14.04.1

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
-- Table structure for table `architects`
--

DROP TABLE IF EXISTS `architects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `architects` (
  `name` char(50) NOT NULL,
  `phone_number` char(20) DEFAULT NULL,
  `email_address` char(50) DEFAULT NULL,
  `physical_address` char(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `architects`
--

LOCK TABLES `architects` WRITE;
/*!40000 ALTER TABLE `architects` DISABLE KEYS */;
INSERT INTO `architects` VALUES ('Aaron','09343445','aaron@architect.com','Scotland'),('Calum Gilchrist','07772541875','calum@gilchrist.com','My house, Irvine'),('Dominic Smith','07837583746','domsmith@industry.com','The Office, Glasgow'),('John Smith','356456','trbsrtbsr','srtbstrb'),('Lewis Latham','07648937476','lewis@latham.com','Somewhere, Irvine'),('Sam Smith','07659487377','sam@smith.com','The Studio, Glasgow'),('The Architect','9458675','the@architect.com','A Studio, Glasgow');
/*!40000 ALTER TABLE `architects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `name` char(50) NOT NULL,
  `phone_number` char(20) DEFAULT NULL,
  `email_address` char(50) DEFAULT NULL,
  `physical_address` char(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('God knows','3453465','iam@thedevil.com','hell, england'),('Laura Jones','039487432','calum@customer.com','South Pole'),('Mr Mackie','01294 829975','mrmackie@home.com','The Gorbles, Kilwinning, KA2 4BJ'),('Mr Munro','01294 2746453','mikemunro@btinternet.com','Whitehirst Park, Kilwinning, KA2 4BJ'),('Mrs Gary','01294 473629','mrsgary@hotmail.com','85 Fintry Place, Kilwinning, KA7 8GB'),('Mrs Smith','01294 876543','smith@btinternet.com','83 Fintry Place, Kilwinning, KA7 8GB'),('The Customer','07837546387','custom@email.com','A house, somewhere');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engineers`
--

DROP TABLE IF EXISTS `engineers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engineers` (
  `name` char(50) NOT NULL,
  `phone_number` char(20) DEFAULT NULL,
  `email_address` char(50) DEFAULT NULL,
  `physical_address` char(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engineers`
--

LOCK TABLES `engineers` WRITE;
/*!40000 ALTER TABLE `engineers` DISABLE KEYS */;
INSERT INTO `engineers` VALUES ('Adam','34907345','adam@engineer.com','Ireland'),('Irvine Builders','01294 764938','builders@irvine.co.uk','Irvine, North Ayrshire'),('James Anderson','01294 237624','jamesa@builder.co.uk','Kilmarnock, East Ayrshire'),('JRS Construction','764894837','JRS@construct.com','The Moon'),('Marley Construction','01294 678456','marley@construction.com','Marley, East Industrial Estate, Irvine'),('Sam','233445','sam@engineer.com','Glasgow'),('We Are Construction','01563 764867','weare@building.com','Somewhere Else, Kilmarnock');
/*!40000 ALTER TABLE `engineers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poised_projects`
--

DROP TABLE IF EXISTS `poised_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poised_projects` (
  `job_number` int(11) NOT NULL,
  `job_name` char(100) DEFAULT NULL,
  `build_type` char(50) DEFAULT NULL,
  `physical_address` char(255) DEFAULT NULL,
  `erf_number` int(11) DEFAULT NULL,
  `total_fee` double DEFAULT NULL,
  `total_paid` double DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `architect` char(100) DEFAULT NULL,
  `engineer` char(100) DEFAULT NULL,
  `proj_manager` char(100) DEFAULT NULL,
  `customer` char(100) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`job_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poised_projects`
--

LOCK TABLES `poised_projects` WRITE;
/*!40000 ALTER TABLE `poised_projects` DISABLE KEYS */;
INSERT INTO `poised_projects` VALUES (3,'Test Build','Treehouse','arvrv',123,79976,12321,'2016-06-06','John Smith','Adam','Naomi Ash','God knows',1),(12,'New Home','house','27 Carmichael Place, Irvine, North Ayrshire, KA12 0XH',237,215000,104000,'2022-12-25','Calum Gilchrist','James Anderson','Aleksi Warner','Mrs Smith',1),(13,'Renovation','flat','14 Globe Place, Irvine, North Ayrshire, KA11 1JB',836,321000,97000,'2025-04-27','Dominic Smith','We Are Construction','Liam Sergeant','Mr Munro',1),(14,'Old Home','house','4 Maxwood Place, Irvine, North Ayrshire, KA12 9JB',736,150000,140000,'2021-07-15','Lewis Latham','Irvine Builders','Kat Hunter','Mrs Gary',0),(15,'Renovation','house','57 High Street, Irvine, North Ayrshire, KA11 4SU',836,76000,14000,'2019-04-26','Sam Smith','Marley Construction','Jenson Strange','Mr Mackie',1),(16,'Glow','store','65 High Street, Kilmarnock, East Ayrshire, KA4 8JU',123,100000,40000,'2023-08-12','Aaron','JRS Construction','Karina Wade','Laura Jones',0),(19,'My House','Detached House','Irvine, North Ayrshire',23,789987,123321,'2025-08-26','The Architect','Sam','Vicki Barr','The Customer',1);
/*!40000 ALTER TABLE `poised_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_managers`
--

DROP TABLE IF EXISTS `proj_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proj_managers` (
  `name` char(50) NOT NULL,
  `phone_number` char(20) DEFAULT NULL,
  `email_address` char(50) DEFAULT NULL,
  `physical_address` char(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_managers`
--

LOCK TABLES `proj_managers` WRITE;
/*!40000 ALTER TABLE `proj_managers` DISABLE KEYS */;
INSERT INTO `proj_managers` VALUES ('Aleksi Warner','3459873423','aleksi@pjm.com','Irvine'),('Jenson Strange','345398577896','jenson@strange.com','Kilmarnock'),('Karina Wade','58972987','karina@wadepm.com','Glasgow'),('Kat Hunter','52509785','k@hunter.co.uk','Aberdeen'),('Liam Sergeant','345t09785','liam@sergent.co.uk','Ayr'),('Naomi Ash','3450983475','naomiash@management.com','Dundee'),('Vicki Barr','345784432','vickib@rrpjm.com','Skye');
/*!40000 ALTER TABLE `proj_managers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-15 11:46:29
