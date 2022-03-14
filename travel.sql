/*
SQLyog Enterprise v12.08 (64 bit)
MySQL - 8.0.12 : Database - travel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`travel` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `travel`;

/*Table structure for table `banner` */

DROP TABLE IF EXISTS `banner`;

CREATE TABLE `banner` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `banner` */

insert  into `banner`(`bid`,`url`) values (1,'http://localhost:3000/imgs/01.jpg'),(2,'http://localhost:3000/imgs/02.jpg'),(3,'http://localhost:3000/imgs/03.jpg'),(4,'http://localhost:3000/imgs/04.jpg'),(5,'http://localhost:3000/imgs/05.jpg');

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '城市名称',
  `pid` int(11) DEFAULT NULL COMMENT '省id',
  PRIMARY KEY (`cid`),
  KEY `city_pro` (`pid`),
  CONSTRAINT `city_pro` FOREIGN KEY (`pid`) REFERENCES `provincial` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `city` */

insert  into `city`(`cid`,`city`,`pid`) values (1,'北京市',1),(2,'天津市',2),(3,'上海市',3),(4,'重庆市',4),(5,'石家庄市',5),(6,'唐山市',5),(7,'秦皇岛市',5),(8,'邯郸市',5),(9,'邢台市',5),(10,'保定市',5),(11,'张家口市',5),(12,'承德市',5),(13,'沧州市',5),(14,'廊坊市',5),(15,'衡水市',5),(16,'太原市',6),(17,'大同市',6),(18,'阳泉市',6),(19,'长治市',6),(20,'晋城市',6),(21,'朔州市',6),(22,'晋中市',6),(23,'运城市',6),(24,'忻州市',6),(25,'临汾市',6),(26,'吕梁市',6),(27,'台北市',7),(28,'高雄市',7),(29,'基隆市',7),(30,'台中市',7),(31,'台南市',7),(32,'新竹市',7),(33,'嘉义市',7),(34,'台北县',7),(35,'宜兰县',7),(36,'桃园县',7),(37,'新竹县',7),(38,'苗栗县',7),(39,'台中县',7),(40,'彰化县',7),(41,'南投县',7),(42,'云林县',7),(43,'嘉义县',7),(44,'台南县',7),(45,'高雄县',7),(46,'屏东县',7),(47,'澎湖县',7),(48,'台东县',7),(49,'花莲县',7),(50,'沈阳市',8),(51,'大连市',8),(52,'鞍山市',8),(53,'抚顺市',8),(54,'本溪市',8),(55,'丹东市',8),(56,'锦州市',8),(57,'营口市',8),(58,'阜新市',8),(59,'辽阳市',8),(60,'盘锦市',8),(61,'铁岭市',8),(62,'朝阳市',8),(63,'葫芦岛市',8),(64,'长春市',9),(65,'吉林市',9),(66,'四平市',9),(67,'辽源市',9),(68,'通化市',9),(69,'白山市',9),(70,'松原市',9),(71,'白城市',9),(72,'延边朝鲜族自治州',9),(73,'哈尔滨市',10),(74,'齐齐哈尔市',10),(75,'鹤 岗 市',10),(76,'双鸭山市',10),(77,'鸡 西 市',10),(78,'大 庆 市',10),(79,'伊 春 市',10),(80,'牡丹江市',10),(81,'佳木斯市',10),(82,'七台河市',10),(83,'黑 河 市',10),(84,'绥 化 市',10),(85,'大兴安岭地区',10),(86,'南京市',11),(87,'无锡市',11),(88,'徐州市',11),(89,'常州市',11),(90,'苏州市',11),(91,'南通市',11),(92,'连云港市',11),(93,'淮安市',11),(94,'盐城市',11),(95,'扬州市',11),(96,'镇江市',11),(97,'泰州市',11),(98,'宿迁市',11),(99,'杭州市',12),(100,'宁波市',12),(101,'温州市',12),(102,'嘉兴市',12),(103,'湖州市',12),(104,'绍兴市',12),(105,'金华市',12),(106,'衢州市',12),(107,'舟山市',12),(108,'台州市',12),(109,'丽水市',12),(110,'合肥市',13),(111,'芜湖市',13),(112,'蚌埠市',13),(113,'淮南市',13),(114,'马鞍山市',13),(115,'淮北市',13),(116,'铜陵市',13),(117,'安庆市',13),(118,'黄山市',13),(119,'滁州市',13),(120,'阜阳市',13),(121,'宿州市',13),(122,'巢湖市',13),(123,'六安市',13),(124,'亳州市',13),(125,'池州市',13),(126,'宣城市',13),(127,'福州市',14),(128,'厦门市',14),(129,'莆田市',14),(130,'三明市',14),(131,'泉州市',14),(132,'漳州市',14),(133,'南平市',14),(134,'龙岩市',14),(135,'宁德市',14),(136,'南昌市',15),(137,'景德镇市',15),(138,'萍乡市',15),(139,'九江市',15),(140,'新余市',15),(141,'鹰潭市',15),(142,'赣州市',15),(143,'吉安市',15),(144,'宜春市',15),(145,'抚州市',15),(146,'上饶市',15),(147,'济南市',16),(148,'青岛市',16),(149,'淄博市',16),(150,'枣庄市',16),(151,'东营市',16),(152,'烟台市',16),(153,'潍坊市',16),(154,'济宁市',16),(155,'泰安市',16),(156,'威海市',16),(157,'日照市',16),(158,'莱芜市',16),(159,'临沂市',16),(160,'德州市',16),(161,'聊城市',16),(162,'滨州市',16),(163,'菏泽市',16),(164,'郑州市',17),(165,'开封市',17),(166,'洛阳市',17),(167,'平顶山市',17),(168,'安阳市',17),(169,'鹤壁市',17),(170,'新乡市',17),(171,'焦作市',17),(172,'濮阳市',17),(173,'许昌市',17),(174,'漯河市',17),(175,'三门峡市',17),(176,'南阳市',17),(177,'商丘市',17),(178,'信阳市',17),(179,'周口市',17),(180,'驻马店市',17),(181,'济源市',17),(182,'武汉市',18),(183,'黄石市',18),(184,'十堰市',18),(185,'荆州市',18),(186,'宜昌市',18),(187,'襄樊市',18),(188,'鄂州市',18),(189,'荆门市',18),(190,'孝感市',18),(191,'黄冈市',18),(192,'咸宁市',18),(193,'随州市',18),(194,'仙桃市',18),(195,'天门市',18),(196,'潜江市',18),(197,'神农架林区',18),(198,'恩施土家族苗族自治州',18),(199,'长沙市',19),(200,'株洲市',19),(201,'湘潭市',19),(202,'衡阳市',19),(203,'邵阳市',19),(204,'岳阳市',19),(205,'常德市',19),(206,'张家界市',19),(207,'益阳市',19),(208,'郴州市',19),(209,'永州市',19),(210,'怀化市',19),(211,'娄底市',19),(212,'湘西土家族苗族自治州',19),(213,'广州市',20),(214,'深圳市',20),(215,'珠海市',20),(216,'汕头市',20),(217,'韶关市',20),(218,'佛山市',20),(219,'江门市',20),(220,'湛江市',20),(221,'茂名市',20),(222,'肇庆市',20),(223,'惠州市',20),(224,'梅州市',20),(225,'汕尾市',20),(226,'河源市',20),(227,'阳江市',20),(228,'清远市',20),(229,'东莞市',20),(230,'中山市',20),(231,'潮州市',20),(232,'揭阳市',20),(233,'云浮市',20),(234,'兰州市',21),(235,'金昌市',21),(236,'白银市',21),(237,'天水市',21),(238,'嘉峪关市',21),(239,'武威市',21),(240,'张掖市',21),(241,'平凉市',21),(242,'酒泉市',21),(243,'庆阳市',21),(244,'定西市',21),(245,'陇南市',21),(246,'临夏回族自治州',21),(247,'甘南藏族自治州',21),(248,'成都市',22),(249,'自贡市',22),(250,'攀枝花市',22),(251,'泸州市',22),(252,'德阳市',22),(253,'绵阳市',22),(254,'广元市',22),(255,'遂宁市',22),(256,'内江市',22),(257,'乐山市',22),(258,'南充市',22),(259,'眉山市',22),(260,'宜宾市',22),(261,'广安市',22),(262,'达州市',22),(263,'雅安市',22),(264,'巴中市',22),(265,'资阳市',22),(266,'阿坝藏族羌族自治州',22),(267,'甘孜藏族自治州',22),(268,'凉山彝族自治州',22),(269,'贵阳市',23),(270,'六盘水市',23),(271,'遵义市',23),(272,'安顺市',23),(273,'铜仁地区',23),(274,'毕节地区',23),(275,'黔西南布依族苗族自治州',23),(276,'黔东南苗族侗族自治州',23),(277,'黔南布依族苗族自治州',23),(278,'海口市',24),(279,'三亚市',24),(280,'五指山市',24),(281,'琼海市',24),(282,'儋州市',24),(283,'文昌市',24),(284,'万宁市',24),(285,'东方市',24),(286,'澄迈县',24),(287,'定安县',24),(288,'屯昌县',24),(289,'临高县',24),(290,'白沙黎族自治县',24),(291,'昌江黎族自治县',24),(292,'乐东黎族自治县',24),(293,'陵水黎族自治县',24),(294,'保亭黎族苗族自治县',24),(295,'琼中黎族苗族自治县',24),(296,'昆明市',25),(297,'曲靖市',25),(298,'玉溪市',25),(299,'保山市',25),(300,'昭通市',25),(301,'丽江市',25),(302,'思茅市',25),(303,'临沧市',25),(304,'文山壮族苗族自治州',25),(305,'红河哈尼族彝族自治州',25),(306,'西双版纳傣族自治州',25),(307,'楚雄彝族自治州',25),(308,'大理白族自治州',25),(309,'德宏傣族景颇族自治州',25),(310,'怒江傈傈族自治州',25),(311,'迪庆藏族自治州',25),(312,'西宁市',26),(313,'海东地区',26),(314,'海北藏族自治州',26),(315,'黄南藏族自治州',26),(316,'海南藏族自治州',26),(317,'果洛藏族自治州',26),(318,'玉树藏族自治州',26),(319,'海西蒙古族藏族自治州',26),(320,'西安市',27),(321,'铜川市',27),(322,'宝鸡市',27),(323,'咸阳市',27),(324,'渭南市',27),(325,'延安市',27),(326,'汉中市',27),(327,'榆林市',27),(328,'安康市',27),(329,'商洛市',27),(330,'南宁市',28),(331,'柳州市',28),(332,'桂林市',28),(333,'梧州市',28),(334,'北海市',28),(335,'防城港市',28),(336,'钦州市',28),(337,'贵港市',28),(338,'玉林市',28),(339,'百色市',28),(340,'贺州市',28),(341,'河池市',28),(342,'来宾市',28),(343,'崇左市',28),(344,'拉萨市',29),(345,'那曲地区',29),(346,'昌都地区',29),(347,'山南地区',29),(348,'日喀则地区',29),(349,'阿里地区',29),(350,'林芝地区',29),(351,'银川市',30),(352,'石嘴山市',30),(353,'吴忠市',30),(354,'固原市',30),(355,'中卫市',30),(356,'乌鲁木齐市',31),(357,'克拉玛依市',31),(358,'石河子市　',31),(359,'阿拉尔市',31),(360,'图木舒克市',31),(361,'五家渠市',31),(362,'吐鲁番市',31),(363,'阿克苏市',31),(364,'喀什市',31),(365,'哈密市',31),(366,'和田市',31),(367,'阿图什市',31),(368,'库尔勒市',31),(369,'昌吉市　',31),(370,'阜康市',31),(371,'米泉市',31),(372,'博乐市',31),(373,'伊宁市',31),(374,'奎屯市',31),(375,'塔城市',31),(376,'乌苏市',31),(377,'阿勒泰市',31),(378,'呼和浩特市',32),(379,'包头市',32),(380,'乌海市',32),(381,'赤峰市',32),(382,'通辽市',32),(383,'鄂尔多斯市',32),(384,'呼伦贝尔市',32),(385,'巴彦淖尔市',32),(386,'乌兰察布市',32),(387,'锡林郭勒盟',32),(388,'兴安盟',32),(389,'阿拉善盟',32),(390,'澳门特别行政区',33),(391,'香港特别行政区',34);

