-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: 47.93.202.202    Database: wx_votesystem
-- ------------------------------------------------------
-- Server version	5.7.23

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
-- Table structure for table `tbl_selectdetail`
--

DROP TABLE IF EXISTS `tbl_selectdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_selectdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voteid` int(11) NOT NULL COMMENT '投票id',
  `userid` int(11) NOT NULL COMMENT '投票用户id',
  `optionid` int(11) NOT NULL COMMENT '用户选择的选项的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_selectdetail`
--

LOCK TABLES `tbl_selectdetail` WRITE;
/*!40000 ALTER TABLE `tbl_selectdetail` DISABLE KEYS */;
INSERT INTO `tbl_selectdetail` VALUES (88,79,68,188),(89,78,68,186),(90,79,58,188),(91,81,68,192),(92,79,70,189),(93,82,68,194),(94,83,68,197),(95,84,68,202),(96,85,70,205),(97,79,71,189),(98,86,71,208),(99,86,71,213),(100,82,72,195),(101,86,72,214),(102,86,72,212),(103,79,72,189),(104,90,68,224),(105,91,70,226),(106,91,70,227),(107,85,76,205),(108,86,70,217),(109,112,75,274),(110,114,75,279),(111,115,70,281),(112,115,77,282),(113,116,70,285),(114,116,70,284),(115,112,70,276),(116,119,75,292),(117,121,75,298),(118,118,75,290),(119,120,75,315),(120,122,75,320),(121,123,75,322),(122,124,75,326),(123,128,75,333),(124,129,75,335),(125,130,75,340),(126,131,75,342);
/*!40000 ALTER TABLE `tbl_selectdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `openid` varchar(255) NOT NULL COMMENT '微信openid',
  `image` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT '1' COMMENT '1 男 2 女',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (18,'娃娃','odPbG5bNzjo9q6MbKKh3WoV3Fi-U','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epAYd6R93z0eWyuHXzvX4RfsPgTAEeH1rqK3VbJHAbD7pWffHMMcu1yebpGyc97zuMPYNicyxY0JxA/0',2),(20,'晓路漫漫','odPbG5ezxPmAGFJsTVnOz-4i_rU0','https://wx.qlogo.cn/mmopen/vi_32/9jFEk6dqn5ColUNvxSTFLBQAOUxial33TK51SUkQPoHVsuaX8HRwicibuhwJADnENdpdRXez4erIzMxvtggfcibicnw/132',2),(24,'覀','odPbG5Yv0DkID1xUS4D3QvVp-vZQ','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJs2xfY7hic0JElVc4lI1gybykcd5icawRjCl5ztBNRea7HU1fsU30SkqcQMC2yIh3DaWsWKDEANiaFg/0',2),(25,'nayimi','odPbG5Sp5rVsb6px3CFbRpbyUcQ8','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL4KiajJIiafLzlBr4kNof5Vhle6t2LqNpBhYvs1KI6kjeQJoqyzODBibOF40xicrPwLKxPhnjDsRfic8w/0',2),(26,'zy','odPbG5Rln4VI40J6vzxwrpMFny3A','https://wx.qlogo.cn/mmopen/vi_32/qIY5vkzz3cy6Xic7XicK0L7FibEK85KXBGnhv6myzic2ubJIGQgKJiaE7bFyNrlEhz2xfYPFiaPawqarXPE424b66ibkQ/132',2),(27,'peasant','odPbG5Q-Naj4Xnqfm47Pm5tnIN4Y','https://wx.qlogo.cn/mmopen/vi_32/RyH6DZxHiaYm3ttWKzEYicicRDcpGuCScuiaEk5z8tIpKCR0ejk9TjXYvG8PSQl2Dg96Yia98tXcmhm38kbiaDcrVvkA/132',1),(29,'Ji','odPbG5VaH8CzhxvuTXJcL7u0jucQ','https://wx.qlogo.cn/mmopen/vi_32/uu4h1W2hpBInNQIylvYtGd5yxI4GNuSe2XKicgETAMkWxRpUNxT39xtcCpEebmN4ibcWiaLq6rHg6z7jzNcLIzDDQ/132',2),(30,'灬','odPbG5UW8GaMuKNmhFCO04ixHaAA','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL2kibQ9ib9FcerAmsibq5EPIxpmY0hv1tbgLic8rTtN8wH5Fy6K4nkg8ibQ6pqg5pQovvbFs6pLiahrA8g/132',1),(31,'@bb','odPbG5Q8Z_WDCx_HQ2QtFc-nsUqg','https://wx.qlogo.cn/mmopen/vi_32/rtPLq8qTGfK6uhrJ90gicSwCtJ3MwGicD1tXUvXHzHmctY42t7XJ39HMiaeIfah70m7nK518D2Lz2FJm4vDYa4X0w/132',2),(32,'名字长长的才能吊吊哒','odPbG5dvOERB5UOy6g4y-E2In3x4','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epRpCynbtOTxz6sjL7wbNktVXT8quQEfSQict53DibDXxnzjicianFgs6MdHfguwuIbLwicDKDwUMhibj8g/132',1),(33,'boommmmmm','odPbG5YjuNYH7PLLFXPL2lMDezIc','https://wx.qlogo.cn/mmopen/vi_32/8Mh5LMr5LbLamvh0rNrn23eHAhzuCpibyN3h9yibcymywibcLDyWhkOy83vuHiaTdmaAzMY9vvn05vW4vHOBXJSQxg/132',0),(34,'小拖油瓶','odPbG5W8eEn-xWudJPN0AG0rsvts','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIzrdNibIODKPEBsuHuaLTRicJ6JmUXJrxXARJ0bUTOABAbibWTmqYavkuicpNKhbn7s68smFhbF5he9g/132',2),(35,'花花','odPbG5QsRRU3-ZL0Xr-QeQNTXj6E','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibHguZ4ArHO5MiayTavYgrCVq07SxvfDdwpjepI4jDv1mPHqMzibHdxL3HdfNV9iaZLnGDZsD9J0c8A/132',2),(37,'陈英俊是我歌神','odPbG5TDsKyLvNZt27fiRDWqkV4A','https://wx.qlogo.cn/mmopen/vi_32/xrtjJQZF5APhxpxr9985OLw8lSHSZoyVhSiaXicicnTDrXZ2WJZlahWiaiceRRuXdfodWic0ticC0Seyrr9Bsb5Hbpw3A/132',2),(38,'雅遂宁','odPbG5Tloq38HKs5-sochgmiOClY','https://wx.qlogo.cn/mmopen/vi_32/WelVn2ibRUKuNIuAMGoV7FlPJV5ic9PEB3JkffAOCLWcb2gtmqr8W38OoJHQ66HhdfCBy3bVWwo5mianThY5ufQPg/132',2),(39,'青木阳','odPbG5fJz2x9Na1JZWR0x1vSeHHQ','https://wx.qlogo.cn/mmopen/vi_32/ibqKJo3hCA8SdcYubnEB5lk8J8jSL1s4S702NI8LicY5CAz20xbiaocuicwvSCoVttTz5a1RiciaUuZl0SCETUbHYtzA/132',2),(40,'名字什么的随便就好','odPbG5W2EFYVQ4AMAW5KE47pHg9I','https://wx.qlogo.cn/mmopen/vi_32/ib8nZNHmFD6XvQj9UicF9p9X1AaRibJ14NKlto0IZa3kIliagPTE7PcV3PtMTFibBF3OFD9shImMdgBhkXXTbK4WXAQ/132',2),(41,'芸芸众生朱门酒肉臭','odPbG5RUDtE6faaWh1s08aFgUe1Q','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIicaOLeymh1fFk6VsBklClbA0yTV0xCEoiamxo8QjCfc5eBe3sAmnxKhvBFU7adA3YmicNQ4PLXnoTw/132',1),(42,'iamguao','odPbG5cCLdUDxULR0ziAbCXj-9sU','https://wx.qlogo.cn/mmopen/vi_32/ONm5a6a5OUtCLsSVEwCTHO2vzqw1iaicrPSkphWpotvJeI6LmrLcPvLYlPbmpwOO9zlicZYrvu7twyTCAtXlhO6fA/132',2),(43,'但行好事','ob3935GrxJJYCi82v9Bs11OVJ0aM','https://wx.qlogo.cn/mmopen/vi_32/C6a90a5zQicgHdgnDwdej2Mre2pzXAMyEEHQYqXXBHl51US6Nu5dSMMD3XwnenAOCuhdhjv6eQrywNgX1pbmRJA/132',2),(44,'Sylvia ','odPbG5VJngfL4ULNqUD8vb9MMK2A','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLY9xp1nsR6qYVnWWpqgey3mXMKUiaBplvxre2EAic3kVCyEE1euHVmQCY6TqbiawavNaiatPHXBBy2QA/132',2),(45,'Henry Cai','odPbG5aGuIFVhuOudUUuR87VTjiE','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83er7X9X9wIX934rGeutXfBNztyC05XHEtfbr2RdsURuO16zPyGh33oGOHQiciaCkjWSPNOI6loia5B1Ew/132',1),(46,'Joran','odPbG5WxXLRVUHg7x70TM0XMDcLU','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ4v4EMTENDsBjAxlPG3giaBibsmTXWYLSSDpPBFLk0TLOzWPv5tZNckJJeqdVfBGdoftbgIrbeHL2A/132',1),(47,'钱晓春','odPbG5agOyWfpIDHTQBWz-991UL8','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epwwYxqhTLeNDUW9FjUwoSUE7Y3iaicoX7tR17un83UEedM25FWcWNX6eiaicXr5qcYMxpAa5Sm9z9LdA/132',1),(48,'邹菲','odPbG5WWNpZsS9XawK4BcOQZH50A','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eonq6ZCRaZX66PyibHkuQYbJdO8GMZLVVxmyGSot3qM3NC9WV2S5Aw7icHDqcNCosg2c5qmup8SFEjg/132',2),(49,'linda','odPbG5a75I4E8v7X2-5vtGStVng4','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIrFiaqfcQiaPveGEjI7mFWCub6yC9mGc0hz97G8xibhFwJC3jfNpH7sN3ET5n2aS4MiaDezq3fF1R85A/132',2),(50,'蜗牛','odPbG5a5R3cf-cumz1KXTXE01AAA','https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKiaWu2Oe8XWX8EjUeiaibdCnlRoahQRjiaLQzZWUtxdB1ukfq4FAZTT1FVRmyeoKaUUWZy2A8bVOxXibQ/132',1),(51,'黄铭刚','odPbG5U5hOVtJkTsvnj9stVM40Rw','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKvtG0bAIJaK0OUibRu9S3Rper1ptGhLQiaLuI1Y6n3qWHMnKwwjhJxNvgrK7qFNo1Bh9DpicUM5Kpuw/132',1),(52,'刘钦','odPbG5e9YfI9k2zmkzeviCObDnVs','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqZmEYIRh5lqe20lPPMBZwzfcCFwSJfYRXd87hUnmZqcWicZts4Zj7Al0dhzwA7Sjp9yOKsc4cy7CQ/132',2),(54,'A_唐彰','ob3935JqkJFp9JyZVxcSLx-qJvfk','https://wx.qlogo.cn/mmopen/vi_32/1znsUF88YEepJS9I58GGJ6og82pMqFegeruEaG66kxMIMibBobxk9sTcpEDEE5S2x7rkxicNRVAk3w4JXw4TMibPA/132',1),(55,'rdgztest_HEUVBY','ob3935AimZStp2M4nC0qQ3ytUvs4','',0),(56,'rdgztest_UOKVUY','ob3935MsLxlvnP49aNant82xnjaY','',0),(58,'神厨小柚文','odPbG5ai5CvsiJp4QGkpjPgMW7j4','https://wx.qlogo.cn/mmopen/vi_32/iaNIJJ0bKzoJG1s2m1hCl0aMbtDYE9iaNPt7p6bXm2VOk6LNMewhZNbkfZaMgPOzowqan0J9LJ4nC42zj84ojGUg/132',2),(59,'rdgztest_XPZADI','ob3935No2sQP1sDx2McUJQiV6GZc','',0),(60,'风猫','ob3935L8S3M_lW45HxLs9lNYk-OY','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKibRSh26v9yGLkHRicYrY8FodHKKeOxX9kJZ8tu0Tfkkq7eJMOfWTfh5CaWJEG1bwHmLOTbia8CEiajw/132',0),(65,'风猫','odPbG5R7ajE-lez7JJC_VC4oPfIg','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKWD0Utnpnv6WwzOsibs5h4tx4Oib9B2MGg7jHydUxDKgJqboU6lFHoHD8vErmU26qAQhqjTyKicROTA/132',0),(66,'吴何聪','odPbG5aADhAWWtPkW6wtDxaaBmyg','https://wx.qlogo.cn/mmopen/vi_32/v9ibOah7VwvIXhoYpjncibba6sqdoS2ic9G5mibzUZhsbBBSCHFbD742Q2rJakQXT1AG1acjFYR3XBrZUBwMiaXjZKw/132',1),(67,'玲','odPbG5S_EIrdRi1JbT0FvZqSUQLs','https://wx.qlogo.cn/mmopen/vi_32/rv7ZR8icWQAybQgmXm9hnWQ72OzibBlUYhKQWGq42KyODhiceDfNw8gXCTghMEWjibVf9OnX1NiamfEjhlMWZcDK2JQ/132',0),(69,'薛定谔的猫','odPbG5Z9FJq1QtAJxT_9ungAxgkY','https://wx.qlogo.cn/mmopen/vi_32/pEKBDcQGwHGCR3JRIrk9BTIY3O3g6icMYnIyjq60qXr4F4kc820icWibmJ94sfM5wjpjL4Vhl85dAnzTrqWhQzAIA/132',1),(70,'Cing.','oMn3y5DL2JTPLQ8kXJlv-n3P5X98','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epiaQjiaTuVJ6k2yup1ACiaSyLzib0MZWxXmsSiaGCfaI3cTr7z4mol9JPpDhYYk6rqPCq352CZhCSn8HA/132',1),(71,'墨染','oMn3y5D9ScFlYPmCj1Bdrwvhd8t4','https://wx.qlogo.cn/mmopen/vi_32/gFs9JEddYGJLRtfSiak6ibCvicegc7XSC6Tg6f0dO24wwSNADNkxUlr6I9ic5aZQBXno7qZQrGssIMMibUB4YqLF3Zg/132',2),(72,'.','oMn3y5Fi3iLSuYMB1lzq8aSJAKg4','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLzL5Bf9HpibQVep1twWARU9PuvSnzibamzA8ZDWg8b70bs1WIzTm3yO8gic1UGTa6WpDpNK3Tx3Xh1Q/132',1),(73,'宋宪文','oMn3y5ITFfUsgwAmDWWhpz3T526A','',0),(74,'神厨小柚文','oMn3y5LkG9T4uewgk_luy2vNLB9I','https://wx.qlogo.cn/mmopen/vi_32/cicCP1PpTO0qCZVK3lpjR9rDV1bnfSKxElu1gCaqibpiayhIfnEibJVfcyWAg9DS5GrM0AmvYQrVtbicQaY92cMf3Cg/132',2),(75,'平凡之路','','https://wx.qlogo.cn/mmopen/vi_32/um4Ihgic9sbz20F58SBuZPe0iaibEqMu8rleSgKAic0YBb5thOw6L4gZDViaOPpApzIvxZqFwoE9narOUegk6STXAPg/132',1),(76,'Y.','oMn3y5OSqYAwqMpYffNRnkQImgJI','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKLNfxqHmZA95kWvribRLgvbzvUBKXBdjZfxv5aDLMq2CUqC70dygkeMnJoDuyzHUB8nt00MDhOhBQ/132',1),(77,'Sir','oMn3y5BtB_1wu0huzskVaewz-gaA','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erIgS9UtJ1MRjg4Z7a9N9iaR5aJfc0b1ib3pcccSj3HWVN8ibMKWKor3ICTWytylHMC3bFnNicYXaaykw/132',1);
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_vote`
--

DROP TABLE IF EXISTS `tbl_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `votedesc` varchar(255) NOT NULL,
  `votetype` int(11) NOT NULL DEFAULT '1' COMMENT '投票类型 选项数',
  `starttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endtime` varchar(30) NOT NULL,
  `isanonymous` int(11) DEFAULT '1',
  `image` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL COMMENT '发起投票用户的id',
  `end` int(11) DEFAULT '1' COMMENT '结束 2 ||没结素 1',
  `vshow` int(1) DEFAULT '1' COMMENT '是否显示 2审核过 显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_vote`
--

LOCK TABLES `tbl_vote` WRITE;
/*!40000 ALTER TABLE `tbl_vote` DISABLE KEYS */;
INSERT INTO `tbl_vote` VALUES (78,'我想投票','颠三倒四的是颠三倒四',1,'2019-03-28 12:54:43','2019-03-28 09:01',1,'/images/uploader/pic_160.png',58,2,2),(80,'最美城市','随便',1,'2019-04-02 02:54:08','2019-04-01 21:01',1,'https://api.zyrs.xyz:10000/wx_graduation_voteforyou/uploadfile/img/[object Null]/1554119434242_tmp_224ad692fd5b0532d7c33b5924aef166.jpg',58,2,2),(85,'喜欢吃的东西','选择平时你喜欢吃的主食',1,'2019-04-28 06:41:25','2019-04-27 09:01',1,'https://api.zyrs.xyz:10000500',70,2,2),(86,'喜欢的运动','谈谈你平时最喜欢的运动吧',2,'2019-04-22 14:02:11','2019-04-30 21:01',2,'https://api.zyrs.xyz:10000/wx_graduation_voteforyou/uploadfile/img/[object Null]/1555816832127_tmp_23ccd2792caca7379fcd013c2d50dcfd.jpg',71,2,2),(111,'喜欢吃的东西','喜欢吃',1,'2019-04-28 06:41:25','2019-04-24 21:01',1,'https://api.zyrs.xyz:10000/wx_graduation_voteforyou/uploadfile/img/70/1555994101261_tmp_cfe2fa5ad71f5d3e0b0883ec640d7c4f.jpg',70,2,2),(112,'喜欢的爱好','业余时间喜欢做的事',1,'2019-05-19 06:42:00','2019-05-30 21:01',1,'/images/uploader/pic_160.png',70,2,2),(115,'喜欢看的电视节目','平时打开电视都看什么',1,'2019-05-15 06:05:33','2019-05-16 00:01',1,'/images/uploader/pic_160.png',70,2,2),(116,'喜欢吃的东西','选择平时主要的主食',2,'2019-05-17 15:48:36','2019-05-16 09:01',1,'/images/uploader/pic_160.png',70,2,2),(117,'喜欢的城市','选择在你心中最喜欢的城市',1,'2019-05-17 07:52:40','2019-06-17 00:01',1,'/images/uploader/pic_160.png',70,1,1),(127,'测试','我的测试',1,'2020-03-09 08:36:17','2020-03-10 00:01',1,'/images/uploader/pic_160.png',75,2,1),(128,'ces','cde',1,'2020-03-10 18:04:38','2020-03-12 00:01',1,'/images/uploader/pic_160.png',75,1,1),(129,'ce','esdf',3,'2020-03-12 16:35:32','2020-03-14 00:00',1,'/images/uploader/pic_160.png',75,1,1),(130,'1','2广泛大锅饭',1,'2020-03-15 01:04:09','2020-03-18 00:01',1,'/images/uploader/pic_160.png',75,1,1),(131,'12','221',1,'2020-04-12 01:21:25','2020-04-13 09:01',2,'/images/uploader/pic_160.png',75,1,1),(132,'123456','12345687',3,'2020-04-25 03:22:37','2020-04-26 09:04',2,'/images/uploader/pic_160.png',75,1,1);
/*!40000 ALTER TABLE `tbl_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_voteoption`
--

DROP TABLE IF EXISTS `tbl_voteoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_voteoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '选项id',
  `vdesc` varchar(255) NOT NULL COMMENT '选项描述',
  `voteid` int(11) NOT NULL COMMENT '选项对应的投票id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_voteoption`
--

LOCK TABLES `tbl_voteoption` WRITE;
/*!40000 ALTER TABLE `tbl_voteoption` DISABLE KEYS */;
INSERT INTO `tbl_voteoption` VALUES (186,'颠三倒四的',78),(187,'d s d s s d s',78),(188,'颠三倒四',79),(189,'颠三倒四',79),(190,'南京',80),(191,'北京',80),(192,'饭',81),(193,'面',81),(194,'南京',82),(195,'苏州',82),(196,'连云港',82),(197,'233',83),(198,'234',83),(199,'456',83),(200,'1',83),(201,'3',83),(202,'2',84),(203,'3',84),(204,'4',84),(205,'馒头',85),(206,'面条',85),(207,'米饭',85),(208,'篮球',86),(209,'足球',86),(210,'羽毛球',86),(211,'网球',86),(212,'乒乓球',86),(213,'篮球',86),(214,'足球',86),(215,'羽毛球',86),(216,'网球',86),(217,'乒乓球',86),(218,'游戏',88),(219,'运动',88),(220,'吃',88),(221,'詹姆斯',89),(222,'库里',89),(223,'韦德',89),(224,'您你',90),(225,'来咯',90),(226,'1',91),(227,'2',91),(228,'3',91),(229,'疼',92),(230,'岛',92),(231,'疼',92),(232,'岛',92),(233,'疼',92),(234,'岛',92),(235,'疼',95),(236,'岛',95),(237,'疼',95),(238,'岛',95),(239,'疼',95),(240,'岛',95),(241,'疼',98),(242,'岛',98),(243,'疼',98),(244,'岛',98),(245,'1',100),(246,'2',100),(247,'3',100),(248,'好',101),(249,'不好',101),(250,'数学',102),(251,'英语',102),(252,'1',103),(253,'1',103),(254,'唱歌',104),(255,'跳舞',104),(256,'水没烧开',105),(257,'煮的时间太少',105),(258,'5',106),(259,'5',106),(260,'5',107),(261,'5',107),(262,'5',107),(263,'5',107),(264,'小程序',109),(265,'app',109),(266,'网页',109),(267,'小程序',110),(268,'网页',110),(269,'app',110),(270,'面条',111),(271,'米饭',111),(272,'馒头',111),(273,'粥',111),(274,'旅游',112),(275,'摄影',112),(276,'看电影',112),(277,'111',113),(278,'111',113),(279,'1111',114),(280,'111111111',114),(281,'综艺',115),(282,'电视剧',115),(283,'电影',115),(284,'米饭',116),(285,'面条',116),(286,'馒头',116),(287,'南京',117),(288,'上海',117),(289,'北京',117),(290,'34343',118),(291,'54545',118),(292,'32323',119),(293,'32323',119),(294,'2323',120),(295,'4343',120),(296,'2323',120),(297,'3434',120),(298,'1111',121),(299,'222',121),(300,'333',121),(301,'1',122),(302,'2',122),(303,'3',122),(304,'1',123),(305,'2',123),(306,'3',123),(307,'1',124),(308,'2',124),(309,'3',124),(310,'1',118),(311,'2',118),(312,'3',118),(313,'123',119),(314,'123',119),(315,'1',120),(316,'2',120),(317,'1开心',121),(318,'2还好',121),(319,'qqq',122),(320,'www',122),(321,'qq',123),(322,'qq',123),(323,'1',124),(324,'1',124),(325,'1',124),(326,'1',124),(327,'111',125),(328,'222',125),(329,'fffwer',126),(330,'ffff',126),(331,'阿斯顿法国红酒看来',127),(332,'士大夫',127),(333,'sdf',128),(334,'ds',128),(335,'cdf',129),(336,'sd',129),(337,'csd',129),(338,'sdfd',129),(339,'sdf',129),(340,'22',130),(341,'33',130),(342,'12',131),(343,'21',131),(344,'1',132),(345,'2',132),(346,'2',132),(347,'4',132);
/*!40000 ALTER TABLE `tbl_voteoption` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-08 13:36:09
