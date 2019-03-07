start transaction;

drop database if exists `Acme-Madruga`;

create database `Acme-Madruga`;

use 'Acme-Madruga';

create user 'acme-user'@'%' identified by password '*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';

create user 'acme-manager'@'%' identified by password '*FDB8CD304EB2317D10C95D797A4BD7492560F55F';

grant select, insert, update, delete 
	on `Acme-Madruga`.* to 'acme-user'@'%';

grant select, insert, update, delete, create, drop, references, index, alter, 
	create temporary tables, lock tables, create view, create routine, 
	alter routine, execute, trigger, show view 
	on `Acme-Madruga`.* to 'acme-manager'@'%';


-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: Acme-Madruga
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `spammer` bit(1) NOT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `user_account` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_ej7286hj8tdd1f4osp2bjr1ip` (`score`,`spammer`),
  KEY `FK_i7xei45auwq1f6vu25985riuh` (`user_account`),
  CONSTRAINT `FK_i7xei45auwq1f6vu25985riuh` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `spammer` bit(1) NOT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `user_account` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `administratorUK_ej7286hj8tdd1f4osp2bjr1ip` (`score`,`spammer`),
  KEY `FK_7ohwsa2usmvu0yxb44je2lge` (`user_account`),
  CONSTRAINT `FK_7ohwsa2usmvu0yxb44je2lge` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (17,0,'c/Tarfia','luc@gmail.com','Aprobador de','Luis','639854163','https://cdnb.20m.es/sites/76/2015/07/La-an%C3%A9cdota-sobre-la-famosa-e-ic%C3%B3nica-foto-de-Albert-Einstein-sacando-la-lengua.jpeg',NULL,'\0','Depe uno',16);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pictures` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_226rm1fd8fl8ewh0a7n1k8f94` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `box`
--

DROP TABLE IF EXISTS `box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `box` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `system` bit(1) NOT NULL,
  `actor` int(11) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_3g1dt52iwysub5rkt3a4tldoc` (`name`,`system`),
  KEY `FK_2byqkm71y34wbwpwr7s5m0enc` (`parent`),
  CONSTRAINT `FK_2byqkm71y34wbwpwr7s5m0enc` FOREIGN KEY (`parent`) REFERENCES `box` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `box`
--

LOCK TABLES `box` WRITE;
/*!40000 ALTER TABLE `box` DISABLE KEYS */;
INSERT INTO `box` VALUES (18,0,'In box','',17,NULL),(19,0,'Out box','',17,NULL),(20,0,'Trash box','',17,NULL),(21,0,'Notification box','',17,NULL),(22,0,'Spam box','',17,NULL);
/*!40000 ALTER TABLE `box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `box_messages`
--

DROP TABLE IF EXISTS `box_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `box_messages` (
  `box` int(11) NOT NULL,
  `messages` int(11) NOT NULL,
  KEY `FK_acfjrqu1jeixjmv14c0386o0s` (`messages`),
  KEY `FK_e6boieojekgfg919on0dci4na` (`box`),
  CONSTRAINT `FK_e6boieojekgfg919on0dci4na` FOREIGN KEY (`box`) REFERENCES `box` (`id`),
  CONSTRAINT `FK_acfjrqu1jeixjmv14c0386o0s` FOREIGN KEY (`messages`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `box_messages`
--

LOCK TABLES `box_messages` WRITE;
/*!40000 ALTER TABLE `box_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `box_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brotherhood`
--

DROP TABLE IF EXISTS `brotherhood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brotherhood` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `spammer` bit(1) NOT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `user_account` int(11) DEFAULT NULL,
  `establishment_date` date DEFAULT NULL,
  `pictures` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brotherhoodUK_ej7286hj8tdd1f4osp2bjr1ip` (`score`,`spammer`),
  KEY `FK_oku65kpdi3ro8ta0bmmxdkidt` (`area`),
  KEY `FK_j7wkl7fdmmjo3c5wa21wo8nl` (`user_account`),
  CONSTRAINT `FK_j7wkl7fdmmjo3c5wa21wo8nl` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_oku65kpdi3ro8ta0bmmxdkidt` FOREIGN KEY (`area`) REFERENCES `area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brotherhood`
--

