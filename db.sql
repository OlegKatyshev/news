-- MySQL dump 10.13  Distrib 5.5.53, for Win32 (AMD64)
--
-- Host: localhost    Database: news
-- ------------------------------------------------------
-- Server version	5.5.53

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(100) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'Ремонт дорог','Как сообщили в департаменте дорог и благоустройства администрации Перми, 24 июля с 00:00 до 06:00 будет временно прекращено движение всех видов транспорта'),(2,'Выборы президента','18 марта в России прошли выборы президента. РБК следил за явкой и результатами выборов в режиме реального времени'),(3,'Бюджет день города','На день города выделен бюджет в размере 10 000 000 рублей'),(4,'Саратов салют','Саратов отметил салютом присвоение звания Город трудовой доблести'),(5,'МО для детей','В парке на набережной Москвы-реки в Капотне появится пять новых детских площадок'),(6,'Площадка ⁿ1','В парке на набережной Москвы-реки в Капотне появится пять новых детских площадок'),(7,'Площадка ⁿ2','На проспекте Ветеранов в Видном появится семь новых детских площадок'),(8,'Олимпиада 2019','По решению международного антидопингового агентства (WADA) от 9 декабря 2019 года российская команда не будет допущена к участию в Олимпиаде');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubric`
--

DROP TABLE IF EXISTS `rubric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rubric` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubric`
--

LOCK TABLES `rubric` WRITE;
/*!40000 ALTER TABLE `rubric` DISABLE KEYS */;
INSERT INTO `rubric` VALUES (1,'Общество',0),(2,'День города',0),(3,'Спорт',0),(4,'Городская жизнь',1),(5,'Выборы',1),(6,'Салюты',2),(7,'Детская площадка',2),(8,'0-3 года',7),(9,'3-7 года',7);
/*!40000 ALTER TABLE `rubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id_new` int(11) DEFAULT NULL,
  `id_rubric` int(11) DEFAULT NULL,
  KEY `id_new` (`id_new`),
  KEY `id_rubric` (`id_rubric`),
  CONSTRAINT `relations_ibfk_1` FOREIGN KEY (`id_new`) REFERENCES `news` (`id`),
  CONSTRAINT `relations_ibfk_2` FOREIGN KEY (`id_rubric`) REFERENCES `rubric` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES (1,4),(2,5),(3,2),(4,6),(5,7),(6,8),(7,9),(8,3);
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-27 16:25:02
