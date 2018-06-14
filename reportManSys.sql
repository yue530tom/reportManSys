/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : reportmansys

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-06-14 10:53:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `doccategory`
-- ----------------------------
DROP TABLE IF EXISTS `doccategory`;
CREATE TABLE `doccategory` (
  `id` int(11) NOT NULL,
  `cate_name` varchar(100) DEFAULT NULL,
  `cate_status` varchar(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of doccategory
-- ----------------------------
INSERT INTO `doccategory` VALUES ('1', '性能测试报告', '1');
INSERT INTO `doccategory` VALUES ('2', '功能测试报告', '1');
INSERT INTO `doccategory` VALUES ('3', '模板类', '1');
INSERT INTO `doccategory` VALUES ('4', '其他', '1');

-- ----------------------------
-- Table structure for `documentinfo`
-- ----------------------------
DROP TABLE IF EXISTS `documentinfo`;
CREATE TABLE `documentinfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(100) NOT NULL,
  `secondName` varchar(100) NOT NULL,
  `fileType` varchar(250) DEFAULT NULL,
  `fileSize` varchar(50) DEFAULT NULL,
  `fileCreateDate` timestamp NULL DEFAULT NULL,
  `fileAuthor` varchar(100) DEFAULT NULL,
  `filePath` varchar(100) NOT NULL,
  `fileCategory` int(2) DEFAULT NULL,
  `fileMark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of documentinfo
-- ----------------------------
INSERT INTO `documentinfo` VALUES ('31', 'Linux菜鸟专用资料.pdf', '20160809105836293.pdf', 'application/pdf', '2739823', '2016-08-09 10:58:36', 'yueling', 'WEB-INF/report/pdf', '4', 'mark');
INSERT INTO `documentinfo` VALUES ('72', '手机定价与解耦性能测试报告@20150714.pdf', '20160818211950448.pdf', 'application/pdf', '714041', '2016-08-18 21:19:50', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('74', '海外购-顾客系统性能测试报告@20150513.pdf', '20160822161317917.pdf', 'application/pdf', '1770003', '2016-08-22 16:13:17', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('76', '线上单品页性能测试报告@20150507.pdf', '20160822175753256.pdf', 'application/pdf', '926952', '2016-08-22 17:57:53', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('77', '店铺装修前端性能测试报告@20150407.pdf', '20160823172157405.pdf', 'application/pdf', '1266816', '2016-08-23 17:21:57', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('78', 'ShardingJDBC性能测试报告@20160116.pdf', '20160823172207300.pdf', 'application/pdf', '885048', '2016-08-23 17:22:07', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('79', 'ShardingJDBC性能测试报告对外@20160116.pdf', '20160823172210694.pdf', 'application/pdf', '436052', '2016-08-23 17:22:10', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('80', '手机定价与解耦性能测试报告@20150608.pdf', '20160823172217835.pdf', 'application/pdf', '722682', '2016-08-23 17:22:17', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('81', '海尔商家入驻性能测试报告@20150429.pdf', '20160823172243677.pdf', 'application/pdf', '593253', '2016-08-23 17:22:43', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('82', '可配货仓批量穿性能测试报告@20160803.pdf', '20160823172251765.pdf', 'application/pdf', '393388', '2016-08-23 17:22:51', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('83', '配货系统性能测试报告@20160309.pdf', '20160823172257713.pdf', 'application/pdf', '980845', '2016-08-23 17:22:57', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('84', 'sohu云图片上传性能测试报告@20150421.pdf', '20160823172311050.pdf', 'application/pdf', '2225902', '2016-08-23 17:23:11', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('85', '无线接口性能测试报告@20150318.pdf', '20160823172320008.pdf', 'application/pdf', '1356160', '2016-08-23 17:23:20', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('86', '线上单品页性能测试报告@20150428.pdf', '20160823172327045.pdf', 'application/pdf', '1029435', '2016-08-23 17:23:27', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('87', '线上礼券测试报告@20151020.pdf', '20160823172333910.pdf', 'application/pdf', '540717', '2016-08-23 17:23:33', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('88', '性能测试报告模版 0.2.pdf', '20160823172341544.pdf', 'application/pdf', '150637', '2016-08-23 17:23:41', 'yueling', 'WEB-INF/report/pdf', '3', 'mark');
INSERT INTO `documentinfo` VALUES ('91', 'multi-mechanize总结.pdf', '20160824143140146.pdf', 'application/pdf', '684490', '2016-08-24 14:31:40', 'yueling', 'WEB-INF/report/pdf', '4', 'mark');
INSERT INTO `documentinfo` VALUES ('92', '自动化平台操作手册.pdf', '20160824143150575.pdf', 'application/pdf', '3746566', '2016-08-24 14:31:50', 'yueling', 'WEB-INF/report/pdf', '4', 'mark');
INSERT INTO `documentinfo` VALUES ('93', '应用层限流性能测试报告@20160913.pdf', '20160914113631513.pdf', 'application/pdf', '618458', '2016-09-14 11:36:31', 'zhangjing', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('95', '919秋冬促销切首页@20160918.pdf', '20160918182857188.pdf', 'application/pdf', '687660', '2016-09-18 18:28:57', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('96', '店铺基本信息接口切换到商家平台性能测试报告@20160919.pdf', '20160920105402219.pdf', 'application/pdf', '797155', '2016-09-20 10:54:02', 'houjiangnan', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('97', '店铺评分接口性能测试报告@20161214.pdf', '20161214105937294.pdf', 'application/pdf', '1184437', '2016-12-14 10:59:37', 'houjiangnan', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('98', '全站配置性能测试报告@20160203.pdf', '20170303114805038.pdf', 'application/pdf', '295265', '2017-03-03 11:48:05', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('99', '配货系统统一可配货性能测试报告@20170321.pdf', '20170322110408329.pdf', 'application/pdf', '501678', '2017-03-22 11:04:08', 'houjiangnan', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('100', 'LVS负载均衡搭建.pdf', '20170322110820158.pdf', 'application/pdf', '265130', '2017-03-22 11:08:20', 'houjiangnan', 'WEB-INF/report/pdf', '4', 'mark');
INSERT INTO `documentinfo` VALUES ('101', '库存满足度可配货API测试总结.pdf', '20170322110847670.pdf', 'application/pdf', '325233', '2017-03-22 11:08:47', 'houjiangnan', 'WEB-INF/report/pdf', '4', 'mark');
INSERT INTO `documentinfo` VALUES ('102', '一码到底性能测试报告@20170510.pdf', '20170510165222901.pdf', 'application/pdf', '416269', '2017-05-10 16:52:22', 'houjiangnan', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('103', '价格重构性能测试报告@20170407.pdf', '20170510170111511.pdf', 'application/pdf', '526842', '2017-05-10 17:01:11', 'houjiangnan', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('104', '个性化绑券性能测试报告@20170407.pdf', '20170510170122539.pdf', 'application/pdf', '404977', '2017-05-10 17:01:22', 'houjiangnan', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('105', 'wms中间层接口性能测试报告@20170413.pdf', '20170510170957789.pdf', 'application/pdf', '974223', '2017-05-10 17:09:57', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('106', 'WMS全流程性能测试报告.pdf', '20170510171207021.pdf', 'application/pdf', '890905', '2017-05-10 17:12:07', 'zhangjing', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('107', '促销API性能测试报告@20151011.pdf', '20170510171553880.pdf', 'application/pdf', '667318', '2017-05-10 17:15:53', 'zhangjing', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('108', '配货系统统一可配货性能测试报告@20170707.pdf', '20170707095443204.pdf', 'application/pdf', '734454', '2017-07-07 09:54:43', 'houjiangnan', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('109', '配货系统统一可配货性能测试报告@20170717.pdf', '20170717163230722.pdf', 'application/pdf', '712744', '2017-07-17 16:32:30', 'houjiangnan', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('110', 'WMS性能测试报告@20170728.pdf', '20170804115713653.pdf', 'application/pdf', '711224', '2017-08-04 11:57:13', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('111', '分单系统@20170907.pdf', '20171024113756513.pdf', 'application/pdf', '366643', '2017-10-24 11:37:56', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('112', '占用库存@20170917.pdf', '20171024113817745.pdf', 'application/pdf', '275491', '2017-10-24 11:38:17', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('113', '一单多件兜底@20171024.pdf', '20171024113903447.pdf', 'application/pdf', '264131', '2017-10-24 11:39:03', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('114', '新客户领券@20171012.pdf', '20171024113922731.pdf', 'application/pdf', '637175', '2017-10-24 11:39:22', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('115', 'shardingJDBC性能测试报告@20170913.pdf', '20171024114254163.pdf', 'application/pdf', '1715212', '2017-10-24 11:42:54', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('116', '新客户领券@20171026.pdf', '20171026110719410.pdf', 'application/pdf', '694493', '2017-10-26 11:07:19', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');
INSERT INTO `documentinfo` VALUES ('117', '新客户领券@20171026New.pdf', '20171026120206785.pdf', 'application/pdf', '798543', '2017-10-26 12:02:06', 'yueling', 'WEB-INF/report/pdf', '1', 'mark');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(10) NOT NULL DEFAULT '',
  `uname` varchar(20) DEFAULT NULL,
  `upasswd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'yueling', '123456');
INSERT INTO `user` VALUES ('2', 'zhangjing', '123456');
INSERT INTO `user` VALUES ('3', 'houjiangnan', '123456');
