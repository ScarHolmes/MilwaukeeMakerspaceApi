/*
SQLyog Community
MySQL - 10.1.26-MariaDB-0+deb9u1 : Database - access_control
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`access_control` /*!40100 DEFAULT CHARACTER SET latin1 */;

/*Table structure for table `attempt` */

CREATE TABLE `attempt` (
  `attempt_id` int(11) NOT NULL AUTO_INCREMENT,
  `keycode` varchar(255) NOT NULL DEFAULT '',
  `member_id` int(11) NOT NULL,
  `reader_id` int(11) NOT NULL,
  `access_granted` tinyint(1) NOT NULL DEFAULT '0',
  `login` tinyint(1) NOT NULL DEFAULT '0',
  `logout` tinyint(1) NOT NULL DEFAULT '0',
  `attempt_time` datetime NOT NULL,
  PRIMARY KEY (`attempt_id`)
) ENGINE=MyISAM AUTO_INCREMENT=201954 DEFAULT CHARSET=latin1;

/*Table structure for table `group` */

CREATE TABLE `group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `group_member` */

CREATE TABLE `group_member` (
  `group_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `keycode` */

CREATE TABLE `keycode` (
  `keycode_id` varchar(255) NOT NULL,
  `member_id` int(11) NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`keycode_id`,`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `member` */

CREATE TABLE `member` (
  `member_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `apricot_admin` tinyint(1) NOT NULL,
  `joined` datetime NOT NULL,
  `expires` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `network_event` */

CREATE TABLE `network_event` (
  `network_event_id` int(11) NOT NULL AUTO_INCREMENT,
  `reader_id` int(11) NOT NULL,
  `online` tinyint(1) NOT NULL,
  `event_time` datetime NOT NULL,
  PRIMARY KEY (`network_event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `reader` */

CREATE TABLE `reader` (
  `reader_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timeout` int(11) NOT NULL DEFAULT '10',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`reader_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
