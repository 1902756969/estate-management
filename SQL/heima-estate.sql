/*
SQLyog Ultimate v8.32 
MySQL - 5.5.27 : Database - heima-estate
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`heima-estate` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `heima-estate`;

/*Table structure for table `tb_activity` */

DROP TABLE IF EXISTS `tb_activity`;

CREATE TABLE `tb_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `community_name` varchar(50) DEFAULT NULL COMMENT '所属小区名称',
  `community_id` int(11) DEFAULT NULL COMMENT '所属小区ID',
  `title` varchar(100) DEFAULT NULL COMMENT '活动标题',
  `address` varchar(200) DEFAULT NULL COMMENT '活动地点',
  `organizer` varchar(100) DEFAULT NULL COMMENT '举办单位',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动截止时间',
  `status` char(1) DEFAULT '0' COMMENT '状态:0-活动未开始（默认），1-活动进行中，2-活动已结束',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动表';

/*Data for the table `tb_activity` */

/*Table structure for table `tb_building` */

DROP TABLE IF EXISTS `tb_building`;

CREATE TABLE `tb_building` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '楼栋ID',
  `community_name` varchar(50) DEFAULT NULL COMMENT '所属小区名称',
  `community_id` int(11) DEFAULT NULL COMMENT '所属小区ID',
  `name` varchar(50) DEFAULT NULL COMMENT '栋数名称',
  `total_households` int(11) DEFAULT NULL COMMENT '总户数',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='楼栋表';

/*Data for the table `tb_building` */

/*Table structure for table `tb_car` */

DROP TABLE IF EXISTS `tb_car`;

CREATE TABLE `tb_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '车辆ID',
  `picture` varchar(100) DEFAULT NULL COMMENT '车辆照片',
  `owner_id` int(11) DEFAULT NULL COMMENT '所属成员（业主）',
  `color` varchar(10) DEFAULT NULL COMMENT '车辆颜色',
  `car_number` varchar(20) DEFAULT NULL COMMENT '车牌号',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆表';

/*Data for the table `tb_car` */

/*Table structure for table `tb_charge_detail` */

DROP TABLE IF EXISTS `tb_charge_detail`;

CREATE TABLE `tb_charge_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收费明细ID',
  `community_id` int(11) DEFAULT NULL COMMENT '所属小区ID',
  `community_name` varchar(50) DEFAULT NULL COMMENT '所属小区名称',
  `charge_item_id` int(11) DEFAULT NULL COMMENT '收费项目ID',
  `charge_item_name` varchar(50) DEFAULT NULL COMMENT '收费项目名称',
  `contractor` varchar(50) DEFAULT NULL COMMENT '承办人名称',
  `telephone` int(20) DEFAULT NULL COMMENT '承办人联系电话',
  `pay_money` int(11) DEFAULT NULL COMMENT '应收金额(￥)，单位分',
  `actual_money` int(11) DEFAULT NULL COMMENT '实收金额(￥)，单位分',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '缴费时间',
  `status` char(1) DEFAULT '0' COMMENT '状态：0-生效中（默认），1-已过期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收费名细表';

/*Data for the table `tb_charge_detail` */

/*Table structure for table `tb_charge_item` */

DROP TABLE IF EXISTS `tb_charge_item`;

CREATE TABLE `tb_charge_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收费项目ID',
  `community_id` int(11) DEFAULT NULL COMMENT '所属小区ID',
  `community_name` varchar(50) DEFAULT NULL COMMENT '所属小区名称',
  `code` varchar(20) DEFAULT NULL COMMENT '收费编号',
  `name` varchar(50) DEFAULT NULL COMMENT '项目名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `money` int(11) DEFAULT NULL COMMENT '项目收费金额（年），单位分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收费项目表';

/*Data for the table `tb_charge_item` */

/*Table structure for table `tb_community` */

DROP TABLE IF EXISTS `tb_community`;

CREATE TABLE `tb_community` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '小区id',
  `code` varchar(20) NOT NULL COMMENT '小区编号',
  `name` varchar(50) NOT NULL COMMENT '小区名称',
  `address` varchar(200) DEFAULT NULL COMMENT '坐落地址',
  `area` double DEFAULT NULL COMMENT '占地面积（m2）',
  `total_buildings` int(11) DEFAULT NULL COMMENT '总栋数',
  `total_households` int(11) DEFAULT NULL COMMENT '总户数',
  `greening_rate` int(11) DEFAULT NULL COMMENT '绿化率（%）',
  `thumbnail` varchar(200) DEFAULT NULL COMMENT '缩略图',
  `developer` varchar(100) DEFAULT NULL COMMENT '开发商名称',
  `estate_company` varchar(100) DEFAULT NULL COMMENT '物业公司名称',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `status` char(1) DEFAULT '0' COMMENT '状态:0-启用（默认），1-不启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='小区表';

