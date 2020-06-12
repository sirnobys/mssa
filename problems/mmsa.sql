-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: mmsa
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `problems`
--

DROP TABLE IF EXISTS `problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `staff_student_id` varchar(20) NOT NULL,
  `email` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone` varchar(20) NOT NULL,
  `issue` text NOT NULL,
  `assigned_to` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `completed` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problems`
--

LOCK TABLES `problems` WRITE;
/*!40000 ALTER TABLE `problems` DISABLE KEYS */;
INSERT INTO `problems` VALUES (1,'kojo','123456','kojo@mis.dev','123456789','i have issues with my portal',NULL,NULL),(2,'kobby','123456','kobby@mis.dev','123456789','i have issues with my portal',NULL,NULL),(3,'koko','123456','koko@mis.dev','123456789','i have issues with my portal',NULL,NULL),(4,'kowo','123456','koko@mis.dev','123456789','i have issues with my portal',NULL,NULL),(5,'kawo','12345634','kawo@mis.dev','123456789','cant login',NULL,NULL),(6,'kawo','12345634','kawo@mis.dev','123456789','cant login','kobby',NULL),(7,'sam','19789652','sam@mis.dev','9282743','staff portal issue','kobby',NULL),(8,'sammy','133489652','sammy@mis.dev','9234743','staff portal issue','kobby',NULL),(9,'tuga','445489652','tuga@mis.dev','9233443','staff portal issue','kobby',NULL),(10,'barf','445589652','barf@mis.dev','9236443','staff portal issue','kobby',NULL),(11,'barb','555589652','barb@mis.dev','9456443','staff portal issue','kobby',NULL),(12,'barbera','244589652','barbera@mis.dev','11156443','staff portal issue','kobby',NULL),(13,'barber','566589652','barber@mis.dev','11144443','staff portal issue','kobby',NULL),(14,'barbe','666589652','barbe@mis.dev','11166643','staff portal issue','kobby',1),(15,'kwadwo','33389652','kwadwo@mis.dev','1123343','staff portal issue','kobby',1),(16,'kwad','33383452','kwad@mis.dev','1123343','staff portal issue','kobby',1),(17,'kwa','33383452','kwa@mis.dev','1123343','staff portal issue','kobby',1),(18,'kwaa','33383452','kwaa@mis.dev','1123343','staff portal issue','kobby',1),(19,'kwaad','33383452','kwaad@mis.dev','1123343','staff portal issue','kobby',1),(20,'man','333232452','man@mis.dev','99878675','staff portal issue','kobby',1),(21,'mana','987875673','mana@mis.dev','34868675','staff portal issue','kobby',1);
/*!40000 ALTER TABLE `problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `priority` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (0,'kojo','kojo@mis.dev','12345',1),(1,'kobby','kobby@mis.dev','12345',2),(2,'mike','mike@mis.dev','12345',3);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-12 15:34:41
