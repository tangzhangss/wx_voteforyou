/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.28 : Database - wx_votesystem
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wx_votesystem` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `wx_votesystem`;

/*Table structure for table `tbl_selectdetail` */

DROP TABLE IF EXISTS `tbl_selectdetail`;

CREATE TABLE `tbl_selectdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voteid` int(11) NOT NULL COMMENT '投票id',
  `userid` int(11) NOT NULL COMMENT '投票用户id',
  `optionid` int(11) NOT NULL COMMENT '用户选择的选项的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_selectdetail` */

insert  into `tbl_selectdetail`(`id`,`voteid`,`userid`,`optionid`) values (85,75,58,177);

/*Table structure for table `tbl_user` */

DROP TABLE IF EXISTS `tbl_user`;

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `openid` varchar(255) NOT NULL COMMENT '微信openid',
  `image` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT '1' COMMENT '1 男 2 女',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_user` */

insert  into `tbl_user`(`id`,`name`,`openid`,`image`,`gender`) values (18,'娃娃','odPbG5bNzjo9q6MbKKh3WoV3Fi-U','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epAYd6R93z0eWyuHXzvX4RfsPgTAEeH1rqK3VbJHAbD7pWffHMMcu1yebpGyc97zuMPYNicyxY0JxA/0',2),(20,'晓路漫漫','odPbG5ezxPmAGFJsTVnOz-4i_rU0','https://wx.qlogo.cn/mmopen/vi_32/9jFEk6dqn5ColUNvxSTFLBQAOUxial33TK51SUkQPoHVsuaX8HRwicibuhwJADnENdpdRXez4erIzMxvtggfcibicnw/132',2),(24,'覀','odPbG5Yv0DkID1xUS4D3QvVp-vZQ','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJs2xfY7hic0JElVc4lI1gybykcd5icawRjCl5ztBNRea7HU1fsU30SkqcQMC2yIh3DaWsWKDEANiaFg/0',2),(25,'nayimi','odPbG5Sp5rVsb6px3CFbRpbyUcQ8','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL4KiajJIiafLzlBr4kNof5Vhle6t2LqNpBhYvs1KI6kjeQJoqyzODBibOF40xicrPwLKxPhnjDsRfic8w/0',2),(26,'zy','odPbG5Rln4VI40J6vzxwrpMFny3A','https://wx.qlogo.cn/mmopen/vi_32/qIY5vkzz3cy6Xic7XicK0L7FibEK85KXBGnhv6myzic2ubJIGQgKJiaE7bFyNrlEhz2xfYPFiaPawqarXPE424b66ibkQ/132',2),(27,'peasant','odPbG5Q-Naj4Xnqfm47Pm5tnIN4Y','https://wx.qlogo.cn/mmopen/vi_32/RyH6DZxHiaYm3ttWKzEYicicRDcpGuCScuiaEk5z8tIpKCR0ejk9TjXYvG8PSQl2Dg96Yia98tXcmhm38kbiaDcrVvkA/132',1),(29,'Ji','odPbG5VaH8CzhxvuTXJcL7u0jucQ','https://wx.qlogo.cn/mmopen/vi_32/uu4h1W2hpBInNQIylvYtGd5yxI4GNuSe2XKicgETAMkWxRpUNxT39xtcCpEebmN4ibcWiaLq6rHg6z7jzNcLIzDDQ/132',2),(30,'灬','odPbG5UW8GaMuKNmhFCO04ixHaAA','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL2kibQ9ib9FcerAmsibq5EPIxpmY0hv1tbgLic8rTtN8wH5Fy6K4nkg8ibQ6pqg5pQovvbFs6pLiahrA8g/132',1),(31,'@bb','odPbG5Q8Z_WDCx_HQ2QtFc-nsUqg','https://wx.qlogo.cn/mmopen/vi_32/rtPLq8qTGfK6uhrJ90gicSwCtJ3MwGicD1tXUvXHzHmctY42t7XJ39HMiaeIfah70m7nK518D2Lz2FJm4vDYa4X0w/132',2),(32,'名字长长的才能吊吊哒','odPbG5dvOERB5UOy6g4y-E2In3x4','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epRpCynbtOTxz6sjL7wbNktVXT8quQEfSQict53DibDXxnzjicianFgs6MdHfguwuIbLwicDKDwUMhibj8g/132',1),(33,'boommmmmm','odPbG5YjuNYH7PLLFXPL2lMDezIc','https://wx.qlogo.cn/mmopen/vi_32/8Mh5LMr5LbLamvh0rNrn23eHAhzuCpibyN3h9yibcymywibcLDyWhkOy83vuHiaTdmaAzMY9vvn05vW4vHOBXJSQxg/132',0),(34,'小拖油瓶','odPbG5W8eEn-xWudJPN0AG0rsvts','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIzrdNibIODKPEBsuHuaLTRicJ6JmUXJrxXARJ0bUTOABAbibWTmqYavkuicpNKhbn7s68smFhbF5he9g/132',2),(35,'花花','odPbG5QsRRU3-ZL0Xr-QeQNTXj6E','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibHguZ4ArHO5MiayTavYgrCVq07SxvfDdwpjepI4jDv1mPHqMzibHdxL3HdfNV9iaZLnGDZsD9J0c8A/132',2),(37,'陈英俊是我歌神','odPbG5TDsKyLvNZt27fiRDWqkV4A','https://wx.qlogo.cn/mmopen/vi_32/xrtjJQZF5APhxpxr9985OLw8lSHSZoyVhSiaXicicnTDrXZ2WJZlahWiaiceRRuXdfodWic0ticC0Seyrr9Bsb5Hbpw3A/132',2),(38,'雅遂宁','odPbG5Tloq38HKs5-sochgmiOClY','https://wx.qlogo.cn/mmopen/vi_32/WelVn2ibRUKuNIuAMGoV7FlPJV5ic9PEB3JkffAOCLWcb2gtmqr8W38OoJHQ66HhdfCBy3bVWwo5mianThY5ufQPg/132',2),(39,'青木阳','odPbG5fJz2x9Na1JZWR0x1vSeHHQ','https://wx.qlogo.cn/mmopen/vi_32/ibqKJo3hCA8SdcYubnEB5lk8J8jSL1s4S702NI8LicY5CAz20xbiaocuicwvSCoVttTz5a1RiciaUuZl0SCETUbHYtzA/132',2),(40,'名字什么的随便就好','odPbG5W2EFYVQ4AMAW5KE47pHg9I','https://wx.qlogo.cn/mmopen/vi_32/ib8nZNHmFD6XvQj9UicF9p9X1AaRibJ14NKlto0IZa3kIliagPTE7PcV3PtMTFibBF3OFD9shImMdgBhkXXTbK4WXAQ/132',2),(41,'芸芸众生朱门酒肉臭','odPbG5RUDtE6faaWh1s08aFgUe1Q','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIicaOLeymh1fFk6VsBklClbA0yTV0xCEoiamxo8QjCfc5eBe3sAmnxKhvBFU7adA3YmicNQ4PLXnoTw/132',1),(42,'iamguao','odPbG5cCLdUDxULR0ziAbCXj-9sU','https://wx.qlogo.cn/mmopen/vi_32/ONm5a6a5OUtCLsSVEwCTHO2vzqw1iaicrPSkphWpotvJeI6LmrLcPvLYlPbmpwOO9zlicZYrvu7twyTCAtXlhO6fA/132',2),(43,'A！那么远','odPbG5e8DfeuAavPnSePnbf5-fUQ','https://wx.qlogo.cn/mmopen/vi_32/zEfZrSKtt6fwhCp5pjIv2rCT7pQbgXYoJmmrnctMD6IZdOiciajsYicJZS0x1MnfKEAia5BX9ZIWTJYFu5j8eFGPDw/132',1),(44,'Sylvia ','odPbG5VJngfL4ULNqUD8vb9MMK2A','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLY9xp1nsR6qYVnWWpqgey3mXMKUiaBplvxre2EAic3kVCyEE1euHVmQCY6TqbiawavNaiatPHXBBy2QA/132',2),(45,'Henry Cai','odPbG5aGuIFVhuOudUUuR87VTjiE','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83er7X9X9wIX934rGeutXfBNztyC05XHEtfbr2RdsURuO16zPyGh33oGOHQiciaCkjWSPNOI6loia5B1Ew/132',1),(46,'Joran','odPbG5WxXLRVUHg7x70TM0XMDcLU','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ4v4EMTENDsBjAxlPG3giaBibsmTXWYLSSDpPBFLk0TLOzWPv5tZNckJJeqdVfBGdoftbgIrbeHL2A/132',1),(47,'钱晓春','odPbG5agOyWfpIDHTQBWz-991UL8','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epwwYxqhTLeNDUW9FjUwoSUE7Y3iaicoX7tR17un83UEedM25FWcWNX6eiaicXr5qcYMxpAa5Sm9z9LdA/132',1),(48,'邹菲','odPbG5WWNpZsS9XawK4BcOQZH50A','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eonq6ZCRaZX66PyibHkuQYbJdO8GMZLVVxmyGSot3qM3NC9WV2S5Aw7icHDqcNCosg2c5qmup8SFEjg/132',2),(49,'linda','odPbG5a75I4E8v7X2-5vtGStVng4','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIrFiaqfcQiaPveGEjI7mFWCub6yC9mGc0hz97G8xibhFwJC3jfNpH7sN3ET5n2aS4MiaDezq3fF1R85A/132',2),(50,'蜗牛','odPbG5a5R3cf-cumz1KXTXE01AAA','https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKiaWu2Oe8XWX8EjUeiaibdCnlRoahQRjiaLQzZWUtxdB1ukfq4FAZTT1FVRmyeoKaUUWZy2A8bVOxXibQ/132',1),(51,'黄铭刚','odPbG5U5hOVtJkTsvnj9stVM40Rw','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKvtG0bAIJaK0OUibRu9S3Rper1ptGhLQiaLuI1Y6n3qWHMnKwwjhJxNvgrK7qFNo1Bh9DpicUM5Kpuw/132',1),(52,'刘钦','odPbG5e9YfI9k2zmkzeviCObDnVs','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqZmEYIRh5lqe20lPPMBZwzfcCFwSJfYRXd87hUnmZqcWicZts4Zj7Al0dhzwA7Sjp9yOKsc4cy7CQ/132',2),(54,'A！那么远','ob3935JqkJFp9JyZVxcSLx-qJvfk','https://wx.qlogo.cn/mmopen/vi_32/1znsUF88YEepJS9I58GGJ6og82pMqFegeruEaG66kxMIMibBobxk9sTcpEDEE5S2xjePibhuvkFJhaF7nB7diaGaw/132',1),(55,'rdgztest_HEUVBY','ob3935AimZStp2M4nC0qQ3ytUvs4','',0),(56,'rdgztest_UOKVUY','ob3935MsLxlvnP49aNant82xnjaY','',0),(58,'但行好事','odPbG5ai5CvsiJp4QGkpjPgMW7j4','https://wx.qlogo.cn/mmopen/vi_32/iaNIJJ0bKzoJG1s2m1hCl0aMbtDYE9iaNPt7p6bXm2VOk6LNMewhZNbkfZaMgPOzowELsx1gTGql7ICVupm0wyfg/132',2),(59,'rdgztest_XPZADI','ob3935No2sQP1sDx2McUJQiV6GZc','',0),(60,'风猫','ob3935L8S3M_lW45HxLs9lNYk-OY','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKibRSh26v9yGLkHRicYrY8FodHKKeOxX9kJZ8tu0Tfkkq7eJMOfWTfh5CaWJEG1bwHmLOTbia8CEiajw/132',0),(64,'但行好事','ob3935GrxJJYCi82v9Bs11OVJ0aM','https://wx.qlogo.cn/mmopen/vi_32/C6a90a5zQicgHdgnDwdej2Mre2pzXAMyEEHQYqXXBHl51US6Nu5dSMMD3XwnenAOCuhdhjv6eQrywNgX1pbmRJA/132',2),(65,'风猫','odPbG5R7ajE-lez7JJC_VC4oPfIg','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKWD0Utnpnv6WwzOsibs5h4tx4Oib9B2MGg7jHydUxDKgJqboU6lFHoHD8vErmU26qAQhqjTyKicROTA/132',0),(66,'吴何聪','odPbG5aADhAWWtPkW6wtDxaaBmyg','https://wx.qlogo.cn/mmopen/vi_32/v9ibOah7VwvIXhoYpjncibba6sqdoS2ic9G5mibzUZhsbBBSCHFbD742Q2rJakQXT1AG1acjFYR3XBrZUBwMiaXjZKw/132',1),(67,'玲','odPbG5S_EIrdRi1JbT0FvZqSUQLs','https://wx.qlogo.cn/mmopen/vi_32/rv7ZR8icWQAybQgmXm9hnWQ72OzibBlUYhKQWGq42KyODhiceDfNw8gXCTghMEWjibVf9OnX1NiamfEjhlMWZcDK2JQ/132',0),(68,'Joepeng','','https://wx.qlogo.cn/mmopen/vi_32/sx6fib4ibYvu8yVApBLCZ7EfQwoibZUiaibuFZJP6V44wziccOLAzeprWiaZNSoVOqKkaR5kj0WPeegBjiczG5bVH7p7Dg/132',2);

/*Table structure for table `tbl_vote` */

DROP TABLE IF EXISTS `tbl_vote`;

CREATE TABLE `tbl_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `votedesc` varchar(255) NOT NULL,
  `votetype` int(11) NOT NULL DEFAULT '1' COMMENT '投票类型 选项数',
  `starttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endtime` varchar(30) NOT NULL,
  `isanonymous` int(11) DEFAULT '1',
  `image` varchar(255) DEFAULT 'http://blog.iamguao.work/wx_graduation_vote/img/vote_default.png',
  `userid` int(11) DEFAULT NULL COMMENT '发起投票用户的id',
  `end` int(11) DEFAULT '1' COMMENT '结束 2 ||没结素 1',
  `vshow` int(1) DEFAULT '1' COMMENT '是否显示 2审核过 显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vote` */