/*Data for the table `tb_community` */

insert  into `tb_community`(`id`,`code`,`name`,`address`,`area`,`total_buildings`,`total_households`,`greening_rate`,`thumbnail`,`developer`,`estate_company`,`create_time`,`update_time`,`status`) values (1,'HX19960101001','化纤小区','历城区花园路5号',22000,66,2432,30,'/fileupload/d2cea885-a986-463a-97da-7073c9e6fbf6.jpg','济南齐鲁化纤集团有限责任公司','上海新长宁集团新华物业有限公司','2020-12-13 09:12:04','2020-12-13 09:26:12','0');
insert  into `tb_community`(`id`,`code`,`name`,`address`,`area`,`total_buildings`,`total_households`,`greening_rate`,`thumbnail`,`developer`,`estate_company`,`create_time`,`update_time`,`status`) values (2,'DH19960101002','东风小区','历城区花园路6号',33000,50,2222,40,'/images/dongfeng.jpg','济南齐鲁化纤集团有限责任公司','上海新长宁集团新华物业有限公司','2020-12-13 09:24:42','2020-12-13 09:26:14','0');
insert  into `tb_community`(`id`,`code`,`name`,`address`,`area`,`total_buildings`,`total_households`,`greening_rate`,`thumbnail`,`developer`,`estate_company`,`create_time`,`update_time`,`status`) values (3,'BH19960101003','百花小区','历城区花园路7号',44444,88,3000,50,'/fileupload/e6daae7d-17f6-4053-9e44-81cf5a4c5d82.jpg','济南齐鲁化纤集团有限责任公司','上海新长宁集团新华物业有限公司','2020-12-13 09:24:42','2020-12-13 09:24:42','0');
insert  into `tb_community`(`id`,`code`,`name`,`address`,`area`,`total_buildings`,`total_households`,`greening_rate`,`thumbnail`,`developer`,`estate_company`,`create_time`,`update_time`,`status`) values (28,'JYHF20160101001','金域华府','齐鲁软件园',66666,66,2195,35,'/fileupload/ec760e4a-1e1e-479a-9d5d-8c8671069a58.jpg','万达地产集团','万科物业','2020-12-14 19:29:48',NULL,'0');

/*Table structure for table `tb_complaint` */

DROP TABLE IF EXISTS `tb_complaint`;

CREATE TABLE `tb_complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉ID',
  `community_name` varchar(50) DEFAULT NULL COMMENT '所属小区名称',
  `community_id` int(11) DEFAULT NULL COMMENT '所属小区ID',
  `owner_id` int(11) DEFAULT NULL COMMENT '投诉人员（业主）ID',
  `owner_name` varchar(40) DEFAULT NULL COMMENT '投诉人员（业主）名称',
  `description` varchar(500) DEFAULT NULL COMMENT '投诉具体描述',
  `reason` varchar(100) DEFAULT NULL COMMENT '投诉事由',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `status` char(1) DEFAULT '0' COMMENT '状态：0-未受理，1-已受理（默认），2-已处理完毕',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投诉表';

/*Data for the table `tb_complaint` */

/*Table structure for table `tb_device` */

DROP TABLE IF EXISTS `tb_device`;

CREATE TABLE `tb_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设备ID',
  `community_name` varchar(50) DEFAULT NULL COMMENT '所属小区名称',
  `community_id` int(11) DEFAULT NULL COMMENT '所属小区ID',
  `code` varchar(20) DEFAULT NULL COMMENT '设备编号',
  `name` varchar(50) DEFAULT NULL COMMENT '设备名称',
  `brand` varchar(40) DEFAULT NULL COMMENT '设备品牌',
  `unit_price` int(11) DEFAULT NULL COMMENT '购买单价(￥)，单位分',
  `num` int(11) DEFAULT NULL COMMENT '购买数量',
  `expected_useful_life` int(11) DEFAULT NULL COMMENT '预计使用年限(年)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `purchase_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '购买日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备表';

