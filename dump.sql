-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: localhost    Database: company_db
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `Accounts`
--

DROP TABLE IF EXISTS `Accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `e_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`id`,`e_id`,`role_id`),
  KEY `e_id` (`e_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`e_id`) REFERENCES `Employees` (`e_id`),
  CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `Roles` (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts`
--

LOCK TABLES `Accounts` WRITE;
/*!40000 ALTER TABLE `Accounts` DISABLE KEYS */;
INSERT INTO `Accounts` VALUES (1,'test','test','test@test.com',17,1),(2,'buh','buh','buh@buh.com',11,4),(3,'kadr','kadr','kadr@kadr.com',16,2);
/*!40000 ALTER TABLE `Accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdrTel`
--

DROP TABLE IF EXISTS `AdrTel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AdrTel` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `a_address` varchar(100) DEFAULT NULL,
  `a_phone` varchar(50) DEFAULT NULL,
  `e_id` int NOT NULL,
  PRIMARY KEY (`a_id`),
  KEY `AdrTel_Employees_idx` (`e_id`),
  CONSTRAINT `adrtel_ibfk_1` FOREIGN KEY (`e_id`) REFERENCES `Employees` (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdrTel`
--

LOCK TABLES `AdrTel` WRITE;
/*!40000 ALTER TABLE `AdrTel` DISABLE KEYS */;
INSERT INTO `AdrTel` VALUES (1,'г.Минск, ул.Жукова 351/3, кв.22','88005553535',1),(2,'г.Минск, ул.Кирова 1/1, кв.23','623457',2),(3,'г.Минск, ул.Ленина 35/1, кв.24','623458',3),(4,'г.Минск, ул.Наконечникова 3/4, кв.25','623459',4),(5,'г.Минск, ул.50 лет ВЛКСМ 3/4, кв.26','623451',5),(6,'г.Минск, ул.Королика 3/4, кв.27','623452',6),(7,'г.Минск, ул.Сердича 3/4, кв.28','623453',7),(8,'г.Минск, ул.Сурганова 3/4, кв.29','623454',8),(9,'г.Минск, ул.Молодежная 3/4, кв.30','623455',10),(10,'г.Минск, ул.Могилевская 3/4, кв.31','623410',11),(11,'г.Минск, ул.Коласа 3/4, кв.32','623411',12),(12,'г.Минск, ул.Бородинского 3/4, кв.33','623412',13),(13,'г.Минск, ул.Вильчковского 3/4, кв.34','623413',14),(14,'г.Минск, ул.Газеты звезды 3/4, кв.35','623414',15),(15,'г.Минск, ул.Калинина 3/4, кв.36','623415',16),(16,'г.Минск, ул.Цветочная 3/4, кв.47','623416',17);
/*!40000 ALTER TABLE `AdrTel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clients`
--

DROP TABLE IF EXISTS `Clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clients` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `c_company` varchar(255) DEFAULT NULL,
  `c_adr` varchar(50) NOT NULL,
  `c_person` varchar(50) NOT NULL,
  `c_phone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients`
--

LOCK TABLES `Clients` WRITE;
/*!40000 ALTER TABLE `Clients` DISABLE KEYS */;
INSERT INTO `Clients` VALUES (1,'Белстройинвест','Жукова 9','Иванов Сергей Геннадьевич','+375331237678'),(2,'БелПромСтройТрансКапитал','Ленина 451','Жмышенко Виталий Натальевич','+375293188910');
/*!40000 ALTER TABLE `Clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `curr_projects`
--

DROP TABLE IF EXISTS `curr_projects`;
/*!50001 DROP VIEW IF EXISTS `curr_projects`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `curr_projects` AS SELECT 
 1 AS `pr_id`,
 1 AS `pr_title`,
 1 AS `pr_abbr`,
 1 AS `pr_begin`,
 1 AS `pr_end`,
 1 AS `pr_cost`,
 1 AS `pr_client`,
 1 AS `pr_depart`,
 1 AS `pr_chief`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Departs`
--

DROP TABLE IF EXISTS `Departs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Departs` (
  `d_id` int NOT NULL AUTO_INCREMENT,
  `d_name` varchar(255) NOT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departs`
--

LOCK TABLES `Departs` WRITE;
/*!40000 ALTER TABLE `Departs` DISABLE KEYS */;
INSERT INTO `Departs` VALUES (1,'Отдел инновационных разработок'),(2,'Отдел сетевых технологий'),(3,'Отдел информационных технологий'),(4,'Бухгалтерия'),(5,'Отдел кадров'),(6,'Отдел контроля качества'),(7,'Головной офис');
/*!40000 ALTER TABLE `Departs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Education`
--

DROP TABLE IF EXISTS `Education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Education` (
  `u_id` int NOT NULL AUTO_INCREMENT,
  `u_type` varchar(50) NOT NULL,
  `u_spec` varchar(40) DEFAULT NULL,
  `u_year` int NOT NULL,
  `e_id` int NOT NULL,
  PRIMARY KEY (`u_id`),
  KEY `Education_Employees_idx` (`e_id`),
  CONSTRAINT `education_ibfk_1` FOREIGN KEY (`e_id`) REFERENCES `Employees` (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Education`
--

LOCK TABLES `Education` WRITE;
/*!40000 ALTER TABLE `Education` DISABLE KEYS */;
INSERT INTO `Education` VALUES (1,'Высшее','Инженер-Программист',2020,1),(2,'Высшее','Инженер-Системотехник',2021,2),(3,'Высшее','Инженер-Программист',2021,3),(4,'Высшее','Инженер-Системотехник',2020,4),(5,'Высшее','Инженер-Программист',2019,5),(6,'Высшее','Инженер-Системотехник',2018,6),(7,'Высшее','Инженер-Программист',2017,7),(8,'Высшее','Инженер-Системотехник',2020,8),(10,'Высшее','Инженер-Системотехник',2019,10),(11,'Высшее','Инженер-Программист',2018,11),(12,'Высшее','Инженер-Системотехник',2017,12),(13,'Высшее','Инженер-Программист',2016,13),(14,'Высшее','Инженер-Системотехник',2020,14),(15,'Высшее','Инженер-Программист',2021,15),(16,'Высшее','Инженер-Системотехник',2019,16),(17,'Высшее','Инженер-Программист',2018,17),(18,'Высшее','Инженер-Системотехник',2019,18);
/*!40000 ALTER TABLE `Education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employees` (
  `e_id` int NOT NULL AUTO_INCREMENT,
  `e_lname` varchar(30) NOT NULL,
  `e_fname` varchar(25) NOT NULL,
  `e_patronymic` varchar(30) DEFAULT NULL,
  `e_pasp` varchar(255) NOT NULL,
  `e_birthdate` date NOT NULL,
  `e_gender` char(1) DEFAULT NULL,
  `e_phone` varchar(255) NOT NULL,
  `e_depart` int NOT NULL,
  `e_post` int NOT NULL,
  PRIMARY KEY (`e_id`,`e_depart`,`e_post`),
  UNIQUE KEY `e_pasp` (`e_pasp`),
  KEY `Employees_Departs_idx` (`e_depart`),
  KEY `Employees_Posts_idx` (`e_post`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`e_depart`) REFERENCES `Departs` (`d_id`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`e_post`) REFERENCES `Posts` (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
INSERT INTO `Employees` VALUES (1,'Зиневич','Алексей','Алексеев','AB3128989','1997-12-13','м','+375291234567',1,1),(2,'Уласевич','Артём','Алексеевич','AB3128987','2003-05-31','м','+375293188989',1,3),(3,'Малевич','Владислав','Алексеевич','AB3128998','1998-05-01','м','+375291234523',1,4),(4,'Возмитель','Марина','Константиновна','AB3128911','1985-03-14','ж','+375299876745',1,8),(5,'Хованский','Алексей','Александрович','AB3128954','1997-12-14','м','+375291277567',2,1),(6,'Басак','Дмитрий','Андреевич','AB3128765','1999-07-08','м','+375291234190',2,2),(7,'Марков','Сергей','Сергеевич','AB3248989','1991-12-13','м','+375291144567',2,10),(8,'Алексеевец','Вячеслав','Александрович','AB3128999','2002-03-01','м','+375291234999',3,1),(10,'Марков','Сергей','Сергеевич','AB1248989','1991-12-13','м','+375291144567',3,10),(11,'Кулак','Павел','Сергеевич','AB3248349','1991-12-14','м','+375291154567',4,6),(12,'Ярмолович','Владислав','Игоревич','AB3248767','1991-12-15','м','+375331144567',4,7),(13,'Андык','Дарья','Артёмовна','AB3248333','2002-01-17','ж','+375291144887',5,6),(14,'Юхневич','Алексей','Эдмундович','AB3211989','1997-10-13','м','+375222144567',6,1),(15,'Макаров','Денис','Иванович','AB9248989','1989-09-13','м','+375291147767',7,2),(16,'Минин','Евгений','Викторович','AB3248900','1977-07-08','м','+375291144007',6,11),(17,'Грицук','Сергей','Иванович','AB3248988','1991-05-01','м','+375291144509',7,12),(18,'Мышковец','Леонид','Игоревич','AB3241111','1991-12-01','м','+375290044567',7,13);
/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Job`
--

DROP TABLE IF EXISTS `Job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Job` (
  `j_id` int NOT NULL,
  `j_role` varchar(20) NOT NULL,
  `j_bonus` int NOT NULL,
  `j_emp` int NOT NULL,
  `j_pr` int NOT NULL,
  PRIMARY KEY (`j_emp`,`j_pr`,`j_id`),
  KEY `Job_Projects_idx` (`j_pr`),
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`j_emp`) REFERENCES `Employees` (`e_id`),
  CONSTRAINT `job_ibfk_2` FOREIGN KEY (`j_pr`) REFERENCES `Projects` (`pr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Job`
--

LOCK TABLES `Job` WRITE;
/*!40000 ALTER TABLE `Job` DISABLE KEYS */;
INSERT INTO `Job` VALUES (1,'Разработчик ПО',300,1,1),(3,'Разработчик ПО',300,2,1),(4,'Менеджер проекта',500,4,1),(5,'Разработчик ПО',300,5,2),(6,'Разработчик ПО',300,6,2);
/*!40000 ALTER TABLE `Job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `msg` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `row_id` int NOT NULL,
  `_table` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'insert','2022-12-15 13:21:43',3,NULL),(2,'Зарплата увеличена','2022-12-15 13:34:35',1,NULL),(3,'Зарплата увеличена','2022-12-15 13:34:50',2,NULL),(4,'Зарплата уменьшена','2022-12-15 13:34:50',4,NULL),(5,'Зарплата увеличена','2022-12-15 13:36:42',1,'Posts'),(6,'insert','2022-12-16 14:36:54',4,NULL),(7,'Зарплата увеличена','2022-12-16 16:07:54',13,'Posts');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Posts`
--

DROP TABLE IF EXISTS `Posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Posts` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `p_post` varchar(255) NOT NULL,
  `p_salary` int NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Posts`
--

LOCK TABLES `Posts` WRITE;
/*!40000 ALTER TABLE `Posts` DISABLE KEYS */;
INSERT INTO `Posts` VALUES (1,'Инженер-Программист',850),(2,'Техник-Программист',420),(3,'Фронтенд-разработчик',1350),(4,'Бэкенд-разработчик',1340),(5,'Дизайнер',1350),(6,'Бухгалтер',1500),(7,'Главный бухгалтер',2100),(8,'Начальник Отдела инновационных технологий',2900),(9,'Начальник Отдела инновационных разработок',2900),(10,'Начальник Отдела сетевых технологий',2900),(11,'Начальник Отдела контроля качества',2900),(12,'Директор',4100),(13,'Заместитель директора',3600);
/*!40000 ALTER TABLE `Posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Projects`
--

DROP TABLE IF EXISTS `Projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Projects` (
  `pr_id` int NOT NULL AUTO_INCREMENT,
  `pr_title` varchar(100) DEFAULT NULL,
  `pr_abbr` char(10) NOT NULL,
  `pr_begin` date NOT NULL,
  `pr_end` date NOT NULL,
  `pr_cost` int NOT NULL,
  `pr_client` int NOT NULL,
  `pr_depart` int NOT NULL,
  `pr_chief` int NOT NULL,
  PRIMARY KEY (`pr_id`,`pr_client`,`pr_depart`,`pr_chief`),
  KEY `Projects_Clients_idx` (`pr_client`),
  KEY `Projects_Departs_idx` (`pr_depart`),
  KEY `Projects_Employees_idx` (`pr_chief`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`pr_client`) REFERENCES `Clients` (`c_id`),
  CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`pr_depart`) REFERENCES `Departs` (`d_id`),
  CONSTRAINT `projects_ibfk_3` FOREIGN KEY (`pr_chief`) REFERENCES `Employees` (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Projects`
--

LOCK TABLES `Projects` WRITE;
/*!40000 ALTER TABLE `Projects` DISABLE KEYS */;
INSERT INTO `Projects` VALUES (1,'Корпоративный сайт','САЙТ','2022-09-15','2022-12-29',5000,1,1,4),(2,'Автоматизация процессов на предприятии','АВТ','2022-09-15','2022-12-25',5000,2,2,7);
/*!40000 ALTER TABLE `Projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Roles` (
  `r_id` int NOT NULL AUTO_INCREMENT,
  `r_role` varchar(50) NOT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES (1,'Директор'),(2,'Сотрудник отдела кадров'),(3,'Руководитель проекта'),(4,'Бухгалтер'),(5,'Участник проекта'),(6,'Директор');
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rooms`
--

DROP TABLE IF EXISTS `Rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rooms` (
  `r_name` varchar(5) NOT NULL,
  `r_id` int NOT NULL AUTO_INCREMENT,
  `r_depart` int DEFAULT NULL,
  PRIMARY KEY (`r_id`),
  KEY `Rooms_Departs_idx` (`r_id`),
  KEY `rooms_ibfk_1` (`r_depart`),
  CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`r_depart`) REFERENCES `Departs` (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rooms`
--

LOCK TABLES `Rooms` WRITE;
/*!40000 ALTER TABLE `Rooms` DISABLE KEYS */;
INSERT INTO `Rooms` VALUES ('102',1,1),('104',2,2),('105',3,1),('105Б',4,1),('122',5,1),('123',6,1),('221',7,2),('222',8,2),('224',9,2),('224Б',10,2),('321',11,3),('322',12,3),('324',13,3),('324Б',14,3),('421',15,3),('422',16,3),('424',17,4),('424Б',18,4),('521',19,5),('522',20,5),('524',21,5),('524Б',22,5),('621',23,6),('622',24,6),('624',25,6),('624Б',26,6),('102',27,1),('104',28,1),('105',29,1),('105Б',30,1),('122',31,1),('123',32,1),('221',33,2),('222',34,2),('224',35,2),('224Б',36,2),('321',37,3),('322',38,3),('324',39,3),('324Б',40,3),('421',41,4),('422',42,4),('424',43,4),('424Б',44,4),('521',45,5),('522',46,5),('524',47,5),('524Б',48,5),('621',49,6),('622',50,6),('624',51,6),('624Б',52,6),('710',53,NULL);
/*!40000 ALTER TABLE `Rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stages`
--

DROP TABLE IF EXISTS `Stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stages` (
  `s_id` int NOT NULL AUTO_INCREMENT,
  `s_num` int NOT NULL,
  `s_title` varchar(200) NOT NULL,
  `s_begin` date NOT NULL,
  `s_end` date NOT NULL,
  `s_cost` int NOT NULL,
  `s_compl` tinyint(1) DEFAULT NULL,
  `s_pr` int NOT NULL,
  PRIMARY KEY (`s_id`,`s_pr`),
  KEY `stages_ibfk_1` (`s_pr`),
  CONSTRAINT `stages_ibfk_1` FOREIGN KEY (`s_pr`) REFERENCES `Projects` (`pr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stages`
--

LOCK TABLES `Stages` WRITE;
/*!40000 ALTER TABLE `Stages` DISABLE KEYS */;
INSERT INTO `Stages` VALUES (1,1,'Разработка макета','2022-09-16','2022-09-30',1000,1,1),(2,2,'Верстка','2022-10-01','2022-10-30',2000,1,1),(3,3,'Тестирование','2022-11-01','2022-12-25',1000,0,1),(4,1,'Разработка макета','2022-09-16','2022-09-30',1000,1,2),(5,2,'Верстка','2022-10-01','2022-10-30',1000,1,2),(6,3,'Тестирование','2022-11-01','2022-12-25',1000,0,2);
/*!40000 ALTER TABLE `Stages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `curr_projects`
--

/*!50001 DROP VIEW IF EXISTS `curr_projects`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `curr_projects` AS select `projects`.`pr_id` AS `pr_id`,`projects`.`pr_title` AS `pr_title`,`projects`.`pr_abbr` AS `pr_abbr`,`projects`.`pr_begin` AS `pr_begin`,`projects`.`pr_end` AS `pr_end`,`projects`.`pr_cost` AS `pr_cost`,`projects`.`pr_client` AS `pr_client`,`projects`.`pr_depart` AS `pr_depart`,`projects`.`pr_chief` AS `pr_chief` from `projects` where ((`projects`.`pr_begin` <= curdate()) and (curdate() <= `projects`.`pr_end`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-16 22:11:30
