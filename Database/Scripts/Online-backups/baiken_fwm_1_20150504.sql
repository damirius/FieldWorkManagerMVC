-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: 10.123.0.52    Database: baiken_fwm_1
-- ------------------------------------------------------
-- Server version	5.5.5-10.0.17-MariaDB-log

DROP SCHEMA IF EXISTS `baiken_fwm_1`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
-- Database: `baiken_fwm_1`
CREATE DATABASE IF NOT EXISTS `baiken_fwm_1` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `baiken_fwm_1`;


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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL COMMENT 'Foreign key => project',
  `client_company_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_contact_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_contact_phone` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_contact_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  KEY `fk_client_project` (`project_id`),
  CONSTRAINT `fk_client_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,1,'Comp','','','',''),(2,2,'Field Work Manager','Austin, TX','Brian Aiken','','baiken@fieldworkmanager.com'),(4,4,'Storm Water Helper','Austin, TX\nCountry','Brian Aiken','','baiken@fieldworkmanager.com'),(9,9,'Field Work Manager','Austin, TX','BSA','',''),(33,33,'Field Work Manager','Prescott Valley, AZ','Brian Aiken','','baiken@fieldworkmanager.com'),(41,41,'Client 870','870 Av of There\nCity\nCountry','','800064358',''),(42,42,'Field Work Manager','Austin, TX','Brian Aiken','','baiken@fieldworkmanager.com'),(112,125,'Client 583','583 Av of There\nCity\nCountry','','714380018',''),(117,130,'Client 875','875 Av of There\nCity\nCountry','','50198322',''),(124,137,'Client 97a','97 Av of There\nCity\nCountry','a','331075364a','a'),(127,140,'Client 494','494 Av of There\nCity\nCountry','John Halloran','312863482','john.devtechnosys'),(128,141,'Client 831','831 Av of There\nCity\nCountry','Nr. Mane','918644496',''),(136,149,'Field Work Manager','','Brian Aiken','5123004278',''),(137,150,'Client 51','51 Somewhere','','549166566',''),(138,151,'Client 125','125 Somewhere','','978483322','A@b.net'),(139,152,'Client 84','84 Somewhere','','446017336','client@client.com');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_field_analyte`
--

