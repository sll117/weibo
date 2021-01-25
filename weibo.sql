/*
SQLyog Ultimate v12.5.1 (32 bit)
MySQL - 8.0.20-cluster : Database - weibo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`weibo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `weibo`;

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `comment_id` int DEFAULT NULL,
  `comment_weibo_id` int DEFAULT NULL,
  `comment_username` varchar(32) DEFAULT NULL,
  `comment_content` mediumtext,
  `comment_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `comment_weibo_id` (`comment_weibo_id`),
  KEY `comment_username` (`comment_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `comment` */

insert  into `comment`(`comment_id`,`comment_weibo_id`,`comment_username`,`comment_content`,`comment_time`) values 
(1,33,'lxl','hello!','2021-01-04 20:00:43'),
(1,34,'sll','123','2021-01-09 20:01:08'),
(1,39,'lxl','dvgdfhvxvc','2021-01-09 20:01:44'),
(2,34,'sll','456','2021-01-19 22:03:46'),
(2,33,'lxl','123','2021-01-24 23:44:35'),
(3,34,'lxl','1212','2021-01-24 23:44:40'),
(3,33,'lxl','fgfdgfd','2021-01-25 19:37:39');

/*Table structure for table `myblog` */

DROP TABLE IF EXISTS `myblog`;

CREATE TABLE `myblog` (
  `weibo_id` int NOT NULL AUTO_INCREMENT,
  `weibo_username` varchar(32) DEFAULT NULL,
  `weibo_content` mediumtext,
  `weibo_img` varchar(64) DEFAULT NULL,
  `weibo_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`weibo_id`),
  KEY `myblog` (`weibo_username`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `myblog` */

insert  into `myblog`(`weibo_id`,`weibo_username`,`weibo_content`,`weibo_img`,`weibo_time`) values 
(40,'sll','ghgcvbvb',NULL,'2021-01-09 20:06:03'),
(39,'sll','test1',NULL,'2021-01-09 20:01:22'),
(34,'sll','拼多多为官方账号管控不严道歉：供应商员工发布 不代表官方态度\n\n1月4日晚，拼多多再发声明回应“网传截图”事件称，此事系拼多多对官方账号管控不严导致，向公众表示真诚歉意。',NULL,'2021-01-04 19:50:23'),
(33,'sll','你好',NULL,'2021-01-04 19:45:14');

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `user_nickname` varchar(32) NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `user_icon` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`user_nickname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `userinfo` */

insert  into `userinfo`(`user_nickname`,`user_password`,`user_icon`) values 
('sll','000614',''),
('lxl','000117',NULL);

/* Trigger structure for table `myblog` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tr_delete_blog` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tr_delete_blog` BEFORE DELETE ON `myblog` FOR EACH ROW DELETE
                 FROM comment
                 WHERE comment_weibo_id = OLD.weibo_id */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
