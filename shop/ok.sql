/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.6.23-log : Database - ok
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`ok` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ok`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `detail` */

DROP TABLE IF EXISTS `detail`;

CREATE TABLE `detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '{主键}',
  `orderid` int(11) DEFAULT NULL COMMENT '订单id号',
  `goodsid` int(11) DEFAULT NULL COMMENT '商品id号',
  `name` varchar(32) DEFAULT NULL COMMENT '商品名称',
  `price` double(6,2) DEFAULT NULL COMMENT '单价',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

/*Data for the table `detail` */

insert  into `detail`(`id`,`orderid`,`goodsid`,`name`,`price`,`num`) values (13,14,22,'苹果',2.00,6),(14,14,19,'韩都衣舍',698.00,9),(15,15,18,'七匹狼',398.00,1),(16,16,22,'苹果',2.00,1),(17,17,23,'奸-20',9999.00,3),(18,18,20,'索尼',6999.00,3),(19,19,22,'苹果',2.00,1),(20,20,18,'七匹狼',398.00,4),(21,21,18,'七匹狼',398.00,3),(22,22,21,'小米',4998.00,5),(23,23,19,'韩都衣舍',698.00,1),(24,24,19,'韩都衣舍',698.00,2),(25,25,19,'韩都衣舍',698.00,3),(26,25,18,'七匹狼',398.00,1),(27,26,18,'七匹狼',398.00,3),(28,27,19,'韩都衣舍',698.00,3),(29,28,20,'索尼',6999.00,1),(30,29,23,'奸-20',9999.00,1),(31,30,18,'七匹狼',398.00,1),(32,31,18,'七匹狼',398.00,1),(33,32,20,'索尼',6999.00,1),(34,33,21,'小米',4998.00,1),(35,34,18,'七匹狼',398.00,3),(36,35,18,'七匹狼',398.00,1),(37,36,22,'苹果',2.00,3),(38,37,22,'苹果',2.00,3),(39,37,20,'索尼',6999.00,3),(40,38,18,'七匹狼',398.00,1),(41,38,21,'小米',4998.00,1),(42,38,22,'苹果',2.00,1),(43,39,21,'小米',4998.00,1),(44,40,18,'七匹狼',398.00,2),(45,40,23,'奸-20',9999.00,1),(46,41,22,'苹果',2.00,1),(47,42,24,'香蕉',23.00,1),(48,43,18,'七匹狼',398.00,5),(49,43,21,'小米',4998.00,1),(50,43,20,'索尼',6999.00,1),(51,44,21,'小米',4998.00,1),(52,44,24,'香蕉',23.00,1);

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2017-10-18 20:24:29.525800'),(2,'auth','0001_initial','2017-10-18 20:24:48.470277'),(3,'admin','0001_initial','2017-10-18 20:24:51.351666'),(4,'admin','0002_logentry_remove_auto_add','2017-10-18 20:24:51.893062'),(5,'contenttypes','0002_remove_content_type_name','2017-10-18 20:24:54.731568'),(6,'auth','0002_alter_permission_name_max_length','2017-10-18 20:24:56.490288'),(7,'auth','0003_alter_user_email_max_length','2017-10-18 20:24:58.748626'),(8,'auth','0004_alter_user_username_opts','2017-10-18 20:24:58.847989'),(9,'auth','0005_alter_user_last_login_null','2017-10-18 20:25:05.101855'),(10,'auth','0006_require_contenttypes_0002','2017-10-18 20:25:05.180968'),(11,'auth','0007_alter_validators_add_error_messages','2017-10-18 20:25:05.273377'),(12,'auth','0008_alter_user_username_max_length','2017-10-18 20:25:06.774987'),(13,'sessions','0001_initial','2017-10-18 20:25:07.917815');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('2beagamnkklyj1qy5k0r8d3xhatrx5ev','ODU4MmU3Mzk4NGE1YzM3ODcxYWNlNDBlMjYxMTJmNDJiZTgzNmNiNzp7ImFkbWludXNlciI6Ilx1NTM1Y1x1NGVlNFx1NmQ5YiIsInZlcmlmeWNvZGUiOiJGOFFKIn0=','2017-11-02 01:30:45.244843'),('2i9p4zqbqigaiow36n70eqz71hp4phne','NDFiY2ExZmRjNGEwNWY5ZWZhZWI2NzUyZTYwOWZiMzE0Y2Q1MmY5Yzp7InZlcmlmeWNvZGUiOiJQTUhKIiwiYWRtaW51c2VyIjoiXHU1MzVjXHU0ZWU0XHU2ZDliIiwidmlwdXNlciI6eyJpZCI6NCwidXNlcm5hbWUiOiJcdTUzZWZcdTcyMzEiLCJuYW1lIjoiXHU1M2VmXHU3MjMxIiwicGFzc3dvcmQiOiIyMDJjYjk2MmFjNTkwNzViOTY0YjA3MTUyZDIzNGI3MCIsInNleCI6MSwiYWRkcmVzcyI6Ilx1NTMxN1x1NGVhY1x1NjYwY1x1NWU3MyIsImNvZGUiOiIyMzY3IiwicGhvbmUiOiIzNjAiLCJlbWFpbCI6IjM2MEAxNjMuY29tIiwic3RhdGUiOjEsImFkZHRpbWUiOjE1MDgzNzQ4NzR9LCJzaG9wbGlzdCI6eyIyMiI6eyJpZCI6MjIsInR5cGVpZCI6OCwiZ29vZHMiOiJcdTgyZjlcdTY3OWMiLCJjb21wYW55IjoiXHU4MmY5XHU2NzljIiwicGljbmFtZSI6IjE1MDgzNjA0MzYuODUwODM5Ni5qcGciLCJwcmljZSI6Mi4wLCJzdGF0ZSI6MSwic3RvcmUiOjI5MCwibXVuIjowLCJjbGlja251bSI6OCwiYWRkdGltZSI6MTUwODM2MDQzNywibSI6NH0sIjE5Ijp7ImlkIjoxOSwidHlwZWlkIjo1LCJnb29kcyI6Ilx1OTdlOVx1OTBmZFx1ODg2M1x1ODIwZCIsImNvbXBhbnkiOiJcdTk3ZTlcdTkwZmRcdTg4NjNcdTgyMGQiLCJwaWNuYW1lIjoiMTUwODM1OTkzMy42NTAwODI2LmpwZyIsInByaWNlIjo2OTguMCwic3RhdGUiOjEsInN0b3JlIjo1OTksIm11biI6MCwiY2xpY2tudW0iOjUsImFkZHRpbWUiOjE1MDgzNTk5MzMsIm0iOjF9LCIxOCI6eyJpZCI6MTgsInR5cGVpZCI6NCwiZ29vZHMiOiJcdTRlMDNcdTUzMzlcdTcyZmMiLCJjb21wYW55IjoiXHU0ZTAzXHU1MzM5XHU3MmZjIiwicGljbmFtZSI6IjE1MDgzNTk4MDEuMDkyNzc4Mi5qcGciLCJwcmljZSI6Mzk4LjAsInN0YXRlIjoxLCJzdG9yZSI6Mjg5LCJtdW4iOjAsImNsaWNrbnVtIjoxNiwiYWRkdGltZSI6MTUwODM1OTgwMSwibSI6Mn0sIjI0Ijp7ImlkIjoyNCwidHlwZWlkIjoxMCwiZ29vZHMiOiJcdTk5OTlcdTg1NDkiLCJjb21wYW55IjoiXHU2ZTI5XHU1ZGRlIiwicGljbmFtZSI6IjE1MDg0MjcyMTguOTg0ODc1LmpwZyIsInByaWNlIjoyMy4wLCJzdGF0ZSI6MSwic3RvcmUiOjIyMjIsIm11biI6MCwiY2xpY2tudW0iOjUsImFkZHRpbWUiOjE1MDg0MjcyMTksIm0iOjF9LCIyMCI6eyJpZCI6MjAsInR5cGVpZCI6NiwiZ29vZHMiOiJcdTdkMjJcdTVjM2MiLCJjb21wYW55IjoiXHU3ZDIyXHU1YzNjIiwicGljbmFtZSI6IjE1MDgzNjAwMzQuMTM2NjM0My5qcGciLCJwcmljZSI6Njk5OS4wLCJzdGF0ZSI6MSwic3RvcmUiOjIxLCJtdW4iOjAsImNsaWNrbnVtIjo4LCJhZGR0aW1lIjoxNTA4MzYwMDM0LCJtIjoxfX19','2017-11-03 13:15:39.011737');