DROP TABLE IF EXISTS `common_field_analyte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_field_analyte` (
  `common_field_analyte_id` int(11) NOT NULL AUTO_INCREMENT,
  `common_field_analyte_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`common_field_analyte_id`),
  UNIQUE KEY `un_cfa` (`common_field_analyte_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_field_analyte`
--

LOCK TABLES `common_field_analyte` WRITE;
/*!40000 ALTER TABLE `common_field_analyte` DISABLE KEYS */;
INSERT INTO `common_field_analyte` VALUES (3,'Common analyte upload 4-20-2015 test'),(4,'Common analyte upload 4-20-2015 testa'),(1,'Dissolved Oxygen (mg/L) (duplicate)'),(2,'Ferrous Iron (mg/L)');
/*!40000 ALTER TABLE `common_field_analyte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_lab_analyte`
--

DROP TABLE IF EXISTS `common_lab_analyte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_lab_analyte` (
  `common_lab_analyte_id` int(11) NOT NULL AUTO_INCREMENT,
  `common_lab_analyte_category_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `common_lab_analyte_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`common_lab_analyte_id`),
  UNIQUE KEY `un_cla` (`common_lab_analyte_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_lab_analyte`
--

LOCK TABLES `common_lab_analyte` WRITE;
/*!40000 ALTER TABLE `common_lab_analyte` DISABLE KEYS */;
INSERT INTO `common_lab_analyte` VALUES (1,'Groundwater','VOCs'),(2,'Groundwater','BTEX'),(3,'Surface Water','Total metals'),(4,'Surface Water','BOD'),(5,'4-20-2015 common analyte ','4-20-2015 common analyte upload test'),(6,'4-20-2015 common analyte ','4-20-2015 common analyte upload testa');
/*!40000 ALTER TABLE `common_lab_analyte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion`
--

DROP TABLE IF EXISTS `discussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussion` (
  `discussion_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `discussion_start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`discussion_id`),
  KEY `fk_discussion_task` (`task_id`),
  CONSTRAINT `fk_discussion_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion`
--

LOCK TABLES `discussion` WRITE;
/*!40000 ALTER TABLE `discussion` DISABLE KEYS */;
INSERT INTO `discussion` VALUES (1,65,'2015-04-29 04:44:58');
/*!40000 ALTER TABLE `discussion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion_content`
--

DROP TABLE IF EXISTS `discussion_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussion_content` (
  `discussion_content_id` int(11) NOT NULL AUTO_INCREMENT,
  `discussion_content_message` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The message sent',
  `discussion_content_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `discussion_person_id` int(11) NOT NULL,
  PRIMARY KEY (`discussion_content_id`),
  KEY `fk_dc_discussion_person` (`discussion_person_id`),
  CONSTRAINT `fk_dc_discussion_person` FOREIGN KEY (`discussion_person_id`) REFERENCES `discussion_person` (`discussion_person_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion_content`
--

LOCK TABLES `discussion_content` WRITE;
/*!40000 ALTER TABLE `discussion_content` DISABLE KEYS */;
INSERT INTO `discussion_content` VALUES (1,'blablabla','2015-04-29 04:45:24',1);
/*!40000 ALTER TABLE `discussion_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion_person`
--

DROP TABLE IF EXISTS `discussion_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussion_person` (
  `discussion_person_id` int(11) NOT NULL AUTO_INCREMENT,
  `discussion_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `discussion_person_is_author` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Set to 1 when the person is the one who created the discussion',
  PRIMARY KEY (`discussion_person_id`),
  KEY `fk_dp_discussion` (`discussion_id`),
  KEY `fk_dp_user` (`user_id`),
  CONSTRAINT `fk_dp_discussion` FOREIGN KEY (`discussion_id`) REFERENCES `discussion` (`discussion_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dp_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion_person`
--

LOCK TABLES `discussion_person` WRITE;
/*!40000 ALTER TABLE `discussion_person` DISABLE KEYS */;
INSERT INTO `discussion_person` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `discussion_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `document_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_content_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Store the content type of the document (https://docs.google.com/spreadsheets/d/1NZTuQ974YlxW5u1huzFjvFCpFFWSU08wFNF3AcgWRa8)',
  `document_category` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Is the name of the table/class for which we want a document. Possible values (13-01-14): location, technician',
  `document_value` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `document_size` int(11) NOT NULL COMMENT 'File size in Kb',
  `document_title` varchar(250) COLLATE utf8_unicode_ci DEFAULT 'Caption goes here' COMMENT 'This is the value for a document that is displayed in the HTML as a caption',
  PRIMARY KEY (`document_id`),
  UNIQUE KEY `un_doc_cat_val` (`document_id`,`document_category`,`document_value`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES (1,'png','location_id','247_0f1a1001-0546-499e-a247-3f540767a161.png',56,'Caption goes here'),(3,'png','location_id','278_6fc35ee9-af54-4a43-8081-eadb12b46872.png',181,'Screen shot 2014-09-06 at 14.05.47.png'),(4,'jpg','technician_id','36_18b2d2fb-5d8a-4df9-a002-a24da6469625.jpg',2664,'go-kart_-_07.jpg'),(5,'jpg','location_id','61_a25b491a-3b45-4c13-9cd2-45d48152a255.jpg',621,'Wild Cave.jpg'),(6,'jpg','location_id','61_21a957a4-88c4-4004-b64d-dbb1b4ee3738.jpg',1776,'Hot_springs_with_kids.JPG'),(7,'png','location_id','272_3fb8b09a-7242-477e-b7e6-f70a22386c98.png',2522,'Screen Shot 2015-03-23 at 9.08.33 PM.png'),(8,'png','location_id','277_907ea810-04dd-4e32-b590-9e5c234436ec.png',2622,'Screen Shot 2015-03-23 at 9.10.57 PM.png'),(10,'jpg','technician_id','62_4f8de7b4-9b37-4676-a1ac-98b6fa9ca129.jpg',201,'April.jpg'),(11,'png','location_id','7_1aedc34f-ed8e-4bfb-92ac-55dcee4054b6.png',2871,'Screen Shot 2015-03-26 at 8.11.12 AM.png'),(12,'jpg','location_id','7_a2a3ea7a-3f90-4c6b-be2b-68b33d119151.jpg',2664,'go-kart_-_07.jpg'),(13,'jpg','location_id','7_e70eba0e-b82e-4b0b-a526-29e0fe9f3c61.jpg',231,'Brian_China_2.JPG'),(14,'jpg','location_id','7_1c66e674-3a3f-4b90-865c-b4af451f76ef.jpg',760,'Test photo'),(15,'jpg','location_id','7_4d70aa16-3368-49ee-a20e-b615e8635d86.jpg',201,'April.jpg'),(16,'jpg','location_id','7_270976c1-3ab9-46da-a525-092ebdc48846.jpg',81,'Add Title First'),(18,'jpg','technician_id','67_bb185647-d749-489c-9010-e02b9b549b7c.jpg',2664,'Test 4-20-2015 Photo'),(19,'jpg','location_id','316_cc8c7538-8a28-45f2-b2b2-c6ac7cf50f51.jpg',642,'TEST LOCATION UPLOAD'),(20,'pdf','task_location','22_fc551ff2-b956-44a2-abf1-e831a45ef0ec.pdf',148,'Well Purge_1'),(21,'pdf','task_location','23_359ac464-b80b-4927-95ef-6aaf238f0e5b.pdf',148,'Well Purge_2'),(22,'pdf','task_location','24_0d55f3b9-5166-43f4-9be3-9fe81b03398b.pdf',148,'Well Purge_3'),(23,'pdf','task_location','22_22b14ff7-4b88-4973-8daa-3ef6f3089fb9.pdf',148,'Well Purge_1'),(24,'pdf','task_location','23_3658badf-cf19-4628-8a80-627af84b0e57.pdf',148,'Well Purge_2'),(25,'pdf','task_location','24_992143ed-f40e-49e1-a881-afd60e4f5130.pdf',148,'Well Purge_3'),(26,'pdf','task_location','35_0382da50-1782-434c-8832-e9de23c19397.pdf',148,'Well Purge_1'),(27,'pdf','task_location','36_8c9e9551-96bf-442d-b8bb-89b3bd585ce9.pdf',148,'Well Purge_2'),(28,'pdf','task_location','37_fdd7914c-4bc7-434b-af18-e3cb61477388.pdf',148,'Well Purge_3'),(29,'pdf','task_location','38_7cfcd9c1-a682-4643-91dc-eae333980655.pdf',148,'Well Purge_2'),(30,'pdf','task_location','39_86934e0b-4ce8-4cbc-a6be-3be810b566b4.pdf',148,'Well Purge_3'),(31,'pdf','task_location','25_5f95c1a6-917a-4aa2-abbd-52e8f0a1f4a7.pdf',98,'Field Sampling_A'),(32,'pdf','task_location','26_af0dcf51-3b37-4001-867f-f83fe4954b99.pdf',98,'Field Sampling_B'),(33,'pdf','task_location','27_81ad3f8e-5a80-4bbf-9c50-a8c984b76744.pdf',98,'Field Sampling_C'),(34,'pdf','task_location','28_befb43b5-fab5-4a89-88c5-cfaa263dcdbf.pdf',98,'Field Sampling_D'),(35,'pdf','task_location','43_6d884239-9e83-4536-928c-d9f802bbb02e.pdf',98,'Field Sampling_Location 6'),(36,'pdf','task_location','44_c651bb5b-0226-49fc-857d-156146afec84.pdf',98,'Field Sampling_Location 7'),(37,'pdf','task_location','34_ff798244-1251-4624-a571-6e577e6517a6.pdf',98,'Field Sampling_Location 6'),(38,'pdf','task_location','30_6ab5db65-5d0e-4a5f-9840-0e47c0c6ed12.pdf',98,'Field Sampling_A'),(39,'pdf','task_location','31_e70cd48a-c514-4feb-b747-cef53382533f.pdf',98,'Field Sampling_B'),(40,'pdf','task_location','32_0e173a21-16a6-4ad2-a56d-6b2cf3593eb8.pdf',98,'Field Sampling_C'),(41,'pdf','task_location','33_f82d1444-a469-41ae-97c3-92a13fad42f1.pdf',98,'Field Sampling_D');
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facility` (
  `facility_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL COMMENT 'Foreign key => project',
  `facility_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `facility_address` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `facility_lat` float(10,6) NOT NULL,
  `facility_long` float(10,6) NOT NULL,
  `facility_contact_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facility_contact_phone` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `facility_contact_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `facility_id_num` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facility_sector` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facility_sic` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `boundary` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`facility_id`),
  KEY `fk_facility_project` (`project_id`),
  CONSTRAINT `fk_facility_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (1,1,'EC-TX','Texas',29.179445,-96.277115,'','','','','','',''),(2,2,'Tempe Dog runs','Tempe, AZ',33.428318,-111.941666,'N/A','','','','','','}|akE|kjjTrdBO?yxE{fDtA'),(4,4,'Centex Mine','Buda, TX\nCountry',30.068968,-97.857910,'','','','','','',''),(9,9,'EC','El Campo, TX',29.181072,-96.278358,'','','','','','',''),(33,33,'No facility','USA',0.000000,0.000000,'','','','','','',''),(41,41,'Facility 870','1405 E. Lockett Rd, Flagstaff, AZ',35.218369,-111.608711,'','','','','','',''),(42,42,'Zilker Park','Austin, TX',30.266886,-97.772926,'','','','','','','erywDx_wsQt[?l@wy@aQr@WeWjMYvn@`Cs@wy@wmA|L'),(115,125,'Facility 583','Austin, TX',30.248165,-97.790825,'','','','','','',''),(120,130,'Facility 875','12 Market Street, San Francisco, CA',37.599998,-95.665001,'','','','','','',''),(126,137,'Facility 97','95 wayward lane\nIna, Georgia',34.009060,-84.319473,'','','','','','',''),(129,140,'Facility 494','494 St of Somewhere\nCity\nCountry',26.912434,75.787270,'John Halloran','skype john.d','john@devtechnosys.com','','','',''),(130,141,'Facility 831','Fishing, in Arizona',34.048927,-111.093735,'','','','','','',''),(138,149,'Facility 441','Omaha, Nebraska',41.252361,-95.997986,'','','','','','',''),(139,150,'Facility 51','USA',37.090240,-95.712891,'','','','','','',''),(140,151,'Facility 125','Duluth, MI',42.593601,-82.835892,'RTe`est ` quote escape','','','','','',''),(141,152,'Facility 84','USA',37.090240,-95.712891,'','','','','','','');
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_analyte`
--

DROP TABLE IF EXISTS `field_analyte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_analyte` (
  `field_analyte_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_analyte_name_unit` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `pm_id` int(11) NOT NULL COMMENT 'Foreign key => project_manager',
  PRIMARY KEY (`field_analyte_id`),
  UNIQUE KEY `un_fa` (`pm_id`,`field_analyte_name_unit`),
  KEY `fk_field_analyte_pm` (`pm_id`),
  CONSTRAINT `fk_field_analyte_pm` FOREIGN KEY (`pm_id`) REFERENCES `project_manager` (`pm_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_analyte`
--

LOCK TABLES `field_analyte` WRITE;
/*!40000 ALTER TABLE `field_analyte` DISABLE KEYS */;
INSERT INTO `field_analyte` VALUES (61,'Common analyte upload 4-20-2015 test',1),(58,'Dissolved Oxygen (mg/L) (duplicate)',1),(59,'Ferrous Iron (mg/L)',1),(63,'New 1',1),(64,'New 2',1),(60,'TDS',1),(18,'Dissolved Oxygen (mg/L)',3),(19,'Ferrous Iron (mg/L)',3),(50,'Ferrous Iron (mg/L)',4),(51,'New field analyte 1',4),(47,'Sniff Test1',4),(43,'Dissolved Oxygen (mg/L)',7),(46,'Ferrous Iron (mg/L)',7),(53,'DO',8),(54,'Fe2+',8),(55,'ORP',8),(56,'Dissolved Oxygen (mg/L) (duplicate)',19),(57,'Ferrous Iron (mg/L)',19);
/*!40000 ALTER TABLE `field_analyte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_analyte_location`
--

DROP TABLE IF EXISTS `field_analyte_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_analyte_location` (
  `task_id` int(11) NOT NULL,
  `field_analyte_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  KEY `fk_fsm_task` (`task_id`),
  KEY `fk_fsm_field_analyte` (`field_analyte_id`),
  KEY `fk_fsm_location` (`location_id`),
  CONSTRAINT `fk_fsm_field_analyte` FOREIGN KEY (`field_analyte_id`) REFERENCES `field_analyte` (`field_analyte_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fsm_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fsm_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_analyte_location`
--

LOCK TABLES `field_analyte_location` WRITE;
/*!40000 ALTER TABLE `field_analyte_location` DISABLE KEYS */;
INSERT INTO `field_analyte_location` VALUES (62,58,309),(62,59,309),(62,60,309),(62,58,310),(62,59,310),(62,60,310),(62,58,311),(62,60,311),(63,60,312),(63,60,313),(63,60,314),(63,60,315),(63,60,300);
/*!40000 ALTER TABLE `field_analyte_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_analyte`
--

DROP TABLE IF EXISTS `lab_analyte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_analyte` (
  `lab_analyte_id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_analyte_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pm_id` int(11) NOT NULL COMMENT 'Foreign key => project_manager',
  PRIMARY KEY (`lab_analyte_id`),
  UNIQUE KEY `un_la` (`pm_id`,`lab_analyte_name`),
  KEY `fk_lab_analyte_pm` (`pm_id`),
  CONSTRAINT `fk_lab_analyte_pm` FOREIGN KEY (`pm_id`) REFERENCES `project_manager` (`pm_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_analyte`
--

LOCK TABLES `lab_analyte` WRITE;
/*!40000 ALTER TABLE `lab_analyte` DISABLE KEYS */;
INSERT INTO `lab_analyte` VALUES (48,'4-20-2015 common analyte upload test2',1),(49,'4-20-2015 common analyte upload testa',1),(51,'BB',1),(46,'BOD',1),(44,'BTEX',1),(52,'CD',1),(47,'COD',1),(45,'Total metals',1),(43,'VOCs',1),(14,'BOD',3),(15,'Total metals',3),(42,'VOCs',3),(37,'BOD',4),(29,'e-coli',4),(38,'New analyte 1a',4),(28,'BOD',7),(17,'BTEX',7),(26,'Total metals',7),(16,'VOCs',7),(40,'VOCs',8);
/*!40000 ALTER TABLE `lab_analyte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_analyte_location`
--

DROP TABLE IF EXISTS `lab_analyte_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_analyte_location` (
  `task_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `lab_analyte_id` int(11) NOT NULL,
  UNIQUE KEY `un_lal` (`task_id`,`location_id`,`lab_analyte_id`),
  KEY `fk_lal_location` (`location_id`),
  KEY `fk_lal_lab_analyte` (`lab_analyte_id`),
  CONSTRAINT `fk_lal_lab_analyte` FOREIGN KEY (`lab_analyte_id`) REFERENCES `lab_analyte` (`lab_analyte_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lal_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lal_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_analyte_location`
--

LOCK TABLES `lab_analyte_location` WRITE;
/*!40000 ALTER TABLE `lab_analyte_location` DISABLE KEYS */;
INSERT INTO `lab_analyte_location` VALUES (62,309,43),(62,309,45),(62,310,43),(62,310,47),(62,311,43),(62,311,45),(63,300,44),(63,300,46),(63,300,47),(63,312,44),(63,312,46),(63,312,47),(63,313,44),(63,313,46),(63,313,47),(63,314,46),(63,314,47),(63,315,46),(63,315,47);
/*!40000 ALTER TABLE `lab_analyte_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_sample_matrix`
--

DROP TABLE IF EXISTS `lab_sample_matrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_sample_matrix` (
  `task_id` int(11) NOT NULL,
  `lab_analyte_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  KEY `fk_lsm_task` (`task_id`),
  KEY `fk_lsm_lab_analyte` (`lab_analyte_id`),
  KEY `fk_lsm_location` (`location_id`),
  CONSTRAINT `fk_lsm_lab_analyte` FOREIGN KEY (`lab_analyte_id`) REFERENCES `lab_analyte` (`lab_analyte_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lsm_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lsm_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_sample_matrix`
--

LOCK TABLES `lab_sample_matrix` WRITE;
/*!40000 ALTER TABLE `lab_sample_matrix` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_sample_matrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_desc` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_lat` float(10,6) DEFAULT NULL,
  `location_long` float(10,6) DEFAULT NULL,
  `location_active` tinyint(1) NOT NULL DEFAULT '1',
  `location_visible` tinyint(1) NOT NULL DEFAULT '1',
  `project_id` int(11) NOT NULL COMMENT 'Foreign key => project',
  `location_address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_category` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  KEY `fk_loc_project` (`project_id`),
  CONSTRAINT `fk_loc_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (7,'Tempe Beach Park','',33.429966,-111.940262,1,0,2,'',''),(8,'Mitchel Park Dog Run','',33.419724,-111.948189,1,0,2,NULL,NULL),(9,'Vista Del Camino Dog Run','',33.454678,-111.911453,1,0,2,NULL,NULL),(20,'MP1','',33.419582,-111.949837,1,0,2,NULL,NULL),(272,'BSA','House I grew up in.',35.218681,-111.605034,1,0,41,'3206 N Tindle, Flagstaff, AZ',''),(277,'RAR','',35.218269,-111.604668,1,0,41,'',''),(279,'Harkey','',35.218227,-111.605324,1,0,41,'',''),(280,'Avery','',35.218288,-111.604416,1,0,41,'',''),(281,'Paisano','',35.218296,-111.604874,1,0,41,'',''),(282,'Stice','',35.218666,-111.605850,1,0,41,'',''),(283,'Hendricks','',35.218273,-111.605537,1,0,41,'',''),(284,'Klinkenburg','',0.000000,0.000000,1,0,41,'',''),(285,'Patterson','',0.000000,0.000000,1,0,41,'',''),(286,'Rae','',0.000000,0.000000,1,0,41,'',''),(287,'Schaber','',35.219826,-111.608467,1,0,41,'',''),(288,'Curry','',35.219463,-111.605331,1,0,41,'',''),(289,'Smith','',0.000000,0.000000,1,0,41,'',''),(290,'Valverde','',35.219059,-111.604950,1,0,41,'',''),(291,'Heath','',0.000000,0.000000,1,0,41,'',''),(292,'1','',29.179466,-96.285179,0,0,1,'',''),(293,'2','',29.179457,-96.285454,0,0,1,'',''),(294,'3','',29.179409,-96.285713,0,0,1,'',''),(295,'4','',0.000000,0.000000,0,0,1,'',''),(296,'5','',0.000000,0.000000,0,0,1,'',''),(300,'Location 6','',29.178755,-96.285774,1,0,1,'',''),(301,'Location 7','',29.179140,-96.285767,1,0,1,'',''),(302,'Location 1','',0.000000,0.000000,1,0,33,'',''),(303,'Location 2','',0.000000,0.000000,1,0,33,'',''),(304,'Location 3','',0.000000,0.000000,1,0,33,'',''),(305,'1a','',29.179472,-96.284912,0,0,1,'',''),(306,'Location 1','',0.000000,0.000000,1,0,140,'',''),(307,'Location 2','',0.000000,0.000000,1,0,140,'',''),(308,'Location 3','',0.000000,0.000000,1,0,140,'',''),(309,'1','',0.000000,0.000000,1,0,141,'',''),(310,'2','',0.000000,0.000000,1,0,141,'',''),(311,'3','',0.000000,0.000000,1,0,141,'',''),(312,'A','',0.000000,0.000000,1,0,1,'',''),(313,'B','',0.000000,0.000000,1,0,1,'',''),(314,'C','',0.000000,0.000000,1,0,1,'',''),(315,'D','',0.000000,0.000000,1,0,1,'','');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_request_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `log_start` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `log_end` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'FORMAT: Y-m-d H:i:s',
  `log_execution_time` float(10,6) NOT NULL COMMENT 'In milliseconds',
  `log_type` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT 'http_request, controller_method',
  `log_filter` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34310 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (33518,'5540f9936cf1a','2015-04-29 15:32:35','2015-04-29 15:32:35',27.232170,'log_controller_method_request','/task/technicians'),(33519,'5540f9936cf1a','2015-04-29 15:32:35','2015-04-29 15:32:35',76.303963,'log_http_request','/task/technicians'),(33520,'5540f994e9747','2015-04-29 15:32:36','2015-04-29 15:32:37',17.515182,'log_controller_method_request','/task/locations'),(33521,'5540f994e9747','2015-04-29 15:32:36','2015-04-29 15:32:37',66.679955,'log_http_request','/task/locations'),(33522,'5540f99568dfe','2015-04-29 15:32:37','2015-04-29 15:32:37',18.899918,'log_http_request','/favicon.ico'),(33523,'5540f995ecb5f','2015-04-29 15:32:37','2015-04-29 15:32:38',15.806913,'log_http_request','/favicon.ico'),(33524,'5540f996d37bd','2015-04-29 15:32:38','2015-04-29 15:32:38',69.177864,'log_controller_method_request','/task/forms'),(33525,'5540f996d37bd','2015-04-29 15:32:38','2015-04-29 15:32:39',125.004051,'log_http_request','/task/forms'),(33526,'5540f99781499','2015-04-29 15:32:39','2015-04-29 15:32:39',13.527870,'log_http_request','/favicon.ico'),(33527,'5540f99eac6b7','2015-04-29 15:32:46','2015-04-29 15:32:46',5.027056,'log_controller_method_request','/task/form/updateItems'),(33528,'5540f99eac6b7','2015-04-29 15:32:46','2015-04-29 15:32:46',29.976845,'log_http_request','/task/form/updateItems'),(33529,'5540f99eeff74','2015-04-29 15:32:47','2015-04-29 15:32:47',20.594835,'log_controller_method_request','/task/forms'),(33530,'5540f99eeff74','2015-04-29 15:32:47','2015-04-29 15:32:47',53.026917,'log_http_request','/task/forms'),(33531,'5540f99f8149d','2015-04-29 15:32:47','2015-04-29 15:32:47',13.046980,'log_http_request','/favicon.ico'),(33532,'5540f9a25b0a1','2015-04-29 15:32:50','2015-04-29 15:32:50',18.829823,'log_controller_method_request','/task/locations'),(33533,'5540f9a25b0a1','2015-04-29 15:32:50','2015-04-29 15:32:50',57.015896,'log_http_request','/task/locations'),(33534,'5540f9a2bf235','2015-04-29 15:32:50','2015-04-29 15:32:50',19.430876,'log_http_request','/favicon.ico'),(33535,'5540f9a42b068','2015-04-29 15:32:52','2015-04-29 15:32:52',16.283035,'log_controller_method_request','/task/technicians'),(33536,'5540f9a42b068','2015-04-29 15:32:52','2015-04-29 15:32:52',59.985161,'log_http_request','/task/technicians'),(33537,'5540f9a4814a1','2015-04-29 15:32:52','2015-04-29 15:32:52',20.123005,'log_http_request','/favicon.ico'),(33538,'5540f9a68f1f8','2015-04-29 15:32:54','2015-04-29 15:32:54',13.131142,'log_controller_method_request','/task/showForm'),(33539,'5540f9a68f1f8','2015-04-29 15:32:54','2015-04-29 15:32:54',43.199062,'log_http_request','/task/showForm'),(33540,'5540f9a6ecb5e','2015-04-29 15:32:55','2015-04-29 15:32:55',1.418114,'log_controller_method_request','/task/getItem'),(33541,'5540f9a6ecb5e','2015-04-29 15:32:54','2015-04-29 15:32:55',30.888081,'log_http_request','/task/getItem'),(33542,'5540f9a715de9','2015-04-29 15:32:55','2015-04-29 15:32:55',11.883020,'log_http_request','/favicon.ico'),(33543,'5540f9aa78561','2015-04-29 15:32:58','2015-04-29 15:32:58',11.692047,'log_controller_method_request','/task/edit'),(33544,'5540f9aa78561','2015-04-29 15:32:58','2015-04-29 15:32:58',48.799992,'log_http_request','/task/edit'),(33545,'5540f9abcc289','2015-04-29 15:32:59','2015-04-29 15:32:59',26.988029,'log_http_request','/task'),(33546,'5540f9ac0f5b2','2015-04-29 15:33:00','2015-04-29 15:33:00',13.932943,'log_controller_method_request','/task/showForm'),(33547,'5540f9ac0f5b2','2015-04-29 15:33:00','2015-04-29 15:33:00',51.743984,'log_http_request','/task/showForm'),(33548,'5540f9ac6cf19','2015-04-29 15:33:00','2015-04-29 15:33:00',1.972914,'log_controller_method_request','/task/getItem'),(33549,'5540f9ac6cf19','2015-04-29 15:33:00','2015-04-29 15:33:00',33.502102,'log_http_request','/task/getItem'),(33550,'5540f9ac889ce','2015-04-29 15:33:00','2015-04-29 15:33:00',18.819094,'log_http_request','/favicon.ico'),(33551,'5540f9c35145f','2015-04-29 15:33:23','2015-04-29 15:33:23',13.936043,'log_controller_method_request','/task/listAll'),(33552,'5540f9c35145f','2015-04-29 15:33:23','2015-04-29 15:33:23',68.276878,'log_http_request','/task/listAll'),(33553,'5540f9c3b14de','2015-04-29 15:33:23','2015-04-29 15:33:23',16.857862,'log_http_request','/favicon.ico'),(33554,'5540f9cae492c','2015-04-29 15:33:30','2015-04-29 15:33:31',74.219940,'log_controller_method_request','/task/updateItems'),(33555,'5540f9cae492c','2015-04-29 15:33:30','2015-04-29 15:33:31',113.248108,'log_http_request','/task/updateItems'),(33556,'5540f9cb4c642','2015-04-29 15:33:31','2015-04-29 15:33:31',6.680012,'log_controller_method_request','/task/listAll'),(33557,'5540f9cb4c642','2015-04-29 15:33:31','2015-04-29 15:33:31',40.985825,'log_http_request','/task/listAll'),(33558,'5540f9cbad3d2','2015-04-29 15:33:31','2015-04-29 15:33:31',19.042969,'log_http_request','/favicon.ico'),(33559,'5540f9ce52165','2015-04-29 15:33:34','2015-04-29 15:33:34',6.617069,'log_controller_method_request','/activetask/showForm'),(33560,'5540f9ce52165','2015-04-29 15:33:34','2015-04-29 15:33:34',49.463036,'log_http_request','/activetask/showForm'),(33561,'5540f9cea929b','2015-04-29 15:33:34','2015-04-29 15:33:34',4.786015,'log_controller_method_request','/activetask/getNotes'),(33562,'5540f9cea929b','2015-04-29 15:33:34','2015-04-29 15:33:34',33.110855,'log_http_request','/activetask/getNotes'),(33563,'5540f9cec9b72','2015-04-29 15:33:34','2015-04-29 15:33:34',12.366056,'log_http_request','/favicon.ico'),(33564,'5540f9d123b31','2015-04-29 15:33:37','2015-04-29 15:33:37',12.818098,'log_controller_method_request','/activetask/forms'),(33565,'5540f9d123b31','2015-04-29 15:33:37','2015-04-29 15:33:37',58.844090,'log_http_request','/activetask/forms'),(33566,'5540f9d18219f','2015-04-29 15:33:37','2015-04-29 15:33:37',19.693851,'log_http_request','/favicon.ico'),(33567,'5540fb2feff47','2015-04-29 15:39:28','2015-04-29 15:39:28',11.770964,'log_controller_method_request','/task/listAll'),(33568,'5540fb2feff47','2015-04-29 15:39:28','2015-04-29 15:39:28',92.459915,'log_http_request','/task/listAll'),(33569,'5540fb30c674c','2015-04-29 15:39:28','2015-04-29 15:39:28',24.176121,'log_http_request','/favicon.ico'),(33570,'5540fb34ce972','2015-04-29 15:39:32','2015-04-29 15:39:32',33.722878,'log_controller_method_request','/task/showForm'),(33571,'5540fb34ce972','2015-04-29 15:39:32','2015-04-29 15:39:32',73.222160,'log_http_request','/task/showForm'),(33572,'5540fb3552e4b','2015-04-29 15:39:33','2015-04-29 15:39:33',2.615929,'log_controller_method_request','/task/getItem'),(33573,'5540fb3552e4b','2015-04-29 15:39:33','2015-04-29 15:39:33',41.972878,'log_http_request','/task/getItem'),(33574,'5540fb3663fb6','2015-04-29 15:39:34','2015-04-29 15:39:34',21.516085,'log_http_request','/favicon.ico'),(33575,'5540fb3b8f1cc','2015-04-29 15:39:39','2015-04-29 15:39:39',17.012119,'log_controller_method_request','/task/edit'),(33576,'5540fb3b8f1cc','2015-04-29 15:39:39','2015-04-29 15:39:39',50.435780,'log_http_request','/task/edit'),(33577,'5540fb3cebe2f','2015-04-29 15:39:40','2015-04-29 15:39:41',28.007030,'log_http_request','/task'),(33578,'5540fb3d2ca49','2015-04-29 15:39:41','2015-04-29 15:39:41',21.126032,'log_controller_method_request','/task/showForm'),(33579,'5540fb3d2ca49','2015-04-29 15:39:41','2015-04-29 15:39:41',68.026070,'log_http_request','/task/showForm'),(33580,'5540fb3d8d7c9','2015-04-29 15:39:41','2015-04-29 15:39:41',1.299858,'log_controller_method_request','/task/getItem'),(33581,'5540fb3d8d7c9','2015-04-29 15:39:41','2015-04-29 15:39:41',34.106014,'log_http_request','/task/getItem'),(33582,'5540fb3e96700','2015-04-29 15:39:42','2015-04-29 15:39:42',18.192053,'log_http_request','/favicon.ico'),(33583,'5540fb3ed78a9','2015-04-29 15:39:42','2015-04-29 15:39:42',25.470972,'log_controller_method_request','/task/forms'),(33584,'5540fb3ed78a9','2015-04-29 15:39:42','2015-04-29 15:39:42',66.193108,'log_http_request','/task/forms'),(33585,'5540fb3f41cd6','2015-04-29 15:39:43','2015-04-29 15:39:43',19.813061,'log_http_request','/favicon.ico'),(33586,'5540fb430734e','2015-04-29 15:39:47','2015-04-29 15:39:47',5.355120,'log_controller_method_request','/task/form/updateItems'),(33587,'5540fb430734e','2015-04-29 15:39:47','2015-04-29 15:39:47',30.349970,'log_http_request','/task/form/updateItems'),(33588,'5540fb43450e7','2015-04-29 15:39:47','2015-04-29 15:39:47',20.385027,'log_controller_method_request','/task/forms'),(33589,'5540fb43450e7','2015-04-29 15:39:47','2015-04-29 15:39:47',59.288979,'log_http_request','/task/forms'),(33590,'5540fb43a4465','2015-04-29 15:39:47','2015-04-29 15:39:47',13.553858,'log_http_request','/favicon.ico'),(33591,'5540fb463dbbd','2015-04-29 15:39:50','2015-04-29 15:39:50',15.000105,'log_controller_method_request','/task/locations'),(33592,'5540fb463dbbd','2015-04-29 15:39:50','2015-04-29 15:39:50',54.008961,'log_http_request','/task/locations'),(33593,'5540fb468bdb9','2015-04-29 15:39:50','2015-04-29 15:39:50',16.157150,'log_controller_method_request','/task/locations'),(33594,'5540fb468bdb9','2015-04-29 15:39:50','2015-04-29 15:39:50',45.890808,'log_http_request','/task/locations'),(33595,'5540fb46e8a1a','2015-04-29 15:39:50','2015-04-29 15:39:50',18.793821,'log_http_request','/favicon.ico'),(33596,'5540fb4c97404','2015-04-29 15:39:56','2015-04-29 15:39:56',12.289047,'log_controller_method_request','/task/location/updateItems'),(33597,'5540fb4c97404','2015-04-29 15:39:56','2015-04-29 15:39:56',47.179935,'log_http_request','/task/location/updateItems'),(33598,'5540fb4cd9fb8','2015-04-29 15:39:56','2015-04-29 15:39:56',14.708996,'log_controller_method_request','/task/locations'),(33599,'5540fb4cd9fb8','2015-04-29 15:39:56','2015-04-29 15:39:56',48.882961,'log_http_request','/task/locations'),(33600,'5540fb4d50735','2015-04-29 15:39:57','2015-04-29 15:39:57',19.414186,'log_http_request','/favicon.ico'),(33601,'5540fb51177d0','2015-04-29 15:40:01','2015-04-29 15:40:01',19.094944,'log_controller_method_request','/task/showForm'),(33602,'5540fb51177d0','2015-04-29 15:40:01','2015-04-29 15:40:01',58.604958,'log_http_request','/task/showForm'),(33603,'5540fb5179f51','2015-04-29 15:40:01','2015-04-29 15:40:01',1.334906,'log_controller_method_request','/task/getItem'),(33604,'5540fb5179f51','2015-04-29 15:40:01','2015-04-29 15:40:01',33.395054,'log_http_request','/task/getItem'),(33605,'5540fb5199b14','2015-04-29 15:40:01','2015-04-29 15:40:01',15.781879,'log_http_request','/favicon.ico'),(33606,'5540fb53e7028','2015-04-29 15:40:03','2015-04-29 15:40:03',10.072947,'log_controller_method_request','/task/edit'),(33607,'5540fb53e7028','2015-04-29 15:40:03','2015-04-29 15:40:03',39.130924,'log_http_request','/task/edit'),(33608,'5540fb5499b16','2015-04-29 15:40:04','2015-04-29 15:40:04',7.401943,'log_controller_method_request','/task/edit'),(33609,'5540fb5499b16','2015-04-29 15:40:04','2015-04-29 15:40:04',34.534931,'log_http_request','/task/edit'),(33610,'5540fb55e700f','2015-04-29 15:40:05','2015-04-29 15:40:05',34.034966,'log_http_request','/task'),(33611,'5540fb5631867','2015-04-29 15:40:06','2015-04-29 15:40:06',18.575191,'log_controller_method_request','/task/showForm'),(33612,'5540fb5631867','2015-04-29 15:40:06','2015-04-29 15:40:06',57.174919,'log_http_request','/task/showForm'),(33613,'5540fb568b0ae','2015-04-29 15:40:06','2015-04-29 15:40:06',2.012014,'log_controller_method_request','/task/getItem'),(33614,'5540fb568b0ae','2015-04-29 15:40:06','2015-04-29 15:40:06',34.061909,'log_http_request','/task/getItem'),(33615,'5540fb56a6bab','2015-04-29 15:40:06','2015-04-29 15:40:06',21.128893,'log_http_request','/favicon.ico'),(33616,'5540fb5b9a812','2015-04-29 15:40:11','2015-04-29 15:40:11',9.173155,'log_controller_method_request','/task/listAll'),(33617,'5540fb5b9a812','2015-04-29 15:40:11','2015-04-29 15:40:11',41.800022,'log_http_request','/task/listAll'),(33618,'5540fb5bebe2a','2015-04-29 15:40:11','2015-04-29 15:40:12',22.761106,'log_http_request','/favicon.ico'),(33619,'5540fb6308d5a','2015-04-29 15:40:19','2015-04-29 15:40:19',63.824890,'log_controller_method_request','/task/updateItems'),(33620,'5540fb6308d5a','2015-04-29 15:40:19','2015-04-29 15:40:19',105.234146,'log_http_request','/task/updateItems'),(33621,'5540fb63a9275','2015-04-29 15:40:19','2015-04-29 15:40:19',10.260820,'log_controller_method_request','/task/listAll'),(33622,'5540fb63a9275','2015-04-29 15:40:19','2015-04-29 15:40:19',47.677040,'log_http_request','/task/listAll'),(33623,'5540fb64143aa','2015-04-29 15:40:20','2015-04-29 15:40:20',13.208151,'log_http_request','/favicon.ico'),(33624,'5540fb675e48a','2015-04-29 15:40:23','2015-04-29 15:40:23',5.684853,'log_controller_method_request','/activetask/showForm'),(33625,'5540fb675e48a','2015-04-29 15:40:23','2015-04-29 15:40:23',47.693012,'log_http_request','/activetask/showForm'),(33626,'5540fb6815db0','2015-04-29 15:40:24','2015-04-29 15:40:24',116.131065,'log_controller_method_request','/activetask/getNotes'),(33627,'5540fb6815db0','2015-04-29 15:40:24','2015-04-29 15:40:24',153.933044,'log_http_request','/activetask/getNotes'),(33628,'5540fb69429d6','2015-04-29 15:40:25','2015-04-29 15:40:25',22.320986,'log_http_request','/favicon.ico'),(33629,'5540fb697ed96','2015-04-29 15:40:25','2015-04-29 15:40:25',13.623953,'log_controller_method_request','/activetask/forms'),(33630,'5540fb697ed96','2015-04-29 15:40:25','2015-04-29 15:40:25',55.691006,'log_http_request','/activetask/forms'),(33631,'5540fb69e07e2','2015-04-29 15:40:25','2015-04-29 15:40:25',20.549059,'log_http_request','/favicon.ico'),(33632,'5540fc0010f83','2015-04-29 15:42:56','2015-04-29 15:42:56',19.486904,'log_controller_method_request','/activetask/communications'),(33633,'5540fc0010f83','2015-04-29 15:42:56','2015-04-29 15:42:56',65.304039,'log_http_request','/activetask/communications'),(33634,'5540fc00bf1f9','2015-04-29 15:42:56','2015-04-29 15:42:56',2.343178,'log_controller_method_request','/activetask/getDiscussionThread'),(33635,'5540fc00bf1f9','2015-04-29 15:42:56','2015-04-29 15:42:57',269.781128,'log_http_request','/activetask/getDiscussionThread'),(33636,'5540fc01cc24f','2015-04-29 15:42:57','2015-04-29 15:42:57',12.397051,'log_http_request','/favicon.ico'),(33637,'5540fc0783b75','2015-04-29 15:43:03','2015-04-29 15:43:03',10.372877,'log_controller_method_request','/task/listAll'),(33638,'5540fc0783b75','2015-04-29 15:43:03','2015-04-29 15:43:03',65.529106,'log_http_request','/task/listAll'),(33639,'5540fc07e07d3','2015-04-29 15:43:03','2015-04-29 15:43:03',17.918110,'log_http_request','/favicon.ico'),(33640,'5540fc0ab6fcc','2015-04-29 15:43:06','2015-04-29 15:43:06',9.020090,'log_controller_method_request','/activetask/showForm'),(33641,'5540fc0ab6fcc','2015-04-29 15:43:06','2015-04-29 15:43:06',83.660126,'log_http_request','/activetask/showForm'),(33642,'5540fc0b6e8e8','2015-04-29 15:43:07','2015-04-29 15:43:07',6.755114,'log_controller_method_request','/activetask/getNotes'),(33643,'5540fc0b6e8e8','2015-04-29 15:43:07','2015-04-29 15:43:07',64.370872,'log_http_request','/activetask/getNotes'),(33644,'5540fc0b9a80b','2015-04-29 15:43:07','2015-04-29 15:43:07',22.209167,'log_http_request','/favicon.ico'),(33645,'5540fc0cd3784','2015-04-29 15:43:08','2015-04-29 15:43:08',9.377956,'log_controller_method_request','/activetask/communications'),(33646,'5540fc0cd3784','2015-04-29 15:43:08','2015-04-29 15:43:08',69.741966,'log_http_request','/activetask/communications'),(33647,'5540fc0d3b499','2015-04-29 15:43:09','2015-04-29 15:43:09',1.714945,'log_controller_method_request','/activetask/getDiscussionThread'),(33648,'5540fc0d3b499','2015-04-29 15:43:09','2015-04-29 15:43:09',35.472157,'log_http_request','/activetask/getDiscussionThread'),(33649,'5540fc0d53b37','2015-04-29 15:43:09','2015-04-29 15:43:09',16.548157,'log_http_request','/favicon.ico'),(33650,'5540ff7057c12','2015-04-29 15:57:36','2015-04-29 15:57:36',10.643005,'log_controller_method_request','/project/listAll'),(33651,'5540ff7057c12','2015-04-29 15:57:36','2015-04-29 15:57:36',77.624084,'log_http_request','/project/listAll'),(33652,'5540ff70d9253','2015-04-29 15:57:36','2015-04-29 15:57:36',16.096115,'log_http_request','/favicon.ico'),(33653,'554133b8adaf3','2015-04-29 19:40:40','2015-04-29 19:40:40',0.202894,'log_controller_method_request','/login'),(33654,'554133b8adaf3','2015-04-29 19:40:40','2015-04-29 19:40:40',160.611160,'log_http_request','/login'),(33655,'554133ba9c981','2015-04-29 19:40:42','2015-04-29 19:40:42',0.185966,'log_controller_method_request','/login'),(33656,'554133ba9c981','2015-04-29 19:40:42','2015-04-29 19:40:42',53.936958,'log_http_request','/login'),(33657,'5541424137979','2015-04-29 20:42:41','2015-04-29 20:42:41',0.178099,'log_controller_method_request','/login'),(33658,'5541424137979','2015-04-29 20:42:41','2015-04-29 20:42:41',93.663216,'log_http_request','/login'),(33659,'554147b550c92','2015-04-29 21:05:57','2015-04-29 21:05:57',0.148058,'log_controller_method_request','/login'),(33660,'554147b550c92','2015-04-29 21:05:57','2015-04-29 21:05:57',57.501793,'log_http_request','/login'),(33661,'554147b7085b7','2015-04-29 21:05:59','2015-04-29 21:05:59',0.187159,'log_controller_method_request','/login'),(33662,'554147b7085b7','2015-04-29 21:05:59','2015-04-29 21:05:59',58.604004,'log_http_request','/login'),(33663,'554147beec390','2015-04-29 21:06:07','2015-04-29 21:06:07',111.721039,'log_controller_method_request','/auth'),(33664,'554147beec390','2015-04-29 21:06:06','2015-04-29 21:06:07',154.412033,'log_http_request','/auth'),(33665,'554147bf42234','2015-04-29 21:06:07','2015-04-29 21:06:07',94.652893,'log_http_request','/project'),(33666,'554147bf80cd0','2015-04-29 21:06:07','2015-04-29 21:06:07',18.799067,'log_controller_method_request','/project/listAll'),(33667,'554147bf80cd0','2015-04-29 21:06:07','2015-04-29 21:06:07',90.259789,'log_http_request','/project/listAll'),(33668,'554147c07e5b8','2015-04-29 21:06:08','2015-04-29 21:06:08',23.787975,'log_http_request','/Web/css/core/images/ui-bg_flat_75_ffffff_40x100.png'),(33669,'554147c44d881','2015-04-29 21:06:12','2015-04-29 21:06:12',28.027058,'log_controller_method_request','/task/listAll'),(33670,'554147c44d881','2015-04-29 21:06:12','2015-04-29 21:06:12',77.672005,'log_http_request','/task/listAll'),(33671,'554147c54152c','2015-04-29 21:06:13','2015-04-29 21:06:13',11.826038,'log_http_request','/Web/css/core/images/ui-bg_flat_75_ffffff_40x100.png'),(33672,'554147c849762','2015-04-29 21:06:16','2015-04-29 21:06:16',6.123781,'log_controller_method_request','/activetask/showForm'),(33673,'554147c849762','2015-04-29 21:06:16','2015-04-29 21:06:16',50.395012,'log_http_request','/activetask/showForm'),(33674,'554147c94ff8d','2015-04-29 21:06:17','2015-04-29 21:06:17',321.598999,'log_controller_method_request','/activetask/getNotes'),(33675,'554147c94ff8d','2015-04-29 21:06:17','2015-04-29 21:06:17',368.546967,'log_http_request','/activetask/getNotes'),(33676,'554147ca17d1b','2015-04-29 21:06:18','2015-04-29 21:06:18',31.311989,'log_controller_method_request','/activetask/communications'),(33677,'554147ca17d1b','2015-04-29 21:06:18','2015-04-29 21:06:18',75.341942,'log_http_request','/activetask/communications'),(33678,'554147cae6862','2015-04-29 21:06:18','2015-04-29 21:06:18',17.190933,'log_http_request','/Web/css/core/images/ui-bg_flat_75_ffffff_40x100.png'),(33679,'554147cb19727','2015-04-29 21:06:19','2015-04-29 21:06:19',2.329111,'log_controller_method_request','/activetask/getDiscussionThread'),(33680,'554147cb19727','2015-04-29 21:06:19','2015-04-29 21:06:19',38.918018,'log_http_request','/activetask/getDiscussionThread'),(33681,'55416f43522bf','2015-04-29 23:54:43','2015-04-29 23:54:43',0.208855,'log_controller_method_request','/login'),(33682,'55416f43522bf','2015-04-29 23:54:43','2015-04-29 23:54:43',97.261909,'log_http_request','/login'),(33683,'5541839c5fdfd','2015-04-30 01:21:32','2015-04-30 01:21:32',0.161171,'log_controller_method_request','/login'),(33684,'5541839c5fdfd','2015-04-30 01:21:32','2015-04-30 01:21:32',102.328064,'log_http_request','/login'),(33685,'5542535517c6a','2015-04-30 16:07:49','2015-04-30 16:07:49',0.254869,'log_controller_method_request','/login'),(33686,'5542535517c6a','2015-04-30 16:07:49','2015-04-30 16:07:55',5874.189941,'log_http_request','/login'),(33687,'5542535db0c54','2015-04-30 16:07:57','2015-04-30 16:07:57',0.204802,'log_controller_method_request','/login'),(33688,'5542535db0c54','2015-04-30 16:07:57','2015-04-30 16:08:09',10000.000000,'log_http_request','/login'),(33689,'55430c0222d54','2015-05-01 05:15:46','2015-05-01 05:15:46',0.190020,'log_controller_method_request','/login'),(33690,'55430c0222d54','2015-05-01 05:15:46','2015-05-01 05:15:46',183.285950,'log_http_request','/login'),(33691,'55431f2121e56','2015-05-01 06:37:21','2015-05-01 06:37:21',0.171185,'log_controller_method_request','/login'),(33692,'55431f2121e56','2015-05-01 06:37:21','2015-05-01 06:37:21',190.053940,'log_http_request','/login'),(33693,'55431f22e3945','2015-05-01 06:37:22','2015-05-01 06:37:22',0.192881,'log_controller_method_request','/login'),(33694,'55431f22e3945','2015-05-01 06:37:22','2015-05-01 06:37:22',44.383049,'log_http_request','/login'),(33695,'55431f2c5d4d3','2015-05-01 06:37:32','2015-05-01 06:37:32',232.196808,'log_controller_method_request','/auth'),(33696,'55431f2c5d4d3','2015-05-01 06:37:32','2015-05-01 06:37:32',296.869049,'log_http_request','/auth'),(33697,'55431f2cd1acb','2015-05-01 06:37:32','2015-05-01 06:37:32',126.955986,'log_http_request','/project'),(33698,'55431f2d20443','2015-05-01 06:37:33','2015-05-01 06:37:33',237.262009,'log_controller_method_request','/project/listAll'),(33699,'55431f2d20443','2015-05-01 06:37:33','2015-05-01 06:37:33',428.489929,'log_http_request','/project/listAll'),(33700,'55431f2e75b7f','2015-05-01 06:37:34','2015-05-01 06:37:34',33.652065,'log_http_request','/Web/css/core/images/ui-bg_flat_75_ffffff_40x100.png'),(33701,'55431f3015b07','2015-05-01 06:37:36','2015-05-01 06:37:36',4.686832,'log_controller_method_request','/project/showForm'),(33702,'55431f3015b07','2015-05-01 06:37:36','2015-05-01 06:37:36',81.408981,'log_http_request','/project/showForm'),(33703,'55431f3cdd11c','2015-05-01 06:37:48','2015-05-01 06:37:48',29.146910,'log_controller_method_request','/project/ifProjectExists'),(33704,'55431f3cdd11c','2015-05-01 06:37:48','2015-05-01 06:37:48',61.879871,'log_http_request','/project/ifProjectExists'),(33705,'55431f3d46840','2015-05-01 06:37:49','2015-05-01 06:37:49',8.512020,'log_controller_method_request','/project/add'),(33706,'55431f3d46840','2015-05-01 06:37:49','2015-05-01 06:37:49',45.619965,'log_http_request','/project/add'),(33707,'55431f3d7eab3','2015-05-01 06:37:49','2015-05-01 06:37:49',7.308960,'log_controller_method_request','/facility/add'),(33708,'55431f3d7eab3','2015-05-01 06:37:49','2015-05-01 06:37:49',66.233871,'log_http_request','/facility/add'),(33709,'55431f3e97e4c','2015-05-01 06:37:50','2015-05-01 06:37:50',31.468153,'log_controller_method_request','/client/add'),(33710,'55431f3e97e4c','2015-05-01 06:37:50','2015-05-01 06:37:50',73.232887,'log_http_request','/client/add'),(33711,'55431f41cf3cf','2015-05-01 06:37:53','2015-05-01 06:37:53',8.862019,'log_controller_method_request','/project/listAll'),(33712,'55431f41cf3cf','2015-05-01 06:37:53','2015-05-01 06:37:53',48.752068,'log_http_request','/project/listAll'),(33713,'55431f42ba12f','2015-05-01 06:37:54','2015-05-01 06:37:54',11.929035,'log_http_request','/Web/css/core/images/ui-bg_flat_75_ffffff_40x100.png'),(33714,'55431f488ef17','2015-05-01 06:38:00','2015-05-01 06:38:00',30.583858,'log_http_request','/logout'),(33715,'55431f48c5780','2015-05-01 06:38:00','2015-05-01 06:38:00',0.180960,'log_controller_method_request','/login'),(33716,'55431f48c5780','2015-05-01 06:38:00','2015-05-01 06:38:00',58.284042,'log_http_request','/login'),(33717,'55431f5a356e2','2015-05-01 06:38:18','2015-05-01 06:38:18',20.436049,'log_controller_method_request','/auth'),(33718,'55431f5a356e2','2015-05-01 06:38:18','2015-05-01 06:38:18',68.542007,'log_http_request','/auth'),(33719,'55431f667827e','2015-05-01 06:38:30','2015-05-01 06:38:30',6.223917,'log_controller_method_request','/auth'),(33720,'55431f667827e','2015-05-01 06:38:30','2015-05-01 06:38:30',53.829906,'log_http_request','/auth'),(33721,'55431f7566408','2015-05-01 06:38:45','2015-05-01 06:38:45',0.192881,'log_controller_method_request','/login'),(33722,'55431f7566408','2015-05-01 06:38:45','2015-05-01 06:38:45',39.162159,'log_http_request','/login'),(33723,'55431f7e9bf67','2015-05-01 06:38:54','2015-05-01 06:38:54',33.278942,'log_controller_method_request','/auth'),(33724,'55431f7e9bf67','2015-05-01 06:38:54','2015-05-01 06:38:54',73.580978,'log_http_request','/auth'),(33725,'55431f7ee052b','2015-05-01 06:38:54','2015-05-01 06:38:55',88.766098,'log_http_request','/project'),(33726,'55431f7f2fbae','2015-05-01 06:38:55','2015-05-01 06:38:55',8.604050,'log_controller_method_request','/project/listAll'),(33727,'55431f7f2fbae','2015-05-01 06:38:55','2015-05-01 06:38:55',48.934937,'log_http_request','/project/listAll'),(33728,'55431f806e63d','2015-05-01 06:38:56','2015-05-01 06:38:56',12.002945,'log_http_request','/Web/css/core/images/ui-bg_flat_75_ffffff_40x100.png'),(33729,'55431f8522b4b','2015-05-01 06:39:01','2015-05-01 06:39:01',1.871824,'log_controller_method_request','/technician/showForm'),(33730,'55431f8522b4b','2015-05-01 06:39:01','2015-05-01 06:39:01',161.403900,'log_http_request','/technician/showForm'),(33731,'55431f9092332','2015-05-01 06:39:12','2015-05-01 06:39:12',45.827148,'log_controller_method_request','/technician/add'),(33732,'55431f9092332','2015-05-01 06:39:12','2015-05-01 06:39:12',82.802055,'log_http_request','/technician/add'),(33733,'55431f91cd9a7','2015-05-01 06:39:13','2015-05-01 06:39:13',6.554127,'log_controller_method_request','/technician/listAll'),(33734,'55431f91cd9a7','2015-05-01 06:39:13','2015-05-01 06:39:13',53.932903,'log_http_request','/technician/listAll'),(33735,'55431f92b3916','2015-05-01 06:39:14','2015-05-01 06:39:14',16.140938,'log_http_request','/Web/css/core/images/ui-bg_flat_75_ffffff_40x100.png'),(33736,'55431f969bf6a','2015-05-01 06:39:18','2015-05-01 06:39:18',30.464888,'log_http_request','/logout'),(33737,'55431f96c8b8b','2015-05-01 06:39:18','2015-05-01 06:39:18',0.166178,'log_controller_method_request','/login'),(33738,'55431f96c8b8b','2015-05-01 06:39:18','2015-05-01 06:39:18',63.916206,'log_http_request','/login'),(33739,'55431fa3f1691','2015-05-01 06:39:32','2015-05-01 06:39:32',14.678955,'log_controller_method_request','/auth'),(33740,'55431fa3f1691','2015-05-01 06:39:31','2015-05-01 06:39:32',70.229050,'log_http_request','/auth'),(33741,'55431fa4363c6','2015-05-01 06:39:32','2015-05-01 06:39:32',0.423908,'log_controller_method_request','/user/showDetails'),(33742,'55431fa4363c6','2015-05-01 06:39:32','2015-05-01 06:39:32',70.407867,'log_http_request','/user/showDetails'),(33743,'55431fa541a13','2015-05-01 06:39:33','2015-05-01 06:39:33',0.380039,'log_controller_method_request','/user/getCurrent'),(33744,'55431fa541a13','2015-05-01 06:39:33','2015-05-01 06:39:33',29.083014,'log_http_request','/user/getCurrent'),(33745,'55431fb8608db','2015-05-01 06:39:52','2015-05-01 06:39:52',26.602030,'log_http_request','/logout'),(33746,'55431fb88adf4','2015-05-01 06:39:52','2015-05-01 06:39:52',0.173092,'log_controller_method_request','/login'),(33747,'55431fb88adf4','2015-05-01 06:39:52','2015-05-01 06:39:52',66.112991,'log_http_request','/login'),(33748,'55431fc878278','2015-05-01 06:40:08','2015-05-01 06:40:08',17.246008,'log_controller_method_request','/auth'),(33749,'55431fc878278','2015-05-01 06:40:08','2015-05-01 06:40:08',89.094879,'log_http_request','/auth'),(33750,'55431fc8b2bf5','2015-05-01 06:40:08','2015-05-01 06:40:08',47.782898,'log_http_request','/project'),(33751,'55431fc8e3933','2015-05-01 06:40:08','2015-05-01 06:40:08',8.745909,'log_controller_method_request','/project/listAll'),(33752,'55431fc8e3933','2015-05-01 06:40:08','2015-05-01 06:40:09',58.130028,'log_http_request','/project/listAll'),(33753,'55431fc9e6042','2015-05-01 06:40:09','2015-05-01 06:40:09',17.013073,'log_http_request','/Web/css/core/images/ui-bg_flat_75_ffffff_40x100.png'),(33754,'55431fcd6cc2a','2015-05-01 06:40:13','2015-05-01 06:40:13',5.241871,'log_controller_method_request','/service/showForm'),(33755,'55431fcd6cc2a','2015-05-01 06:40:13','2015-05-01 06:40:13',115.518089,'log_http_request','/service/showForm'),(33756,'55431fdc97e42','2015-05-01 06:40:28','2015-05-01 06:40:28',16.491890,'log_controller_method_request','/service/add'),(33757,'55431fdc97e42','2015-05-01 06:40:28','2015-05-01 06:40:28',56.251049,'log_http_request','/service/add'),(33758,'55431fddccc9d','2015-05-01 06:40:29','2015-05-01 06:40:29',53.478004,'log_controller_method_request','/service/listAll'),(33759,'55431fddccc9d','2015-05-01 06:40:29','2015-05-01 06:40:29',98.973991,'log_http_request','/service/listAll'),(33760,'55431fded1ac1','2015-05-01 06:40:30','2015-05-01 06:40:30',14.317989,'log_http_request','/Web/css/core/images/ui-bg_flat_75_ffffff_40x100.png'),(33761,'55431fdfb45fe','2015-05-01 06:40:31','2015-05-01 06:40:31',22.799015,'log_http_request','/logout'),(33762,'55431fdfdc408','2015-05-01 06:40:31','2015-05-01 06:40:31',0.102043,'log_controller_method_request','/login'),(33763,'55431fdfdc408','2015-05-01 06:40:31','2015-05-01 06:40:31',40.146111,'log_http_request','/login'),(33764,'55431fec3b1df','2015-05-01 06:40:44','2015-05-01 06:40:44',6.933212,'log_controller_method_request','/auth'),(33765,'55431fec3b1df','2015-05-01 06:40:44','2015-05-01 06:40:44',67.964790,'log_http_request','/auth'),(33766,'55431ff327960','2015-05-01 06:40:51','2015-05-01 06:40:51',3.696918,'log_controller_method_request','/auth'),(33767,'55431ff327960','2015-05-01 06:40:51','2015-05-01 06:40:51',28.006077,'log_http_request','/auth'),(33768,'554320178ade2','2015-05-01 06:41:27','2015-05-01 06:41:27',19.792080,'log_controller_method_request','/auth'),(33769,'554320178ade2','2015-05-01 06:41:27','2015-05-01 06:41:27',62.793015,'log_http_request','/auth'),(33770,'55432017ac3c0','2015-05-01 06:41:27','2015-05-01 06:41:27',11.334181,'log_controller_method_request','/auth'),(33771,'55432017ac3c0','2015-05-01 06:41:27','2015-05-01 06:41:27',49.839973,'log_http_request','/auth'),(33772,'5543201b8d4f5','2015-05-01 06:41:31','2015-05-01 06:41:31',3.705025,'log_controller_method_request','/auth'),(33773,'5543201b8d4f5','2015-05-01 06:41:31','2015-05-01 06:41:31',35.971882,'log_http_request','/auth'),(33774,'5543201bb7a0f','2015-05-01 06:41:31','2015-05-01 06:41:31',12.311935,'log_http_request','/user/listAll'),(33775,'5543201be1f1b','2015-05-01 06:41:31','2015-05-01 06:41:31',12.097836,'log_http_request','/user/Web/css/app/reset.css'),(33776,'5543201c06386','2015-05-01 06:41:32','2015-05-01 06:41:32',12.246132,'log_http_request','/user/Web/css/core/bootstrap.css'),(33777,'5543201c126f3','2015-05-01 06:41:32','2015-05-01 06:41:32',18.892050,'log_http_request','/user/Web/css/core/dropzone.css'),(33778,'5543201c2b09d','2015-05-01 06:41:32','2015-05-01 06:41:32',14.444113,'log_http_request','/user/Web/js/core/jquery.js'),(33779,'5543201c38aca','2015-05-01 06:41:32','2015-05-01 06:41:32',12.959003,'log_http_request','/user/Web/js/core/jquery-ui.js'),(33780,'5543201c4f77a','2015-05-01 06:41:32','2015-05-01 06:41:32',18.113136,'log_http_request','/user/Web/js/app/controllers/top_menu.actions.js'),(33781,'5543201c5e1bd','2015-05-01 06:41:32','2015-05-01 06:41:32',19.085169,'log_http_request','/user/Web/js/core/parsexml.js'),(33782,'5543201c7685f','2015-05-01 06:41:32','2015-05-01 06:41:32',22.843122,'log_http_request','/user/Web/js/core/bootstrap.min.js'),(33783,'5543201c852c0','2015-05-01 06:41:32','2015-05-01 06:41:32',15.538931,'log_http_request','/user/Web/js/core/bootbox.min.js'),(33784,'5543201cb9417','2015-05-01 06:41:32','2015-05-01 06:41:32',19.755840,'log_http_request','/user/Web/js/core/moment.locales.js'),(33785,'5543201cdf812','2015-05-01 06:41:32','2015-05-01 06:41:32',12.566090,'log_http_request','/user/Web/js/core/lightbox.js'),(33786,'5543201d09796','2015-05-01 06:41:33','2015-05-01 06:41:33',11.879921,'log_http_request','/user/Web/css/addons/toastr.css'),(33787,'5543201d1ea1e','2015-05-01 06:41:33','2015-05-01 06:41:33',13.725996,'log_http_request','/user/Web/css/core/jquery-ui.css'),(33788,'5543201d1ea1e','2015-05-01 06:41:33','2015-05-01 06:41:33',16.225815,'log_http_request','/user/Web/css/addons/jquery.contextMenu.css'),(33789,'5543201d2e192','2015-05-01 06:41:33','2015-05-01 06:41:33',12.261152,'log_http_request','/user/Web/js/addons/jquery.parseParams.js'),(33790,'5543201d1ea21','2015-05-01 06:41:33','2015-05-01 06:41:33',13.477087,'log_http_request','/user/Web/css/core/lightbox.css'),(33791,'5543201d43411','2015-05-01 06:41:33','2015-05-01 06:41:33',20.627975,'log_http_request','/user/Web/js/addons/jquery.contextMenu.js'),(33792,'5543201d50464','2015-05-01 06:41:33','2015-05-01 06:41:33',20.641804,'log_http_request','/user/Web/js/addons/jquery.ui.position.js'),(33793,'5543201d5387a','2015-05-01 06:41:33','2015-05-01 06:41:33',22.253990,'log_http_request','/user/Web/js/addons/spin.min.js'),(33794,'5543201d5c7b5','2015-05-01 06:41:33','2015-05-01 06:41:33',12.321949,'log_http_request','/user/Web/js/app/services/config.js'),(33795,'5543201d6b216','2015-05-01 06:41:33','2015-05-01 06:41:33',13.650179,'log_http_request','/user/Web/js/app/services/dataservice.js'),(33796,'5543201d77565','2015-05-01 06:41:33','2015-05-01 06:41:33',20.426989,'log_http_request','/user/Web/js/app/services/utils.js'),(33797,'5543201d81ec2','2015-05-01 06:41:33','2015-05-01 06:41:33',21.324158,'log_http_request','/user/Web/js/app/controllers/tabs.js'),(33798,'5543201d893e3','2015-05-01 06:41:33','2015-05-01 06:41:33',23.054123,'log_http_request','/user/Web/images/FWM_logo.jpg'),(33799,'5543201dbbb27','2015-05-01 06:41:33','2015-05-01 06:41:33',23.510933,'log_http_request','/user/Web/js/core/dropzone.js'),(33800,'5543201e126d3','2015-05-01 06:41:34','2015-05-01 06:41:34',13.590097,'log_http_request','/user/Web/js/addons/toastr.js'),(33801,'5543202a8c82b','2015-05-01 06:41:46','2015-05-01 06:41:46',20.955086,'log_http_request','/logout'),(33802,'5543202ab530b','2015-05-01 06:41:46','2015-05-01 06:41:46',0.199080,'log_controller_method_request','/login'),(33803,'5543202ab530b','2015-05-01 06:41:46','2015-05-01 06:41:46',53.385975,'log_http_request','/login'),(33804,'554320360bea2','2015-05-01 06:41:58','2015-05-01 06:41:58',3.668070,'log_controller_method_request','/auth'),(33805,'554320360bea2','2015-05-01 06:41:58','2015-05-01 06:41:58',59.890034,'log_http_request','/auth'),(33806,'55432036cd9b6','2015-05-01 06:41:58','2015-05-01 06:41:58',9.917974,'log_controller_method_request','/user/listAll'),(33807,'55432036cd9b6','2015-05-01 06:41:58','2015-05-01 06:41:58',66.632988,'log_http_request','/user/listAll'),(33808,'55432037e5343','2015-05-01 06:41:59','2015-05-01 06:41:59',11.574984,'log_http_request','/Web/css/core/images/ui-bg_flat_75_ffffff_40x100.png'),(33809,'5543203e7274b','2015-05-01 06:42:06','2015-05-01 06:42:06',0.431061,'log_controller_method_request','/user/showForm'),(33810,'5543203e7274b','2015-05-01 06:42:06','2015-05-01 06:42:06',66.530945,'log_http_request','/user/showForm'),(33811,'5543213c5fbb4','2015-05-01 06:46:20','2015-05-01 06:46:20',31.537056,'log_controller_method_request','/user/add'),(33812,'5543213c5fbb4','2015-05-01 06:46:20','2015-05-01 06:46:20',68.006042,'log_http_request','/user/add'),(33813,'5543213ce1206','2015-05-01 06:46:20','2015-05-01 06:46:20',1.156092,'log_controller_method_request','/user/listAll'),(33814,'5543213ce1206','2015-05-01 06:46:20','2015-05-01 06:46:20',40.911915,'log_http_request','/user/listAll'),(33815,'5543213e01543','2015-05-01 06:46:22','2015-05-01 06:46:22',12.943029,'log_http_request','/Web/css/core/images/ui-bg_flat_75_ffffff_40x100.png'),(33816,'554321463e5e3','2015-05-01 06:46:30','2015-05-01 06:46:30',5.308867,'log_controller_method_request','/user/getItem'),(33817,'554321463e5e3','2015-05-01 06:46:30','2015-05-01 06:46:30',54.188011,'log_http_request','/user/getItem'),(33818,'5543214672728','2015-05-01 06:46:30','2015-05-01 06:46:30',0.247002,'log_controller_method_request','/login'),(33819,'5543214672728','2015-05-01 06:46:30','2015-05-01 06:46:30',29.646873,'log_http_request','/login'),(33820,'554321479571e','2015-05-01 06:46:31','2015-05-01 06:46:31',32.309055,'log_controller_method_request','/auth'),(33821,'554321479571e','2015-05-01 06:46:31','2015-05-01 06:46:31',82.973000,'log_http_request','/auth'),(33822,'55432147cd982','2015-05-01 06:46:31','2015-05-01 06:46:31',56.102036,'log_http_request','/project'),(33823,'554321480be8d','2015-05-01 06:46:32','2015-05-01 06:46:32',4.129887,'log_controller_method_request','/project/showForm'),(33824,'554321480be8d','2015-05-01 06:46:32','2015-05-01 06:46:32',35.963058,'log_http_request','/project/showForm'),(33825,'554321558bad9','2015-05-01 06:46:45','2015-05-01 06:46:45',33.006908,'log_http_request','/logout'),(33826,'55432155b79f3','2015-05-01 06:46:45','2015-05-01 06:46:45',0.132799,'log_controller_method_request','/login'),(33827,'55432155b79f3','2015-05-01 06:46:45','2015-05-01 06:46:45',41.431904,'log_http_request','/login'),(33828,'554321609711a','2015-05-01 06:46:56','2015-05-01 06:46:56',8.697987,'log_controller_method_request','/auth'),(33829,'554321609711a','2015-05-01 06:46:56','2015-05-01 06:46:56',69.885017,'log_http_request','/auth'),(33830,'55432160cbf81','2015-05-01 06:46:56','2015-05-01 06:46:56',3.047943,'log_controller_method_request','/user/listAll'),(33831,'55432160cbf81','2015-05-01 06:46:56','2015-05-01 06:46:56',35.042049,'log_http_request','/user/listAll'),(33832,'55432161b86f3','2015-05-01 06:46:57','2015-05-01 06:46:57',18.789053,'log_http_request','/Web/css/core/images/ui-bg_flat_75_ffffff_40x100.png'),(33833,'5543216975b54','2015-05-01 06:47:05','2015-05-01 06:47:05',2.061129,'log_controller_method_request','/user/getItem'),(33834,'5543216975b54','2015-05-01 06:47:05','2015-05-01 06:47:05',40.841103,'log_http_request','/user/getItem'),(33835,'55432169a5b8b','2015-05-01 06:47:05','2015-05-01 06:47:05',0.158072,'log_controller_method_request','/login'),(33836,'55432169a5b8b','2015-05-01 06:47:05','2015-05-01 06:47:05',26.831865,'log_http_request','/login'),(33837,'5543216b1c2ec','2015-05-01 06:47:07','2015-05-01 06:47:07',4.024982,'log_controller_method_request','/auth'),(33838,'5543216b1c2ec','2015-05-01 06:47:07','2015-05-01 06:47:07',45.373917,'log_http_request','/auth'),(33839,'554321a3a8282','2015-05-01 06:48:03','2015-05-01 06:48:03',0.149012,'log_controller_method_request','/login'),(33840,'554321a3a8282','2015-05-01 06:48:03','2015-05-01 06:48:03',42.931080,'log_http_request','/login'),(33841,'554321b05937e','2015-05-01 06:48:16','2015-05-01 06:48:16',4.845858,'log_controller_method_request','/auth'),(33842,'554321b05937e','2015-05-01 06:48:16','2015-05-01 06:48:16',66.020012,'log_http_request','/auth'),(33843,'554321b09cc33','2015-05-01 06:48:16','2015-05-01 06:48:16',6.025076,'log_controller_method_request','/user/listAll'),(33844,'554321b09cc33','2015-05-01 06:48:16','2015-05-01 06:48:16',38.381100,'log_http_request','/user/listAll'),(33845,'554321b181e83','2015-05-01 06:48:17','2015-05-01 06:48:17',11.530876,'log_http_request','/Web/css/core/images/ui-bg_flat_75_ffffff_40x100.png'),(33846,'554321b9db6d0','2015-05-01 06:48:25','2015-05-01 06:48:25',2.229929,'log_controller_method_request','/user/getItem'),(33847,'554321b9db6d0','2015-05-01 06:48:25','2015-05-01 06:48:25',35.631180,'log_http_request','/user/getItem'),(33848,'554321ba24627','2015-05-01 06:48:26','2015-05-01 06:48:26',0.232935,'log_controller_method_request','/login'),(33849,'554321ba24627','2015-05-01 06:48:26','2015-05-01 06:48:26',33.241035,'log_http_request','/login'),(33850,'554321bb2863f','2015-05-01 06:48:27','2015-05-01 06:48:27',8.482933,'log_controller_method_request','/auth'),(33851,'554321bb2863f','2015-05-01 06:48:27','2015-05-01 06:48:27',70.867065,'log_http_request','/auth'),(33852,'554321c7ea13e','2015-05-01 06:48:39','2015-05-01 06:48:39',0.157118,'log_controller_method_request','/login'),(33853,'554321c7ea13e','2015-05-01 06:48:39','2015-05-01 06:48:39',29.368877,'log_http_request','/login'),(33854,'554321cf6bef5','2015-05-01 06:48:47','2015-05-01 06:48:47',5.359173,'log_controller_method_request','/auth'),(33855,'554321cf6bef5','2015-05-01 06:48:47','2015-05-01 06:48:47',68.526031,'log_http_request','/auth'),(33856,'554321cfa0d4d','2015-05-01 06:48:47','2015-05-01 06:48:47',3.815889,'log_controller_method_request','/user/listAll'),(33857,'554321cfa0d4d','2015-05-01 06:48:47','2015-05-01 06:48:47',46.425102,'log_http_request','/user/listAll'),(33858,'554321d0886ad','2015-05-01 06:48:48','2015-05-01 06:48:48',14.182091,'log_http_request','/Web/css/core/images/ui-bg_flat_75_ffffff_40x100.png'),(33859,'554321d7c4a37','2015-05-01 06:48:55','2015-05-01 06:48:55',1.623154,'log_controller_method_request','/user/getItem'),(33860,'554321d7c4a37','2015-05-01 06:48:55','2015-05-01 06:48:55',31.980991,'log_http_request','/user/getItem'),(33861,'554321d80cb89','2015-05-01 06:48:56','2015-05-01 06:48:56',0.216007,'log_controller_method_request','/login'),(33862,'554321d80cb89','2015-05-01 06:48:56','2015-05-01 06:48:56',35.585880,'log_http_request','/login'),(33863,'554321d9126b1','2015-05-01 06:48:57','2015-05-01 06:48:57',9.038210,'log_controller_method_request','/auth'),(33864,'554321d9126b1','2015-05-01 06:48:57','2015-05-01 06:48:57',65.209869,'log_http_request','/auth'),(33865,'554321d94821c','2015-05-01 06:48:57','2015-05-01 06:48:57',0.282049,'log_controller_method_request','/user/showDetails'),(33866,'554321d94821c','2015-05-01 06:48:57','2015-05-01 06:48:57',31.511068,'log_http_request','/user/showDetails'),(33867,'554321da2794a','2015-05-01 06:48:58','2015-05-01 06:48:58',0.355005,'log_controller_method_request','/user/getCurrent'),(33868,'554321da2794a','2015-05-01 06:48:58','2015-05-01 06:48:58',42.536976,'log_http_request','/user/getCurrent'),(33869,'554328e047448','2015-05-01 07:18:56','2015-05-01 07:18:56',0.183105,'log_controller_method_request','/login'),(33870,'554328e047448','2015-05-01 07:18:56','2015-05-01 07:18:56',91.662888,'log_http_request','/login'),(33871,'5543332a0d6c9','2015-05-01 08:02:50','2015-05-01 08:02:50',0.255823,'log_controller_method_request','/login'),(33872,'5543332a0d6c9','2015-05-01 08:02:50','2015-05-01 08:02:50',101.489067,'log_http_request','/login'),(33873,'5543332b33ac7','2015-05-01 08:02:51','2015-05-01 08:02:51',0.183105,'log_controller_method_request','/login'),(33874,'5543332b33ac7','2015-05-01 08:02:51','2015-05-01 08:02:51',56.604149,'log_http_request','/login'),(33875,'5543332fd66ef','2015-05-01 08:02:55','2015-05-01 08:02:55',20.410061,'log_controller_method_request','/auth'),(33876,'5543332fd66ef','2015-05-01 08:02:55','2015-05-01 08:02:55',74.026108,'log_http_request','/auth'),(33877,'55433334a80ba','2015-05-01 08:03:00','2015-05-01 08:03:00',3.992081,'log_controller_method_request','/auth'),(33878,'55433334a80ba','2015-05-01 08:03:00','2015-05-01 08:03:00',30.622005,'log_http_request','/auth'),(33879,'554333437a793','2015-05-01 08:03:15','2015-05-01 08:03:15',343.476044,'log_controller_method_request','/auth'),(33880,'554333437a793','2015-05-01 08:03:15','2015-05-01 08:03:15',434.900055,'log_http_request','/auth'),(33881,'5543338f2c58b','2015-05-01 08:04:31','2015-05-01 08:04:31',0.182152,'log_controller_method_request','/login'),(33882,'5543338f2c58b','2015-05-01 08:04:31','2015-05-01 08:04:31',36.887169,'log_http_request','/login'),(33883,'55433390a80c8','2015-05-01 08:04:32','2015-05-01 08:04:32',0.133038,'log_controller_method_request','/login'),(33884,'55433390a80c8','2015-05-01 08:04:32','2015-05-01 08:04:32',60.629128,'log_http_request','/login'),(33885,'554333928c601','2015-05-01 08:04:34','2015-05-01 08:04:34',23.061037,'log_controller_method_request','/auth'),(33886,'554333928c601','2015-05-01 08:04:34','2015-05-01 08:04:34',80.642937,'log_http_request','/auth'),(33887,'554333930e3c7','2015-05-01 08:04:35','2015-05-01 08:04:35',2.685070,'log_controller_method_request','/user/showDetails'),(33888,'554333930e3c7','2015-05-01 08:04:35','2015-05-01 08:04:35',92.657089,'log_http_request','/user/showDetails'),(33889,'55433394388d9','2015-05-01 08:04:36','2015-05-01 08:04:36',0.944853,'log_controller_method_request','/user/getCurrent'),(33890,'55433394388d9','2015-05-01 08:04:36','2015-05-01 08:04:36',32.585857,'log_http_request','/user/getCurrent'),(33891,'55433394a9ac4','2015-05-01 08:04:36','2015-05-01 08:04:36',13.214111,'log_http_request','/favicon.ico'),(33892,'5543339703a7e','2015-05-01 08:04:39','2015-05-01 08:04:39',23.455858,'log_http_request','/logout'),(33893,'5543339748d41','2015-05-01 08:04:39','2015-05-01 08:04:39',0.128984,'log_controller_method_request','/login'),(33894,'5543339748d41','2015-05-01 08:04:39','2015-05-01 08:04:39',52.950146,'log_http_request','/login'),(33895,'554333c3c215b','2015-05-01 08:05:23','2015-05-01 08:05:23',0.163078,'log_controller_method_request','/login'),(33896,'554333c3c215b','2015-05-01 08:05:23','2015-05-01 08:05:28',5168.322266,'log_http_request','/login'),(33897,'554333ca29e78','2015-05-01 08:05:30','2015-05-01 08:05:30',0.129938,'log_controller_method_request','/login'),(33898,'554333ca29e78','2015-05-01 08:05:30','2015-05-01 08:05:30',41.734936,'log_http_request','/login'),(33899,'554333ce4662e','2015-05-01 08:05:34','2015-05-01 08:05:34',29.108047,'log_controller_method_request','/auth'),(33900,'554333ce4662e','2015-05-01 08:05:34','2015-05-01 08:05:34',84.815025,'log_http_request','/auth'),(33901,'554333d2e1020','2015-05-01 08:05:38','2015-05-01 08:05:38',11.441946,'log_controller_method_request','/auth'),(33902,'554333d2e1020','2015-05-01 08:05:38','2015-05-01 08:05:38',40.174007,'log_http_request','/auth'),(33903,'554333d33e40d','2015-05-01 08:05:39','2015-05-01 08:05:39',11.676073,'log_controller_method_request','/user/listAll'),(33904,'554333d33e40d','2015-05-01 08:05:39','2015-05-01 08:05:39',57.951927,'log_http_request','/user/listAll'),(33905,'554333d3b851a','2015-05-01 08:05:39','2015-05-01 08:05:39',12.932062,'log_http_request','/Web/css/core/images/ui-bg_flat_75_ffffff_40x100.png'),(33906,'554333d419a25','2015-05-01 08:05:40','2015-05-01 08:05:40',21.141052,'log_http_request','/favicon.ico'),(33907,'554333d59b058','2015-05-01 08:05:41','2015-05-01 08:05:41',0.231981,'log_controller_method_request','/user/showForm'),(33908,'554333d59b058','2015-05-01 08:05:41','2015-05-01 08:05:41',37.196159,'log_http_request','/user/showForm'),(33909,'554333d63a2e0','2015-05-01 08:05:42','2015-05-01 08:05:42',19.676924,'log_http_request','/favicon.ico'),(33910,'5543341699647','2015-05-01 08:06:46','2015-05-01 08:06:46',41.517975,'log_controller_method_request','/user/add'),(33911,'5543341699647','2015-05-01 08:06:46','2015-05-01 08:06:46',82.127090,'log_http_request','/user/add'),(33912,'55433417395cd','2015-05-01 08:06:47','2015-05-01 08:06:47',1.349926,'log_controller_method_request','/user/listAll'),(33913,'55433417395cd','2015-05-01 08:06:47','2015-05-01 08:06:47',45.163155,'log_http_request','/user/listAll'),(33914,'55433417ca386','2015-05-01 08:06:47','2015-05-01 08:06:47',11.907101,'log_http_request','/favicon.ico'),(33915,'554334f8a8098','2015-05-01 08:10:32','2015-05-01 08:10:32',23.189068,'log_http_request','/logout'),(33916,'554334f8d80cd','2015-05-01 08:10:32','2015-05-01 08:10:32',0.126123,'log_controller_method_request','/login'),(33917,'554334f8d80cd','2015-05-01 08:10:32','2015-05-01 08:10:32',41.157963,'log_http_request','/login'),(33918,'554334f9d18a2','2015-05-01 08:10:33','2015-05-01 08:10:33',0.170946,'log_controller_method_request','/login'),(33919,'554334f9d18a2','2015-05-01 08:10:33','2015-05-01 08:10:33',50.457001,'log_http_request','/login'),(33920,'554337ee96efd','2015-05-01 08:23:10','2015-05-01 08:23:10',0.140905,'log_controller_method_request','/login'),(33921,'554337ee96efd','2015-05-01 08:23:10','2015-05-01 08:23:10',51.817894,'log_http_request','/login'),(33922,'554337efc06e5','2015-05-01 08:23:11','2015-05-01 08:23:11',0.138044,'log_controller_method_request','/login'),(33923,'554337efc06e5','2015-05-01 08:23:11','2015-05-01 08:23:11',41.152954,'log_http_request','/login'),(33924,'554337f2b509a','2015-05-01 08:23:14','2015-05-01 08:23:15',228.327988,'log_controller_method_request','/auth'),(33925,'554337f2b509a','2015-05-01 08:23:14','2015-05-01 08:23:15',267.143005,'log_http_request','/auth'),(33926,'554337f33af7b','2015-05-01 08:23:15','2015-05-01 08:23:15',104.512932,'log_http_request','/project'),(33927,'554337f3954c5','2015-05-01 08:23:15','2015-05-01 08:23:15',7.483959,'log_controller_method_request','/project/listAll'),(33928,'554337f3954c5','2015-05-01 08:23:15','2015-05-01 08:23:15',58.295013,'log_http_request','/project/listAll'),(33929,'554337f4417a6','2015-05-01 08:23:16','2015-05-01 08:23:16',21.348953,'log_http_request','/Web/css/core/images/ui-bg_flat_75_ffffff_40x100.png'),(33930,'554337f4a6645','2015-05-01 08:23:16','2015-05-01 08:23:16',19.298792,'log_http_request','/favicon.ico'),(33931,'554337f73d686','2015-05-01 08:23:19','2015-05-01 08:23:19',4.720926,'log_controller_method_request','/project/showForm'),(33932,'554337f73d686','2015-05-01 08:23:19','2015-05-01 08:23:19',60.731888,'log_http_request','/project/showForm'),(33933,'554337f80541c','2015-05-01 08:23:20','2015-05-01 08:23:20',20.869017,'log_http_request','/favicon.ico'),(33934,'5543381420ecc','2015-05-01 08:23:48','2015-05-01 08:23:48',1.611948,'log_controller_method_request','/project/ifProjectExists'),(33935,'5543381420ecc','2015-05-01 08:23:48','2015-05-01 08:23:48',33.954861,'log_http_request','/project/ifProjectExists'),(33936,'554338148c58d','2015-05-01 08:23:48','2015-05-01 08:23:48',10.324955,'log_controller_method_request','/project/add'),(33937,'554338148c58d','2015-05-01 08:23:48','2015-05-01 08:23:48',35.748959,'log_http_request','/project/add'),(33938,'55433814c2103','2015-05-01 08:23:48','2015-05-01 08:23:48',8.236885,'log_controller_method_request','/facility/add'),(33939,'55433814c2103','2015-05-01 08:23:48','2015-05-01 08:23:48',45.881035,'log_http_request','/facility/add'),(33940,'55433814e50d3','2015-05-01 08:23:48','2015-05-01 08:23:48',12.598038,'log_controller_method_request','/client/add'),(33941,'55433814e50d3','2015-05-01 08:23:48','2015-05-01 08:23:48',43.487072,'log_http_request','/client/add'),(33942,'554338188294d','2015-05-01 08:23:52','2015-05-01 08:23:52',8.787155,'log_controller_method_request','/project/listAll'),(33943,'554338188294d','2015-05-01 08:23:52','2015-05-01 08:23:52',49.118996,'log_http_request','/project/listAll'),(33944,'554338194f4fc','2015-05-01 08:23:53','2015-05-01 08:23:53',14.195204,'log_http_request','/favicon.ico'),(33945,'5543381c5843c','2015-05-01 08:23:56','2015-05-01 08:23:56',3.789902,'log_controller_method_request','/project/showForm'),(33946,'5543381c5843c','2015-05-01 08:23:56','2015-05-01 08:23:56',49.093964,'log_http_request','/project/showForm'),(33947,'5543381cec5ff','2015-05-01 08:23:56','2015-05-01 08:23:56',1.131058,'log_controller_method_request','/project/getItem'),(33948,'5543381cec5ff','2015-05-01 08:23:56','2015-05-01 08:23:57',27.688026,'log_http_request','/project/getItem'),(33949,'5543381d1658c','2015-05-01 08:23:57','2015-05-01 08:23:57',14.872074,'log_http_request','/favicon.ico'),(33950,'5543381f6afb1','2015-05-01 08:23:59','2015-05-01 08:23:59',5.494833,'log_controller_method_request','/project/delete'),(33951,'5543381f6afb1','2015-05-01 08:23:59','2015-05-01 08:23:59',48.819065,'log_http_request','/project/delete'),(33952,'5543381fa733c','2015-05-01 08:23:59','2015-05-01 08:23:59',8.163929,'log_controller_method_request','/project/listAll'),(33953,'5543381fa733c','2015-05-01 08:23:59','2015-05-01 08:23:59',149.793869,'log_http_request','/project/listAll'),(33954,'554338204a6e0','2015-05-01 08:24:00','2015-05-01 08:24:00',12.346983,'log_http_request','/favicon.ico'),(33955,'55436ef6b993b','2015-05-01 12:17:58','2015-05-01 12:17:58',0.123978,'log_controller_method_request','/login'),(33956,'55436ef6b993b','2015-05-01 12:17:58','2015-05-01 12:17:58',120.861053,'log_http_request','/login'),(33957,'55436efeecd9c','2015-05-01 12:18:07','2015-05-01 12:18:07',0.174999,'log_controller_method_request','/login'),(33958,'55436efeecd9c','2015-05-01 12:18:06','2015-05-01 12:18:07',60.014008,'log_http_request','/login'),(33959,'55436f028da19','2015-05-01 12:18:10','2015-05-01 12:18:10',84.834099,'log_controller_method_request','/auth'),(33960,'55436f028da19','2015-05-01 12:18:10','2015-05-01 12:18:10',269.917023,'log_http_request','/auth'),(33961,'55436f0f7126f','2015-05-01 12:18:23','2015-05-01 12:18:23',6.233931,'log_controller_method_request','/auth'),(33962,'55436f0f7126f','2015-05-01 12:18:23','2015-05-01 12:18:23',33.008816,'log_http_request','/auth'),(33963,'5543b11438952','2015-05-01 17:00:04','2015-05-01 17:00:04',0.233889,'log_controller_method_request','/login'),(33964,'5543b11438952','2015-05-01 17:00:04','2015-05-01 17:00:04',154.030090,'log_http_request','/login'),(33965,'5543d714a5651','2015-05-01 19:42:12','2015-05-01 19:42:12',0.200033,'log_controller_method_request','/login'),(33966,'5543d714a5651','2015-05-01 19:42:12','2015-05-01 19:42:12',164.175980,'log_http_request','/login'),(33967,'5543ec83216cf','2015-05-01 21:13:40','2015-05-01 21:13:40',0.221014,'log_controller_method_request','/login'),(33968,'5543ec83216cf','2015-05-01 21:13:39','2015-05-01 21:13:40',264.017090,'log_http_request','/login'),(33969,'5543ec85e8ce4','2015-05-01 21:13:42','2015-05-01 21:13:42',0.136137,'log_controller_method_request','/login'),(33970,'5543ec85e8ce4','2015-05-01 21:13:41','2015-05-01 21:13:42',157.374146,'log_http_request','/login'),(33971,'5543ec8e5da59','2015-05-01 21:13:50','2015-05-01 21:13:50',506.519073,'log_controller_method_request','/auth'),(33972,'5543ec8e5da59','2015-05-01 21:13:50','2015-05-01 21:13:50',560.522095,'log_http_request','/auth'),(33973,'5543ec8f80a39','2015-05-01 21:13:51','2015-05-01 21:13:51',124.547958,'log_http_request','/project'),(33974,'5543ec8fcf940','2015-05-01 21:13:51','2015-05-01 21:13:51',33.875942,'log_controller_method_request','/project/listAll'),(33975,'5543ec8fcf940','2015-05-01 21:13:51','2015-05-01 21:13:52',161.072968,'log_http_request','/project/listAll'),(33976,'5543ec90b3184','2015-05-01 21:13:52','2015-05-01 21:13:52',35.348179,'log_http_request','/Web/css/core/images/ui-bg_flat_75_ffffff_40x100.png'),(33977,'5543ec90f0215','2015-05-01 21:13:52','2015-05-01 21:13:53',21.508932,'log_http_request','/favicon.ico'),(33978,'5543ec932f424','2015-05-01 21:13:55','2015-05-01 21:13:55',62.596085,'log_controller_method_request','/task/listAll'),(33979,'5543ec932f424','2015-05-01 21:13:55','2015-05-01 21:13:55',153.668884,'log_http_request','/task/listAll'),(33980,'5543ec9434f49','2015-05-01 21:13:56','2015-05-01 21:13:56',10.272026,'log_controller_method_request','/task/listAll'),(33981,'5543ec9434f49','2015-05-01 21:13:56','2015-05-01 21:13:56',51.644089,'log_http_request','/task/listAll'),(33982,'5543ec94ad65f','2015-05-01 21:13:56','2015-05-01 21:13:56',12.721062,'log_http_request','/favicon.ico'),(33983,'5543ec9939d69','2015-05-01 21:14:01','2015-05-01 21:14:01',184.135910,'log_controller_method_request','/task/showForm'),(33984,'5543ec9939d69','2015-05-01 21:14:01','2015-05-01 21:14:01',297.431000,'log_http_request','/task/showForm'),(33985,'5543ec99cab1b','2015-05-01 21:14:01','2015-05-01 21:14:01',3.373146,'log_controller_method_request','/task/getItem'),(33986,'5543ec99cab1b','2015-05-01 21:14:01','2015-05-01 21:14:01',34.735916,'log_http_request','/task/getItem'),(33987,'5543ec9a12c6a','2015-05-01 21:14:02','2015-05-01 21:14:02',13.108015,'log_http_request','/favicon.ico'),(33988,'5543eca2afd70','2015-05-01 21:14:10','2015-05-01 21:14:10',67.670105,'log_controller_method_request','/task/edit'),(33989,'5543eca2afd70','2015-05-01 21:14:10','2015-05-01 21:14:10',98.605873,'log_http_request','/task/edit'),(33990,'5543eca40f854','2015-05-01 21:14:12','2015-05-01 21:14:12',31.993151,'log_http_request','/task'),(33991,'5543eca441297','2015-05-01 21:14:12','2015-05-01 21:14:12',17.636061,'log_controller_method_request','/task/showForm'),(33992,'5543eca441297','2015-05-01 21:14:12','2015-05-01 21:14:12',66.121101,'log_http_request','/task/showForm'),(33993,'5543eca49d1f3','2015-05-01 21:14:12','2015-05-01 21:14:12',1.447201,'log_controller_method_request','/task/getItem'),(33994,'5543eca49d1f3','2015-05-01 21:14:12','2015-05-01 21:14:12',32.700062,'log_http_request','/task/getItem'),(33995,'5543eca55240b','2015-05-01 21:14:13','2015-05-01 21:14:13',17.202139,'log_http_request','/favicon.ico'),(33996,'5543eca6c6a03','2015-05-01 21:14:14','2015-05-01 21:14:14',9.580135,'log_controller_method_request','/task/listAll'),(33997,'5543eca6c6a03','2015-05-01 21:14:14','2015-05-01 21:14:14',49.911022,'log_http_request','/task/listAll'),(33998,'5543eca723dd6','2015-05-01 21:14:15','2015-05-01 21:14:15',19.456863,'log_http_request','/favicon.ico'),(33999,'5543ecab2e718','2015-05-01 21:14:19','2015-05-01 21:14:19',260.674957,'log_controller_method_request','/task/updateItems'),(34000,'5543ecab2e718','2015-05-01 21:14:19','2015-05-01 21:14:19',287.569031,'log_http_request','/task/updateItems'),(34001,'5543ecabb247e','2015-05-01 21:14:19','2015-05-01 21:14:19',6.453037,'log_controller_method_request','/task/listAll'),(34002,'5543ecabb247e','2015-05-01 21:14:19','2015-05-01 21:14:19',34.307003,'log_http_request','/task/listAll'),(34003,'5543ecac1a197','2015-05-01 21:14:20','2015-05-01 21:14:20',17.133951,'log_http_request','/favicon.ico'),(34004,'5543ecb08b37f','2015-05-01 21:14:24','2015-05-01 21:14:24',17.048120,'log_controller_method_request','/activetask/showForm'),(34005,'5543ecb08b37f','2015-05-01 21:14:24','2015-05-01 21:14:24',123.487000,'log_http_request','/activetask/showForm'),(34006,'5543ecb13353e','2015-05-01 21:14:25','2015-05-01 21:14:25',27.052879,'log_controller_method_request','/activetask/getNotes'),(34007,'5543ecb13353e','2015-05-01 21:14:25','2015-05-01 21:14:25',63.122990,'log_http_request','/activetask/getNotes'),(34008,'5543ecb23b772','2015-05-01 21:14:26','2015-05-01 21:14:26',17.893076,'log_http_request','/favicon.ico'),(34009,'5543ecb2d1346','2015-05-01 21:14:26','2015-05-01 21:14:26',11.428118,'log_controller_method_request','/activetask/forms'),(34010,'5543ecb2d1346','2015-05-01 21:14:26','2015-05-01 21:14:26',73.868034,'log_http_request','/activetask/forms'),(34011,'5543ecb33eb89','2015-05-01 21:14:27','2015-05-01 21:14:27',20.396948,'log_http_request','/favicon.ico'),(34012,'5543f30aa7aa8','2015-05-01 21:41:30','2015-05-01 21:41:30',48.391819,'log_http_request','/logout'),(34013,'5543f30b1a0fb','2015-05-01 21:41:31','2015-05-01 21:41:31',0.173092,'log_controller_method_request','/login'),(34014,'5543f30b1a0fb','2015-05-01 21:41:31','2015-05-01 21:41:31',81.941841,'log_http_request','/login'),(34015,'5543f30bde2fa','2015-05-01 21:41:31','2015-05-01 21:41:31',0.170946,'log_controller_method_request','/login'),(34016,'5543f30bde2fa','2015-05-01 21:41:31','2015-05-01 21:41:31',47.152996,'log_http_request','/login'),(34017,'5543f30cc0e3b','2015-05-01 21:41:32','2015-05-01 21:41:32',0.142097,'log_controller_method_request','/login'),(34018,'5543f30cc0e3b','2015-05-01 21:41:32','2015-05-01 21:41:32',48.295021,'log_http_request','/login'),(34019,'5543f312b8c08','2015-05-01 21:41:38','2015-05-01 21:41:38',12.898922,'log_controller_method_request','/auth'),(34020,'5543f312b8c08','2015-05-01 21:41:38','2015-05-01 21:41:38',59.082985,'log_http_request','/auth'),(34021,'5543f312e4b24','2015-05-01 21:41:38','2015-05-01 21:41:39',17.948866,'log_controller_method_request','/user/listAll'),(34022,'5543f312e4b24','2015-05-01 21:41:38','2015-05-01 21:41:39',95.304970,'log_http_request','/user/listAll'),(34023,'5543f3136b70a','2015-05-01 21:41:39','2015-05-01 21:41:39',16.654968,'log_http_request','/favicon.ico'),(34024,'5543f320e653b','2015-05-01 21:41:52','2015-05-01 21:41:52',0.284910,'log_controller_method_request','/user/showForm'),(34025,'5543f320e653b','2015-05-01 21:41:52','2015-05-01 21:41:53',71.462868,'log_http_request','/user/showForm'),(34026,'5543f32139cca','2015-05-01 21:41:53','2015-05-01 21:41:53',16.013145,'log_http_request','/favicon.ico'),(34027,'5543f32ea1266','2015-05-01 21:42:06','2015-05-01 21:42:06',32.330990,'log_http_request','/logout'),(34028,'5543f32ecf896','2015-05-01 21:42:06','2015-05-01 21:42:06',0.178099,'log_controller_method_request','/login'),(34029,'5543f32ecf896','2015-05-01 21:42:06','2015-05-01 21:42:06',61.758041,'log_http_request','/login'),(34030,'5543f32f46d12','2015-05-01 21:42:07','2015-05-01 21:42:07',0.128984,'log_controller_method_request','/login'),(34031,'5543f32f46d12','2015-05-01 21:42:07','2015-05-01 21:42:07',41.071892,'log_http_request','/login'),(34032,'5543f3346aa00','2015-05-01 21:42:12','2015-05-01 21:42:12',61.665058,'log_controller_method_request','/auth'),(34033,'5543f3346aa00','2015-05-01 21:42:12','2015-05-01 21:42:12',143.207077,'log_http_request','/auth'),(34034,'5543f334da1da','2015-05-01 21:42:12','2015-05-01 21:42:13',192.173004,'log_http_request','/project'),(34035,'5543f33546010','2015-05-01 21:42:13','2015-05-01 21:42:13',6.131887,'log_controller_method_request','/project/listAll'),(34036,'5543f33546010','2015-05-01 21:42:13','2015-05-01 21:42:13',52.219151,'log_http_request','/project/listAll'),(34037,'5543f3358a5d0','2015-05-01 21:42:13','2015-05-01 21:42:13',16.973972,'log_http_request','/favicon.ico'),(34038,'5543f33acc47c','2015-05-01 21:42:18','2015-05-01 21:42:18',3.920078,'log_controller_method_request','/service/showForm'),(34039,'5543f33acc47c','2015-05-01 21:42:18','2015-05-01 21:42:18',71.895126,'log_http_request','/service/showForm'),(34040,'5543f33b3419c','2015-05-01 21:42:19','2015-05-01 21:42:19',18.558025,'log_http_request','/favicon.ico'),(34041,'5543f3434871d','2015-05-01 21:42:27','2015-05-01 21:42:27',30.405998,'log_controller_method_request','/service/add'),(34042,'5543f3434871d','2015-05-01 21:42:27','2015-05-01 21:42:27',81.012962,'log_http_request','/service/add'),(34043,'5543f3447fc8a','2015-05-01 21:42:28','2015-05-01 21:42:28',23.632050,'log_controller_method_request','/service/listAll'),(34044,'5543f3447fc8a','2015-05-01 21:42:28','2015-05-01 21:42:28',87.526794,'log_http_request','/service/listAll'),(34045,'5543f344cd183','2015-05-01 21:42:28','2015-05-01 21:42:28',14.963150,'log_http_request','/favicon.ico'),(34046,'5543f349404eb','2015-05-01 21:42:33','2015-05-01 21:42:33',36.149979,'log_http_request','/logout'),(34047,'5543f349675e9','2015-05-01 21:42:33','2015-05-01 21:42:33',0.156164,'log_controller_method_request','/login'),(34048,'5543f349675e9','2015-05-01 21:42:33','2015-05-01 21:42:33',70.044044,'log_http_request','/login'),(34049,'5543f349da1db','2015-05-01 21:42:33','2015-05-01 21:42:33',0.127077,'log_controller_method_request','/login'),(34050,'5543f349da1db','2015-05-01 21:42:33','2015-05-01 21:42:33',76.004028,'log_http_request','/login'),(34051,'5543f3506b702','2015-05-01 21:42:40','2015-05-01 21:42:40',7.142067,'log_controller_method_request','/auth'),(34052,'5543f3506b702','2015-05-01 21:42:40','2015-05-01 21:42:40',78.110214,'log_http_request','/auth'),(34053,'5543f35765be1','2015-05-01 21:42:47','2015-05-01 21:42:47',4.359961,'log_controller_method_request','/auth'),(34054,'5543f35765be1','2015-05-01 21:42:47','2015-05-01 21:42:47',54.327965,'log_http_request','/auth'),(34055,'5543f35794f11','2015-05-01 21:42:47','2015-05-01 21:42:47',6.834984,'log_controller_method_request','/user/listAll'),(34056,'5543f35794f11','2015-05-01 21:42:47','2015-05-01 21:42:47',60.402157,'log_http_request','/user/listAll'),(34057,'5543f357e1725','2015-05-01 21:42:47','2015-05-01 21:42:47',19.901991,'log_http_request','/favicon.ico'),(34058,'5543f376145c1','2015-05-01 21:43:18','2015-05-01 21:43:18',13.522863,'log_controller_method_request','/user/delete'),(34059,'5543f376145c1','2015-05-01 21:43:18','2015-05-01 21:43:18',66.325905,'log_http_request','/user/delete'),(34060,'5543f376c1b33','2015-05-01 21:43:18','2015-05-01 21:43:18',2.856016,'log_controller_method_request','/user/listAll'),(34061,'5543f376c1b33','2015-05-01 21:43:18','2015-05-01 21:43:18',126.140831,'log_http_request','/user/listAll'),(34062,'5543f3776d109','2015-05-01 21:43:19','2015-05-01 21:43:19',11.424065,'log_http_request','/favicon.ico'),(34063,'5543f37a0686b','2015-05-01 21:43:22','2015-05-01 21:43:22',5.819082,'log_controller_method_request','/user/delete'),(34064,'5543f37a0686b','2015-05-01 21:43:22','2015-05-01 21:43:22',455.827942,'log_http_request','/user/delete'),(34065,'5543f37b35ba0','2015-05-01 21:43:23','2015-05-01 21:43:23',6.980896,'log_controller_method_request','/user/listAll'),(34066,'5543f37b35ba0','2015-05-01 21:43:23','2015-05-01 21:43:23',437.065826,'log_http_request','/user/listAll'),(34067,'5543f37c0dd97','2015-05-01 21:43:24','2015-05-01 21:43:24',15.146017,'log_http_request','/favicon.ico'),(34068,'5543f38108f77','2015-05-01 21:43:29','2015-05-01 21:43:29',4.871845,'log_controller_method_request','/user/delete'),(34069,'5543f38108f77','2015-05-01 21:43:29','2015-05-01 21:43:29',53.915024,'log_http_request','/user/delete'),(34070,'5543f381b4adf','2015-05-01 21:43:29','2015-05-01 21:43:29',3.632069,'log_controller_method_request','/user/listAll'),(34071,'5543f381b4adf','2015-05-01 21:43:29','2015-05-01 21:43:29',47.844887,'log_http_request','/user/listAll'),(34072,'5543f38208f7b','2015-05-01 21:43:30','2015-05-01 21:43:30',12.511015,'log_http_request','/favicon.ico'),(34073,'5543f387cb775','2015-05-01 21:43:35','2015-05-01 21:43:35',5.125046,'log_controller_method_request','/user/delete'),(34074,'5543f387cb775','2015-05-01 21:43:35','2015-05-01 21:43:35',111.268997,'log_http_request','/user/delete'),(34075,'5543f3888ccda','2015-05-01 21:43:36','2015-05-01 21:43:36',4.062176,'log_controller_method_request','/user/listAll'),(34076,'5543f3888ccda','2015-05-01 21:43:36','2015-05-01 21:43:36',116.322990,'log_http_request','/user/listAll'),(34077,'5543f389104ac','2015-05-01 21:43:37','2015-05-01 21:43:37',19.953012,'log_http_request','/favicon.ico'),(34078,'5543f38c8d9dd','2015-05-01 21:43:40','2015-05-01 21:43:40',4.770041,'log_controller_method_request','/user/delete'),(34079,'5543f38c8d9dd','2015-05-01 21:43:40','2015-05-01 21:43:40',63.503029,'log_http_request','/user/delete'),(34080,'5543f38d44602','2015-05-01 21:43:41','2015-05-01 21:43:41',4.261017,'log_controller_method_request','/user/listAll'),(34081,'5543f38d44602','2015-05-01 21:43:41','2015-05-01 21:43:41',34.749031,'log_http_request','/user/listAll'),(34082,'5543f38d8168d','2015-05-01 21:43:41','2015-05-01 21:43:41',11.534929,'log_http_request','/favicon.ico'),(34083,'5543f3924bb2b','2015-05-01 21:43:46','2015-05-01 21:43:46',5.125046,'log_controller_method_request','/user/delete'),(34084,'5543f3924bb2b','2015-05-01 21:43:46','2015-05-01 21:43:46',36.388874,'log_http_request','/user/delete'),(34085,'5543f392ee757','2015-05-01 21:43:47','2015-05-01 21:43:47',4.058123,'log_controller_method_request','/user/listAll'),(34086,'5543f392ee757','2015-05-01 21:43:46','2015-05-01 21:43:47',29.606819,'log_http_request','/user/listAll'),(34087,'5543f39339cb8','2015-05-01 21:43:47','2015-05-01 21:43:47',12.092113,'log_http_request','/favicon.ico'),(34088,'5543f3973a9b8','2015-05-01 21:43:51','2015-05-01 21:43:51',4.892111,'log_controller_method_request','/user/delete'),(34089,'5543f3973a9b8','2015-05-01 21:43:51','2015-05-01 21:43:51',44.128895,'log_http_request','/user/delete'),(34090,'5543f397deff3','2015-05-01 21:43:51','2015-05-01 21:43:51',4.431009,'log_controller_method_request','/user/listAll'),(34091,'5543f397deff3','2015-05-01 21:43:51','2015-05-01 21:43:51',42.063000,'log_http_request','/user/listAll'),(34092,'5543f39828b46','2015-05-01 21:43:52','2015-05-01 21:43:52',12.192965,'log_http_request','/favicon.ico'),(34093,'5543f39bad5b3','2015-05-01 21:43:55','2015-05-01 21:43:55',4.949093,'log_controller_method_request','/user/delete'),(34094,'5543f39bad5b3','2015-05-01 21:43:55','2015-05-01 21:43:55',32.963989,'log_http_request','/user/delete'),(34095,'5543f39c59882','2015-05-01 21:43:56','2015-05-01 21:43:56',6.098986,'log_controller_method_request','/user/listAll'),(34096,'5543f39c59882','2015-05-01 21:43:56','2015-05-01 21:43:56',38.893936,'log_http_request','/user/listAll'),(34097,'5543f39c99d2a','2015-05-01 21:43:56','2015-05-01 21:43:56',23.912907,'log_http_request','/favicon.ico'),(34098,'5543f3a046d09','2015-05-01 21:44:00','2015-05-01 21:44:00',10.874987,'log_controller_method_request','/user/delete'),(34099,'5543f3a046d09','2015-05-01 21:44:00','2015-05-01 21:44:00',44.154881,'log_http_request','/user/delete'),(34100,'5543f3a0eda50','2015-05-01 21:44:01','2015-05-01 21:44:01',8.820057,'log_controller_method_request','/user/listAll'),(34101,'5543f3a0eda50','2015-05-01 21:44:00','2015-05-01 21:44:01',42.496922,'log_http_request','/user/listAll'),(34102,'5543f3a13a9bb','2015-05-01 21:44:01','2015-05-01 21:44:01',18.509865,'log_http_request','/favicon.ico'),(34103,'5543f3a86c3fe','2015-05-01 21:44:08','2015-05-01 21:44:08',0.437975,'log_controller_method_request','/user/showForm'),(34104,'5543f3a86c3fe','2015-05-01 21:44:08','2015-05-01 21:44:08',41.285038,'log_http_request','/user/showForm'),(34105,'5543f3a8c8359','2015-05-01 21:44:08','2015-05-01 21:44:08',2.429962,'log_controller_method_request','/user/getItem'),(34106,'5543f3a8c8359','2015-05-01 21:44:08','2015-05-01 21:44:08',40.545223,'log_http_request','/user/getItem'),(34107,'5543f3a8e2403','2015-05-01 21:44:08','2015-05-01 21:44:08',19.175053,'log_http_request','/favicon.ico'),(34108,'5543f3ebe3e14','2015-05-01 21:45:15','2015-05-01 21:45:15',1.166105,'log_controller_method_request','/user/listAll'),(34109,'5543f3ebe3e14','2015-05-01 21:45:15','2015-05-01 21:45:15',44.872997,'log_http_request','/user/listAll'),(34110,'5543f3ec42be8','2015-05-01 21:45:16','2015-05-01 21:45:16',17.831087,'log_http_request','/favicon.ico'),(34111,'5543f3f00ea93','2015-05-01 21:45:20','2015-05-01 21:45:20',9.469986,'log_controller_method_request','/user/delete'),(34112,'5543f3f00ea93','2015-05-01 21:45:20','2015-05-01 21:45:20',37.122967,'log_http_request','/user/delete'),(34113,'5543f3f0afcb3','2015-05-01 21:45:20','2015-05-01 21:45:20',55.333138,'log_controller_method_request','/user/listAll'),(34114,'5543f3f0afcb3','2015-05-01 21:45:20','2015-05-01 21:45:20',107.795952,'log_http_request','/user/listAll'),(34115,'5543f3f11ade2','2015-05-01 21:45:21','2015-05-01 21:45:21',18.832207,'log_http_request','/favicon.ico'),(34116,'5543f46e2712e','2015-05-01 21:47:26','2015-05-01 21:47:26',0.217915,'log_controller_method_request','/login'),(34117,'5543f46e2712e','2015-05-01 21:47:26','2015-05-01 21:47:26',74.957848,'log_http_request','/login'),(34118,'5543f47360d9f','2015-05-01 21:47:31','2015-05-01 21:47:31',0.168085,'log_controller_method_request','/login'),(34119,'5543f47360d9f','2015-05-01 21:47:31','2015-05-01 21:47:31',43.684959,'log_http_request','/login'),(34120,'554422d307db6','2015-05-02 01:05:23','2015-05-02 01:05:23',0.178099,'log_controller_method_request','/login'),(34121,'554422d307db6','2015-05-02 01:05:23','2015-05-02 01:05:23',142.789124,'log_http_request','/login'),(34122,'554436d593b4e','2015-05-02 02:30:45','2015-05-02 02:30:45',0.182152,'log_controller_method_request','/login'),(34123,'554436d593b4e','2015-05-02 02:30:45','2015-05-02 02:30:45',174.402954,'log_http_request','/login'),(34124,'554436d8088c4','2015-05-02 02:30:48','2015-05-02 02:30:48',0.242949,'log_controller_method_request','/login'),(34125,'554436d8088c4','2015-05-02 02:30:48','2015-05-02 02:30:49',1238.459839,'log_http_request','/login'),(34126,'55446a0805c8e','2015-05-02 06:09:12','2015-05-02 06:09:12',0.199080,'log_controller_method_request','/login'),(34127,'55446a0805c8e','2015-05-02 06:09:12','2015-05-02 06:09:12',185.515167,'log_http_request','/login'),(34128,'55446a0c0f8cc','2015-05-02 06:09:16','2015-05-02 06:09:16',0.138998,'log_controller_method_request','/login'),(34129,'55446a0c0f8cc','2015-05-02 06:09:16','2015-05-02 06:09:16',53.668976,'log_http_request','/login'),(34130,'55446a10628fc','2015-05-02 06:09:20','2015-05-02 06:09:20',169.401886,'log_controller_method_request','/auth'),(34131,'55446a10628fc','2015-05-02 06:09:20','2015-05-02 06:09:20',229.675049,'log_http_request','/auth'),(34132,'55446a1109dab','2015-05-02 06:09:21','2015-05-02 06:09:21',129.906891,'log_http_request','/project'),(34133,'55446a1183ec7','2015-05-02 06:09:21','2015-05-02 06:09:21',27.912855,'log_controller_method_request','/project/listAll'),(34134,'55446a1183ec7','2015-05-02 06:09:21','2015-05-02 06:09:21',200.428970,'log_http_request','/project/listAll'),(34135,'55446a12d95f9','2015-05-02 06:09:22','2015-05-02 06:09:22',45.016048,'log_http_request','/Web/css/core/images/ui-bg_flat_75_ffffff_40x100.png'),(34136,'55446a139362c','2015-05-02 06:09:23','2015-05-02 06:09:23',13.410091,'log_http_request','/favicon.ico'),(34137,'55446a1f66a06','2015-05-02 06:09:35','2015-05-02 06:09:35',4.301071,'log_controller_method_request','/technician/listAll'),(34138,'55446a1f66a06','2015-05-02 06:09:35','2015-05-02 06:09:35',92.132095,'log_http_request','/technician/listAll'),(34139,'55446a2074762','2015-05-02 06:09:36','2015-05-02 06:09:36',17.632961,'log_http_request','/favicon.ico'),(34140,'55446a5360edb','2015-05-02 06:10:27','2015-05-02 06:10:27',5.081177,'log_controller_method_request','/project/listAll'),(34141,'55446a5360edb','2015-05-02 06:10:27','2015-05-02 06:10:27',52.773952,'log_http_request','/project/listAll'),(34142,'55446a541a21e','2015-05-02 06:10:28','2015-05-02 06:10:28',19.513845,'log_http_request','/favicon.ico'),(34143,'55446a57ac9d9','2015-05-02 06:10:31','2015-05-02 06:10:31',4.171133,'log_controller_method_request','/technician/listAll'),(34144,'55446a57ac9d9','2015-05-02 06:10:31','2015-05-02 06:10:31',29.726028,'log_http_request','/technician/listAll'),(34145,'55446a5855890','2015-05-02 06:10:32','2015-05-02 06:10:32',19.752979,'log_http_request','/favicon.ico'),(34146,'55446a5e0ebbe','2015-05-02 06:10:38','2015-05-02 06:10:38',5.721092,'log_controller_method_request','/project/listAll'),(34147,'55446a5e0ebbe','2015-05-02 06:10:38','2015-05-02 06:10:38',42.057991,'log_http_request','/project/listAll'),(34148,'55446a5e9f974','2015-05-02 06:10:38','2015-05-02 06:10:38',11.465073,'log_http_request','/favicon.ico'),(34149,'55446affdfe0f','2015-05-02 06:13:19','2015-05-02 06:13:19',5.117893,'log_controller_method_request','/technician/listAll'),(34150,'55446affdfe0f','2015-05-02 06:13:19','2015-05-02 06:13:19',44.939041,'log_http_request','/technician/listAll'),(34151,'55446b009913f','2015-05-02 06:13:20','2015-05-02 06:13:20',19.508123,'log_http_request','/favicon.ico'),(34152,'55446b0830e8f','2015-05-02 06:13:28','2015-05-02 06:13:28',2.172947,'log_controller_method_request','/technician/showForm'),(34153,'55446b0830e8f','2015-05-02 06:13:28','2015-05-02 06:13:28',146.307938,'log_http_request','/technician/showForm'),(34154,'55446b08ee86d','2015-05-02 06:13:29','2015-05-02 06:13:29',9.907961,'log_controller_method_request','/technician/getItem'),(34155,'55446b08ee86d','2015-05-02 06:13:28','2015-05-02 06:13:29',36.422970,'log_http_request','/technician/getItem'),(34156,'55446b0956597','2015-05-02 06:13:29','2015-05-02 06:13:29',11.939049,'log_http_request','/favicon.ico'),(34157,'55446b09683f7','2015-05-02 06:13:29','2015-05-02 06:13:29',24.163961,'log_controller_method_request','/file/load'),(34158,'55446b09683f7','2015-05-02 06:13:29','2015-05-02 06:13:29',81.488846,'log_http_request','/file/load'),(34159,'55446b09b31e4','2015-05-02 06:13:29','2015-05-02 06:13:29',8.755922,'log_controller_method_request','/user/getTechnicianItem'),(34160,'55446b09b31e4','2015-05-02 06:13:29','2015-05-02 06:13:29',61.814072,'log_http_request','/user/getTechnicianItem'),(34161,'55446b1a21727','2015-05-02 06:13:46','2015-05-02 06:13:46',8.309841,'log_controller_method_request','/project/listAll'),(34162,'55446b1a21727','2015-05-02 06:13:46','2015-05-02 06:13:46',41.807175,'log_http_request','/project/listAll'),(34163,'55446b1aabcce','2015-05-02 06:13:46','2015-05-02 06:13:46',12.230873,'log_http_request','/favicon.ico'),(34164,'55446b8334298','2015-05-02 06:15:31','2015-05-02 06:15:31',5.246162,'log_controller_method_request','/project/listAll'),(34165,'55446b8334298','2015-05-02 06:15:31','2015-05-02 06:15:31',38.318157,'log_http_request','/project/listAll'),(34166,'55446b83a8892','2015-05-02 06:15:31','2015-05-02 06:15:31',71.986198,'log_controller_method_request','/project/getlist'),(34167,'55446b83a8892','2015-05-02 06:15:31','2015-05-02 06:15:31',111.307861,'log_http_request','/project/getlist'),(34168,'55446b8495012','2015-05-02 06:15:32','2015-05-02 06:15:32',12.617111,'log_http_request','/favicon.ico'),(34169,'55446b8d1fd13','2015-05-02 06:15:41','2015-05-02 06:15:41',20.813942,'log_controller_method_request','/task/listAll'),(34170,'55446b8d1fd13','2015-05-02 06:15:41','2015-05-02 06:15:41',84.445000,'log_http_request','/task/listAll'),(34171,'55446b8e16dd8','2015-05-02 06:15:42','2015-05-02 06:15:42',12.614012,'log_http_request','/favicon.ico'),(34172,'55446ba955899','2015-05-02 06:16:09','2015-05-02 06:16:09',6.496906,'log_controller_method_request','/technician/listAll'),(34173,'55446ba955899','2015-05-02 06:16:09','2015-05-02 06:16:09',48.061848,'log_http_request','/technician/listAll'),(34174,'55446baa11fb2','2015-05-02 06:16:10','2015-05-02 06:16:10',13.645887,'log_http_request','/favicon.ico'),(34175,'55446bacac9ab','2015-05-02 06:16:12','2015-05-02 06:16:12',8.322001,'log_controller_method_request','/project/listAll'),(34176,'55446bacac9ab','2015-05-02 06:16:12','2015-05-02 06:16:12',49.083946,'log_http_request','/project/listAll'),(34177,'55446bad6df0f','2015-05-02 06:16:13','2015-05-02 06:16:13',19.268036,'log_http_request','/favicon.ico'),(34178,'55446c0b3f8d1','2015-05-02 06:17:47','2015-05-02 06:17:47',13.808012,'log_controller_method_request','/task/addPrompt'),(34179,'55446c0b3f8d1','2015-05-02 06:17:47','2015-05-02 06:17:47',72.360992,'log_http_request','/task/addPrompt'),(34180,'55446c0c11faa','2015-05-02 06:17:48','2015-05-02 06:17:48',15.298843,'log_http_request','/favicon.ico'),(34181,'55446c103d1ce','2015-05-02 06:17:52','2015-05-02 06:17:52',6.226063,'log_controller_method_request','/task/listAll'),(34182,'55446c103d1ce','2015-05-02 06:17:52','2015-05-02 06:17:52',36.175014,'log_http_request','/task/listAll'),(34183,'55446c10dbcd7','2015-05-02 06:17:52','2015-05-02 06:17:52',13.890028,'log_http_request','/favicon.ico'),(34184,'55446c1150a4b','2015-05-02 06:17:53','2015-05-02 06:17:53',10.235071,'log_controller_method_request','/task/listAll'),(34185,'55446c1150a4b','2015-05-02 06:17:53','2015-05-02 06:17:53',54.064034,'log_http_request','/task/listAll'),(34186,'55446c11edb50','2015-05-02 06:17:53','2015-05-02 06:17:54',17.833948,'log_http_request','/favicon.ico'),(34187,'55446c1864fcc','2015-05-02 06:18:00','2015-05-02 06:18:00',9.716034,'log_controller_method_request','/task/listAll'),(34188,'55446c1864fcc','2015-05-02 06:18:00','2015-05-02 06:18:00',49.420834,'log_http_request','/task/listAll'),(34189,'55446c18f1c65','2015-05-02 06:18:01','2015-05-02 06:18:01',17.785072,'log_http_request','/favicon.ico'),(34190,'55446d450352f','2015-05-02 06:23:01','2015-05-02 06:23:01',6.138086,'log_controller_method_request','/location/listAll'),(34191,'55446d450352f','2015-05-02 06:23:01','2015-05-02 06:23:01',88.335037,'log_http_request','/location/listAll'),(34192,'55446d4609051','2015-05-02 06:23:02','2015-05-02 06:23:02',20.761013,'log_http_request','/favicon.ico'),(34193,'55446d4ebcdec','2015-05-02 06:23:10','2015-05-02 06:23:10',3.200054,'log_controller_method_request','/location/listAll'),(34194,'55446d4ebcdec','2015-05-02 06:23:10','2015-05-02 06:23:10',52.929878,'log_http_request','/location/listAll'),(34195,'55446d4f58c5a','2015-05-02 06:23:11','2015-05-02 06:23:11',13.505936,'log_http_request','/favicon.ico'),(34196,'55446d5069dcd','2015-05-02 06:23:12','2015-05-02 06:23:12',4.125118,'log_controller_method_request','/technician/listAll'),(34197,'55446d5069dcd','2015-05-02 06:23:12','2015-05-02 06:23:12',81.490044,'log_http_request','/technician/listAll'),(34198,'55446d5112c8e','2015-05-02 06:23:13','2015-05-02 06:23:13',12.231112,'log_http_request','/favicon.ico'),(34199,'55446d57c9e3f','2015-05-02 06:23:19','2015-05-02 06:23:19',5.306005,'log_controller_method_request','/location/listAll'),(34200,'55446d57c9e3f','2015-05-02 06:23:19','2015-05-02 06:23:19',37.446022,'log_http_request','/location/listAll'),(34201,'55446d5861bac','2015-05-02 06:23:20','2015-05-02 06:23:20',13.520956,'log_http_request','/favicon.ico'),(34202,'55446d5a31b62','2015-05-02 06:23:22','2015-05-02 06:23:22',6.323099,'log_controller_method_request','/technician/listAll'),(34203,'55446d5a31b62','2015-05-02 06:23:22','2015-05-02 06:23:22',67.903046,'log_http_request','/technician/listAll'),(34204,'55446d5ad207b','2015-05-02 06:23:22','2015-05-02 06:23:22',20.219088,'log_http_request','/favicon.ico'),(34205,'55446d5c942de','2015-05-02 06:23:24','2015-05-02 06:23:24',3.287077,'log_controller_method_request','/location/listAll'),(34206,'55446d5c942de','2015-05-02 06:23:24','2015-05-02 06:23:24',31.456947,'log_http_request','/location/listAll'),(34207,'55446d5d216f4','2015-05-02 06:23:25','2015-05-02 06:23:25',13.273001,'log_http_request','/favicon.ico'),(34208,'55446d608c0ba','2015-05-02 06:23:28','2015-05-02 06:23:28',4.091978,'log_controller_method_request','/technician/listAll'),(34209,'55446d608c0ba','2015-05-02 06:23:28','2015-05-02 06:23:28',31.782150,'log_http_request','/technician/listAll'),(34210,'55446d613697d','2015-05-02 06:23:29','2015-05-02 06:23:29',14.259100,'log_http_request','/favicon.ico'),(34211,'55446d62ea712','2015-05-02 06:23:31','2015-05-02 06:23:31',4.154921,'log_controller_method_request','/location/listAll'),(34212,'55446d62ea712','2015-05-02 06:23:30','2015-05-02 06:23:31',37.519932,'log_http_request','/location/listAll'),(34213,'55446d638f4c0','2015-05-02 06:23:31','2015-05-02 06:23:31',12.235880,'log_http_request','/favicon.ico'),(34214,'55446d8817aaa','2015-05-02 06:24:08','2015-05-02 06:24:08',6.532907,'log_controller_method_request','/technician/listAll'),(34215,'55446d8817aaa','2015-05-02 06:24:08','2015-05-02 06:24:08',54.840088,'log_http_request','/technician/listAll'),(34216,'55446d88a9563','2015-05-02 06:24:08','2015-05-02 06:24:08',13.499022,'log_http_request','/favicon.ico'),(34217,'55446d894c903','2015-05-02 06:24:09','2015-05-02 06:24:09',3.540993,'log_controller_method_request','/location/listAll'),(34218,'55446d894c903','2015-05-02 06:24:09','2015-05-02 06:24:09',30.308962,'log_http_request','/location/listAll'),(34219,'55446d89dbcaf','2015-05-02 06:24:09','2015-05-02 06:24:09',19.152880,'log_http_request','/favicon.ico'),(34220,'55446d8c8175d','2015-05-02 06:24:12','2015-05-02 06:24:12',10.780811,'log_controller_method_request','/map/allProjects'),(34221,'55446d8c8175d','2015-05-02 06:24:12','2015-05-02 06:24:12',107.495071,'log_http_request','/map/allProjects'),(34222,'55446d8eb58b1','2015-05-02 06:24:14','2015-05-02 06:24:14',12.423038,'log_http_request','/favicon.ico'),(34223,'55446d8ecf967','2015-05-02 06:24:14','2015-05-02 06:24:14',4.486084,'log_controller_method_request','/map/listAll'),(34224,'55446d8ecf967','2015-05-02 06:24:14','2015-05-02 06:24:14',33.702133,'log_http_request','/map/listAll'),(34225,'55446d8f2a625','2015-05-02 06:24:15','2015-05-02 06:24:15',3.052950,'log_controller_method_request','/location/listAll'),(34226,'55446d8f2a625','2015-05-02 06:24:15','2015-05-02 06:24:15',28.772831,'log_http_request','/location/listAll'),(34227,'55446d8fc4312','2015-05-02 06:24:15','2015-05-02 06:24:15',18.491983,'log_http_request','/favicon.ico'),(34228,'55446d9060e8b','2015-05-02 06:24:16','2015-05-02 06:24:16',11.913776,'log_controller_method_request','/technician/listAll'),(34229,'55446d9060e8b','2015-05-02 06:24:16','2015-05-02 06:24:16',41.370869,'log_http_request','/technician/listAll'),(34230,'55446d9104f2e','2015-05-02 06:24:17','2015-05-02 06:24:17',13.196945,'log_http_request','/favicon.ico'),(34231,'55446d9860190','2015-05-02 06:24:24','2015-05-02 06:24:24',7.452011,'log_controller_method_request','/project/listAll'),(34232,'55446d9860190','2015-05-02 06:24:24','2015-05-02 06:24:24',39.856911,'log_http_request','/project/listAll'),(34233,'55446d98ee828','2015-05-02 06:24:24','2015-05-02 06:24:24',11.857986,'log_http_request','/favicon.ico'),(34234,'55446d9b64fa2','2015-05-02 06:24:27','2015-05-02 06:24:27',4.602194,'log_controller_method_request','/technician/listAll'),(34235,'55446d9b64fa2','2015-05-02 06:24:27','2015-05-02 06:24:27',61.466930,'log_http_request','/technician/listAll'),(34236,'55446d9c04f2c','2015-05-02 06:24:28','2015-05-02 06:24:28',18.073082,'log_http_request','/favicon.ico'),(34237,'55446da1d6185','2015-05-02 06:24:33','2015-05-02 06:24:33',3.148079,'log_controller_method_request','/location/listAll'),(34238,'55446da1d6185','2015-05-02 06:24:33','2015-05-02 06:24:33',35.598991,'log_http_request','/location/listAll'),(34239,'55446da27c94b','2015-05-02 06:24:34','2015-05-02 06:24:34',19.205093,'log_http_request','/favicon.ico'),(34240,'55446da44aef8','2015-05-02 06:24:36','2015-05-02 06:24:36',10.270119,'log_controller_method_request','/task/listAll'),(34241,'55446da44aef8','2015-05-02 06:24:36','2015-05-02 06:24:36',51.675079,'log_http_request','/task/listAll'),(34242,'55446da4da2a2','2015-05-02 06:24:36','2015-05-02 06:24:36',20.779133,'log_http_request','/favicon.ico'),(34243,'55446dbe3b791','2015-05-02 06:25:02','2015-05-02 06:25:02',3.383160,'log_controller_method_request','/location/listAll'),(34244,'55446dbe3b791','2015-05-02 06:25:02','2015-05-02 06:25:02',43.282032,'log_http_request','/location/listAll'),(34245,'55446dbecc544','2015-05-02 06:25:02','2015-05-02 06:25:02',14.885902,'log_http_request','/favicon.ico'),(34246,'55446dc474705','2015-05-02 06:25:08','2015-05-02 06:25:08',6.253958,'log_controller_method_request','/technician/listAll'),(34247,'55446dc474705','2015-05-02 06:25:08','2015-05-02 06:25:08',49.453018,'log_http_request','/technician/listAll'),(34248,'55446dc50de62','2015-05-02 06:25:09','2015-05-02 06:25:09',19.261837,'log_http_request','/favicon.ico'),(34249,'55446dced5482','2015-05-02 06:25:18','2015-05-02 06:25:18',9.359121,'log_controller_method_request','/task/listAll'),(34250,'55446dced5482','2015-05-02 06:25:18','2015-05-02 06:25:18',37.929058,'log_http_request','/task/listAll'),(34251,'55446dcf899a3','2015-05-02 06:25:19','2015-05-02 06:25:19',15.948057,'log_http_request','/favicon.ico'),(34252,'55446dd052424','2015-05-02 06:25:20','2015-05-02 06:25:20',3.742933,'log_controller_method_request','/map/allProjects'),(34253,'55446dd052424','2015-05-02 06:25:20','2015-05-02 06:25:20',44.437885,'log_http_request','/map/allProjects'),(34254,'55446dd0ea70b','2015-05-02 06:25:20','2015-05-02 06:25:20',13.304949,'log_http_request','/favicon.ico'),(34255,'55446dd1ece25','2015-05-02 06:25:22','2015-05-02 06:25:22',3.829002,'log_controller_method_request','/map/listAll'),(34256,'55446dd1ece25','2015-05-02 06:25:21','2015-05-02 06:25:22',40.616035,'log_http_request','/map/listAll'),(34257,'55446dd2d6181','2015-05-02 06:25:22','2015-05-02 06:25:22',4.578114,'log_controller_method_request','/location/listAll'),(34258,'55446dd2d6181','2015-05-02 06:25:22','2015-05-02 06:25:22',41.662930,'log_http_request','/location/listAll'),(34259,'55446dd36f8e6','2015-05-02 06:25:23','2015-05-02 06:25:23',19.248962,'log_http_request','/favicon.ico'),(34260,'55446de0c360f','2015-05-02 06:25:36','2015-05-02 06:25:36',6.533146,'log_controller_method_request','/technician/listAll'),(34261,'55446de0c360f','2015-05-02 06:25:36','2015-05-02 06:25:36',51.097157,'log_http_request','/technician/listAll'),(34262,'55446de1690b2','2015-05-02 06:25:37','2015-05-02 06:25:37',11.978865,'log_http_request','/favicon.ico'),(34263,'55446de2e3ee1','2015-05-02 06:25:38','2015-05-02 06:25:38',4.456043,'log_controller_method_request','/location/listAll'),(34264,'55446de2e3ee1','2015-05-02 06:25:38','2015-05-02 06:25:38',36.026955,'log_http_request','/location/listAll'),(34265,'55446de37e350','2015-05-02 06:25:39','2015-05-02 06:25:39',20.163059,'log_http_request','/favicon.ico'),(34266,'55446de5257fb','2015-05-02 06:25:41','2015-05-02 06:25:41',4.560947,'log_controller_method_request','/technician/listAll'),(34267,'55446de5257fb','2015-05-02 06:25:41','2015-05-02 06:25:41',30.376911,'log_http_request','/technician/listAll'),(34268,'55446de5b7fc2','2015-05-02 06:25:41','2015-05-02 06:25:41',21.085024,'log_http_request','/favicon.ico'),(34269,'5544e980e3f88','2015-05-02 15:13:05','2015-05-02 15:13:05',0.252962,'log_controller_method_request','/login'),(34270,'5544e980e3f88','2015-05-02 15:13:04','2015-05-02 15:13:05',320.369965,'log_http_request','/login'),(34271,'554502bfc1a19','2015-05-02 17:00:47','2015-05-02 17:00:47',0.236988,'log_controller_method_request','/login'),(34272,'554502bfc1a19','2015-05-02 17:00:47','2015-05-02 17:00:47',129.809860,'log_http_request','/login'),(34273,'554502c408161','2015-05-02 17:00:52','2015-05-02 17:00:52',0.208855,'log_controller_method_request','/login'),(34274,'554502c408161','2015-05-02 17:00:52','2015-05-02 17:00:52',55.660961,'log_http_request','/login'),(34275,'554506ac6b586','2015-05-02 17:17:32','2015-05-02 17:17:32',0.164986,'log_controller_method_request','/login'),(34276,'554506ac6b586','2015-05-02 17:17:32','2015-05-02 17:17:32',61.635971,'log_http_request','/login'),(34277,'554506b054905','2015-05-02 17:17:36','2015-05-02 17:17:36',0.176907,'log_controller_method_request','/login'),(34278,'554506b054905','2015-05-02 17:17:36','2015-05-02 17:17:36',47.111988,'log_http_request','/login'),(34279,'554512b2bca65','2015-05-02 18:08:50','2015-05-02 18:08:50',0.225067,'log_controller_method_request','/login'),(34280,'554512b2bca65','2015-05-02 18:08:50','2015-05-02 18:08:50',151.026962,'log_http_request','/login'),(34281,'554512b498d93','2015-05-02 18:08:52','2015-05-02 18:08:52',0.174046,'log_controller_method_request','/login'),(34282,'554512b498d93','2015-05-02 18:08:52','2015-05-02 18:08:52',52.346947,'log_http_request','/login'),(34283,'554530a45e102','2015-05-02 20:16:36','2015-05-02 20:16:36',0.192881,'log_controller_method_request','/login'),(34284,'554530a45e102','2015-05-02 20:16:36','2015-05-02 20:16:36',202.084061,'log_http_request','/login'),(34285,'554530a556bd3','2015-05-02 20:16:37','2015-05-02 20:16:37',0.144958,'log_controller_method_request','/login'),(34286,'554530a556bd3','2015-05-02 20:16:37','2015-05-02 20:16:37',58.532951,'log_http_request','/login'),(34287,'55454187c6eff','2015-05-02 21:28:39','2015-05-02 21:28:39',0.188112,'log_controller_method_request','/login'),(34288,'55454187c6eff','2015-05-02 21:28:39','2015-05-02 21:28:39',98.251106,'log_http_request','/login'),(34289,'55454188c13d6','2015-05-02 21:28:40','2015-05-02 21:28:40',0.142097,'log_controller_method_request','/login'),(34290,'55454188c13d6','2015-05-02 21:28:40','2015-05-02 21:28:40',42.243004,'log_http_request','/login'),(34291,'5545a60d049f9','2015-05-03 04:37:33','2015-05-03 04:37:33',0.236988,'log_controller_method_request','/login'),(34292,'5545a60d049f9','2015-05-03 04:37:33','2015-05-03 04:37:33',199.535843,'log_http_request','/login'),(34293,'5545a7ea68b56','2015-05-03 04:45:30','2015-05-03 04:45:30',0.135899,'log_controller_method_request','/login'),(34294,'5545a7ea68b56','2015-05-03 04:45:30','2015-05-03 04:45:30',53.758862,'log_http_request','/login'),(34295,'554649f225c76','2015-05-03 16:16:50','2015-05-03 16:16:50',0.149965,'log_controller_method_request','/login'),(34296,'554649f225c76','2015-05-03 16:16:50','2015-05-03 16:16:50',175.947906,'log_http_request','/login'),(34297,'554649f29956c','2015-05-03 16:16:50','2015-05-03 16:16:50',0.139952,'log_controller_method_request','/login'),(34298,'554649f29956c','2015-05-03 16:16:50','2015-05-03 16:16:50',39.915085,'log_http_request','/login'),(34299,'554661a34be14','2015-05-03 17:57:55','2015-05-03 17:57:55',0.211954,'log_controller_method_request','/login'),(34300,'554661a34be14','2015-05-03 17:57:55','2015-05-03 17:57:55',140.787842,'log_http_request','/login'),(34301,'5546afcf9a552','2015-05-03 23:31:27','2015-05-03 23:31:27',0.203133,'log_controller_method_request','/login'),(34302,'5546afcf9a552','2015-05-03 23:31:27','2015-05-03 23:31:27',226.790192,'log_http_request','/login'),(34303,'5546afd18bae4','2015-05-03 23:31:29','2015-05-03 23:31:29',0.133038,'log_controller_method_request','/login'),(34304,'5546afd18bae4','2015-05-03 23:31:29','2015-05-03 23:31:29',47.966957,'log_http_request','/login'),(34305,'5546f0206ecba','2015-05-04 04:05:52','2015-05-04 04:05:52',0.172138,'log_controller_method_request','/login'),(34306,'5546f0206ecba','2015-05-04 04:05:52','2015-05-04 04:05:52',433.063995,'log_http_request','/login'),(34307,'5546f021c5dfc','2015-05-04 04:05:53','2015-05-04 04:05:53',0.188112,'log_controller_method_request','/login'),(34308,'5546f021c5dfc','2015-05-04 04:05:53','2015-05-04 04:05:59',5677.939941,'log_http_request','/login'),(34309,'5546f09f9c5d6','2015-05-04 04:07:59','2015-05-04 04:07:59',0.262976,'log_controller_method_request','/login');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_form`
--

DROP TABLE IF EXISTS `master_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_form` (
  `form_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_form`
--

LOCK TABLES `master_form` WRITE;
/*!40000 ALTER TABLE `master_form` DISABLE KEYS */;
INSERT INTO `master_form` VALUES (1,'pdf',NULL,'FWM_T-ChainofCustody.pdf',45,'Chain Of Custody'),(2,'pdf',NULL,'FWM_L-WellPurge.pdf',152,'Well Purge'),(3,'pdf',NULL,'FWM_T-FieldSampling.pdf',100,'Field Sampling'),(4,'pdf','','e25c9ded-3f84-4c84-8750-84c6b7ca4d16.pdf',88,'Mater form test'),(5,'pdf','','35a1d2c9-d008-4abb-aa86-b130e467b911.pdf',88,'Mater form test');
/*!40000 ALTER TABLE `master_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_lab_analyte`
--

DROP TABLE IF EXISTS `master_lab_analyte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_lab_analyte` (
  `master_lab_analyte_id` int(11) NOT NULL AUTO_INCREMENT,
  `master_lab_analyte_category_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `master_lab_analyte_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`master_lab_analyte_id`),
  UNIQUE KEY `un_cla` (`master_lab_analyte_name`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_lab_analyte`
--

LOCK TABLES `master_lab_analyte` WRITE;
/*!40000 ALTER TABLE `master_lab_analyte` DISABLE KEYS */;
INSERT INTO `master_lab_analyte` VALUES (1,'','Dichlorodifluoromethane'),(2,'','Chloromethane'),(3,'','Vinyl chloride'),(4,'','Bromomethane'),(5,'','Chloroethane'),(6,'','Trichlorofluoromethane'),(7,'','1,1-Dichloroethene'),(8,'','1,1,2-Trichloro-1,2,2-trifluoroethane'),(9,'','Acetone'),(10,'','Carbon disulfide'),(11,'','Methyl acetate'),(12,'','Methylene chloride'),(13,'','trans-1,2-Dichloroethene'),(14,'','Methyl tert-butyl ether'),(15,'','1,1-Dichloroethane'),(16,'','cis-1,2-Dichloroethene'),(17,'','2-Butanone'),(18,'','Bromochloromethane'),(19,'','Chloroform'),(20,'','1,1,1-Trichloroethane'),(21,'','Cyclohexane'),(22,'','Carbon tetrachloride'),(23,'','Benzene'),(24,'','1,2-Dichloroethane'),(25,'','1,4-Dioxane'),(26,'','Trichloroethene'),(27,'','Methylcyclohexane'),(28,'','1,2-Dichloropropane'),(29,'','Bromodichloromethane'),(30,'','cis-1,3-Dichloropropene'),(31,'','4-Methyl-2-pentanone'),(32,'','Toluene'),(33,'','trans-1,3-Dichloropropene'),(34,'','1,1,2-Trichloroethane'),(35,'','Tetrachloroethene'),(36,'','2-Hexanone'),(37,'','Dibromochloromethane'),(38,'','1,2-Dibromoethane'),(39,'','Chlorobenzene'),(40,'','Ethylbenzene'),(41,'','o-Xylene'),(42,'','m,p-Xylene'),(43,'','Styrene'),(44,'','Bromoform'),(45,'','Isopropylbenzene'),(46,'','1,1,2,2-Tetrachloroethane'),(47,'','1,3-Dichlorobenzene'),(48,'','1,4-Dichlorobenzene'),(49,'','1,2-Dichlorobenzene'),(50,'','1,2-Dibromo-3-chloropropane'),(51,'','1,2,4-Trichlorobenzene'),(52,'','1,2,3-Trichlorobenzene'),(53,'','Benzaldehyde'),(54,'','Phenol'),(55,'','Bis(2-chloroethyl) ether'),(56,'','2-Chlorophenol'),(57,'','2-Methylphenol'),(58,'','2,2\'-Oxybis(1-choloropropane)'),(59,'','Acetophenone'),(60,'','4-Methylphenol'),(61,'','N-Nitroso-di-n propylamine'),(62,'','Hexachloroethane'),(63,'','Nitrobenzene'),(64,'','Isophorone'),(65,'','2-Nitrophenol '),(66,'','2,4-Dimethylphenol'),(67,'','Bis(2-chloroethoxy) methane'),(68,'','2,4-Dichlorophenol'),(69,'','Naphthalene'),(70,'','4-Chloroaniline'),(71,'','Hexachlorobutadiene'),(72,'','Caprolactam'),(73,'','4-Chloro-3-methylphenol'),(74,'','2-Methylnaphthalene'),(75,'','Hexachlorocyclopentadiene'),(76,'','2,4,6-Trichlorophenol'),(77,'','2,4,5-Trichlorophenol'),(78,'','1,1\'-Biphenyl'),(79,'','2-Chloronaphthalene'),(80,'','2-Nitroaniline'),(81,'','Dimethylphthalate'),(82,'','2,6-Dinitrotoluene'),(83,'','Acenaphthylene'),(84,'','3-Nitroaniline'),(85,'','Acenaphthene'),(86,'','2,4-Dinitrophenol'),(87,'','4-Nitrophenol'),(88,'','Dibenzofuran'),(89,'','2,4-Dinitrotoluene'),(90,'','Diethylphthalate'),(91,'','Fluorene'),(92,'','4-Chlorophenyl-phenyl ether'),(93,'','4-Nitroaniline'),(94,'','4,6-Dinitro-2-methylphenol'),(95,'','N-Nitrosodiphenylamine'),(96,'','1,2,4,5-Tetrachlorobenzene'),(97,'','4-Bromophenyl-phenylether'),(98,'','Hexachlorobenzene'),(99,'','Atrazine'),(100,'','Pentachlorophenol'),(101,'','Phenanthrene'),(102,'','Anthracene'),(103,'','Carbazole'),(104,'','Di-n-butylphthalate'),(105,'','Fluoranthene'),(106,'','Pyrene'),(107,'','Butylbenzylphthalate'),(108,'','3,3\'-dicholorobenzidine'),(109,'','Benzo(a)anthracene'),(110,'','Chrysene'),(111,'','Bis(2-ethylhexyl) phthalate'),(112,'','Di-n-octylphthalate'),(113,'','Benzo(b) fluoranthene'),(114,'','Benzo(k) fluoranthene'),(115,'','Benzo(a) pyrene'),(116,'','Indeno(1,2,3,-cd) pyrene'),(117,'','Dibenzo(a,h) anthracene'),(118,'','Benzo(g,h,i) perylene'),(119,'','2,3,4,6-Tetrachlorophenol'),(120,'','alpha-BHC'),(121,'','beta-BHC'),(122,'','delta-BHC'),(123,'','gamma-BHC (Lindane)'),(124,'','Heptachlor'),(125,'','Aldrin'),(126,'','Heptachlor epoxide'),(127,'','Endosulfan I'),(128,'','Dieldrin'),(129,'','4,4\'-DDE'),(130,'','Endrin'),(131,'','Endosulfan II'),(132,'','4,4\'-DDD'),(133,'','Endosulfan sulfate'),(134,'','4,4\'-DDT'),(135,'','Methoxychlor'),(136,'','Endrin ketone'),(137,'','Endrin aldehyde'),(138,'','alpha-Chlordane'),(139,'','gamma-Chlordane'),(140,'','Toxaphene'),(141,'','Aroclor-1016'),(142,'','Aroclor-1221'),(143,'','Aroclor-1232'),(144,'','Aroclor-1242'),(145,'','Aroclor-1248'),(146,'','Aroclor-1254'),(147,'','Aroclor-1260'),(148,'','Aroclor-1262'),(149,'','Aroclor-1268'),(150,'','Aluminum'),(151,'','Antimony'),(152,'','Arsenic'),(153,'','Barium'),(154,'','Beryllium'),(155,'','Cadmium'),(156,'','Calcium'),(157,'','Chromium'),(158,'','Cobalt'),(159,'','Copper'),(160,'','Iron'),(161,'','Lead'),(162,'','Magnesium'),(163,'','Manganese'),(164,'','Nickel'),(165,'','Potassium'),(166,'','Selenium'),(167,'','Silver'),(168,'','Sodium'),(169,'','Thallium'),(170,'','Vanadium'),(171,'','Zinc'),(172,'','Volatile Organic Carbons (VOCs)'),(173,'','Total Petroleum Hydrocarbons (TPH)'),(174,'','BTEX'),(175,'','TDS'),(176,'','Bological Oxygen Demand (BOD)'),(177,'','Chemical Oxygen Demand (COD)'),(178,'','RCRA Metals');
/*!40000 ALTER TABLE `master_lab_analyte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `project_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `project_desc` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_active` tinyint(1) DEFAULT NULL,
  `project_visible` tinyint(1) DEFAULT NULL,
  `pm_id` int(11) NOT NULL COMMENT 'Foreign key => project_manager',
  `project_is_default` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`project_id`),
  KEY `fk_project_pm` (`pm_id`),
  CONSTRAINT `fk_project_pm` FOREIGN KEY (`pm_id`) REFERENCES `project_manager` (`pm_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'EC-TX','','Description 301',1,0,1,1),(2,'Tempe Doggie Dispensers','1','Created to develop mapping tool',1,0,4,0),(4,'Stormwater','2','Example Project for Stormwater Sampling',0,0,4,0),(9,'EC','1','',0,0,4,0),(33,'Sample Project for popups','popup1','Use this project for popus and other bootstrap functions.',1,0,7,0),(41,'Example pdf Project','n-870','Description 870',1,0,8,0),(42,'Demonstration Project','n-13','Description 13',0,0,3,0),(125,'Demo Project','n-583','Description 583',1,0,4,0),(130,'Project 875','n-875','Testing Facility Coordinates auto-create',1,0,4,0),(137,'Project 97a','n-97a','Description 97a',1,0,19,0),(140,'DevTechnosys Project check','n-494','Need to check how this Application works',1,0,3,0),(141,'Project 831a','n-831','Description 831',1,0,1,0),(149,'Discussion Thread','1','Add discussion thread to website',1,0,20,0),(150,'Project 51','n-51','Description 51',1,0,4,0),(151,'Project 125','Quot\'es test','Description 125',1,0,1,0),(152,'Project 84','n-84','Description 84',1,0,1,NULL);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_field_analyte`
--

DROP TABLE IF EXISTS `project_field_analyte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_field_analyte` (
  `project_id` int(11) NOT NULL,
  `field_analyte_id` int(11) NOT NULL,
  UNIQUE KEY `un_pfa_p_fa` (`project_id`,`field_analyte_id`),
  KEY `fk_pfa_field_analyte` (`field_analyte_id`),
  CONSTRAINT `fk_pfa_field_analyte` FOREIGN KEY (`field_analyte_id`) REFERENCES `field_analyte` (`field_analyte_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pfa_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_field_analyte`
--

LOCK TABLES `project_field_analyte` WRITE;
/*!40000 ALTER TABLE `project_field_analyte` DISABLE KEYS */;
INSERT INTO `project_field_analyte` VALUES (1,60),(1,63),(1,64),(2,50),(33,46),(41,53),(41,54),(41,55),(141,60);
/*!40000 ALTER TABLE `project_field_analyte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_form`
--

DROP TABLE IF EXISTS `project_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_form` (
  `project_id` int(11) NOT NULL,
  `master_form_id` int(11) DEFAULT NULL,
  `user_form_id` int(11) DEFAULT NULL,
  UNIQUE KEY `un_pf_p_uf_mf` (`project_id`,`user_form_id`,`master_form_id`),
  CONSTRAINT `fk_pf_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_form`
--

LOCK TABLES `project_form` WRITE;
/*!40000 ALTER TABLE `project_form` DISABLE KEYS */;
INSERT INTO `project_form` VALUES (1,3,0),(33,1,0),(33,2,0),(33,0,2),(41,2,0),(41,3,0),(141,2,0),(141,3,0);
/*!40000 ALTER TABLE `project_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_lab_analyte`
--

DROP TABLE IF EXISTS `project_lab_analyte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_lab_analyte` (
  `project_id` int(11) NOT NULL,
  `lab_analyte_id` int(11) NOT NULL,
  UNIQUE KEY `un_pla_l_la` (`project_id`,`lab_analyte_id`),
  KEY `fk_pla_field_analyte` (`lab_analyte_id`),
  CONSTRAINT `fk_pla_field_analyte` FOREIGN KEY (`lab_analyte_id`) REFERENCES `lab_analyte` (`lab_analyte_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pla_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_lab_analyte`
--

LOCK TABLES `project_lab_analyte` WRITE;
/*!40000 ALTER TABLE `project_lab_analyte` DISABLE KEYS */;
INSERT INTO `project_lab_analyte` VALUES (1,44),(1,46),(1,47),(2,29),(2,37),(2,38),(33,17),(33,28),(141,44),(141,46),(141,47);
/*!40000 ALTER TABLE `project_lab_analyte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_manager`
--

DROP TABLE IF EXISTS `project_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_manager` (
  `pm_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hint` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `pm_comp_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pm_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pm_address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pm_phone` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `pm_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`pm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_manager`
--

LOCK TABLES `project_manager` WRITE;
/*!40000 ALTER TABLE `project_manager` DISABLE KEYS */;
INSERT INTO `project_manager` VALUES (1,'test','a94a8fe5ccb19ba61c4c0873d391e987982fbbd3g496lJL683','hint','comp name 2','John','Doe1','1234567890','test@fwa.net'),(3,'demo','89e495e7941cf9e40e6980d14a16bf023ccd4c91g496lJL683','','','Demo User','','',''),(4,'mapping','821b7db1bf69055d3819db82de2c55389a73409bg496lJL683','','','Damir123','','',''),(7,'Popup','3b6fb9033a8302fc168ca0199caaba142dbc5530g496lJL683','','','Souvik','','',''),(8,'pdf','ce9f44bc3d348133b47226685a8f75bbf17e757bg496lJL683','','','Mehedee','','',''),(9,'admin','a94a8fe5ccb19ba61c4c0873d391e987982fbbd3g496lJL683','hint','comp name','John','Doe','1234567890','test@fwa.net'),(19,'abcd','81fe8bfe87576c3ecb22426f8e57847382917acfg496lJL683','','','Demo User','','',''),(20,'','','','.','Nadir','.','.','.'),(21,'','','','','PM','','','pm1@test.com'),(22,'','','','','PM','','','pm@pm.com'),(23,'','','','FWM','Brian','','','brian@fieldworkmanager.com');
/*!40000 ALTER TABLE `project_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_service`
--

DROP TABLE IF EXISTS `project_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_service` (
  `project_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  UNIQUE KEY `un_p_s` (`project_id`,`service_id`),
  KEY `fk_ps_s` (`service_id`),
  CONSTRAINT `fk_ps_p` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ps_s` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_service`
--

LOCK TABLES `project_service` WRITE;
/*!40000 ALTER TABLE `project_service` DISABLE KEYS */;
INSERT INTO `project_service` VALUES (1,22),(1,41),(2,28),(2,29),(2,30),(42,38);
/*!40000 ALTER TABLE `project_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `pm_id` int(11) NOT NULL COMMENT 'Foreign key => project_manager',
  `service_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'contractor or equipment',
  `service_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_url` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `service_address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_contact_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_contact_phone` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_contact_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`service_id`),
  KEY `fk_service_pm` (`pm_id`),
  CONSTRAINT `fk_service_pm` FOREIGN KEY (`pm_id`) REFERENCES `project_manager` (`pm_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (15,1,'Drillers','Driller Mexico','aaa','Address','My name','','',1),(19,7,'Example','Example Service Provider','','','','','',1),(20,7,'Freelancer','Souvik Ghosh','','Kolkata, West Bengal','','','',1),(22,1,'Test','Test','','','','','',1),(27,7,'Freelancer','Souvik Ghosh -1','','','','','',1),(28,4,'Supplies','Souper poops bags','','','','','',1),(29,4,'Supplies','Souper Scoopers','','','','','',1),(30,4,'Supplies','Pet Supplies','','','','','',1),(31,4,'Services','We scoop poop','','','','','',1),(33,7,'New','Name','','','','','',1),(34,7,'New','Name1','','','','','',1),(35,4,'Supplies','New company','','','','','',1),(37,3,'Maintenance','Park Cleaners','','','','','baiken@fieldworkmanager.com',1),(38,3,'Maintenance','Great Lawn Service','','','','','baiken@fieldworkmanager.com',1),(39,3,'Supplies','Sprinkle You','','','','','baiken@fieldworkmanager.com',1),(40,19,'New','New Test Company for cascade delete test','','','','','',1),(41,1,'Labs','New Lab','','','','','',1),(42,1,'Labs','New Lab','','','','','',1),(43,20,'Communications','Discussion Thread Service','','','','','',1),(45,1,'Labs','New Test Lab 4-20-2015','aaa','','','','',1),(48,1,'Cat','Another test','','','','','jl3@test.com',1),(49,1,'SP','SP','','','','','sp@sp.com',1),(50,1,'Test','Testing New SP','','','','','',1);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL COMMENT 'Foreign key => project',
  `task_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `task_deadline` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `task_instructions` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_trigger_cal` tinyint(1) DEFAULT '0',
  `task_trigger_cal_value` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_trigger_pm` tinyint(1) DEFAULT '0',
  `task_trigger_ext` tinyint(1) DEFAULT '0',
  `task_active` tinyint(1) NOT NULL DEFAULT '0',
  `task_req_form` tinyint(1) DEFAULT '0',
  `task_req_field_analyte` tinyint(1) DEFAULT '0',
  `task_req_lab_analyte` tinyint(1) DEFAULT '0',
  `task_req_service` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`task_id`),
  KEY `fk_task_project` (`project_id`),
  CONSTRAINT `fk_task_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,1,'Monitoring-2','01-15-2015','Hold1',0,'',0,0,1,1,0,0,0),(2,2,'Refill Dispensers','','',0,NULL,0,0,1,0,0,0,0),(9,4,'Sampling','','',0,NULL,0,0,1,0,0,0,0),(35,2,'Check for damage','02-28-2015','',0,NULL,0,0,1,0,0,0,0),(36,33,'Example Task for Issue #778','','',0,'',0,0,1,1,0,0,0),(38,2,'Test','02-28-2015','',0,NULL,0,0,0,0,0,0,0),(42,2,'New test taska','03-11-2015','Insuctions',0,NULL,0,0,0,0,0,0,0),(44,2,'Copy test','03-11-2015','Insuctions',0,NULL,0,0,0,0,0,0,0),(45,2,'Copy Test','03-11-2015','Insuctions',0,NULL,0,0,0,0,0,0,0),(46,2,'a','','',0,NULL,0,0,0,0,0,0,0),(49,42,'Demonstration Task - Inactive','','',0,NULL,0,0,0,0,0,0,0),(50,42,'Demonstration Task - Active','','',0,NULL,0,0,1,0,0,0,0),(51,125,'Demo Task','','',0,NULL,0,0,0,0,0,0,0),(53,1,'Test Task','','',0,'',0,1,1,1,1,1,1),(55,41,'Growing up','','',0,'',0,0,0,0,0,0,0),(57,42,'webgrity task','04-30-2015','this is test from Webgrity Team',0,'',0,0,1,0,0,0,0),(58,149,'Discussion Task','','',0,'',0,0,1,0,0,0,0),(62,141,'Task','','',0,'',0,0,1,1,1,1,0),(63,1,'New test task','04-30-2015','',0,'',0,0,1,1,1,1,1),(64,141,'Test Task - forms generation','','',0,'',0,0,0,1,0,0,0),(65,141,'Test Task - Forms Generation','','',0,'',0,0,1,1,0,0,0),(66,41,'Test PDF Task','','',0,'',0,0,1,1,0,0,0),(67,141,'A','','',0,'',0,0,0,1,1,1,1);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_coc_info`
--

DROP TABLE IF EXISTS `task_coc_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_coc_info` (
  `task_coc_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL COMMENT 'Lab ID number',
  `po_number` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `lab_instructions` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `lab_sample_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `lab_sample_tat` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `project_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Is project.project_number by DEFAULT but deverges from it if the PM wants to change it',
  `results_to_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Is pm.pm_name by DEFAULT but can changed',
  `results_to_company` varchar(25) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Is pm.pm_comp_name by DEFAULT but can changed',
  `results_to_address` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Is pm.pm_address by DEFAULT but can changed',
  `results_to_phone` varchar(25) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Is pm.pm_phone by DEFAULT but can changed',
  `results_to_email` varchar(35) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Is pm.pm_email by DEFAULT but can changed',
  PRIMARY KEY (`task_coc_id`),
  KEY `fk_tci_task` (`task_id`),
  KEY `fk_tci_service` (`service_id`),
  CONSTRAINT `fk_tci_service` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tci_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_coc_info`
--

LOCK TABLES `task_coc_info` WRITE;
/*!40000 ALTER TABLE `task_coc_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_coc_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_field_analyte`
--

DROP TABLE IF EXISTS `task_field_analyte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_field_analyte` (
  `task_id` int(11) NOT NULL,
  `field_analyte_id` int(11) NOT NULL,
  KEY `fk_tfa_task` (`task_id`),
  KEY `fk_tfa_field_analyte` (`field_analyte_id`),
  CONSTRAINT `fk_tfa_field_analyte` FOREIGN KEY (`field_analyte_id`) REFERENCES `field_analyte` (`field_analyte_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tfa_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_field_analyte`
--

LOCK TABLES `task_field_analyte` WRITE;
/*!40000 ALTER TABLE `task_field_analyte` DISABLE KEYS */;
INSERT INTO `task_field_analyte` VALUES (49,19),(49,18),(55,53),(55,54),(55,55),(57,18),(53,58),(62,58),(62,59),(62,60),(63,60);
/*!40000 ALTER TABLE `task_field_analyte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_field_data_location`
--

DROP TABLE IF EXISTS `task_field_data_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_field_data_location` (
  `task_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  KEY `fk_tfdl_task` (`task_id`),
  KEY `fk_tfdl_location` (`location_id`),
  CONSTRAINT `fk_tfdl_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tfdl_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_field_data_location`
--

LOCK TABLES `task_field_data_location` WRITE;
/*!40000 ALTER TABLE `task_field_data_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_field_data_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_lab_analyte`
--

DROP TABLE IF EXISTS `task_lab_analyte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_lab_analyte` (
  `task_id` int(11) NOT NULL,
  `lab_analyte_id` int(11) NOT NULL,
  KEY `fk_tla_task` (`task_id`),
  KEY `fk_tla_lab_analyte` (`lab_analyte_id`),
  CONSTRAINT `fk_tla_lab_analyte` FOREIGN KEY (`lab_analyte_id`) REFERENCES `lab_analyte` (`lab_analyte_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tla_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_lab_analyte`
--

LOCK TABLES `task_lab_analyte` WRITE;
/*!40000 ALTER TABLE `task_lab_analyte` DISABLE KEYS */;
INSERT INTO `task_lab_analyte` VALUES (49,14),(49,15),(49,42),(53,44),(53,45),(62,45),(62,43),(62,47),(63,46),(63,44),(63,47);
/*!40000 ALTER TABLE `task_lab_analyte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_lab_data_location`
--

DROP TABLE IF EXISTS `task_lab_data_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_lab_data_location` (
  `task_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  KEY `fk_tldl_task` (`task_id`),
  KEY `fk_tldl_location` (`location_id`),
  CONSTRAINT `fk_tldl_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tldl_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_lab_data_location`
--

LOCK TABLES `task_lab_data_location` WRITE;
/*!40000 ALTER TABLE `task_lab_data_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_lab_data_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_location`
--

DROP TABLE IF EXISTS `task_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_location` (
  `task_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `task_location_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`task_location_id`),
  UNIQUE KEY `un_t_l` (`task_id`,`location_id`),
  KEY `fk_tl_location` (`location_id`),
  CONSTRAINT `fk_tl_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tl_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_location`
--

LOCK TABLES `task_location` WRITE;
/*!40000 ALTER TABLE `task_location` DISABLE KEYS */;
INSERT INTO `task_location` VALUES (1,312,25),(1,313,26),(1,314,27),(1,315,28),(2,7,5),(2,8,6),(2,9,7),(2,20,8),(35,7,9),(35,8,10),(35,9,11),(36,302,12),(36,303,13),(36,304,14),(53,300,43),(53,301,44),(55,272,18),(55,277,19),(62,309,22),(62,310,23),(62,311,24),(63,300,34),(63,312,30),(63,313,31),(63,314,32),(63,315,33),(64,309,35),(64,310,36),(64,311,37),(65,310,38),(65,311,39),(66,279,41),(66,288,40),(66,291,42);
/*!40000 ALTER TABLE `task_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_note`
--

DROP TABLE IF EXISTS `task_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_note` (
  `task_note_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `task_note_category_type` varchar(25) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Possible values: pm_id, technician_id',
  `task_note_category_value` int(11) NOT NULL COMMENT 'Represents the value of the object property set in the task_note_category_type',
  `task_note_value` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The value of the note typed by the user',
  PRIMARY KEY (`task_note_id`),
  KEY `fk_tn_task` (`task_id`),
  CONSTRAINT `fk_tn_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_note`
--

LOCK TABLES `task_note` WRITE;
/*!40000 ALTER TABLE `task_note` DISABLE KEYS */;
INSERT INTO `task_note` VALUES (1,64,'pm_id',1,'Test note');
/*!40000 ALTER TABLE `task_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_service`
--

DROP TABLE IF EXISTS `task_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_service` (
  `task_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  UNIQUE KEY `un_t_s` (`task_id`,`service_id`),
  KEY `fk_ts_service` (`service_id`),
  CONSTRAINT `fk_ts_service` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ts_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_service`
--

LOCK TABLES `task_service` WRITE;
/*!40000 ALTER TABLE `task_service` DISABLE KEYS */;
INSERT INTO `task_service` VALUES (1,15),(1,22),(57,37),(57,39),(58,43),(63,41);
/*!40000 ALTER TABLE `task_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_technician`
--

DROP TABLE IF EXISTS `task_technician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_technician` (
  `task_id` int(11) NOT NULL,
  `technician_id` int(11) NOT NULL,
  `is_lead_tech` tinyint(1) DEFAULT '0',
  UNIQUE KEY `un_t_r` (`task_id`,`technician_id`),
  KEY `fk_tt_technician` (`technician_id`),
  CONSTRAINT `fk_tt_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tt_technician` FOREIGN KEY (`technician_id`) REFERENCES `technician` (`technician_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_technician`
--

LOCK TABLES `task_technician` WRITE;
/*!40000 ALTER TABLE `task_technician` DISABLE KEYS */;
INSERT INTO `task_technician` VALUES (36,37,0),(36,44,0),(55,55,0),(58,66,0),(63,10,0),(64,68,0),(65,1,0),(65,70,NULL),(66,55,0);
/*!40000 ALTER TABLE `task_technician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_template_form`
--

DROP TABLE IF EXISTS `task_template_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_template_form` (
  `task_id` int(11) NOT NULL,
  `master_form_id` int(11) DEFAULT NULL,
  `user_form_id` int(11) DEFAULT NULL,
  UNIQUE KEY `un_tf_t_uf_mf` (`task_id`,`master_form_id`,`user_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_template_form`
--

LOCK TABLES `task_template_form` WRITE;
/*!40000 ALTER TABLE `task_template_form` DISABLE KEYS */;
INSERT INTO `task_template_form` VALUES (1,3,NULL),(36,2,0),(53,3,NULL),(55,2,0),(55,3,0),(62,2,0),(63,3,0),(64,2,0),(65,2,0),(66,3,0);
/*!40000 ALTER TABLE `task_template_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technician`
--

DROP TABLE IF EXISTS `technician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technician` (
  `technician_id` int(11) NOT NULL AUTO_INCREMENT,
  `technician_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `technician_phone` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `technician_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `technician_document` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `technician_active` smallint(6) NOT NULL DEFAULT '1',
  `pm_id` int(11) NOT NULL COMMENT 'Foreign key => project_manager',
  PRIMARY KEY (`technician_id`),
  KEY `fk_tech_pm` (`pm_id`),
  CONSTRAINT `fk_tech_pm` FOREIGN KEY (`pm_id`) REFERENCES `project_manager` (`pm_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technician`
--

LOCK TABLES `technician` WRITE;
/*!40000 ALTER TABLE `technician` DISABLE KEYS */;
INSERT INTO `technician` VALUES (1,'Joe2','111111111111','joe@fwm.com','',1,1),(8,'Milton','','','',1,1),(10,'Jon','','','',1,1),(36,'Technician A-1','555-535-4555','','',1,1),(37,'Sample Popup technician 1','','','',1,7),(41,'Tech 1','uyuyu','uyuyuy','',1,3),(42,'Tech 2','ytyt','tytyt','',1,3),(44,'Sample Popup Technician 2','','','',1,7),(49,'Where are your?','','','',1,4),(51,'New Tech','','','',1,4),(53,'Sample popup technician 1','','','',0,7),(54,'Sample Popup technician 1','','','',0,7),(55,'PDF Technician','','','',1,8),(56,'New tech for testing','','','',1,19),(57,'A new tech','','','',1,19),(59,'B New Tech','','','',1,19),(60,'Z new tech','','','',1,19),(62,'Another tech','','','',1,19),(63,'A New Tech','','','',1,4),(64,'a','98','a@gmail','',0,3),(66,'Test Technician - messages','','baiken@fieldworkmanager.com','',1,20),(68,'Alan','123456789','alan@fieldworkmanager.com','',1,1),(69,'Test','','test@test.com','',1,1),(70,'Jeremie\'s test','','jl@test.com','',1,1),(71,'Tech','','tech@tech.com','',1,1);
/*!40000 ALTER TABLE `technician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_hint` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Possible values: pm_id, technician_id, service_id',
  `user_value` int(11) NOT NULL COMMENT 'ID value corresponding to the user_type',
  `user_role_id` smallint(2) NOT NULL COMMENT 'Look up the table user_role for details about the roles',
  `user_session_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Hashed session ID',
  `user_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'User email that is unique and must be set',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `un_user_login` (`user_login`),
  UNIQUE KEY `un_user_email` (`user_email`),
  KEY `fk_user_role_user` (`user_role_id`),
  CONSTRAINT `fk_user_role_user` FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'test','a94a8fe5ccb19ba61c4c0873d391e987982fbbd3g496lJL683','test','pm_id',1,2,'','test'),(2,'demo','89e495e7941cf9e40e6980d14a16bf023ccd4c91g496lJL683','','pm_id',3,2,NULL,'demo'),(3,'mapping','821b7db1bf69055d3819db82de2c55389a73409bg496lJL683','','pm_id',4,2,'','mapping'),(4,'Popup','3b6fb9033a8302fc168ca0199caaba142dbc5530g496lJL683','','pm_id',7,2,NULL,'Popup'),(5,'pdf','ce9f44bc3d348133b47226685a8f75bbf17e757bg496lJL683','','pm_id',8,2,NULL,'pdf'),(10,'admintest','011c945f30ce2cbafc452f39840f025693339c42g496lJL683','test','administrator_id',0,1,'','admintest'),(12,'thread','c283e375ed8cebf3b8d1b5101fd51bb522961656g496lJL683','thread','pm_id',20,2,NULL,'thread'),(13,'joe@fwm.com','a94a8fe5ccb19ba61c4c0873d391e987982fbbd3g496lJL683','','technician_id',1,3,NULL,'joe@fwm.com'),(16,'alan@fieldworkmanager.com','93a6742abd1bcf98fcbad51928ab772702fb0998g496lJL683','Alan','technician_id',68,3,'','alan@fieldworkmanager.com'),(17,'test@test.com','a6ad00ac113a19d953efb91820d8788e2263b28ag496lJL683','','technician_id',69,3,'','test@test.com'),(18,'pm','c4dcbb4b94a41194c08603eb9e1f5c8f76ecc307g496lJL683','pm','pm_id',21,2,NULL,'pm1@test.com'),(28,'pml@pml.com','dd7aa1b46c2adc3192c1053804260feb281b7c0fg496lJL683','hint','pm_id',22,2,NULL,'pm@pm.com'),(29,'brian','760e7dab2836853c63805033e514668301fa9c47g496lJL683','Firstname','pm_id',23,2,NULL,'brian@fieldworkmanager.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_form`
--

DROP TABLE IF EXISTS `user_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_form` (
  `form_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(10) DEFAULT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pm_id` int(11) NOT NULL,
  PRIMARY KEY (`form_id`),
  KEY `fk_uf_project_manager` (`pm_id`),
  CONSTRAINT `fk_uf_project_manager` FOREIGN KEY (`pm_id`) REFERENCES `project_manager` (`pm_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_form`
--

LOCK TABLES `user_form` WRITE;
/*!40000 ALTER TABLE `user_form` DISABLE KEYS */;
INSERT INTO `user_form` VALUES (2,'pdf','','5d8d0e4c-3728-4860-b8d5-318b80560b13.pdf',15,'TX SW Quarterly Visual Inspection.pdf',7);
/*!40000 ALTER TABLE `user_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_role_id` smallint(2) NOT NULL,
  `user_role_desc` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'Administrator'),(2,'Project Manager'),(3,'Field Technician'),(4,'Visitor'),(5,'None');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-04  4:30:58