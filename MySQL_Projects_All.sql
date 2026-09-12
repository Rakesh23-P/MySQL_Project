CREATE DATABASE  IF NOT EXISTS `rrgi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `rrgi`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: rrgi
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `account_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `branch_id` int NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `account_type` varchar(30) NOT NULL,
  `balance` decimal(15,2) DEFAULT '0.00',
  `minimum_balance` decimal(15,2) DEFAULT '0.00',
  `opened_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `currency` varchar(10) DEFAULT 'INR',
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `account_number` (`account_number`),
  KEY `customer_id` (`customer_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (101,1,2,'ACC1000001','SAVINGS',43500.00,1000.00,'2025-01-15','ACTIVE','INR'),(102,2,2,'ACC1000002','SAVINGS',25750.00,1000.00,'2025-02-20','ACTIVE','INR'),(103,3,3,'ACC1000003','CURRENT',75000.00,5000.00,'2025-03-10','ACTIVE','INR'),(104,4,4,'ACC1000004','SAVINGS',62000.00,1000.00,'2025-04-05','ACTIVE','INR'),(105,5,5,'ACC1000005','SALARY',45000.00,0.00,'2025-05-12','ACTIVE','INR');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficiaries`
--

DROP TABLE IF EXISTS `beneficiaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beneficiaries` (
  `beneficiary_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `beneficiary_name` varchar(100) NOT NULL,
  `account_number` varchar(30) NOT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `ifsc_code` varchar(20) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `added_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`beneficiary_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `beneficiaries_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficiaries`
--

