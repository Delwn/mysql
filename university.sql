-- MySQL dump 10.13  Distrib 5.7.40, for Linux (x86_64)
--
-- Host: localhost    Database: university
-- ------------------------------------------------------
-- Server version	5.7.40-0ubuntu0.18.04.1

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
-- Table structure for table `Classroom`
--

DROP TABLE IF EXISTS `Classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Classroom` (
  `building` varchar(10) DEFAULT NULL,
  `room_number` int(11) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`room_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Classroom`
--

LOCK TABLES `Classroom` WRITE;
/*!40000 ALTER TABLE `Classroom` DISABLE KEYS */;
INSERT INTO `Classroom` VALUES ('Watson',100,30),('Packard',101,500),('Watson',120,50),('Painter',514,10),('Taylor',3128,70);
/*!40000 ALTER TABLE `Classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Course` (
  `course_id` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `Course_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `Department` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
INSERT INTO `Course` VALUES ('BIO-101','Intro. to Biology','Biology',4),('BIO-301','Genetics','Biology',4),('BIO-399','Computational Biology','Biology',3),('CS-101','Intro to Computer Science','Comp.Sci.',4),('CS-190','Game Design','Comp.Sci.',4),('CS-315','Robotics','Comp.Sci.',3),('CS-319','Image Processing','Comp.Sci.',3),('CS-347','Database System Concepts','Comp.Sci.',3),('EE-181','Intro to Digital Systems','Elec.Eng.',3),('FIN-201','Investment Banking','Finance',3),('HIS-351','World History','History',3),('MU-199','Music Video Production','Music',3),('PHY-101','Physical Principles','Physics',4);
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `dept_name` varchar(20) NOT NULL,
  `building` varchar(20) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  PRIMARY KEY (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES ('Biology','Watson',90000),('Comp.Sci.','Taylor',100000),('Elec.Eng.','Taylor',85000),('Finance','Painter',120000),('History','Painter',50000),('Music','Packard',80000),('Physics','Watson',70000);
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Instructor`
--

DROP TABLE IF EXISTS `Instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Instructor` (
  `ID` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `Instructor_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `Department` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instructor`
--

LOCK TABLES `Instructor` WRITE;
/*!40000 ALTER TABLE `Instructor` DISABLE KEYS */;
INSERT INTO `Instructor` VALUES ('10101','Srinivasan','Comp.Sci.',65000),('12121','Wu','Finance',90000),('15151','Mozart','Music',40000),('22222','Einstein','Physics',95000),('32343','El Said','Physics',60000),('33456','Gold','Physics',87000),('45565','Katz','Comp.Sci.',75000),('58583','Califieri','History',62000),('76543','Singh','Finance',80000),('76766','Crick','Biology',72000),('83821','Brandt','Comp.Sci.',92000),('98345','Kim','Elec.Eng.',80000);
/*!40000 ALTER TABLE `Instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Section`
--

DROP TABLE IF EXISTS `Section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Section` (
  `course_id` varchar(10) NOT NULL,
  `sec_id` int(11) NOT NULL,
  `semester` varchar(10) DEFAULT NULL,
  `year` int(11) NOT NULL,
  `building` varchar(10) DEFAULT NULL,
  `room_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`course_id`,`sec_id`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Section`
--

LOCK TABLES `Section` WRITE;
/*!40000 ALTER TABLE `Section` DISABLE KEYS */;
INSERT INTO `Section` VALUES ('BIO-101',1,'Summer',2009,'Painter',514),('BIO-301',1,'Summer',2010,'Painter',514),('CS-101',1,'Fall',2009,'Packard',101),('CS-101',1,'Spring',2010,'Packard',101),('CS-190',1,'Spring',2009,'Taylor',3128),('CS-190',2,'Spring',2009,'Taylor',3128),('CS-315',1,'Spring',2010,'Watson',120),('CS-319',1,'Spring',2010,'Watson',100),('CS-319',2,'Spring',2010,'Taylor',3128),('CS-347',1,'Fall',2009,'Taylor',3128),('EE-181',1,'Spring',2009,'Taylor',3128),('FIN-201',1,'Spring',2010,'Packard',101),('HIS-351',1,'Spring',2010,'Painter',514),('MU-199',1,'Spring',2010,'Packard',101),('PHY-101',1,'Fall',2009,'Watson',100);
/*!40000 ALTER TABLE `Section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `ID` varchar(10) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `tot_cred` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `Department` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES ('00128','Zhang','Comp.Sci.',102),('12345','Shankar','Comp.Sci.',32),('19991','Brandt','History',80),('23121','Chavez','Finance',110),('44553','Peltier','Physics',56),('45678','Levy','Physics',46),('54321','Williams','Comp.Sci.',54),('55739','Sanchez','Music',38),('70557','Snow','Physics',0),('76543','Brown','Comp.Sci.',58),('76653','Aoi','Elec.Eng.',60),('98765','Bourikas','Elec.Eng.',98),('98988','Tanaka','Biology',120);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Takes`
--

DROP TABLE IF EXISTS `Takes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Takes` (
  `ID` varchar(10) DEFAULT NULL,
  `course_id` varchar(10) DEFAULT NULL,
  `sec_id` int(11) DEFAULT NULL,
  `semester` varchar(20) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `grade` varchar(5) DEFAULT NULL,
  KEY `ID` (`ID`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `Takes_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `Student` (`ID`),
  CONSTRAINT `Takes_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Takes`
--

LOCK TABLES `Takes` WRITE;
/*!40000 ALTER TABLE `Takes` DISABLE KEYS */;
INSERT INTO `Takes` VALUES ('00128','CS-101',1,'Fall',2009,'A'),('00128','CS-347',1,'Fall',2009,'A-'),('12345','CS-101',1,'Fall',2009,'C'),('12345','CS-315',0,'Spring',2009,'A'),('12345','CS-347',1,'Fall',2009,'A'),('12345','CS-190',2,'Spring',2009,'A'),('19991','HIS-351',1,'Spring',2010,'B'),('23121','FIN-201',1,'Spring',2010,'C+'),('44553','PHY-101',1,'Fall',2009,'B-'),('45678','CS-101',1,'Fall',2009,'F'),('45678','CS-101',1,'Spring',2010,'B+'),('45678','CS-319',1,'Spring',2010,'B'),('54321','CS-101',1,'Fall',2009,'A-'),('54321','CS-190',2,'Spring',2009,'B+'),('55739','MU-199',1,'Spring',2010,'A-'),('76543','CS-101',1,'Fall',2009,'A'),('76543','CS-319',2,'Spring',2010,'A'),('76653','EE-181',1,'Spring',2009,'C'),('98765','CS-101',1,'Fall',2009,'C-'),('98765','CS-315',1,'Spring',2010,'B'),('98765','BIO-101',1,'Summer',2009,'A'),('98765','BIO-301',1,'Summer',2010,NULL);
/*!40000 ALTER TABLE `Takes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teaches`
--

DROP TABLE IF EXISTS `Teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teaches` (
  `ID` varchar(10) DEFAULT NULL,
  `course_id` varchar(10) DEFAULT NULL,
  `sec_id` int(11) DEFAULT NULL,
  `semester` varchar(20) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  KEY `ID` (`ID`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `Teaches_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `Instructor` (`ID`),
  CONSTRAINT `Teaches_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teaches`
--

LOCK TABLES `Teaches` WRITE;
/*!40000 ALTER TABLE `Teaches` DISABLE KEYS */;
INSERT INTO `Teaches` VALUES ('10101','CS-101',1,'Fall',2009),('10101','CS-315',1,'Spring',2010),('10101','CS-347',1,'Fall',2009),('12121','FIN-201',1,'Spring',2010),('15151','MU-199',1,'Spring',2010),('22222','PHY-101',1,'Fall',2009),('32343','HIS-351',1,'Spring',2010),('45565','CS-101',1,'Spring',2010),('45565','CS-319',1,'Spring',2010),('76766','BIO-101',1,'Summer',2009),('76766','BIO-301',1,'Summer',2010),('83821','CS-190',1,'Spring',2009),('83821','CS-190',2,'Spring',2009),('83821','CS-319',2,'Spring',2010),('98345','EE-181',1,'Spring',2009);
/*!40000 ALTER TABLE `Teaches` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-03 15:45:40
