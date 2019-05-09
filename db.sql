-- MySQL dump 10.13  Distrib 8.0.16, for Linux (x86_64)
--
-- Host: localhost    Database: QAproject
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Answer`
--

DROP TABLE IF EXISTS `Answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `upvotes` int(11) DEFAULT '0',
  `downvotes` int(11) DEFAULT '0',
  `answered_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `content` blob,
  `is_solution` int(11) DEFAULT '0',
  `question_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`question_id`,`answer_id`),
  KEY `userid` (`userid`),
  KEY `answer_id` (`answer_id`),
  CONSTRAINT `Answer_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `Question` (`question_id`) ON DELETE CASCADE,
  CONSTRAINT `Answer_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `User` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Answer`
--

LOCK TABLES `Answer` WRITE;
/*!40000 ALTER TABLE `Answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Answer_Upvotes`
--

DROP TABLE IF EXISTS `Answer_Upvotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Answer_Upvotes` (
  `question_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`question_id`,`answer_id`,`userid`),
  KEY `userid` (`userid`),
  CONSTRAINT `Answer_Upvotes_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `Question` (`question_id`),
  CONSTRAINT `Answer_Upvotes_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `User` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Answer_Upvotes`
--

LOCK TABLES `Answer_Upvotes` WRITE;
/*!40000 ALTER TABLE `Answer_Upvotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Answer_Upvotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Moderator`
--

DROP TABLE IF EXISTS `Moderator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Moderator` (
  `userid` int(11) NOT NULL,
  `moderator_since` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`userid`),
  CONSTRAINT `Moderator_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `User` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Moderator`
--

LOCK TABLES `Moderator` WRITE;
/*!40000 ALTER TABLE `Moderator` DISABLE KEYS */;
/*!40000 ALTER TABLE `Moderator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Question`
--

DROP TABLE IF EXISTS `Question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Question` (
  `question_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `upvotes` int(11) DEFAULT '0',
  `downvotes` int(11) DEFAULT '0',
  `asked_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `content` blob,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`question_id`),
  KEY `userid` (`userid`),
  CONSTRAINT `Question_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `User` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Question`
--

LOCK TABLES `Question` WRITE;
/*!40000 ALTER TABLE `Question` DISABLE KEYS */;
/*!40000 ALTER TABLE `Question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Question_Upvotes`
--

DROP TABLE IF EXISTS `Question_Upvotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Question_Upvotes` (
  `question_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`question_id`,`userid`),
  KEY `userid` (`userid`),
  CONSTRAINT `Question_Upvotes_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `Question` (`question_id`) ON DELETE CASCADE,
  CONSTRAINT `Question_Upvotes_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `User` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Question_Upvotes`
--

LOCK TABLES `Question_Upvotes` WRITE;
/*!40000 ALTER TABLE `Question_Upvotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Question_Upvotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tag`
--

DROP TABLE IF EXISTS `Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Tag` (
  `Tagname` char(30) NOT NULL,
  `question_count` int(11) DEFAULT '0',
  PRIMARY KEY (`Tagname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tag`
--

LOCK TABLES `Tag` WRITE;
/*!40000 ALTER TABLE `Tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tag_relation`
--

DROP TABLE IF EXISTS `Tag_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Tag_relation` (
  `Tagname1` char(10) NOT NULL,
  `Tagname2` char(10) NOT NULL,
  PRIMARY KEY (`Tagname1`,`Tagname2`),
  KEY `Tagname2` (`Tagname2`),
  CONSTRAINT `Tag_relation_ibfk_1` FOREIGN KEY (`Tagname1`) REFERENCES `Tag` (`Tagname`) ON DELETE CASCADE,
  CONSTRAINT `Tag_relation_ibfk_2` FOREIGN KEY (`Tagname2`) REFERENCES `Tag` (`Tagname`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tag_relation`
--

LOCK TABLES `Tag_relation` WRITE;
/*!40000 ALTER TABLE `Tag_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tag_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tagged`
--

DROP TABLE IF EXISTS `Tagged`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Tagged` (
  `Tagname` char(10) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`Tagname`,`question_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `Tagged_ibfk_1` FOREIGN KEY (`Tagname`) REFERENCES `Tag` (`Tagname`) ON DELETE CASCADE,
  CONSTRAINT `Tagged_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `Question` (`question_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tagged`
--

LOCK TABLES `Tagged` WRITE;
/*!40000 ALTER TABLE `Tagged` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tagged` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `User` (
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `username` varchar(20) NOT NULL,
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `reputation` int(11) DEFAULT '0',
  `user_since` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-08  2:17:58