/*Table structure for table `jiudian` */

DROP TABLE IF EXISTS `jiudian`;

CREATE TABLE `jiudian` (
  `jid` int(11) NOT NULL AUTO_INCREMENT,
  `jtitle` varchar(250) NOT NULL COMMENT '标题',
  `jimg` varchar(300) NOT NULL COMMENT '图片',
  `price` int(10) NOT NULL COMMENT '价格',
  `address` varchar(250) NOT NULL COMMENT '地址',
  `jnr` longtext NOT NULL COMMENT '内容',
  `jieshao` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isShow` tinyint(1) NOT NULL COMMENT '是否显示',
  `jnum` int(11) NOT NULL COMMENT '轮播图个数',
  PRIMARY KEY (`jid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `jiudian` */

insert  into `jiudian`(`jid`,`jtitle`,`jimg`,`price`,`address`,`jnr`,`jieshao`,`isShow`,`jnum`) values (1,'飘HOME连锁酒店(北京王府井步行街店)','http://localhost:3000/jiudian/01.jpg',278,'天安门/王府井','<div class=\"m-hoteldesc_basic\"><p><li><b>开业</b>：2008</li></p><p><ul class=\"basicInfo clearfix\"><li><b>装修时间</b>：2019</li></ul></p><p><ul class=\"basicInfo clearfix\"><li><b>客房数</b>：200</li></ul></p><p><ul class=\"basicInfo clearfix\"><li><b>联系方式：</b>+86-10-57305888-0</li></ul></p><p><b>住宿预订提供方</b>：&nbsp;<span class=\"underscore\">资质备案</span></p><div class=\"basicImg\"><img src=\"https://ak-d.tripcdn.com/images/200l1e000001fktgp9737_R_490_318_R5_Q70.jpg\"></div><div class=\"transitionWrapper\"><div class=\"descriptionMark\"><div class=\"\"><p><span><br></span></p><p><span>飘HOME连锁酒店(北京王府井步行街店)位于市中心王府井地区，周边景点众多，靠近天安门广场、故宫，毗邻王府井步行街、新东方广场仅150米。酒店位置优越，交通便捷。</span></p><span>飘HOME连锁酒店(北京王府井步行街店)周围汇聚着北京最繁荣的购物、休闲娱乐、餐饮，酒店门口是东华门夜市汇聚各类特色小吃。无论您是去天安门广场看升旗还是去故宫博物院，皇城根遗址公园，本酒店将是您理想的温馨的住所，酒店房间装修温馨典雅，基础生活设施齐备。飘HOME全体员工期待您的光临。</span></div></div></div></div><div class=\"transitionWrapper\"><div class=\"descriptionMark\"><div class=\"\"><div class=\"m-policy_main\"><div class=\"m-policy_item\"><div class=\"m-hp-right\"><div class=\"m-hp-credit\"><span class=\"cardBox\" title=\"国内发行银联卡\"><div class=\"m-img \"><div style=\"text-align: center;\"></div></div></span><span class=\"cardBox\" title=\"微信支付\"><div class=\"m-img \"><div style=\"text-align: center;\"></div></div></span><span class=\"cardBox\" title=\"支付宝支付\"><div class=\"m-img \"></div></span></div></div></div></div></div></div></div>','飘HOME连锁酒店(北京王府井步行街店)位于市中心王府井地区，周边景点众多，靠近天安门广场、故宫，毗邻王府井步行街、新东方广场仅150米。酒店位置优越，交通便捷',0,5),(2,'云川酒店(北京国贸店)','http://localhost:3000/jiudian/02.jpg',376,'国贸CBD','<div class=\"m-hoteldesc_basic\"><p><ul class=\"basicInfo clearfix\"><li><b>开业</b>：2011</li></ul></p><p><ul class=\"basicInfo clearfix\"><li><b>装修时间</b>：2019</li></ul></p><p><ul class=\"basicInfo clearfix\"><li><b>客房数</b>：86</li></ul></p><p><ul class=\"basicInfo clearfix\"><li><b>联系方式</b>：+86-10-87774417</li></ul></p><p><b>住宿预订提供方</b>：&nbsp;<span class=\"underscore\">资质备案</span></p><div class=\"basicImg\"><img src=\"https://ak-d.tripcdn.com/images/200j1h000001hl8hl8B5A_R_490_318_R5_Q70.jpg\"></div></div><div class=\"transitionWrapper\"><div class=\"descriptionMark\"><div class=\"\"><p><span><br></span></p><p><span>云川酒店(北京国贸店)位于通惠河畔南岸、盛世龙源生态园区内，（四惠地铁站、四惠公交总站和四惠长途汽车站斜对面，）四惠公交枢纽总站是北京公交枢纽总站，车站到店步行需10分钟；紧邻北京火车站、四惠客运站；能快速通往四环路、京沈高速路、京通快速路。商圈：南靠大城国际中心和金长安商务中心，远洋天地，东靠九号温泉、国粹苑，爱蜂巢家居体验中心；高校：临近北京工业大学、北京第二外国语学院、中国传媒大学；距离欢乐谷打车20元，至天安门故宫方向，地铁一号线直达。毗邻CBD商业圈，公交直达华贸商务中心、世贸商务中心、SOHO现代城等；随着北京交通的快速发展，本店的高性价比也日益凸显，是您出差、旅游和探亲访友的首选下榻之地。本店全体员工欢迎您的光临！全体员工将以热忱、周到的服务，努力为您提供一个健康、舒适、快乐的空间，让您天天睡好觉！</span></p><p><b>快乐休闲生活</b>：瀚金佰九号温泉、普吉十号温泉、于志远休闲中心、尚艺墅KTV、红袖KTV 、爱蜂巢家居体验馆…</p><p><b>快乐美食体验</b>：梁家菜、阿一鲍鱼海鲜城、蜀锦亭、齐海鱼圣、银滩金汤、潮汕府 等等</p><p><b>畅游魅力京城</b>：欢乐谷游乐园、朝阳公园，打车20元即到 天安门、王府井、西单广场等一号线地铁直达</p><div class=\"m-policy_main\"><div class=\"m-policy_item\"><div class=\"m-hp-right\"><div class=\"m-hp-credit\"><span class=\"cardBox\" title=\"国内发行银联卡\"><div class=\"m-img \"><div style=\"text-align: center;\"></div></div></span><span class=\"cardBox\" title=\"微信支付\"><div class=\"m-img \"><div style=\"text-align: center;\"></div></div></span><span class=\"cardBox\" title=\"支付宝支付\"><div class=\"m-img \"></div></span></div></div></div></div></div></div></div>','云川酒店(北京国贸店)位于通惠河畔南岸、盛世龙源生态园区内，（四惠地铁站、四惠公交总站和四惠长途汽车站斜对面，）四惠公交枢纽总站是北京公交枢纽总站，车站到店步行需10分钟；紧邻北京火车站、四惠客运站；能快速通往四环路、京沈高速路、京通快速路。',0,3),(3,'北京华泰饭店','http://localhost:3000/jiudian/03.jpg',248,'劲松/潘家园','<div class=\"m-hoteldesc_basic\"><p><li><b>开业</b>：2002</li></p><p><ul class=\"basicInfo clearfix\"><li><b>装修时间：</b>2015</li></ul></p><p><ul class=\"basicInfo clearfix\"><li><b>客房数</b>：198</li></ul></p><p><ul class=\"basicInfo clearfix\"><li><b>联系方式</b>：+86-10-67716688-5100</li></ul></p><ul class=\"basicInfo clearfix\"><p><b>住宿预订提供方</b>：&nbsp;<span class=\"underscore\">资质备案</span></p><div class=\"basicImg\"><img src=\"https://ak-d.tripcdn.com/images/fd/hotel/g4/M08/5E/93/CggYHlXlaNiAcPWbAAxywFGTFxc262_R_490_318_R5_Q70.jpg\"></div><div class=\"transitionWrapper\"><p><span><br></span></p></div><div class=\"transitionWrapper\"><div class=\"descriptionMark\"><div class=\"\"><p><span>北京华泰饭店位于北京市朝阳区CBD中央商务区、三环劲松桥畔，毗邻天坛公园、欢乐谷。饭店周围临近王府井洋华堂等商场，购物便利；步行5分钟可至地铁10号线劲松站，可前往市内各景点，交通便捷。</span></p><p><span>饭店拥有不同类型的舒适客房，并配备中心餐厅、美容美发中心及现代化的康体、娱乐设施。不同规格的会议室拥有先进的商务配套设施，可举办各类会议活动。</span></p><span>北京华泰饭店将传统的建筑风格与现代文化内涵融合，使您感受中国传统文化的同时、享受舒适的住宿环境和无微不至的服务。</span></div></div></div></ul></div><div class=\"transitionWrapper\"><div class=\"descriptionMark\"><div class=\"\"><div class=\"m-policy_main\"><div class=\"m-policy_item\"><div class=\"m-hp-right\"><div class=\"m-hp-credit\"><span class=\"cardBox\" title=\"国内发行银联卡\"><div class=\"m-img \"><div style=\"text-align: center;\"></div></div></span><span class=\"cardBox\" title=\"微信支付\"><div class=\"m-img \"><div style=\"text-align: center;\"></div></div></span><span class=\"cardBox\" title=\"支付宝支付\"><div class=\"m-img \"></div></span></div></div></div></div></div></div></div>','北京华泰饭店位于北京市朝阳区CBD中央商务区、三环劲松桥畔，毗邻天坛公园、欢乐谷。饭店周围临近王府井洋华堂等商场，购物便利；步行5分钟可至地铁10号线劲松站，可前往市内各景点，交通便捷。',0,4),(4,'吉泰智上酒店(上海延长路地铁站店)','http://localhost:3000/jiudian/04.jpg',215,'大宁国际','<div class=\"m-hoteldesc_basic\"><p><ul class=\"basicInfo clearfix\"><li><b>开业</b>：2019</li></ul></p><p><ul class=\"basicInfo clearfix\"><li><b>客房数</b>：61</li></ul></p><p><ul class=\"basicInfo clearfix\"><li><b>联系方式</b>：+86-21-56660609</li></ul></p><p><b>住宿预订提供方</b>：&nbsp;<span class=\"underscore\">资质备案</span></p><div class=\"basicImg\"><img src=\"https://ak-d.tripcdn.com/images/20051e000001f7pql6C03_R_490_318_R5_Q70.jpg\"></div></div><div class=\"transitionWrapper\"><div class=\"descriptionMark\"><div class=\"\"><p><span><br></span></p><p><span>吉泰智上酒店(上海延长路地铁站店)坐落于上海市静安区沪太路807弄（近延长路口）交通便捷，距离地铁1号线延长路站步行约10分钟，距离上海虹桥站、国家会展中心、新国际博览中心约35分钟车程，周边有20多条公交线路，地理位置优越。</span></p><p>隔壁邻里即是新华文化创新科技园区，园内餐饮娱乐为一体，为您带来便捷的就餐服务。邻近大宁郁金香公园、大宁国际商业广场，以及上海第十人民综合医院。闲暇时逛逛公园购购物，选择全国各地美食，更是在忙碌生活中缓解压力的好去处。</p><p>酒店采用现代轻居风情设计，以原木、皮革的中性色调为主，用色彩的纯度传递细腻的质感。同时入住房间时乐享语音智能控制，智能马桶，一系列智能化服务为您带来的便利，精致的酒店环境，方便快捷的服务方式带给您一场全新的商务旅行体验！</p></div></div></div>','吉泰智上酒店(上海延长路地铁站店)坐落于上海市静安区沪太路807弄（近延长路口）交通便捷，距离地铁1号线延长路站步行约10分钟，距离上海虹桥站、国家会展中心、新国际博览中心约35分钟车程，周边有20多条公交线路，地理位置优越。',0,3),(5,'上海葉泽酒店','http://localhost:3000/jiudian/05.jpg',286,'佘山/松江大学城','<div class=\"m-hoteldesc_basic\"><p><li><b>开业</b>：2013</li></p><p><ul class=\"basicInfo clearfix\"><li><b>装修时间</b>：2019</li></ul></p><p><ul class=\"basicInfo clearfix\"><li><b>客房数：</b>21</li></ul></p><p><ul class=\"basicInfo clearfix\"><li><b>联系方式</b>：+86-21-37010666</li></ul></p><ul class=\"basicInfo clearfix\"><p><b>住宿预订提供方</b>：&nbsp;<span class=\"underscore\">资质备案</span></p><div class=\"basicImg\"><img src=\"https://ak-d.tripcdn.com/images/2002190000017zr5l2ACF_R_490_318_R5_Q70.jpg\"></div><div class=\"transitionWrapper\"><p><br></p></div><div class=\"transitionWrapper\"><p>上海葉泽酒店位于上海松江区谷阳北路，九号线松江新城地铁站旁，交通方便，环境优雅。</p></div><div class=\"transitionWrapper\"><div class=\"descriptionMark\"><div class=\"\"><span>上海葉泽酒店每个房间都有不同主题，房型设计与室内装修均出自知名设计师之手。这里拥有热情而周到的服务、美轮美奂的装修风格，这里提供的并不仅仅是单纯的硬件设施与服务，更是一种全新的都市生活体验，让每个人都能成为自己的生活“家”。</span></div></div></div></ul></div>','上海葉泽酒店位于上海松江区谷阳北路，九号线松江新城地铁站旁，交通方便，环境优雅。',0,3),(6,'广州锋·态度酒店','http://localhost:3000/jiudian/06.jpg',259,'火车站','<div class=\"m-hoteldesc_basic\"><p><li><b>开业</b>：2019</li></p><p><ul class=\"basicInfo clearfix\"><li><b>装修时间</b>：2021</li></ul></p><p><ul class=\"basicInfo clearfix\"><li><b>客房数</b>：78</li></ul></p><p><ul class=\"basicInfo clearfix\"><li><b>联系方式</b>：+86-20-86368685</li></ul></p><p><b>住宿预订提供方</b>：&nbsp;<span class=\"underscore\">资质备案</span></p><div class=\"basicImg\"><img src=\"https://ak-d.tripcdn.com/images/200m170000012ydfp6822_R_490_318_R5_Q70.jpg\"></div><div class=\"transitionWrapper\"><div class=\"descriptionMark\"><p><span><br></span></p><p><span>锋态度酒店系东呈国际旗下IP潮牌态度酒店，开创“态度酒店” 品类。品牌主张“有趣儿”、“有范儿”、“有态度”！为内心永远年轻的潮男潮女以及为生活奔波的商务男女，构建营造一个可办公、可休闲、可社交、可吃喝、可玩耍的潮流态度空间。酒店地理位置优越，交通便利，风景优美；广州火车站、流花车站、省客运站、市客运站近在咫尺。临近2号线和5号线（广州火车站D1出口390m，三元里970m）；皮具城、美博城、流花服装市场、白马服装市场等繁华商业中心环绕；周边有越秀公园、流花湖公园、雕塑公园、广州动物园、中山纪念堂、白云山等环境优美的自然或人文景区。可让你整个行程应有尽有，玩转大广州。超高端斯林百兰床垫让您尽情释放压力，体验舒适睡眠；首席陪玩官陪您玩转工作、快意生活；团队特别研发品牌专属的炭黑风三明治、锋味气泡水并提供高达40品种的超长待机早餐（7:30-13:00），风味路早、锋味速递和趣味小食品可以满足你随时随地用餐的需求。多场景的复合型公区将颠覆你对酒店以往的认知；这里是一个没有陌生人的世界，我们等你来玩儿！东呈国际集团旗下共有12大酒店品牌。2016年，东呈国际集团与万豪国际集团达成战略合作，联手在中国引进万枫酒店品牌。截至目前，集团旗下拥有超过2000家酒店（含筹建），客房数超16万，分布于中国、马来西亚、白俄罗斯、柬埔寨等国200多座城市，管理人员数量近6万，忠实会员超过2500万。东呈每天服务客人超过13万人次，每年超过5300万人次。</span></p></div></div></div>','锋态度酒店系东呈国际旗下IP潮牌态度酒店，开创“态度酒店” 品类。品牌主张“有趣儿”、“有范儿”、“有态度”！为内心永远年轻的潮男潮女以及为生活奔波的商务男女，构建营造一个可办公、可休闲、可社交、可吃喝、可玩耍的潮流态度空间。',0,3),(7,'艺星酒店(广州区庄地铁站店)','http://localhost:3000/jiudian/07.jpg',266,'环市东路','<div class=\"m-hoteldesc_basic\"><p><li><b>开业</b>：1991</li></p><p><ul class=\"basicInfo clearfix\"><li><b>装修时间</b>：2019</li></ul></p><p><ul class=\"basicInfo clearfix\"><li><b>客房数</b>：163</li></ul></p><p><ul class=\"basicInfo clearfix\"><li><b>联系方式</b>：+86-20-87782989</li></ul></p><p><b>住宿预订提供方</b>：&nbsp;<span class=\"underscore\">资质备案</span></p><div class=\"basicImg\"><img src=\"https://ak-d.tripcdn.com/images/0203u120008h1iv2z96A2_R_490_318_R5_Q70.jpg\"></div><div class=\"transitionWrapper\"><div class=\"descriptionMark\"><div class=\"\"><p><span><br></span></p><p><span>艺星酒店(广州区庄地铁站店)坐落于广州市越秀区东风东路与农林下路交叉口，处于繁华商圈，王府井百货，广百百货近在咫尺。宾馆周边交通便利，地铁5、6号线区庄站B2出口约3分钟步行，1、6号线东山口站步行约8分钟可至，距著名的中山医肿瘤医院、中山医眼科医院、中山医整形医院约5一10分钟路程。东山口区域有丰富的历史文化内涵，是广州旅游打卡胜地。</span></p><span>酒店拥有百余间客房，内有大型为住客免费的停车场，有能容纳20一150人的会议厅，店内还有7-11便利店、真功夫中式餐厅。宾馆坚持艺术特色，秉承殷勤好客之道，舒适自在的如家服务理念，为商旅宾客打造广州之家！</span></div></div></div></div>','艺星酒店(广州区庄地铁站店)坐落于广州市越秀区东风东路与农林下路交叉口，处于繁华商圈，王府井百货，广百百货近在咫尺。',0,3),(8,'普陀山平安里民宿','http://localhost:3000/jiudian/08.jpg',341,'普陀山','<div class=\"m-hoteldesc_basic\"><p><ul class=\"basicInfo clearfix\"><li><b>开业</b>：2021</li></ul></p><p><ul class=\"basicInfo clearfix\"><li><b>装修时间</b>：2021</li></ul></p><p><ul class=\"basicInfo clearfix\"><li><b>客房数：</b>20</li></ul></p><p><ul class=\"basicInfo clearfix\"><li><b>联系方式</b>：+86-15168063175</li></ul></p><p><b>住宿预订提供方</b>：&nbsp;<span class=\"underscore\">资质备案</span></p><div class=\"basicImg\"><img src=\"https://ak-d.tripcdn.com/images/0201u120008ed0y6o2B41_R_490_318_R5_Q70.jpg\"></div></div><div class=\"transitionWrapper\"><div class=\"descriptionMark\"><div class=\"\"><p><span><br></span></p><p><span>相信普陀山平安里民宿周到的服务和一流的设施，会让您在普陀山开展一段难忘的旅行。从酒店出发，至普陀山主寺庙普济寺步行约10分钟就到。</span></p><p>酒店对客房的装饰十分考究，每间设施齐全的客房都配备有空调。有饮水需求的旅客，酒店还为您提供了瓶装水。倘若您在忙碌的一天后想在自己的客房内放松，提供拖鞋、24小时热水和吹风机的客房浴室是不错的选择。</p><span>酒店休闲区提供了各类设施，您可以在这里舒缓身心压力。酒店为旅客提供接站服务，舒适到家。</span></div></div></div>','相信普陀山平安里民宿周到的服务和一流的设施，会让您在普陀山开展一段难忘的旅行。从酒店出发，至普陀山主寺庙普济寺步行约10分钟就到。',0,3);

/*Table structure for table `provincial` */

DROP TABLE IF EXISTS `provincial`;

CREATE TABLE `provincial` (
  `pid` int(11) NOT NULL,
  `provincial` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `provincial` */

insert  into `provincial`(`pid`,`provincial`) values (1,'北京市'),(2,'天津市'),(3,'上海市'),(4,'重庆市'),(5,'河北省'),(6,'山西省'),(7,'台湾省'),(8,'辽宁省'),(9,'吉林省'),(10,'黑龙江省'),(11,'江苏省'),(12,'浙江省'),(13,'安徽省'),(14,'福建省'),(15,'江西省'),(16,'山东省'),(17,'河南省'),(18,'湖北省'),(19,'湖南省'),(20,'广东省'),(21,'甘肃省'),(22,'四川省'),(23,'贵州省'),(24,'海南省'),(25,'云南省'),(26,'青海省'),(27,'陕西省'),(28,'广西壮族自治区'),(29,'西藏自治区'),(30,'宁夏回族自治区'),(31,'新疆维吾尔自治区'),(32,'内蒙古自治区'),(33,'澳门特别行政区'),(34,'香港特别行政区');

/*Table structure for table `scenic` */

DROP TABLE IF EXISTS `scenic`;

CREATE TABLE `scenic` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL COMMENT '标题',
  `image` varchar(300) NOT NULL COMMENT '图片',
  `introduce` longtext NOT NULL COMMENT '介绍',
  `pid` int(11) NOT NULL COMMENT '省id',
  `cid` int(11) NOT NULL COMMENT '市id',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `scenic` */

insert  into `scenic`(`sid`,`title`,`image`,`introduce`,`pid`,`cid`) values (1,'故宫','http://localhost:3000/scenic/01.jpg','绝大多数刚来北京的游客，都会把故宫当作必去之处。故宫又称紫禁城，是明、清两代的皇宫，也是古老中国的标志和象征。当你置身于气派规整的高墙深院，能真真切切地感受到它曾经的荣耀。悠久的历史给这里留下了大规模的珍贵建筑和无数文物，也成为今天游玩故宫的主要看点。',1,1),(2,'八达岭长城','http://localhost:3000/scenic/02.jpg','八达岭长城号称天下九塞之一，风光集巍峨险峻、秀丽苍翠于一体，是明长城景色中的精华。“不到长城非好汉”，很多国人都以这里为登临长城的主要选择。\r\n八达岭长城关城为东窄西宽的梯形，有东西二门。东门额题“居庸外镇”，西门额题“北门锁钥”。关城向北延伸的长城是北长城，有敌楼12处。关城以南是南长城，有敌楼7处。南长城相比北长城的游客人数较少，如果时间充裕，可以先去走南长城，再走北长城。',1,1),(3,'隆兴寺','http://localhost:3000/scenic/03.jpg','隆兴寺又名大佛寺，位于石家庄市正定县县城内，是前来石家庄旅游不能错过的景点。寺院始建于隋朝，又经历代修葺，现为全国保存年代最久远、规模最大、保存程度最完好的寺院之一。隆兴寺如今的名声并不是很大，但历史上却是备受皇家重视的寺院。这里有宋太祖赵匡胤亲自下令修筑的菩萨像、清朝历代皇帝的足迹和手书碑文、牌匾等，地位极高，很多香客都会在这里拜佛祈福。寺内还可以看到众多珍贵的文物珍宝、宋金时期古老风格的建筑等，各具特色又都十分珍贵，都可以一一参观。',5,5),(4,'赵州桥','http://localhost:3000/scenic/04.jpg','又称安济桥，俗名大石桥，在河北赵县城南2.5公里处的洨河上，距石家庄市区仅45公里，是全国重点文物保护单位。',5,5),(5,'石家庄市动物园','http://localhost:3000/scenic/05.jpg','石家庄市动物园地处太行山系余脉与华北平原的交接地带，属低山丘陵区。东距石家庄市区中心较近，南邻石太高速公路，西依白鹿泉郄庄林场，北临307国道，与抱犊寨、蟠龙湖、天桂山、五岳寨等形成省会西部旅游带。\r\n园内景观布局采用非对称式，以山势起伏的隐风山为背景，把自然景色与人工建筑巧妙地结合在一起。园区根据地形分为火烈鸟馆、湿地禽鸟动物区、儿童动物园、鸟语林区、高山动物区等18个功能区，场馆区主要有长颈鹿馆、大象馆、两栖爬行馆、水生馆、熊猫馆等9大展馆。',5,5),(6,'清东陵','http://localhost:3000/scenic/06.jpg','清东陵是清朝的帝王后妃陵墓群，位于遵化市西北部的昌瑞山下，离遵化市区约30公里，是中国现存规模较大、体系较为完整的皇陵建筑群，被列入了世界文化遗产名录。\r\n这里埋葬着顺治、康熙、乾隆、咸丰、同治皇帝及慈禧太后、香妃等共161人。传闻当年顺治皇帝到这一带打猎被其灵山秀水所震撼，后来在这块宝地建成了气势恢宏的清东陵。但清朝灭亡后曾发生过盗宝案，清东陵内的大量珍宝已经不知去向，因此能看到的文物并不多。',5,6),(7,'迁西县凤凰山旅游区','http://localhost:3000/scenic/07.jpg','迁西县凤凰山旅游区位于迁西县东南部新集镇境内，以山体形状如展翅欲飞的凤凰而得名，旅游区以吉祥文化为中心，开发出康养度假、民俗体验、山地运动休闲娱乐等一系列旅游产品，景区推出的高山秋千、高空滑索、旱滑、丛林水滑漂、步步惊心等娱乐项目，将带领全新的山地旅游新体验。',5,6),(8,'运河唐人街不夜城','http://localhost:3000/scenic/08.jpg','唐人街不夜城位于唐山市丰南区惠丰湖南侧、唐津运河两岸，全长近1000米。建筑外形仿明清古建筑，结合现代功能，将唐山传统的戏曲文化、茶文化和饮食文化融入其中，是休闲娱乐、购物为主的大型原始复古商业街，吸引着全国各地的人流，聚集人气，以景繁商。',5,6),(9,'滦州古城','http://localhost:3000/scenic/09.jpg','滦州古城位于唐山市滦县滦州镇，是华北一带著名的古城景区。如今的滦州古城是在原址上重建而来，古色古香，景色优雅，是拍照观景的好去处。古城内店铺和活动都很多，非常热闹，游客来此可以漫步古香街巷、逛特色小店、品尝美食、观看表演，游玩内容丰富。\r\n滦州古城面积不大，从入口的东城门到最西侧的大牌坊，长约1公里，宽约几百米。来到古城后步行即可，大约半天时间为宜。游玩古城可以绕着城内的水道-青龙河漫步，可以遍览古城美景，古城内有电瓶车可以代步，电瓶车为私人运营，价格需要提前问好。也可以乘船环游，上船的地点位于古城东门旁的紫金塔处。',5,6),(10,'山海关','http://localhost:3000/scenic/10.jpg','山海关，又称天下第一关，位于秦皇岛市东北部山海关区。山海关关城始建于明代，北依燕山，东临渤海，是一座防御体系完整的城关，古代重要的军事要塞。古时常说的“关内、关外”，既是以山海关为界。山海关是明长城东部重要的关隘之一，与西段的嘉峪关遥相呼应，互为首尾，有“天下第一关”之美誉。',5,7),(11,'秦皇岛野生动物园','http://localhost:3000/scenic/11.jpg','秦皇岛野生动物园位于北戴河区北侧的海边，是秦皇岛市较大的野生动物园。园内有100多种4000余头动物，而且整个动物园被树木覆盖，环境优美，是周末放松游玩和带领小朋友看动物的好去处。',5,7),(12,'老龙头','http://localhost:3000/scenic/12.jpg','老龙头位于山海关东南部渤海之滨，距离山海关景区4公里，是明长城的东起点。长城像一条巨龙，横亘在华夏大地之上，东端在山海关城南直插入海，犹如龙头高昂，因此称之为“老龙头”。老龙头由入海石城、海神庙、靖卤台、南海口关、宁海城和澄海楼组成，由明代抗倭英雄带兵修建而成。老龙头深入海中，空气清新，沙软潮平，是海上观日出的好去处。',5,7);

/*Table structure for table `tuijian` */

DROP TABLE IF EXISTS `tuijian`;

CREATE TABLE `tuijian` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `ttitle` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `timg` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `tnr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tuijian` */

insert  into `tuijian`(`tid`,`ttitle`,`timg`,`tnr`) values (1,'上海2日1晚自由行','http://localhost:3000/tuijian/01.jpg','<p><span>【游】在海洋公园：</span><br><br><span>公园运营时间：（如有变化，请以景区公布为准）</span><br><span>1、周一至周五：开园时间9:30，闭园时间17:00</span><br><span>2、周六及周日：开园时间9:00，闭园时间18:00</span><br><br><span>推荐游玩顺序：</span><br><span>园区入口---安检及检票---天幕影院---北极桥---珊瑚水母馆---海豚过山车---海豚剧场（请在入园时看好表演时间哦）---花车巡游---时空缆车（建议坐往返程）---火山鲸鲨馆---海底世界馆---海洋珍宝商店---童趣乐园---梦幻甜品屋---南极桥---冰山北极馆---圣诞集市---虎鲸剧场---极地小镇---海兽探秘馆---人鱼宝藏---结束一天的美好之旅</span></p>'),(2,'江苏无锡2日1晚跟团游','http://localhost:3000/tuijian/02.jpg','<p><span>【推荐活动】：</span><br><font color=\"#ff0000\">【抄经】</font><br><span>佛经里说：书写经书一行半句，得静气养身。静下来，写一段话，看一本书，抄一页经。抄写经书可以净化心灵，所以抄经是一种修行，籍着抄经也能实践。</span><br><font color=\"#ff0000\">【汉服体验】</font><br><span>在拈花湾着一身古风汉服，感受春风煦暖，花香四溢，组织一场汉服游吧!无论是闺蜜、情侣、亲子家庭都值得拥有，在小镇留下你们美丽的笑靥和温暖的时光吧。</span><br><font color=\"#ff0000\">【茶道】</font><br><span>茶艺似禅，禅茶一味。通过沏茶、赏茶、闻茶、饮茶、增进友谊，美心修德，学习礼法，领略传统美德，是很有益的一种和美仪式。</span></p>'),(3,'安徽黄山+宏村3日2晚跟团游','http://localhost:3000/tuijian/03.jpg','<p><span>【温馨提示】：<br><br>山顶游览路线较多，您可以根据自身体力自行选择游览路线，导游会在天海景区集合。</span><br><br><span>【线路一】：（经典景点）酒店-丹霞峰-途径飞来石-光明顶-天海</span><br><span>【线路二】：（精华景点，对体力有一定要求）酒店-丹霞峰-西海大峡谷（远眺飞来石）-天海</span><br><br><span>☆西海大峡谷会因天气原因适时封闭，每年开放时间：4月1日-11月30日（具体以景区通知为准）</span></p>'),(4,'丽水3日2晚跟团游','http://localhost:3000/tuijian/04.jpg','<h5>【交通】</h5>在万源路闵虹路路口(中庚漫游城门口，近南方商城）临时停靠点集合，发车前往丽水&nbsp;<p><font color=\"#ff0000\">温馨提示：若遇早高峰，路上拥堵，造成到此集合点时间延后，感谢您的谅解，请您静心等待大巴的到来！</font></p>【景点】<p>小赤壁位于仙都景区的入口处，临溪一面绝壁陡峭，红白相间，犹如焰火烧过，故称小赤壁。绝壁陡峭间有一条栈道，东西横亘数里，石壁下部呈赤红色，小赤壁一带，溪中有岛，岛中有湖，好像蓬莱仙境一般。</p>');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`uid`,`username`,`password`) values (2,'游客1','123456'),(3,'123','123456'),(4,'222','111111'),(5,'123456','123456');

/*Table structure for table `user_jd` */

DROP TABLE IF EXISTS `user_jd`;

CREATE TABLE `user_jd` (
  `uid` int(11) NOT NULL,
  `jid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`jid`),
  KEY `jiud_j` (`jid`),
  CONSTRAINT `jiud_j` FOREIGN KEY (`jid`) REFERENCES `jiudian` (`jid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_u` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_jd` */

insert  into `user_jd`(`uid`,`jid`) values (3,1),(2,5),(3,5),(3,6),(3,7),(3,8);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