insert  into `tbl_vote`(`id`,`title`,`votedesc`,`votetype`,`starttime`,`endtime`,`isanonymous`,`image`,`userid`,`end`,`vshow`) values (74,'最喜欢读的书','请选择你最喜欢读的书',1,'2018-06-05 13:28:43','2018-06-05 21:01',1,'https://blog.iamguao.work/wx_graduation_voteforyou/img/vote_default.png',20,1,1),(75,'最想研究的方向','请投出你最感兴趣的方向',1,'2018-06-08 09:56:54','2018-06-08 00:01',1,'https://www.iamguao.work/wx_graduation_voteforyou/uploadfile/img/58/1528375198822_wxb24d17bf7af92f83.o6zAJs_4qtDtesHUBsGXTx5jRPes.soCs4dA6Bjrrdacb386e35aa2e90ce20ebe1250f7b92.jpg',58,2,2),(77,'测试','测试投票....',1,'2018-06-17 16:43:28','2019-06-17 09:01',1,'https://www.iamguao.work/wx_graduation_voteforyou/uploadfile/img/54/1529224982382_wx666d9a39d2780738.o6zAJs3ryG007UcDlyO4IJBzaivM.kW021un5DU9w7e34a28d21a3ad85aff2f3b9be84718d.jpg',54,1,2);

/*Table structure for table `tbl_voteoption` */

DROP TABLE IF EXISTS `tbl_voteoption`;

CREATE TABLE `tbl_voteoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '选项id',
  `vdesc` varchar(255) NOT NULL COMMENT '选项描述',
  `voteid` int(11) NOT NULL COMMENT '选项对应的投票id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_voteoption` */

insert  into `tbl_voteoption`(`id`,`vdesc`,`voteid`) values (175,'小王子',74),(176,'白夜行',74),(177,'机器学习',75),(178,'数据挖掘',75),(184,'过',77),(185,'meiguo没过',77);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