/*Data for the table `tb_device` */

/*Table structure for table `tb_estate_manager` */

DROP TABLE IF EXISTS `tb_estate_manager`;

CREATE TABLE `tb_estate_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物业管理人员ID',
  `community_name` varchar(50) DEFAULT NULL COMMENT '所属小区名称',
  `community_id` int(11) DEFAULT NULL COMMENT '所属小区ID',
  `login_name` varchar(20) DEFAULT NULL COMMENT '登录名:登录时使用的名称',
  `name` varchar(50) DEFAULT NULL COMMENT '真实名称',
  `password` varchar(60) DEFAULT NULL COMMENT '密码',
  `telephone` int(20) DEFAULT NULL COMMENT '手机',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `role_id` int(11) DEFAULT '0' COMMENT '角色ID：0-普通用户（默认0），1-管理员用户',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='物业管理人员表';

/*Data for the table `tb_estate_manager` */

insert  into `tb_estate_manager`(`id`,`community_name`,`community_id`,`login_name`,`name`,`password`,`telephone`,`email`,`role_id`,`create_time`,`update_time`) values (1,'化纤小区',1,'15900000000','张三','123456',2147483647,'123@163.com',0,'2020-12-14 10:17:49','2020-12-14 10:17:49');
insert  into `tb_estate_manager`(`id`,`community_name`,`community_id`,`login_name`,`name`,`password`,`telephone`,`email`,`role_id`,`create_time`,`update_time`) values (2,'百花小区',3,'15911111111','李四','123456',2147483647,'456@163.com',0,'2020-12-14 10:17:55','2020-12-14 10:17:55');
insert  into `tb_estate_manager`(`id`,`community_name`,`community_id`,`login_name`,`name`,`password`,`telephone`,`email`,`role_id`,`create_time`,`update_time`) values (3,'东风小区',2,'15922222222','王五','123456',2147483647,'789@163.com',0,'2020-12-14 10:18:03','2020-12-14 10:18:03');

/*Table structure for table `tb_house` */

DROP TABLE IF EXISTS `tb_house`;

CREATE TABLE `tb_house` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '房屋ID',
  `community_name` varchar(50) DEFAULT NULL COMMENT '所属小区名称',
  `community_id` int(11) DEFAULT NULL COMMENT '所属小区ID',
  `building_name` varchar(50) DEFAULT NULL COMMENT '所属栋数名称',
  `building_id` int(11) DEFAULT NULL COMMENT '所属栋数ID',
  `code` varchar(50) DEFAULT NULL COMMENT '房产编码',
  `name` varchar(100) DEFAULT NULL COMMENT '房产名称',
  `owner_id` int(11) DEFAULT NULL COMMENT '户主（业主）ID',
  `owner_name` varchar(50) DEFAULT NULL COMMENT '户主（业主）名称',
  `telephone` int(20) DEFAULT NULL COMMENT '联系方式',
  `room_num` int(11) DEFAULT NULL COMMENT '房间数',
  `unit` int(2) DEFAULT NULL COMMENT '单元',
  `floor` int(3) DEFAULT NULL COMMENT '楼层',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `live_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入住时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房屋表';

/*Data for the table `tb_house` */

/*Table structure for table `tb_letter` */

DROP TABLE IF EXISTS `tb_letter`;

CREATE TABLE `tb_letter` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '信件ID',
  `community_id` int(11) DEFAULT NULL COMMENT '所属小区ID',
  `community_name` varchar(50) DEFAULT NULL COMMENT '所属小区名称',
  `owner_id` int(11) DEFAULT NULL COMMENT '信件发送者（业主）ID',
  `owner_name` varchar(50) DEFAULT NULL COMMENT '信件发送者（业主）名称',
  `origin` char(1) DEFAULT '0' COMMENT '信件来源：0-信箱（默认），1-邮件，2-微信，3-公众号，4-app,5-pc',
  `title` varchar(100) DEFAULT NULL COMMENT '信件标题',
  `content` varchar(2000) DEFAULT NULL COMMENT '信箱内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `status` char(1) DEFAULT '0' COMMENT '状态:0-未读（默认），1-已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信件表';

/*Data for the table `tb_letter` */

/*Table structure for table `tb_owner` */

DROP TABLE IF EXISTS `tb_owner`;

