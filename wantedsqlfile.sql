-- MariaDB dump 10.19  Distrib 10.7.3-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: webdamn_demos
-- ------------------------------------------------------
-- Server version	10.7.3-MariaDB

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
-- Table structure for table `enrolls_in`
--

DROP TABLE IF EXISTS `enrolls_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrolls_in` (
  `student_id` int(10) unsigned NOT NULL,
  `section_id` int(11) NOT NULL,
  KEY `section_id` (`section_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `enrolls_in_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `sms_section` (`section_id`),
  CONSTRAINT `enrolls_in_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `sms_students` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolls_in`
--

LOCK TABLES `enrolls_in` WRITE;
/*!40000 ALTER TABLE `enrolls_in` DISABLE KEYS */;
INSERT INTO `enrolls_in` VALUES
(4,1),
(5,1),
(3,3),
(7,3),
(6,5);
/*!40000 ALTER TABLE `enrolls_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_attendance`
--

DROP TABLE IF EXISTS `sms_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_attendance` (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subjectid` int(11) NOT NULL,
  `attendance_status` int(11) NOT NULL,
  `attendance_date` varchar(255) NOT NULL,
  `attendance_hour` time(4) NOT NULL,
  `grade` int(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`attendance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_attendance`
--

LOCK TABLES `sms_attendance` WRITE;
/*!40000 ALTER TABLE `sms_attendance` DISABLE KEYS */;
INSERT INTO `sms_attendance` VALUES
(24,4,2,1,1,1,'2022/07/23','18:48:00.0000',10),
(25,5,2,1,1,1,'2022/07/23','18:48:00.0000',9),
(26,4,2,1,2,1,'2022/07/23','18:48:00.0000',10),
(27,5,2,1,2,1,'2022/07/23','18:48:00.0000',9);
/*!40000 ALTER TABLE `sms_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_classes`
--

DROP TABLE IF EXISTS `sms_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_classes`
--

LOCK TABLES `sms_classes` WRITE;
/*!40000 ALTER TABLE `sms_classes` DISABLE KEYS */;
INSERT INTO `sms_classes` VALUES
(1,'Arabic'),
(2,'Quraan'),
(3,'Math');
/*!40000 ALTER TABLE `sms_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_section`
--

DROP TABLE IF EXISTS `sms_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_section` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(255) NOT NULL,
  `class_id` int(10) unsigned NOT NULL,
  `assigned_teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`section_id`),
  KEY `class_id` (`class_id`),
  KEY `assigned_teacher_id` (`assigned_teacher_id`),
  CONSTRAINT `sms_section_ibfk_1` FOREIGN KEY (`assigned_teacher_id`) REFERENCES `sms_teacher` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_section`
--

LOCK TABLES `sms_section` WRITE;
/*!40000 ALTER TABLE `sms_section` DISABLE KEYS */;
INSERT INTO `sms_section` VALUES
(1,'QuraanA',2,1),
(2,'ArabicA',1,1),
(3,'QuraanB',2,2),
(4,'MathA',3,3),
(5,'QuraanC',2,3);
/*!40000 ALTER TABLE `sms_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_students`
--

DROP TABLE IF EXISTS `sms_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_students` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `gender` varchar(40) NOT NULL,
  `dob` date NOT NULL,
  `photo` varchar(40) DEFAULT NULL,
  `mobile` int(10) unsigned NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `current_address` varchar(40) DEFAULT NULL,
  `permanent_address` varchar(40) DEFAULT NULL,
  `father_name` varchar(255) NOT NULL,
  `father_mobile` int(10) unsigned NOT NULL,
  `father_occupation` varchar(255) NOT NULL,
  `mother_name` varchar(255) NOT NULL,
  `mother_mobile` int(10) unsigned NOT NULL,
  `admission_no` int(11) NOT NULL,
  `roll_no` int(11) NOT NULL,
  `stream` int(10) unsigned DEFAULT NULL,
  `hostel` int(10) unsigned DEFAULT NULL,
  `admission_date` varchar(255) NOT NULL,
  `category` int(10) unsigned DEFAULT NULL,
  `academic_year` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_students`
--

LOCK TABLES `sms_students` WRITE;
/*!40000 ALTER TABLE `sms_students` DISABLE KEYS */;
INSERT INTO `sms_students` VALUES
(3,'Smith','male','2013-07-02','1559480265cat-2083492_960_720.jpg',123456789,'smith@test.com','xyxz',NULL,'jhone smith',0,'','Diana smith',0,1234567,654378,NULL,NULL,'0000-00-00',NULL,2019),
(4,'jaeeme khan','male','2014-07-10','1559480508phpzag.gif',123456789,'jaeeme@test.com','New delhi india',NULL,'',0,'','',0,12345678,67891,NULL,NULL,'02/06/2019',NULL,2019),
(5,'Root','male','2014-04-22','1560685652password reset with php.png',0,'root@gmail.com','',NULL,'',0,'','',0,123456789,3532552,NULL,NULL,'02/06/2019',NULL,2019),
(6,'William','male','2001-03-08','1560686427cat-2083492_960_720.jpg',0,'william@test.com','',NULL,'',0,'','',0,2147483647,2147483647,NULL,NULL,'16/06/2019',NULL,2019),
(7,'Stokes','male','0000-00-00','1560687168cat-2083492_960_720.jpg',0,'stokes@test.com','',NULL,'',0,'','',0,553252525,1234554363,NULL,NULL,'16/06/2019',NULL,2019);
/*!40000 ALTER TABLE `sms_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_subjects`
--

DROP TABLE IF EXISTS `sms_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_subjects` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `code` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  PRIMARY KEY (`subject_id`),
  KEY `section_id` (`section_id`),
  CONSTRAINT `sms_subjects_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `sms_section` (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_subjects`
--

LOCK TABLES `sms_subjects` WRITE;
/*!40000 ALTER TABLE `sms_subjects` DISABLE KEYS */;
INSERT INTO `sms_subjects` VALUES
(1,'Soura Aser',210,1),
(2,'Soura Kader',220,1),
(3,'Soura Fatiha',230,3),
(4,'Soura Falak',240,5),
(5,'Soura Ikhlas',250,1);
/*!40000 ALTER TABLE `sms_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_teacher`
--

DROP TABLE IF EXISTS `sms_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_teacher` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `tnumb` varchar(12) NOT NULL DEFAULT '000-000-0000',
  `teacher` varchar(255) NOT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_teacher`
--

LOCK TABLES `sms_teacher` WRITE;
/*!40000 ALTER TABLE `sms_teacher` DISABLE KEYS */;
INSERT INTO `sms_teacher` VALUES
(1,'111-222-2222','Ali'),
(2,'223-333-3333','George'),
(3,'000-000-0000','Mohan');
/*!40000 ALTER TABLE `sms_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_user`
--

DROP TABLE IF EXISTS `sms_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `gender` enum('male','female') CHARACTER SET utf8mb3 NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `image` varchar(250) NOT NULL,
  `type` varchar(250) NOT NULL DEFAULT 'general',
  `status` enum('active','pending','deleted','') NOT NULL DEFAULT 'active',
  `authtoken` varchar(250) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_user`
--

LOCK TABLES `sms_user` WRITE;
/*!40000 ALTER TABLE `sms_user` DISABLE KEYS */;
INSERT INTO `sms_user` VALUES
(1,'ali','mustafa','adx@live.com','7b24afc8bc80e548d66c4e7ff72171c5','male','','','','general','active','',1),
(2,'George','Abo Yasser','abo@hotmail.com','1739f7c0a0c6e4792dc494d2e7801208','male','223-333-3333 ','','','general','active','',2),
(3,'Mohan','Bob','mohan@google.com','202cb962ac59075b964b07152d234b70','male','','','','general','active','',3),
(999,'admin','mustafa','admin','202cb962ac59075b964b07152d234b70','male','123456789','Web developer','','administrator','active','',999);
/*!40000 ALTER TABLE `sms_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-24  0:00:05