LOCK TABLES `brotherhood` WRITE;
/*!40000 ALTER TABLE `brotherhood` DISABLE KEYS */;
/*!40000 ALTER TABLE `brotherhood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `expire_finder_minutes` int(11) DEFAULT NULL,
  `max_finder_results` int(11) DEFAULT NULL,
  `system_name` varchar(255) DEFAULT NULL,
  `welcomeen` varchar(255) DEFAULT NULL,
  `welcomees` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (23,0,'https://image.ibb.co/iuaDgV/Untitled.png','+34',60,10,'Acme Madrugá','Welcome to Acme Madrugá, the site to organise your processions.','¡Bienvenidos a Acme Madrugá! El lugar para organizar tus procesiones.');
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_negative_words`
--

DROP TABLE IF EXISTS `configuration_negative_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_negative_words` (
  `configuration` int(11) NOT NULL,
  `negative_words` varchar(255) DEFAULT NULL,
  KEY `FK_r0hxth0ts0p4clt0dqj8ox9ct` (`configuration`),
  CONSTRAINT `FK_r0hxth0ts0p4clt0dqj8ox9ct` FOREIGN KEY (`configuration`) REFERENCES `configuration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_negative_words`
--

LOCK TABLES `configuration_negative_words` WRITE;
/*!40000 ALTER TABLE `configuration_negative_words` DISABLE KEYS */;
INSERT INTO `configuration_negative_words` VALUES (23,'not'),(23,'bad'),(23,'horrible'),(23,'average'),(23,'disaster'),(23,'no'),(23,'malo'),(23,'mediocre'),(23,'desastre');
/*!40000 ALTER TABLE `configuration_negative_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_positive_words`
--

DROP TABLE IF EXISTS `configuration_positive_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_positive_words` (
  `configuration` int(11) NOT NULL,
  `positive_words` varchar(255) DEFAULT NULL,
  KEY `FK_9p1bsuhu2pk7a0epfi8ujogct` (`configuration`),
  CONSTRAINT `FK_9p1bsuhu2pk7a0epfi8ujogct` FOREIGN KEY (`configuration`) REFERENCES `configuration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_positive_words`
--

LOCK TABLES `configuration_positive_words` WRITE;
/*!40000 ALTER TABLE `configuration_positive_words` DISABLE KEYS */;
INSERT INTO `configuration_positive_words` VALUES (23,'good'),(23,'fantastic'),(23,'excellent'),(23,'great'),(23,'amazing'),(23,'terrific'),(23,'beautiful'),(23,'bueno'),(23,'fantástico'),(23,'excelente'),(23,'increíble'),(23,'genial'),(23,'estupendo'),(23,'hermoso');
/*!40000 ALTER TABLE `configuration_positive_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_priority_list`
--

DROP TABLE IF EXISTS `configuration_priority_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_priority_list` (
  `configuration` int(11) NOT NULL,
  `priority_list` varchar(255) DEFAULT NULL,
  KEY `FK_1cggj8qd4t0xkw1teq9jtgc7j` (`configuration`),
  CONSTRAINT `FK_1cggj8qd4t0xkw1teq9jtgc7j` FOREIGN KEY (`configuration`) REFERENCES `configuration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_priority_list`
--

LOCK TABLES `configuration_priority_list` WRITE;
/*!40000 ALTER TABLE `configuration_priority_list` DISABLE KEYS */;
INSERT INTO `configuration_priority_list` VALUES (23,'HIGH'),(23,'NEUTRAL'),(23,'LOW');
/*!40000 ALTER TABLE `configuration_priority_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_spam_words`
--

DROP TABLE IF EXISTS `configuration_spam_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_spam_words` (
  `configuration` int(11) NOT NULL,
  `spam_words` varchar(255) DEFAULT NULL,
  KEY `FK_qk3m1jkx4rq87ofjee19f3b33` (`configuration`),
  CONSTRAINT `FK_qk3m1jkx4rq87ofjee19f3b33` FOREIGN KEY (`configuration`) REFERENCES `configuration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_spam_words`
--

LOCK TABLES `configuration_spam_words` WRITE;
/*!40000 ALTER TABLE `configuration_spam_words` DISABLE KEYS */;
INSERT INTO `configuration_spam_words` VALUES (23,'sex'),(23,'viagra'),(23,'cialis'),(23,'one million'),(23,'you’ve been selected'),(23,'Nigeria'),(23,'sexo'),(23,'un millón'),(23,'ha sido seleccionado');
/*!40000 ALTER TABLE `configuration_spam_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolment`
--

DROP TABLE IF EXISTS `enrolment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrolment` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `brotherhood_to_member` bit(1) DEFAULT NULL,
  `drop_out_moment` datetime DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `brotherhood` int(11) NOT NULL,
  `member` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_tqo5sr311oiua40gu8r32gnf3` (`drop_out_moment`,`brotherhood_to_member`),
  KEY `FK_kacft8i7jufll7t0nyk68cptn` (`brotherhood`),
  KEY `FK_o5re2u23cjomuht1q0fjmu09u` (`member`),
  KEY `FK_aopae51comq4kt7iadag2ygye` (`position`),
  CONSTRAINT `FK_aopae51comq4kt7iadag2ygye` FOREIGN KEY (`position`) REFERENCES `position` (`id`),
  CONSTRAINT `FK_kacft8i7jufll7t0nyk68cptn` FOREIGN KEY (`brotherhood`) REFERENCES `brotherhood` (`id`),
  CONSTRAINT `FK_o5re2u23cjomuht1q0fjmu09u` FOREIGN KEY (`member`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolment`
--

LOCK TABLES `enrolment` WRITE;
/*!40000 ALTER TABLE `enrolment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrolment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finder`
--

DROP TABLE IF EXISTS `finder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finder` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `key_word` varchar(255) DEFAULT NULL,
  `maximum_date` date DEFAULT NULL,
  `minimum_date` date DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rbjlwj1bksuusd3142rf62xyt` (`area`),
  CONSTRAINT `FK_rbjlwj1bksuusd3142rf62xyt` FOREIGN KEY (`area`) REFERENCES `area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder`
--

LOCK TABLES `finder` WRITE;
/*!40000 ALTER TABLE `finder` DISABLE KEYS */;
/*!40000 ALTER TABLE `finder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finder_processions`
--

DROP TABLE IF EXISTS `finder_processions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finder_processions` (
  `finder` int(11) NOT NULL,
  `processions` int(11) NOT NULL,
  KEY `FK_6p1eb8rm7luhusax3fd8uksw1` (`processions`),
  KEY `FK_1cueuewr7dicti6yua7dv4b6c` (`finder`),
  CONSTRAINT `FK_1cueuewr7dicti6yua7dv4b6c` FOREIGN KEY (`finder`) REFERENCES `finder` (`id`),
  CONSTRAINT `FK_6p1eb8rm7luhusax3fd8uksw1` FOREIGN KEY (`processions`) REFERENCES `procession` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder_processions`
--

LOCK TABLES `finder_processions` WRITE;
/*!40000 ALTER TABLE `finder_processions` DISABLE KEYS */;
/*!40000 ALTER TABLE `finder_processions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `float`
--

DROP TABLE IF EXISTS `float`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `float` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pictures` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `brotherhood` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bmjnirgvwerdv604sfiusq45v` (`brotherhood`),
  CONSTRAINT `FK_bmjnirgvwerdv604sfiusq45v` FOREIGN KEY (`brotherhood`) REFERENCES `brotherhood` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `float`
--

LOCK TABLES `float` WRITE;
/*!40000 ALTER TABLE `float` DISABLE KEYS */;
/*!40000 ALTER TABLE `float` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `float_processions`
--

DROP TABLE IF EXISTS `float_processions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `float_processions` (
  `float` int(11) NOT NULL,
  `processions` int(11) NOT NULL,
  KEY `FK_gd1ui13g3eo5g9p6nvtwbe87h` (`processions`),
  KEY `FK_on4kcweklnu77fc51cwmrvcad` (`float`),
  CONSTRAINT `FK_on4kcweklnu77fc51cwmrvcad` FOREIGN KEY (`float`) REFERENCES `float` (`id`),
  CONSTRAINT `FK_gd1ui13g3eo5g9p6nvtwbe87h` FOREIGN KEY (`processions`) REFERENCES `procession` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `float_processions`
--

LOCK TABLES `float_processions` WRITE;
/*!40000 ALTER TABLE `float_processions` DISABLE KEYS */;
/*!40000 ALTER TABLE `float_processions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('domain_entity',1);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `spammer` bit(1) NOT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `user_account` int(11) DEFAULT NULL,
  `finder` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memberUK_ej7286hj8tdd1f4osp2bjr1ip` (`score`,`spammer`),
  KEY `FK_mjoa5yw12sbvknx53x7fu5a1g` (`finder`),
  KEY `FK_porqrqrfw70onhs6pelgepxhu` (`user_account`),
  CONSTRAINT `FK_porqrqrfw70onhs6pelgepxhu` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_mjoa5yw12sbvknx53x7fu5a1g` FOREIGN KEY (`finder`) REFERENCES `finder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `sent` datetime DEFAULT NULL,
  `spam` bit(1) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `recipient` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_2uvvjlfsow2vfn21bhggf9srx` (`spam`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_boxes`
--

DROP TABLE IF EXISTS `message_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_boxes` (
  `message` int(11) NOT NULL,
  `boxes` int(11) NOT NULL,
  KEY `FK_bf36nibl7ymvifphn4schu94q` (`boxes`),
  KEY `FK_9bwxxmrh9dknwx32c43s1e6hf` (`message`),
  CONSTRAINT `FK_9bwxxmrh9dknwx32c43s1e6hf` FOREIGN KEY (`message`) REFERENCES `message` (`id`),
  CONSTRAINT `FK_bf36nibl7ymvifphn4schu94q` FOREIGN KEY (`boxes`) REFERENCES `box` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_boxes`
--

LOCK TABLES `message_boxes` WRITE;
/*!40000 ALTER TABLE `message_boxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `nameen` varchar(255) DEFAULT NULL,
  `namees` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (24,0,'President','Presidente'),(25,0,'Vice President','Vicepresidente'),(26,0,'Secretary','Secretario'),(27,0,'Treasurer','Tesorero'),(28,0,'Historian','Historiador'),(29,0,'Fundraiser','Promotor'),(30,0,'Officer','Vocal');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procession`
--

DROP TABLE IF EXISTS `procession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procession` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `final_mode` bit(1) DEFAULT NULL,
  `max_column` int(11) DEFAULT NULL,
  `max_row` int(11) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `brotherhood` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sc8hr69nciikog00mms5616f8` (`ticker`),
  KEY `UK_cg6k5u0d93ql8w8ymy0rnxgpf` (`ticker`,`title`,`description`,`moment`,`final_mode`),
  KEY `FK_k1aiqpf52p76km7ua07nlt1go` (`brotherhood`),
  CONSTRAINT `FK_k1aiqpf52p76km7ua07nlt1go` FOREIGN KEY (`brotherhood`) REFERENCES `brotherhood` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procession`
--

LOCK TABLES `procession` WRITE;
/*!40000 ALTER TABLE `procession` DISABLE KEYS */;
/*!40000 ALTER TABLE `procession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procession_floats`
--

DROP TABLE IF EXISTS `procession_floats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procession_floats` (
  `procession` int(11) NOT NULL,
  `floats` int(11) NOT NULL,
  KEY `FK_h2i386rvrj0r7gc5bicglm0ab` (`floats`),
  KEY `FK_3kw2qfesi92aqi13ubidr6ffv` (`procession`),
  CONSTRAINT `FK_3kw2qfesi92aqi13ubidr6ffv` FOREIGN KEY (`procession`) REFERENCES `procession` (`id`),
  CONSTRAINT `FK_h2i386rvrj0r7gc5bicglm0ab` FOREIGN KEY (`floats`) REFERENCES `float` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procession_floats`
--

LOCK TABLES `procession_floats` WRITE;
/*!40000 ALTER TABLE `procession_floats` DISABLE KEYS */;
/*!40000 ALTER TABLE `procession_floats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `custom_column` int(11) DEFAULT NULL,
  `custom_row` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `member` int(11) NOT NULL,
  `procession` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_gtsnidrsylpi5idb2jkk9w9x` (`status`),
  KEY `FK_hgv8wexlup4hjaqo4ki13th8v` (`member`),
  KEY `FK_pihoapjtqc0dtknukqggpxmq6` (`procession`),
  CONSTRAINT `FK_pihoapjtqc0dtknukqggpxmq6` FOREIGN KEY (`procession`) REFERENCES `procession` (`id`),
  CONSTRAINT `FK_hgv8wexlup4hjaqo4ki13th8v` FOREIGN KEY (`member`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_profile`
--

DROP TABLE IF EXISTS `social_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_profile` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `nick` varchar(255) DEFAULT NULL,
  `profile_link` varchar(255) DEFAULT NULL,
  `social_network` varchar(255) DEFAULT NULL,
  `actor` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_profile`
--

LOCK TABLES `social_profile` WRITE;
/*!40000 ALTER TABLE `social_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `banned` bit(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_castjbvpeeus0r8lbpehiu0e4` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES (16,0,NULL,'21232f297a57a5a743894a0e4a801fc3','admin');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account_authorities`
--

DROP TABLE IF EXISTS `user_account_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account_authorities` (
  `user_account` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_pao8cwh93fpccb0bx6ilq6gsl` (`user_account`),
  CONSTRAINT `FK_pao8cwh93fpccb0bx6ilq6gsl` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account_authorities`
--

LOCK TABLES `user_account_authorities` WRITE;
/*!40000 ALTER TABLE `user_account_authorities` DISABLE KEYS */;
INSERT INTO `user_account_authorities` VALUES (16,'ADMIN');
/*!40000 ALTER TABLE `user_account_authorities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-06 22:18:51
commit;