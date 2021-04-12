/*
SQLyog Community v13.1.2 (64 bit)
MySQL - 5.5.29 : Database - jobportal
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jobportal` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jobportal`;

/*Table structure for table `application` */

DROP TABLE IF EXISTS `application`;

CREATE TABLE `application` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `mob` varchar(100) DEFAULT NULL,
  `altermob` varchar(100) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `hdegree` varchar(100) DEFAULT NULL,
  `percentage` varchar(100) DEFAULT NULL,
  `poutyear` varchar(100) DEFAULT NULL,
  `resume` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `recruiter` varchar(100) DEFAULT NULL,
  `cname` varchar(100) DEFAULT NULL,
  `jrole` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `application` */

LOCK TABLES `application` WRITE;

insert  into `application`(`id`,`name`,`email`,`dob`,`mob`,`altermob`,`qualification`,`hdegree`,`percentage`,`poutyear`,`resume`,`status`,`recruiter`,`cname`,`jrole`) values 
(4,'Harekrishna Jena','shiva@gmail.com','1996-01-15','7978418005','8908455027','B-tech','B-tech','67','2017','Resumes\\Krishna Python Developer Resume.docx','Accepted','hk.1000projects@gmail.com','Infosis','UI Developer');

UNLOCK TABLES;

/*Table structure for table `courses` */

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `cname` varchar(100) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `courses` */

LOCK TABLES `courses` WRITE;

insert  into `courses`(`id`,`cname`,`link`) values 
(1,'java','http://google.com');

UNLOCK TABLES;

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `requirments` text,
  `cname` varchar(100) DEFAULT NULL,
  `jobrole` varchar(100) DEFAULT NULL,
  `package` varchar(100) DEFAULT NULL,
  `cdetails` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `jobs` */

LOCK TABLES `jobs` WRITE;

insert  into `jobs`(`id`,`requirments`,`cname`,`jobrole`,`package`,`cdetails`,`username`) values 
(2,'HTML,CSS,JS,Bootstrap','Infosis','Software Engineer','4 Lakh','Company Details\\National Job Portal(UMLs).docx','hk.1000projects@gmail.com');

UNLOCK TABLES;

/*Table structure for table `recruiter` */

DROP TABLE IF EXISTS `recruiter`;

CREATE TABLE `recruiter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `jobrole` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `cmobile` varchar(100) DEFAULT NULL,
  `pmobile` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `icard` text,
  `status` varchar(100) DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `recruiter` */

LOCK TABLES `recruiter` WRITE;

insert  into `recruiter`(`id`,`username`,`password`,`name`,`jobrole`,`company`,`cmobile`,`pmobile`,`address`,`icard`,`status`) values 
(1,'hk.1000projects@gmail.com','1234','Harekrishna Jena','UI Developer','Infosis','8745635412','8974563321','Hitech City, Hyderabad','icards//bg (1).jpg','Accepted');

UNLOCK TABLES;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `college` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `icard` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

LOCK TABLES `user` WRITE;

insert  into `user`(`id`,`username`,`password`,`name`,`gender`,`college`,`address`,`icard`,`status`) values 
(1,'shiva@gmail.com','1234','Shiva','Male','Synergy Institute','Hyderabad','icards//bg.jpg','Accepted'),
(2,'divya.mudiraj02@gmail.com','123456','Divya',NULL,NULL,NULL,'icards\\//frame131.jpg','Accepted');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