CREATE TABLE `tb_owner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '业主ID',
  `community_id` int(11) DEFAULT NULL COMMENT '所属小区',
  `house_id` int(11) DEFAULT NULL COMMENT '所属房产',
  `name` varchar(50) DEFAULT NULL COMMENT '成员名称',
  `picture` varchar(100) DEFAULT NULL COMMENT '成员照片',
  `idcard` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `telephone` int(20) DEFAULT NULL COMMENT '联系方式',
  `profession` varchar(20) DEFAULT NULL COMMENT '职业',
  `sex` char(1) DEFAULT '0' COMMENT '性别:0-男（默认），1-女',
  `type` char(1) DEFAULT '0' COMMENT '类型:0-房主（默认），1-租客',
  `remark` varchar(200) DEFAULT '无' COMMENT '备注（默认无）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `birthday` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '出生日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业主表';

/*Data for the table `tb_owner` */

/*Table structure for table `tb_parking` */

DROP TABLE IF EXISTS `tb_parking`;

CREATE TABLE `tb_parking` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '车位ID',
  `community_name` varchar(50) DEFAULT NULL COMMENT '所属小区名称',
  `community_id` int(11) DEFAULT NULL COMMENT '所属小区ID',
  `picture` varchar(100) DEFAULT NULL COMMENT '车位图片',
  `code` varchar(20) DEFAULT NULL COMMENT '车位编号',
  `name` varchar(50) DEFAULT NULL COMMENT '车位名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车位表';

/*Data for the table `tb_parking` */

/*Table structure for table `tb_parking_use` */

DROP TABLE IF EXISTS `tb_parking_use`;

CREATE TABLE `tb_parking_use` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '车位使用ID',
  `community_name` varchar(50) DEFAULT NULL COMMENT '所属小区名称',
  `community_id` int(11) DEFAULT NULL COMMENT '所属小区ID',
  `code` varchar(20) DEFAULT NULL COMMENT '车位编号',
  `car_number` varchar(20) DEFAULT NULL COMMENT '车牌号码',
  `picture` varchar(100) DEFAULT NULL COMMENT '车辆牌照（照片）',
  `owner_name` varchar(50) DEFAULT NULL COMMENT '车辆所有人（业主）名称',
  `owner_id` int(11) DEFAULT NULL COMMENT '车辆所有人（业主）ID',
  `telephone` int(20) DEFAULT NULL COMMENT '联系方式',
  `use_type` char(1) DEFAULT '0' COMMENT '使用性质：0-购买(默认)，1-月租，2-年租',
  `total_fee` int(11) DEFAULT NULL COMMENT '总费用(￥)，以分为单位',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '（使用）开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '（使用）结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车位使用表';

/*Data for the table `tb_parking_use` */

/*Table structure for table `tb_pet` */

DROP TABLE IF EXISTS `tb_pet`;

CREATE TABLE `tb_pet` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '宠物ID',
  `picture` varchar(100) DEFAULT NULL COMMENT '宠物照片',
  `owner_name` varchar(50) DEFAULT NULL COMMENT '所属成员（业主）名称',
  `owner_id` int(11) DEFAULT NULL COMMENT '所属成员（业主）ID',
  `name` varchar(50) DEFAULT NULL COMMENT '宠物名称',
  `color` varchar(10) DEFAULT NULL COMMENT '宠物颜色',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `adopt_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '收养时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='宠物表';

/*Data for the table `tb_pet` */

/*Table structure for table `tb_repair` */

DROP TABLE IF EXISTS `tb_repair`;

CREATE TABLE `tb_repair` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '维修ID',
  `community_name` varchar(50) DEFAULT NULL COMMENT '所属小区名称',
  `community_id` int(11) DEFAULT NULL COMMENT '所属小区ID',
  `building_name` varchar(50) DEFAULT NULL COMMENT '所属楼栋名称',
  `building_id` int(11) DEFAULT NULL COMMENT '所属楼栋ID',
  `owner_name` varchar(50) DEFAULT NULL COMMENT '报修人员（业主）名称',
  `owner_id` int(11) DEFAULT NULL COMMENT '报修人员（业主）ID',
  `device_name` varchar(50) DEFAULT NULL COMMENT '设备名称',
  `device_id` int(11) DEFAULT NULL COMMENT '设备编号ID',
  `description` varchar(500) DEFAULT NULL COMMENT '报修描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `status` char(1) DEFAULT '0' COMMENT '状态：0-待受理，1-已受理，2-修理完毕',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='维修表';

/*Data for the table `tb_repair` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
