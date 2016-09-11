-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.21-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  8.2.0.4675
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 manage 的数据库结构
DROP DATABASE IF EXISTS `manage`;
CREATE DATABASE IF NOT EXISTS `manage` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `manage`;


-- 导出  表 manage.account 结构
DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `Id` varchar(50) NOT NULL,
  `Coding` varchar(50) NOT NULL DEFAULT '' COMMENT '编码',
  `Name` varchar(50) DEFAULT '' COMMENT '名称',
  `Remarks` varchar(200) DEFAULT '' COMMENT '备注',
  `State` tinyint(4) DEFAULT '0' COMMENT '状态',
  `Created` int(20) DEFAULT '0' COMMENT '创建时间',
  `LastLogin` int(20) DEFAULT '0' COMMENT '最后登录时间',
  `Type` tinyint(4) DEFAULT '0' COMMENT '账号类型',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `coding` (`Coding`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账户';

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