LOCK TABLES `beneficiaries` WRITE;
/*!40000 ALTER TABLE `beneficiaries` DISABLE KEYS */;
INSERT INTO `beneficiaries` VALUES (1,1,'Rahul Sharma','BENACC10001','State Bank of India','SBIN0001234','Rahul','2025-06-01','ACTIVE'),(2,1,'Amit Verma','BENACC10002','Punjab National Bank','PUNB0001234','Amit','2025-06-05','ACTIVE'),(3,2,'Priya Singh','BENACC10003','HDFC Bank','HDFC0001234','Priya','2025-06-10','ACTIVE'),(4,2,'Neha Gupta','BENACC10004','ICICI Bank','ICIC0001234','Neha','2025-06-15','ACTIVE'),(5,3,'Vikas Yadav','BENACC10005','Bank of Baroda','BARB0001234','Vikas','2025-06-20','ACTIVE'),(6,4,'Ankit Singh','BENACC10006','Canara Bank','CNRB0001234','Ankit','2025-07-01','ACTIVE'),(7,5,'Pooja Mishra','BENACC10007','Axis Bank','UTIB0001234','Pooja','2025-07-05','ACTIVE'),(8,6,'Rohit Kumar','BENACC10008','State Bank of India','SBIN0005678','Rohit','2025-07-10','ACTIVE'),(9,7,'Sneha Patel','BENACC10009','HDFC Bank','HDFC0005678','Sneha','2025-07-15','ACTIVE'),(10,8,'Karan Mehta','BENACC10010','ICICI Bank','ICIC0005678','Karan','2025-07-20','ACTIVE');
/*!40000 ALTER TABLE `beneficiaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `branch_id` int NOT NULL,
  `branch_code` varchar(10) NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `ifsc_code` varchar(20) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `manager_name` varchar(100) DEFAULT NULL,
  `opening_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`branch_id`),
  UNIQUE KEY `branch_code` (`branch_code`),
  UNIQUE KEY `ifsc_code` (`ifsc_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (2,'SBI2','BKT','Lucknow','UP','226201','near SRGI','SBI002','6463954583','Amit','2021-02-02','ACTIVE'),(3,'SBI3','Bithauli','Lucknow','UP','226200','near OYO','SBI003','9463954909','Arif','2025-04-08','ACTIVE'),(4,'PNB1','Baikunthpur Kothi','kushinagar','UP','228401','near Padrauna','PNB001','6396963156','Naviz','2026-02-02','ACTIVE'),(5,'CBI2','Nonar','Deoria','UP','274701','near Bhatpar Rani','CBI001','6465698695','Arif','2001-05-01','ACTIVE');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cards` (
  `card_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `account_id` int DEFAULT NULL,
  `card_number` varchar(20) NOT NULL,
  `card_type` varchar(20) DEFAULT NULL,
  `card_network` varchar(20) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `credit_limit` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`card_id`),
  UNIQUE KEY `card_number` (`card_number`),
  KEY `customer_id` (`customer_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `cards_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `cards_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` VALUES (1,1,101,'XXXX-XXXX-0001','DEBIT','VISA','2025-01-20','2030-01-31','ACTIVE',0.00),(2,2,102,'XXXX-XXXX-0002','DEBIT','MASTERCARD','2025-02-25','2030-02-28','ACTIVE',0.00),(3,3,103,'XXXX-XXXX-0003','CREDIT','VISA','2025-03-15','2030-03-31','ACTIVE',100000.00),(4,4,104,'XXXX-XXXX-0004','DEBIT','RUPAY','2025-04-10','2030-04-30','ACTIVE',0.00),(5,5,105,'XXXX-XXXX-0005','DEBIT','VISA','2025-05-15','2030-05-31','ACTIVE',0.00);
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `customer_number` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `customer_since` date DEFAULT NULL,
  `customer_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_number` (`customer_number`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'CUST001','Aman','Verma','aman.verma@gmail.com','9876543210','1998-05-12','Male','Aliganj','Lucknow','Uttar Pradesh','226024','2022-01-15','Active'),(2,'CUST002','Priya','Sharma','priya.sharma@gmail.com','9876543211','1999-08-20','Female','Gomti Nagar','Lucknow','Uttar Pradesh','226010','2021-06-10','Active'),(3,'CUST003','Rahul','Singh','rahul.singh@gmail.com','9876543212','1997-03-18','Male','Indira Nagar','Lucknow','Uttar Pradesh','226016','2020-11-25','Active'),(4,'CUST004','Neha','Gupta','neha.gupta@gmail.com','9876543213','2000-01-30','Female','Hazratganj','Lucknow','Uttar Pradesh','226001','2023-02-12','Active'),(5,'CUST005','Rohit','Yadav','rohit.yadav@gmail.com','9876543214','1996-11-05','Male','Kalyanpur','Kanpur','Uttar Pradesh','208017','2019-08-19','Active'),(6,'CUST006','Sneha','Mishra','sneha.mishra@gmail.com','9876543215','1998-07-14','Female','Civil Lines','Prayagraj','Uttar Pradesh','211001','2022-09-05','Active'),(7,'CUST007','Vikas','Patel','vikas.patel@gmail.com','9876543216','1995-12-22','Male','Mahanagar','Lucknow','Uttar Pradesh','226006','2018-04-16','Inactive'),(8,'CUST008','Anjali','Tiwari','anjali.tiwari@gmail.com','9876543217','2001-04-09','Female','Rajajipuram','Lucknow','Uttar Pradesh','226017','2024-01-20','Active'),(9,'CUST009','Saurabh','Pandey','saurabh.pandey@gmail.com','9876543218','1997-09-27','Male','Bhelupur','Varanasi','Uttar Pradesh','221010','2021-12-01','Active'),(10,'CUST010','Pooja','Singh','pooja.singh@gmail.com','9876543219','1999-06-16','Female','Gomti Nagar','Lucknow','Uttar Pradesh','226010','2023-07-11','Active'),(11,'CUST011','Arjun','Mehta','arjun.mehta@gmail.com','9876543220','1994-02-25','Male','Vaishali Nagar','Jaipur','Rajasthan','302021','2017-10-10','Inactive'),(12,'CUST012','Kavita','Joshi','kavita.joshi@gmail.com','9876543221','1996-10-13','Female','Deccan','Pune','Maharashtra','411004','2020-05-18','Active'),(13,'CUST013','Mohit','Agarwal','mohit.agarwal@gmail.com','9876543222','1993-08-08','Male','Sector 18','Noida','Uttar Pradesh','201301','2016-03-22','Active'),(14,'CUST014','Riya','Chauhan','riya.chauhan@gmail.com','9876543223','2000-12-19','Female','Rajendra Nagar','Delhi','Delhi','110060','2024-04-15','Active'),(15,'CUST015','Karan','Malhotra','karan.malhotra@gmail.com','9876543224','1992-05-03','Male','Andheri West','Mumbai','Maharashtra','400058','2015-09-30','Active');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` int NOT NULL,
  `course` varchar(50) DEFAULT NULL,
  `branch` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'B.Tech','CSE'),(2,'B.Tech','IT'),(3,'B.Tech','ECE'),(4,'B.Tech','ME');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `e_id` int NOT NULL,
  `e_name` varchar(50) DEFAULT NULL,
  `e_department` varchar(50) DEFAULT NULL,
  `e_salary` float DEFAULT NULL,
  `e_city` varchar(50) DEFAULT NULL,
  `e_experience` int DEFAULT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (101,'Aman','IT',40000,'Delhi',5),(102,'Chetan','CSE',50000,'Delhi',0),(103,'Raj','AIML',20000,'Lucknow',12),(104,'Mohan','CSD',60000,'Agra',2),(105,'Rajan','BioTech',70000,'Manpuri',11),(106,'Vikas','IT',55000,'Lucknow',4),(107,'Rohit','IT',65000,'Delhi',6),(108,'Suresh','IT',45000,'Kanpur',3),(109,'Ankit','IT',75000,'Noida',8),(110,'Karan','IT',52000,'Agra',5);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee1`
--

DROP TABLE IF EXISTS `employee1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee1` (
  `emp_id` int NOT NULL,
  `emp_name` varchar(50) DEFAULT NULL,
  `emp_age` int DEFAULT NULL,
  `emp_department` varchar(30) DEFAULT NULL,
  `emp_salary` decimal(10,2) DEFAULT NULL,
  `emp_city` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee1`
--

LOCK TABLES `employee1` WRITE;
/*!40000 ALTER TABLE `employee1` DISABLE KEYS */;
INSERT INTO `employee1` VALUES (1,'Amit',28,'IT',70000.00,'Lucknow'),(2,'Priya',24,'HR',45000.00,'Lucknow'),(3,'Arjun',30,'IT',75000.00,'Lucknow'),(4,'Sneha',27,'Finance',55000.00,'Delhi'),(5,'Ravi',35,'HR',62000.00,'Mumbai'),(6,'Ananya',26,'IT',58000.00,'Delhi'),(7,'Karan',29,'Finance',70000.00,'Lucknow'),(8,'Neha',32,'IT',85000.00,'Mumbai'),(9,'Pooja',23,'HR',NULL,'Lucknow');
/*!40000 ALTER TABLE `employee1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL,
  `employee_code` varchar(20) NOT NULL,
  `branch_id` int DEFAULT NULL,
  `employee_name` varchar(100) NOT NULL,
  `job_role` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `salary` decimal(12,2) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `employee_code` (`employee_code`),
  UNIQUE KEY `email` (`email`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `std`
--

DROP TABLE IF EXISTS `std`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `std` (
  `rollnumber` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rollnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `std`
--

LOCK TABLES `std` WRITE;
/*!40000 ALTER TABLE `std` DISABLE KEYS */;
INSERT INTO `std` VALUES (101,'Raj','Lucknow'),(102,'Ravan','Lucknow'),(103,'Savan','Unnao');
/*!40000 ALTER TABLE `std` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int NOT NULL,
  `student_name` varchar(50) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `student_city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (101,'Aman',1,'Lucknow'),(102,'Raja',2,'Kanpur'),(103,'Rahul',1,'Delhi'),(104,'Ankit',3,'Gorakhpur'),(105,'Vikas',2,'Lucknow');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentdetails`
--

DROP TABLE IF EXISTS `studentdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentdetails` (
  `S_ID` int NOT NULL,
  `S_name` varchar(45) DEFAULT NULL,
  `S_City` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`S_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentdetails`
--

LOCK TABLES `studentdetails` WRITE;
/*!40000 ALTER TABLE `studentdetails` DISABLE KEYS */;
INSERT INTO `studentdetails` VALUES (102,'RR','Lucknow'),(2001,'Aman','Rampur'),(2002,'Raja','Kanpur'),(2301,'Rakesh Patel','Jaunpur'),(2302,'Abhishek Dubey','Jaunpur'),(2303,'Akhilesh Kumar','Ghazipur'),(2304,'Rohan Yadav','Deoria'),(2305,'Vikhyat Mishra','Deoria'),(5001,'Ram','Ayodhya');
/*!40000 ALTER TABLE `studentdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` bigint NOT NULL,
  `account_id` int NOT NULL,
  `transaction_type` varchar(30) NOT NULL,
  `transaction_mode` varchar(30) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `reference_number` varchar(50) DEFAULT NULL,
  `balance_after` decimal(15,2) DEFAULT NULL,
  `transaction_status` varchar(20) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `reference_number` (`reference_number`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1001,101,'DEPOSIT','BRANCH',50000.00,'2026-01-10 10:30:00','Cash deposit','REF100001',50000.00,'SUCCESS','Lucknow'),(1002,101,'PAYMENT','UPI',1500.00,'2026-01-10 14:20:00','UPI payment','REF100002',48500.00,'SUCCESS','Lucknow'),(1003,101,'WITHDRAWAL','ATM',5000.00,'2026-01-11 09:15:00','ATM cash withdrawal','REF100003',43500.00,'SUCCESS','Lucknow'),(1004,102,'TRANSFER','NEFT',10000.00,'2026-01-11 12:00:00','NEFT transfer','REF100004',25000.00,'SUCCESS','Lucknow'),(1005,102,'REFUND','UPI',750.00,'2026-01-12 16:45:00','UPI refund','REF100005',25750.00,'SUCCESS','Lucknow');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfers` (
  `transfer_id` bigint NOT NULL,
  `sender_account_id` int NOT NULL,
  `receiver_account_id` int NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `transfer_mode` varchar(30) DEFAULT NULL,
  `transfer_date` datetime DEFAULT NULL,
  `reference_number` varchar(50) DEFAULT NULL,
  `transfer_status` varchar(20) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`transfer_id`),
  UNIQUE KEY `reference_number` (`reference_number`),
  KEY `sender_account_id` (`sender_account_id`),
  KEY `receiver_account_id` (`receiver_account_id`),
  CONSTRAINT `transfers_ibfk_1` FOREIGN KEY (`sender_account_id`) REFERENCES `accounts` (`account_id`),
  CONSTRAINT `transfers_ibfk_2` FOREIGN KEY (`receiver_account_id`) REFERENCES `accounts` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfers`
--

LOCK TABLES `transfers` WRITE;
/*!40000 ALTER TABLE `transfers` DISABLE KEYS */;
INSERT INTO `transfers` VALUES (2001,101,102,5000.00,'UPI','2026-01-13 10:15:00','TRF100001','SUCCESS','Payment transfer'),(2002,102,103,7500.00,'NEFT','2026-01-13 11:30:00','TRF100002','SUCCESS','Fund transfer'),(2003,103,104,12000.00,'IMPS','2026-01-14 09:45:00','TRF100003','SUCCESS','Urgent transfer'),(2004,104,105,8500.00,'RTGS','2026-01-14 14:20:00','TRF100004','SUCCESS','Business payment'),(2005,105,101,3000.00,'UPI','2026-01-15 16:10:00','TRF100005','PENDING','Transfer pending'),(2006,101,103,2500.00,'IMPS','2026-01-16 12:05:00','TRF100006','FAILED','Transaction failed'),(2007,102,104,6000.00,'NEFT','2026-01-17 13:40:00','TRF100007','SUCCESS','Monthly transfer'),(2008,103,105,15000.00,'RTGS','2026-01-18 15:30:00','TRF100008','SUCCESS','Large value transfer');
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-13  1:16:53