/*Table structure for table `myweb_goods` */

DROP TABLE IF EXISTS `myweb_goods`;

CREATE TABLE `myweb_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` int(11) unsigned DEFAULT NULL,
  `goods` varchar(32) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `descr` text,
  `price` double(6,2) DEFAULT NULL,
  `picname` varchar(255) DEFAULT NULL,
  `state` tinyint(1) DEFAULT '1',
  `store` int(11) unsigned DEFAULT '0',
  `num` int(11) unsigned DEFAULT '0',
  `clicknum` int(11) unsigned DEFAULT '0',
  `addtime` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeid` (`typeid`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `myweb_goods` */

insert  into `myweb_goods`(`id`,`typeid`,`goods`,`company`,`descr`,`price`,`picname`,`state`,`store`,`num`,`clicknum`,`addtime`) values (18,4,'七匹狼','七匹狼','                 七匹狼.狼之美   ',398.00,'1508359801.0927782.jpg',1,289,0,17,1508359801),(19,5,'韩都衣舍','韩都衣舍','                    韩都衣舍,舍之魅力',698.00,'1508359933.6500826.jpg',1,599,0,6,1508359933),(20,6,'索尼','索尼','                    索尼之眼,世界之美',6999.00,'1508360034.1366343.jpg',1,21,0,9,1508360034),(21,7,'小米','小米','                    小米本本,无比流畅',4998.00,'1508360171.2558715.jpg',1,389,0,6,1508360171),(22,8,'苹果','苹果','                    入口甘甜,水果之王',2.00,'1508360436.8508396.jpg',1,290,0,10,1508360437),(23,8,'奸-20','中国装备','                    中国力量,世界之巅',9999.00,'1508402727.9899602.jpg',1,8,0,4,1508402728),(24,10,'香蕉','温州','                    不错的味道',23.00,'1508427218.984875.jpg',1,2222,0,5,1508427219);

/*Table structure for table `myweb_type` */

DROP TABLE IF EXISTS `myweb_type`;

CREATE TABLE `myweb_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `pid` int(11) unsigned DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `myweb_type` */

insert  into `myweb_type`(`id`,`name`,`pid`,`path`) values (1,'服装',0,'0,'),(2,'数码',0,'0,'),(3,'食品',0,'0,'),(4,'男装',1,'0,1,'),(5,'女装',1,'0,1,'),(6,'相机',2,'0,2,'),(7,'电脑',2,'0,2,'),(8,'小吃',3,'0,3,'),(9,'水果',0,'0,'),(10,'南方水果',9,'0,9,');

/*Table structure for table `myweb_users` */

DROP TABLE IF EXISTS `myweb_users`;

CREATE TABLE `myweb_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `password` char(32) NOT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `code` char(6) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `state` tinyint(1) DEFAULT '1',
  `addtime` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `myweb_users` */

insert  into `myweb_users`(`id`,`username`,`name`,`password`,`sex`,`address`,`code`,`phone`,`email`,`state`,`addtime`) values (2,'卜令涛','卜令涛','202cb962ac59075b964b07152d234b70',1,'中国山东','270088','18522571096','taotao@163.com',0,1508358828),(3,'110','110','202cb962ac59075b964b07152d234b70',1,'公安局','11101','110','110@qq.com',1,1508359009),(4,'可爱','可爱','202cb962ac59075b964b07152d234b70',1,'北京昌平','2367','360','360@163.com',1,1508374874),(5,'','前台','202cb962ac59075b964b07152d234b70',1,'11100','123','120','qiantai@110.com',1,1508375419);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '{主键}',
  `uid` int(11) DEFAULT NULL COMMENT '会员id号',
  `linkman` varchar(32) DEFAULT NULL COMMENT '联系人',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `code` char(6) DEFAULT NULL COMMENT '邮编',
  `phone` varchar(16) DEFAULT NULL COMMENT '电话',
  `addtime` int(11) DEFAULT NULL COMMENT '购买时间',
  `total` double(8,2) DEFAULT NULL COMMENT '总金额',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态:0:新订单;1:已发货;2:已收货,3:无效订单.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`uid`,`linkman`,`address`,`code`,`phone`,`addtime`,`total`,`status`) values (14,5,'前台','11100','123','120',1508393979,6294.00,3),(15,5,'前台','11100','123','120',1508400238,398.00,1),(16,5,'前台','11100','123','120',1508400629,2.00,0),(17,5,'前台','11100','123','120',1508402832,29997.00,0),(18,4,'可爱','北京昌平','2367','360',1508404609,20997.00,0),(19,4,'可爱','北京昌平','2367','360',1508404646,2.00,0),(20,3,'110','公安局','11101','110',1508404746,1592.00,3),(21,3,'110','公安局','11101','110',1508405373,1194.00,3),(22,3,'110','公安局','11101','110',1508405449,24990.00,3),(23,3,'110','公安局','11101','110',1508409479,698.00,0),(24,3,'110','公安局','11101','110',1508409714,1396.00,3),(25,3,'110','公安局','11101','110',1508409965,2492.00,0),(26,3,'110','公安局','11101','110',1508410099,1194.00,0),(27,3,'110','公安局','11101','110',1508410197,2094.00,0),(28,3,'110','公安局','11101','110',1508410246,6999.00,0),(29,3,'110','公安局','11101','110',1508410317,9999.00,0),(30,3,'110','公安局','11101','110',1508410478,398.00,0),(31,3,'110','公安局','11101','110',1508411184,398.00,0),(32,3,'110','公安局','11101','110',1508411332,6999.00,0),(33,3,'110','公安局','11101','110',1508411435,4998.00,0),(34,3,'110','公安局','11101','110',1508413359,1194.00,0),(35,3,'110','公安局','11101','110',1508414747,398.00,0),(36,3,'110','公安局','11101','110',1508421929,6.00,0),(37,4,'可爱','北京昌平','2367','360',1508425988,21003.00,0),(38,3,'110','公安局','11101','110',1508427299,5398.00,0),(39,3,'110','公安局','11101','110',1508427442,4998.00,0),(40,3,'110','公安局','11101','110',1508428097,10795.00,0),(41,3,'110','公安局','11101','110',1508440505,2.00,0),(42,4,'可爱','北京昌平','2367','360',1508442557,23.00,0),(43,4,'可爱','北京昌平','2367','360',1508444718,13987.00,3),(44,4,'可爱','北京昌平','2367','360',1508505173,5021.00,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
