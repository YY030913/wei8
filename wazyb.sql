-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 08 月 04 日 14:04
-- 服务器版本: 5.5.40
-- PHP 版本: 5.4.33

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `wq8`
--

-- --------------------------------------------------------

--
-- 表的结构 `ims_account`
--

CREATE TABLE IF NOT EXISTS `ims_account` (
  `acid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `hash` varchar(8) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `isconnect` tinyint(4) NOT NULL,
  `isdeleted` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`acid`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ims_account`
--

INSERT INTO `ims_account` (`acid`, `uniacid`, `hash`, `type`, `isconnect`, `isdeleted`) VALUES
(1, 1, 'uRr8qvQV', 1, 0, 0),
(2, 2, 'M00ddMf0', 1, 1, 1),
(3, 3, 'G866jj7w', 1, 1, 1),
(4, 4, 'fwXWoeO8', 1, 1, 1),
(5, 5, 'jWOM1aio', 1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_wechats`
--

CREATE TABLE IF NOT EXISTS `ims_account_wechats` (
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `token` varchar(32) NOT NULL,
  `access_token` varchar(1000) NOT NULL,
  `encodingaeskey` varchar(255) NOT NULL,
  `level` tinyint(4) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `account` varchar(30) NOT NULL,
  `original` varchar(50) NOT NULL,
  `signature` varchar(100) NOT NULL,
  `country` varchar(10) NOT NULL,
  `province` varchar(3) NOT NULL,
  `city` varchar(15) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `key` varchar(50) NOT NULL,
  `secret` varchar(50) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `subscribeurl` varchar(120) NOT NULL,
  `auth_refresh_token` varchar(255) NOT NULL,
  PRIMARY KEY (`acid`),
  KEY `idx_key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_account_wechats`
--

INSERT INTO `ims_account_wechats` (`acid`, `uniacid`, `token`, `access_token`, `encodingaeskey`, `level`, `name`, `account`, `original`, `signature`, `country`, `province`, `city`, `username`, `password`, `lastupdate`, `key`, `secret`, `styleid`, `subscribeurl`, `auth_refresh_token`) VALUES
(1, 1, 'omJNpZEhZeHj1ZxFECKkP48B5VFbk1HP', '', '', 1, 'we7team', '', '', '', '', '', '', '', '', 0, '', '', 1, '', '');
-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_clerks`
--

CREATE TABLE IF NOT EXISTS `ims_activity_clerks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `storeid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `password` (`password`),
  KEY `openid` (`openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_clerk_menu`
--

CREATE TABLE IF NOT EXISTS `ims_activity_clerk_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `displayorder` int(4) NOT NULL,
  `pid` int(6) NOT NULL,
  `group_name` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `url` varchar(60) NOT NULL,
  `type` varchar(20) NOT NULL,
  `permission` varchar(50) NOT NULL,
  `system` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `ims_activity_clerk_menu`
--

INSERT INTO `ims_activity_clerk_menu` (`id`, `uniacid`, `displayorder`, `pid`, `group_name`, `title`, `icon`, `url`, `type`, `permission`, `system`) VALUES
(1, 0, 0, 0, 'mc', '快捷交易', '', '', '', 'mc_manage', 1),
(2, 0, 0, 1, '', '积分充值', 'fa fa-money', 'credit1', 'modal', 'mc_credit1', 1),
(3, 0, 0, 1, '', '余额充值', 'fa fa-cny', 'credit2', 'modal', 'mc_credit2', 1),
(4, 0, 0, 1, '', '消费', 'fa fa-usd', 'consume', 'modal', 'mc_consume', 1),
(5, 0, 0, 1, '', '发放会员卡', 'fa fa-credit-card', 'card', 'modal', 'mc_card', 1),
(6, 0, 0, 0, 'stat', '数据统计', '', '', '', 'stat_manage', 1),
(7, 0, 0, 6, '', '积分统计', 'fa fa-bar-chart', './index.php?c=stat&a=credit1', 'url', 'stat_credit1', 1),
(8, 0, 0, 6, '', '余额统计', 'fa fa-bar-chart', './index.php?c=stat&a=credit2', 'url', 'stat_credit2', 1),
(9, 0, 0, 6, '', '现金消费统计', 'fa fa-bar-chart', './index.php?c=stat&a=cash', 'url', 'stat_cash', 1),
(10, 0, 0, 6, '', '会员卡统计', 'fa fa-bar-chart', './index.php?c=stat&a=card', 'url', 'stat_card', 1),
(11, 0, 0, 0, 'activity', '卡券核销', '', '', '', 'activity_card_manage', 1),
(19, 0, 0, 18, '', '微信刷卡收款', 'fa fa-money', './index.php?c=paycenter&a=wxmicro&do=pay', 'url', 'paycenter_wxmicro_pay', 1),
(18, 0, 0, 0, 'paycenter', '收银台', '', '', '', 'paycenter_manage', 1),
(16, 0, 0, 6, '', '收银台收款统计', 'fa fa-bar-chart', './index.php?c=stat&a=paycenter', 'url', 'stat_paycenter', 1),
(17, 0, 0, 11, '', '卡券核销', 'fa fa-money', 'cardconsume', 'modal', 'coupon_consume', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_coupon`
--

CREATE TABLE IF NOT EXISTS `ims_activity_coupon` (
  `couponid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `type` tinyint(4) NOT NULL,
  `title` varchar(30) NOT NULL,
  `couponsn` varchar(50) NOT NULL,
  `description` text,
  `discount` decimal(10,2) NOT NULL,
  `condition` decimal(10,2) NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  `limit` int(11) NOT NULL,
  `dosage` int(11) unsigned NOT NULL,
  `amount` int(11) unsigned NOT NULL,
  `thumb` varchar(500) NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `use_module` tinyint(3) unsigned NOT NULL,
  `credittype` varchar(20) NOT NULL,
  PRIMARY KEY (`couponid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_coupon_allocation`
--

CREATE TABLE IF NOT EXISTS `ims_activity_coupon_allocation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `groupid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`couponid`,`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_coupon_modules`
--

CREATE TABLE IF NOT EXISTS `ims_activity_coupon_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `couponid` (`couponid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_coupon_record`
--

CREATE TABLE IF NOT EXISTS `ims_activity_coupon_record` (
  `recid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `code` varchar(50) NOT NULL,
  `grantmodule` varchar(50) NOT NULL,
  `granttime` int(10) unsigned NOT NULL,
  `usemodule` varchar(50) NOT NULL,
  `usetime` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `operator` varchar(30) NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `remark` varchar(300) NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`recid`),
  KEY `couponid` (`uid`,`grantmodule`,`usemodule`,`status`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_exchange`
--

CREATE TABLE IF NOT EXISTS `ims_activity_exchange` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `thumb` varchar(500) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `extra` varchar(3000) NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `credittype` varchar(10) NOT NULL,
  `pretotal` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extra` (`extra`(333))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_exchange_trades`
--

CREATE TABLE IF NOT EXISTS `ims_activity_exchange_trades` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `exid` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `uniacid` (`uniacid`,`uid`,`exid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_exchange_trades_shipping`
--

CREATE TABLE IF NOT EXISTS `ims_activity_exchange_trades_shipping` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `exid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `province` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `district` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_modules`
--

CREATE TABLE IF NOT EXISTS `ims_activity_modules` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `exid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `available` int(10) unsigned NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `uniacid` (`uniacid`),
  KEY `module` (`module`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_modules_record`
--

CREATE TABLE IF NOT EXISTS `ims_activity_modules_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `num` tinyint(3) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_stores`
--

CREATE TABLE IF NOT EXISTS `ims_activity_stores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `category` varchar(255) NOT NULL,
  `province` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `district` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `photo_list` varchar(10000) NOT NULL,
  `avg_price` int(10) unsigned NOT NULL,
  `open_time` varchar(50) NOT NULL,
  `recommend` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `source` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1为系统门店，2为微信门店',
  `message` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `location_id` (`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_category`
--

CREATE TABLE IF NOT EXISTS `ims_article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_news`
--

CREATE TABLE IF NOT EXISTS `ims_article_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_show_home` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `cateid` (`cateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_notice`
--

CREATE TABLE IF NOT EXISTS `ims_article_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_show_home` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `cateid` (`cateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_unread_notice`
--

CREATE TABLE IF NOT EXISTS `ims_article_unread_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notice_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `is_new` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `notice_id` (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_basic_reply`
--

CREATE TABLE IF NOT EXISTS `ims_basic_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `content` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ims_basic_reply`
--

INSERT INTO `ims_basic_reply` (`id`, `rid`, `content`) VALUES
(1, 12, '你好，我在这里');

-- --------------------------------------------------------

--
-- 表的结构 `ims_business`
--

CREATE TABLE IF NOT EXISTS `ims_business` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `dist` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `lng` varchar(10) NOT NULL,
  `lat` varchar(10) NOT NULL,
  `industry1` varchar(10) NOT NULL,
  `industry2` varchar(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lat_lng` (`lng`,`lat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_attachment`
--

CREATE TABLE IF NOT EXISTS `ims_core_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=94 ;

--
-- 转存表中的数据 `ims_core_attachment`
--

INSERT INTO `ims_core_attachment` (`id`, `uniacid`, `uid`, `filename`, `attachment`, `type`, `createtime`) VALUES
(1, 1, 1, '33R58PICa8V.jpg', 'images/1/2016/07/ko20xxz7C7Oa727OqvP77o0C7YZAoq.jpg', 1, 1467599032),
(2, 1, 1, 'getheadimg.jpg', 'images/1/2016/07/I663Avf0tgwS66VSt7A6vvvPG6ftS6.jpg', 1, 1467599434);
-- --------------------------------------------------------

--
-- 表的结构 `ims_core_cache`
--

CREATE TABLE IF NOT EXISTS `ims_core_cache` (
  `key` varchar(50) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_core_cache`
--

INSERT INTO `ims_core_cache` (`key`, `value`) VALUES
('setting', 'a:9:{s:9:"copyright";a:22:{s:6:"status";s:1:"0";s:10:"verifycode";s:1:"0";s:6:"reason";s:6:"备份";s:3:"url";s:20:"http://www.010xr.com";s:8:"statcode";s:0:"";s:10:"footerleft";s:0:"";s:11:"footerright";s:0:"";s:4:"icon";s:0:"";s:5:"flogo";s:0:"";s:6:"slides";s:2:"N;";s:6:"notice";s:0:"";s:5:"blogo";s:0:"";s:8:"baidumap";a:2:{s:3:"lng";s:0:"";s:3:"lat";s:0:"";}s:7:"company";s:0:"";s:7:"address";s:0:"";s:6:"person";s:0:"";s:5:"phone";s:0:"";s:2:"qq";s:0:"";s:5:"email";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";s:12:"showhomepage";i:1;}s:8:"authmode";i:1;s:5:"close";a:2:{s:6:"status";s:1:"0";s:6:"reason";s:0:"";}s:8:"register";a:4:{s:4:"open";i:1;s:6:"verify";i:0;s:4:"code";i:1;s:7:"groupid";i:1;}s:4:"site";s:0:"";s:7:"cloudip";a:2:{s:2:"ip";s:12:"125.39.6.164";s:6:"expire";i:1470305882;}s:8:"sms.info";a:3:{s:3:"key";s:5:"61189";s:8:"sms_sign";a:0:{}s:9:"sms_count";i:0;}s:8:"platform";a:5:{s:5:"token";s:32:"D66D3VZ560fF6v834vcF3oC0068v630z";s:14:"encodingaeskey";s:43:"mU8p7hxAstR2AUvH7sNrvd78Z7XxDKNLhhlDsP4txxs";s:9:"appsecret";s:0:"";s:5:"appid";s:0:"";s:9:"authstate";i:1;}s:18:"module_receive_ban";a:0:{}}'),
('upgrade', 'a:2:{s:7:"upgrade";b:0;s:10:"lastupdate";i:1470289099;}'),
('system_frame', 'a:5:{s:8:"platform";a:3:{i:0;a:2:{s:5:"title";s:12:"基本功能";s:5:"items";a:9:{i:0;a:5:{s:2:"id";s:1:"3";s:5:"title";s:12:"文字回复";s:3:"url";s:38:"./index.php?c=platform&a=reply&m=basic";s:15:"permission_name";s:20:"platform_reply_basic";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:46:"./index.php?c=platform&a=reply&do=post&m=basic";}}i:1;a:5:{s:2:"id";s:1:"4";s:5:"title";s:12:"图文回复";s:3:"url";s:37:"./index.php?c=platform&a=reply&m=news";s:15:"permission_name";s:19:"platform_reply_news";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:45:"./index.php?c=platform&a=reply&do=post&m=news";}}i:2;a:5:{s:2:"id";s:1:"5";s:5:"title";s:12:"音乐回复";s:3:"url";s:38:"./index.php?c=platform&a=reply&m=music";s:15:"permission_name";s:20:"platform_reply_music";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:46:"./index.php?c=platform&a=reply&do=post&m=music";}}i:3;a:5:{s:2:"id";s:1:"6";s:5:"title";s:12:"图片回复";s:3:"url";s:39:"./index.php?c=platform&a=reply&m=images";s:15:"permission_name";s:21:"platform_reply_images";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:47:"./index.php?c=platform&a=reply&do=post&m=images";}}i:4;a:5:{s:2:"id";s:1:"7";s:5:"title";s:12:"语音回复";s:3:"url";s:38:"./index.php?c=platform&a=reply&m=voice";s:15:"permission_name";s:20:"platform_reply_voice";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:46:"./index.php?c=platform&a=reply&do=post&m=voice";}}i:5;a:5:{s:2:"id";s:1:"8";s:5:"title";s:12:"视频回复";s:3:"url";s:38:"./index.php?c=platform&a=reply&m=video";s:15:"permission_name";s:20:"platform_reply_video";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:46:"./index.php?c=platform&a=reply&do=post&m=video";}}i:6;a:5:{s:2:"id";s:1:"9";s:5:"title";s:18:"微信卡券回复";s:3:"url";s:39:"./index.php?c=platform&a=reply&m=wxcard";s:15:"permission_name";s:21:"platform_reply_wxcard";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:47:"./index.php?c=platform&a=reply&do=post&m=wxcard";}}i:7;a:5:{s:2:"id";s:2:"10";s:5:"title";s:21:"自定义接口回复";s:3:"url";s:40:"./index.php?c=platform&a=reply&m=userapi";s:15:"permission_name";s:22:"platform_reply_userapi";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:48:"./index.php?c=platform&a=reply&do=post&m=userapi";}}i:8;a:4:{s:2:"id";s:2:"11";s:5:"title";s:12:"系统回复";s:3:"url";s:44:"./index.php?c=platform&a=special&do=display&";s:15:"permission_name";s:21:"platform_reply_system";}}}i:1;a:2:{s:5:"title";s:12:"高级功能";s:5:"items";a:6:{i:0;a:4:{s:2:"id";s:2:"13";s:5:"title";s:18:"常用服务接入";s:3:"url";s:43:"./index.php?c=platform&a=service&do=switch&";s:15:"permission_name";s:16:"platform_service";}i:1;a:4:{s:2:"id";s:2:"14";s:5:"title";s:15:"自定义菜单";s:3:"url";s:30:"./index.php?c=platform&a=menu&";s:15:"permission_name";s:13:"platform_menu";}i:2;a:4:{s:2:"id";s:2:"15";s:5:"title";s:18:"特殊消息回复";s:3:"url";s:44:"./index.php?c=platform&a=special&do=message&";s:15:"permission_name";s:16:"platform_special";}i:3;a:4:{s:2:"id";s:2:"16";s:5:"title";s:15:"二维码管理";s:3:"url";s:28:"./index.php?c=platform&a=qr&";s:15:"permission_name";s:11:"platform_qr";}i:4;a:4:{s:2:"id";s:2:"17";s:5:"title";s:15:"多客服接入";s:3:"url";s:39:"./index.php?c=platform&a=reply&m=custom";s:15:"permission_name";s:21:"platform_reply_custom";}i:5;a:4:{s:2:"id";s:2:"18";s:5:"title";s:18:"长链接二维码";s:3:"url";s:32:"./index.php?c=platform&a=url2qr&";s:15:"permission_name";s:15:"platform_url2qr";}}}i:2;a:2:{s:5:"title";s:12:"数据统计";s:5:"items";a:4:{i:0;a:4:{s:2:"id";s:2:"20";s:5:"title";s:12:"聊天记录";s:3:"url";s:41:"./index.php?c=platform&a=stat&do=history&";s:15:"permission_name";s:21:"platform_stat_history";}i:1;a:4:{s:2:"id";s:2:"21";s:5:"title";s:24:"回复规则使用情况";s:3:"url";s:38:"./index.php?c=platform&a=stat&do=rule&";s:15:"permission_name";s:18:"platform_stat_rule";}i:2;a:4:{s:2:"id";s:2:"22";s:5:"title";s:21:"关键字命中情况";s:3:"url";s:41:"./index.php?c=platform&a=stat&do=keyword&";s:15:"permission_name";s:21:"platform_stat_keyword";}i:3;a:4:{s:2:"id";s:2:"23";s:5:"title";s:6:"参数";s:3:"url";s:41:"./index.php?c=platform&a=stat&do=setting&";s:15:"permission_name";s:21:"platform_stat_setting";}}}}s:4:"site";a:3:{i:0;a:2:{s:5:"title";s:12:"微站管理";s:5:"items";a:3:{i:0;a:5:{s:2:"id";s:2:"26";s:5:"title";s:12:"站点管理";s:3:"url";s:38:"./index.php?c=site&a=multi&do=display&";s:15:"permission_name";s:18:"site_multi_display";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:35:"./index.php?c=site&a=multi&do=post&";}}i:1;a:4:{s:2:"id";s:2:"29";s:5:"title";s:12:"模板管理";s:3:"url";s:39:"./index.php?c=site&a=style&do=template&";s:15:"permission_name";s:19:"site_style_template";}i:2;a:4:{s:2:"id";s:2:"30";s:5:"title";s:18:"模块模板扩展";s:3:"url";s:37:"./index.php?c=site&a=style&do=module&";s:15:"permission_name";s:17:"site_style_module";}}}i:1;a:2:{s:5:"title";s:18:"特殊页面管理";s:5:"items";a:2:{i:0;a:4:{s:2:"id";s:2:"32";s:5:"title";s:12:"会员中心";s:3:"url";s:34:"./index.php?c=site&a=editor&do=uc&";s:15:"permission_name";s:14:"site_editor_uc";}i:1;a:5:{s:2:"id";s:2:"33";s:5:"title";s:12:"专题页面";s:3:"url";s:36:"./index.php?c=site&a=editor&do=page&";s:15:"permission_name";s:16:"site_editor_page";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:38:"./index.php?c=site&a=editor&do=design&";}}}}i:2;a:2:{s:5:"title";s:12:"功能组件";s:5:"items";a:2:{i:0;a:4:{s:2:"id";s:2:"35";s:5:"title";s:12:"分类设置";s:3:"url";s:30:"./index.php?c=site&a=category&";s:15:"permission_name";s:13:"site_category";}i:1;a:4:{s:2:"id";s:2:"36";s:5:"title";s:12:"文章管理";s:3:"url";s:29:"./index.php?c=site&a=article&";s:15:"permission_name";s:12:"site_article";}}}}s:2:"mc";a:9:{i:0;a:2:{s:5:"title";s:12:"粉丝管理";s:5:"items";a:2:{i:0;a:4:{s:2:"id";s:2:"39";s:5:"title";s:12:"粉丝分组";s:3:"url";s:28:"./index.php?c=mc&a=fangroup&";s:15:"permission_name";s:11:"mc_fangroup";}i:1;a:4:{s:2:"id";s:2:"40";s:5:"title";s:6:"粉丝";s:3:"url";s:24:"./index.php?c=mc&a=fans&";s:15:"permission_name";s:7:"mc_fans";}}}i:1;a:2:{s:5:"title";s:12:"会员中心";s:5:"items";a:3:{i:0;a:4:{s:2:"id";s:2:"42";s:5:"title";s:21:"会员中心关键字";s:3:"url";s:37:"./index.php?c=platform&a=cover&do=mc&";s:15:"permission_name";s:17:"platform_cover_mc";}i:1;a:5:{s:2:"id";s:2:"43";s:5:"title";s:6:"会员";s:3:"url";s:25:"./index.php?c=mc&a=member";s:15:"permission_name";s:9:"mc_member";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:32:"./index.php?c=mc&a=member&do=add";}}i:2;a:4:{s:2:"id";s:2:"44";s:5:"title";s:9:"会员组";s:3:"url";s:25:"./index.php?c=mc&a=group&";s:15:"permission_name";s:8:"mc_group";}}}i:2;a:2:{s:5:"title";s:15:"会员卡管理";s:5:"items";a:4:{i:0;a:4:{s:2:"id";s:2:"46";s:5:"title";s:18:"会员卡关键字";s:3:"url";s:39:"./index.php?c=platform&a=cover&do=card&";s:15:"permission_name";s:19:"platform_cover_card";}i:1;a:4:{s:2:"id";s:2:"47";s:5:"title";s:15:"会员卡管理";s:3:"url";s:33:"./index.php?c=mc&a=card&do=manage";s:15:"permission_name";s:14:"mc_card_manage";}i:2;a:4:{s:2:"id";s:2:"48";s:5:"title";s:15:"会员卡设置";s:3:"url";s:33:"./index.php?c=mc&a=card&do=editor";s:15:"permission_name";s:14:"mc_card_editor";}i:3;a:4:{s:2:"id";s:2:"49";s:5:"title";s:21:"会员卡其他功能";s:3:"url";s:32:"./index.php?c=mc&a=card&do=other";s:15:"permission_name";s:13:"mc_card_other";}}}i:3;a:2:{s:5:"title";s:12:"积分兑换";s:5:"items";a:2:{i:0;a:4:{s:2:"id";s:2:"51";s:5:"title";s:12:"卡券兑换";s:3:"url";s:56:"./index.php?c=activity&a=exchange&do=display&type=coupon";s:15:"permission_name";s:24:"activity_coupon_exchange";}i:1;a:4:{s:2:"id";s:2:"55";s:5:"title";s:18:"真实物品兑换";s:3:"url";s:55:"./index.php?c=activity&a=exchange&do=display&type=goods";s:15:"permission_name";s:22:"activity_goods_display";}}}i:4;a:2:{s:5:"title";s:19:"微信素材&群发";s:5:"items";a:2:{i:0;a:4:{s:2:"id";s:2:"57";s:5:"title";s:13:"素材&群发";s:3:"url";s:32:"./index.php?c=material&a=display";s:15:"permission_name";s:16:"material_display";}i:1;a:4:{s:2:"id";s:2:"58";s:5:"title";s:12:"定时群发";s:3:"url";s:29:"./index.php?c=material&a=mass";s:15:"permission_name";s:13:"material_mass";}}}i:5;a:2:{s:5:"title";s:12:"卡券管理";s:5:"items";a:2:{i:0;a:4:{s:2:"id";s:2:"60";s:5:"title";s:12:"卡券列表";s:3:"url";s:42:"./index.php?c=activity&a=coupon&do=display";s:15:"permission_name";s:23:"activity_coupon_display";}i:1;a:4:{s:2:"id";s:2:"94";s:5:"title";s:12:"卡券营销";s:3:"url";s:31:"./index.php?c=activity&a=market";s:15:"permission_name";s:22:"activity_coupon_market";}}}i:6;a:2:{s:5:"title";s:12:"门店管理";s:5:"items";a:2:{i:0;a:4:{s:2:"id";s:2:"64";s:5:"title";s:12:"门店列表";s:3:"url";s:30:"./index.php?c=activity&a=store";s:15:"permission_name";s:19:"activity_store_list";}i:1;a:4:{s:2:"id";s:2:"65";s:5:"title";s:12:"店员列表";s:3:"url";s:30:"./index.php?c=activity&a=clerk";s:15:"permission_name";s:19:"activity_clerk_list";}}}i:7;a:2:{s:5:"title";s:9:"收银台";s:5:"items";a:2:{i:0;a:4:{s:2:"id";s:2:"67";s:5:"title";s:18:"微信刷卡收款";s:3:"url";s:40:"./index.php?c=paycenter&a=wxmicro&do=pay";s:15:"permission_name";s:21:"paycenter_wxmicro_pay";}i:1;a:4:{s:2:"id";s:2:"68";s:5:"title";s:18:"收银台关键字";s:3:"url";s:39:"./index.php?c=platform&a=cover&do=clerk";s:15:"permission_name";s:15:"paycenter_clerk";}}}i:8;a:2:{s:5:"title";s:12:"统计中心";s:5:"items";a:5:{i:0;a:4:{s:2:"id";s:2:"70";s:5:"title";s:18:"会员积分统计";s:3:"url";s:28:"./index.php?c=stat&a=credit1";s:15:"permission_name";s:12:"stat_credit1";}i:1;a:4:{s:2:"id";s:2:"71";s:5:"title";s:18:"会员余额统计";s:3:"url";s:28:"./index.php?c=stat&a=credit2";s:15:"permission_name";s:12:"stat_credit2";}i:2;a:4:{s:2:"id";s:2:"72";s:5:"title";s:24:"会员现金消费统计";s:3:"url";s:25:"./index.php?c=stat&a=cash";s:15:"permission_name";s:9:"stat_cash";}i:3;a:4:{s:2:"id";s:2:"73";s:5:"title";s:15:"会员卡统计";s:3:"url";s:25:"./index.php?c=stat&a=card";s:15:"permission_name";s:9:"stat_card";}i:4;a:4:{s:2:"id";s:2:"74";s:5:"title";s:21:"收银台收款统计";s:3:"url";s:30:"./index.php?c=stat&a=paycenter";s:15:"permission_name";s:14:"stat_paycenter";}}}}s:7:"setting";a:3:{i:0;a:2:{s:5:"title";s:15:"公众号选项";s:5:"items";a:7:{i:0;a:4:{s:2:"id";s:2:"77";s:5:"title";s:12:"支付参数";s:3:"url";s:32:"./index.php?c=profile&a=payment&";s:15:"permission_name";s:15:"profile_payment";}i:1;a:4:{s:2:"id";s:2:"78";s:5:"title";s:19:"借用 oAuth 权限";s:3:"url";s:37:"./index.php?c=mc&a=passport&do=oauth&";s:15:"permission_name";s:17:"mc_passport_oauth";}i:2;a:4:{s:2:"id";s:2:"79";s:5:"title";s:22:"借用 JS 分享权限";s:3:"url";s:31:"./index.php?c=profile&a=jsauth&";s:15:"permission_name";s:14:"profile_jsauth";}i:3;a:4:{s:2:"id";s:2:"80";s:5:"title";s:18:"会员字段管理";s:3:"url";s:25:"./index.php?c=mc&a=fields";s:15:"permission_name";s:9:"mc_fields";}i:4;a:4:{s:2:"id";s:2:"81";s:5:"title";s:18:"微信通知设置";s:3:"url";s:28:"./index.php?c=mc&a=tplnotice";s:15:"permission_name";s:12:"mc_tplnotice";}i:5;a:4:{s:2:"id";s:2:"82";s:5:"title";s:21:"工作台菜单设置";s:3:"url";s:32:"./index.php?c=profile&a=deskmenu";s:15:"permission_name";s:16:"profile_deskmenu";}i:6;a:4:{s:2:"id";s:2:"83";s:5:"title";s:18:"会员扩展功能";s:3:"url";s:25:"./index.php?c=mc&a=plugin";s:15:"permission_name";s:9:"mc_plugin";}}}i:1;a:2:{s:5:"title";s:21:"会员及粉丝选项";s:5:"items";a:5:{i:0;a:4:{s:2:"id";s:2:"85";s:5:"title";s:12:"积分设置";s:3:"url";s:26:"./index.php?c=mc&a=credit&";s:15:"permission_name";s:9:"mc_credit";}i:1;a:4:{s:2:"id";s:2:"86";s:5:"title";s:12:"注册设置";s:3:"url";s:40:"./index.php?c=mc&a=passport&do=passport&";s:15:"permission_name";s:20:"mc_passport_passport";}i:2;a:4:{s:2:"id";s:2:"87";s:5:"title";s:18:"粉丝同步设置";s:3:"url";s:36:"./index.php?c=mc&a=passport&do=sync&";s:15:"permission_name";s:16:"mc_passport_sync";}i:3;a:4:{s:2:"id";s:2:"88";s:5:"title";s:14:"UC站点整合";s:3:"url";s:22:"./index.php?c=mc&a=uc&";s:15:"permission_name";s:5:"mc_uc";}i:4;a:4:{s:2:"id";s:2:"89";s:5:"title";s:18:"邮件通知参数";s:3:"url";s:30:"./index.php?c=profile&a=notify";s:15:"permission_name";s:14:"profile_notify";}}}i:2;a:1:{s:5:"title";s:18:"其他功能选项";}}s:3:"ext";a:1:{i:0;a:2:{s:5:"title";s:6:"管理";s:5:"items";a:1:{i:0;a:4:{s:2:"id";s:2:"93";s:5:"title";s:18:"扩展功能管理";s:3:"url";s:31:"./index.php?c=profile&a=module&";s:15:"permission_name";s:14:"profile_module";}}}}}'),
('zmcn_good_pro', 'a:5:{i:0;a:3:{s:5:"title";s:46:"【推荐】媺尔玫瑰奶昔花瓣面膜120g";s:6:"picurl";s:81:"http://wx.kasho.cn/attachment/images/4/2015/07/Isrr3FNY9gGZt5gUw5BngTGKN59Sw5.jpg";s:3:"url";s:88:"http://wx.kasho.cn/app/index.php?i=4&c=entry&m=ewei_shopv2&do=mobile&r=goods.detail&id=5";}i:1;a:3:{s:5:"title";s:43:"【推荐】媺尔出水莲粉嫩面膜120g";s:6:"picurl";s:81:"http://wx.kasho.cn/attachment/images/4/2015/07/v0rafrk92YbgUVfXWP6GrWp1RUKZ76.jpg";s:3:"url";s:88:"http://wx.kasho.cn/app/index.php?i=4&c=entry&m=ewei_shopv2&do=mobile&r=goods.detail&id=4";}i:2;a:3:{s:5:"title";s:50:"【推荐】媺尔金桂花蜜多效眼膜贴60PCS";s:6:"picurl";s:81:"http://wx.kasho.cn/attachment/images/4/2015/07/zf11afekNuzUec6p1fN2P1F6a13j41.jpg";s:3:"url";s:88:"http://wx.kasho.cn/app/index.php?i=4&c=entry&m=ewei_shopv2&do=mobile&r=goods.detail&id=6";}i:3;a:3:{s:5:"title";s:49:"【推荐】多效修护生物纤维面膜1片装";s:6:"picurl";s:81:"http://wx.kasho.cn/attachment/images/4/2015/07/vQ5z2MHhHSVbiyIi5vZS7vivF6Iiq5.jpg";s:3:"url";s:88:"http://wx.kasho.cn/app/index.php?i=4&c=entry&m=ewei_shopv2&do=mobile&r=goods.detail&id=9";}i:4;a:3:{s:5:"title";s:98:"【推荐】琳韩 虞人2015新款无钢圈大码薄杯调整型文胸90F无海绵全罩杯内衣";s:6:"picurl";s:81:"http://wx.kasho.cn/attachment/images/4/2015/12/gOsIiuns98h6fMVFfhmXIF6nVRnI9u.jpg";s:3:"url";s:90:"http://wx.kasho.cn/app/index.php?i=4&c=entry&m=ewei_shopv2&do=mobile&r=goods.detail&id=154";}}'),
('uniaccount:0', 'a:6:{s:4:"type";b:0;s:3:"uid";N;s:9:"starttime";N;s:7:"endtime";N;s:6:"groups";a:0:{}s:10:"grouplevel";b:0;}'),
('unisetting:0', 'b:0;'),
('unimodules::', 'a:21:{s:5:"basic";a:19:{s:3:"mid";s:1:"1";s:4:"name";s:5:"basic";s:4:"type";s:6:"system";s:5:"title";s:18:"基本文字回复";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"和您进行简单对话";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"news";a:19:{s:3:"mid";s:1:"2";s:4:"name";s:4:"news";s:4:"type";s:6:"system";s:5:"title";s:24:"基本混合图文回复";s:7:"version";s:3:"1.0";s:7:"ability";s:33:"为你提供生动的图文资讯";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"music";a:19:{s:3:"mid";s:1:"3";s:4:"name";s:5:"music";s:4:"type";s:6:"system";s:5:"title";s:18:"基本音乐回复";s:7:"version";s:3:"1.0";s:7:"ability";s:39:"提供语音、音乐等音频类回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:7:"userapi";a:19:{s:3:"mid";s:1:"4";s:4:"name";s:7:"userapi";s:4:"type";s:6:"system";s:5:"title";s:21:"自定义接口回复";s:7:"version";s:3:"1.1";s:7:"ability";s:33:"更方便的第三方接口设置";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:8:"recharge";a:19:{s:3:"mid";s:1:"5";s:4:"name";s:8:"recharge";s:4:"type";s:6:"system";s:5:"title";s:24:"会员中心充值模块";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"提供会员充值功能";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"custom";a:19:{s:3:"mid";s:1:"6";s:4:"name";s:6:"custom";s:4:"type";s:6:"system";s:5:"title";s:15:"多客服转接";s:7:"version";s:5:"1.0.0";s:7:"ability";s:36:"用来接入腾讯的多客服系统";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:17:"http://bbs.we7.cc";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:6:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:8:"location";i:4;s:4:"link";i:5;s:4:"text";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"images";a:19:{s:3:"mid";s:1:"7";s:4:"name";s:6:"images";s:4:"type";s:6:"system";s:5:"title";s:18:"基本图片回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"video";a:19:{s:3:"mid";s:1:"8";s:4:"name";s:5:"video";s:4:"type";s:6:"system";s:5:"title";s:18:"基本视频回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"voice";a:19:{s:3:"mid";s:1:"9";s:4:"name";s:5:"voice";s:4:"type";s:6:"system";s:5:"title";s:18:"基本语音回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供语音回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"chats";a:19:{s:3:"mid";s:2:"10";s:4:"name";s:5:"chats";s:4:"type";s:6:"system";s:5:"title";s:18:"发送客服消息";s:7:"version";s:3:"1.0";s:7:"ability";s:77:"公众号可以在粉丝最后发送消息的48小时内无限制发送消息";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"wxcard";a:19:{s:3:"mid";s:2:"11";s:4:"name";s:6:"wxcard";s:4:"type";s:6:"system";s:5:"title";s:18:"微信卡券回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"微信卡券回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:9:"paycenter";a:19:{s:3:"mid";s:2:"12";s:4:"name";s:9:"paycenter";s:4:"type";s:6:"system";s:5:"title";s:9:"收银台";s:7:"version";s:3:"1.0";s:7:"ability";s:9:"收银台";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:12:"meepo_online";a:19:{s:3:"mid";s:2:"13";s:4:"name";s:12:"meepo_online";s:4:"type";s:8:"business";s:5:"title";s:18:"米波在线直播";s:7:"version";s:5:"1.3.7";s:7:"ability";s:18:"米波在线直播";s:6:"author";s:12:"米波团队";s:3:"url";s:18:"http://bbs.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:1:{i:0;s:4:"text";}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:6:"a:0:{}";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:13:"ewei_shopping";a:19:{s:3:"mid";s:2:"15";s:4:"name";s:13:"ewei_shopping";s:4:"type";s:8:"business";s:5:"title";s:9:"微商城";s:7:"version";s:3:"6.8";s:7:"ability";s:9:"微商城";s:6:"author";s:20:"WeEngine Team & ewei";s:3:"url";s:0:"";s:8:"settings";s:1:"1";s:10:"subscribes";a:0:{}s:7:"handles";a:1:{i:0;s:4:"text";}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:2:"N;";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:10:"hc_article";a:19:{s:3:"mid";s:2:"16";s:4:"name";s:10:"hc_article";s:4:"type";s:8:"business";s:5:"title";s:12:"文章模块";s:7:"version";s:4:"1.71";s:7:"ability";s:12:"文章模块";s:6:"author";s:12:"火池网络";s:3:"url";s:23:"http://www.weixiamen.cn";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:2:{i:0;s:4:"text";i:1;s:9:"subscribe";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:2:"N;";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:11:"wisdom_kefu";a:19:{s:3:"mid";s:2:"17";s:4:"name";s:11:"wisdom_kefu";s:4:"type";s:8:"customer";s:5:"title";s:12:"智慧客服";s:7:"version";s:3:"1.2";s:7:"ability";s:36:"打造微擎最智能的客服系统";s:6:"author";s:13:"QQ:1006822260";s:3:"url";s:0:"";s:8:"settings";s:1:"1";s:10:"subscribes";a:0:{}s:7:"handles";a:1:{i:0;s:4:"text";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:2:"N;";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:11:"meepo_nsign";a:19:{s:3:"mid";s:2:"18";s:4:"name";s:11:"meepo_nsign";s:4:"type";s:8:"business";s:5:"title";s:6:"签到";s:7:"version";s:3:"5.0";s:7:"ability";s:6:"签到";s:6:"author";s:7:"imeepos";s:3:"url";s:18:"http://bbs.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";a:1:{i:0;s:4:"text";}s:7:"handles";a:1:{i:0;s:4:"text";}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:6:"a:0:{}";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:8:"wei_qian";a:19:{s:3:"mid";s:2:"19";s:4:"name";s:8:"wei_qian";s:4:"type";s:8:"activity";s:5:"title";s:6:"签到";s:7:"version";s:3:"2.2";s:7:"ability";s:15:"签到送积分";s:6:"author";s:9:"zhouchong";s:3:"url";s:18:"http://bbs.we7.cc/";s:8:"settings";s:1:"1";s:10:"subscribes";a:14:{i:0;s:4:"text";i:1;s:5:"image";i:2;s:5:"voice";i:3;s:5:"video";i:4;s:10:"shortvideo";i:5;s:8:"location";i:6;s:4:"link";i:7;s:9:"subscribe";i:8;s:11:"unsubscribe";i:9;s:2:"qr";i:10;s:5:"trace";i:11;s:5:"click";i:12;s:4:"view";i:13;s:14:"merchant_order";}s:7:"handles";a:12:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:10:"shortvideo";i:4;s:8:"location";i:5;s:4:"link";i:6;s:9:"subscribe";i:7;s:2:"qr";i:8;s:5:"trace";i:9;s:5:"click";i:10;s:14:"merchant_order";i:11;s:4:"text";}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:6:"a:0:{}";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:9:"zmcn_sign";a:19:{s:3:"mid";s:2:"20";s:4:"name";s:9:"zmcn_sign";s:4:"type";s:8:"customer";s:5:"title";s:12:"天天签到";s:7:"version";s:3:"3.8";s:7:"ability";s:138:"用户每天签到，送积分，增加用户对公众号的粘性。并有固定广告位和随机广告位两种，签到签出商机。";s:6:"author";s:6:"掌盟";s:3:"url";s:18:"http://bbs.we7.cc/";s:8:"settings";s:1:"1";s:10:"subscribes";a:0:{}s:7:"handles";a:1:{i:0;s:4:"text";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:2:"N;";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:15:"wuhao_wactivity";a:19:{s:3:"mid";s:2:"21";s:4:"name";s:15:"wuhao_wactivity";s:4:"type";s:8:"business";s:5:"title";s:30:"活动报名收费签到系统";s:7:"version";s:3:"2.0";s:7:"ability";s:39:"活动发布，交费，统计，签到";s:6:"author";s:5:"wuhao";s:3:"url";s:18:"http://bbs.we7.cc/";s:8:"settings";s:1:"1";s:10:"subscribes";a:14:{i:0;s:4:"text";i:1;s:5:"image";i:2;s:5:"voice";i:3;s:5:"video";i:4;s:10:"shortvideo";i:5;s:8:"location";i:6;s:4:"link";i:7;s:9:"subscribe";i:8;s:11:"unsubscribe";i:9;s:2:"qr";i:10;s:5:"trace";i:11;s:5:"click";i:12;s:4:"view";i:13;s:14:"merchant_order";}s:7:"handles";a:12:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:10:"shortvideo";i:4;s:8:"location";i:5;s:4:"link";i:6;s:9:"subscribe";i:7;s:2:"qr";i:8;s:5:"trace";i:9;s:5:"click";i:10;s:14:"merchant_order";i:11;s:4:"text";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:6:"a:0:{}";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"core";a:5:{s:5:"title";s:24:"系统事件处理模块";s:4:"name";s:4:"core";s:8:"issystem";i:1;s:7:"enabled";i:1;s:9:"isdisplay";i:0;}}'),
('unicount:1', 's:1:"1";'),
('usersfields', 'a:36:{s:8:"realname";s:12:"真实姓名";s:8:"nickname";s:6:"昵称";s:6:"avatar";s:6:"头像";s:2:"qq";s:5:"QQ号";s:6:"mobile";s:12:"手机号码";s:3:"vip";s:9:"VIP级别";s:6:"gender";s:6:"性别";s:9:"birthyear";s:12:"出生生日";s:13:"constellation";s:6:"星座";s:6:"zodiac";s:6:"生肖";s:9:"telephone";s:12:"固定电话";s:6:"idcard";s:12:"证件号码";s:9:"studentid";s:6:"学号";s:5:"grade";s:6:"班级";s:7:"address";s:12:"邮寄地址";s:7:"zipcode";s:6:"邮编";s:11:"nationality";s:6:"国籍";s:14:"resideprovince";s:12:"居住地址";s:14:"graduateschool";s:12:"毕业学校";s:7:"company";s:6:"公司";s:9:"education";s:6:"学历";s:10:"occupation";s:6:"职业";s:8:"position";s:6:"职位";s:7:"revenue";s:9:"年收入";s:15:"affectivestatus";s:12:"情感状态";s:10:"lookingfor";s:13:" 交友目的";s:9:"bloodtype";s:6:"血型";s:6:"height";s:6:"身高";s:6:"weight";s:6:"体重";s:6:"alipay";s:15:"支付宝帐号";s:3:"msn";s:3:"MSN";s:5:"email";s:12:"电子邮箱";s:6:"taobao";s:12:"阿里旺旺";s:4:"site";s:6:"主页";s:3:"bio";s:12:"自我介绍";s:8:"interest";s:12:"兴趣爱好";}'),
('module_receive_enable', 'a:0:{}'),
('unimodules:1:', 'a:14:{s:5:"basic";a:19:{s:3:"mid";s:1:"1";s:4:"name";s:5:"basic";s:4:"type";s:6:"system";s:5:"title";s:18:"基本文字回复";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"和您进行简单对话";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"news";a:19:{s:3:"mid";s:1:"2";s:4:"name";s:4:"news";s:4:"type";s:6:"system";s:5:"title";s:24:"基本混合图文回复";s:7:"version";s:3:"1.0";s:7:"ability";s:33:"为你提供生动的图文资讯";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"music";a:19:{s:3:"mid";s:1:"3";s:4:"name";s:5:"music";s:4:"type";s:6:"system";s:5:"title";s:18:"基本音乐回复";s:7:"version";s:3:"1.0";s:7:"ability";s:39:"提供语音、音乐等音频类回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:7:"userapi";a:19:{s:3:"mid";s:1:"4";s:4:"name";s:7:"userapi";s:4:"type";s:6:"system";s:5:"title";s:21:"自定义接口回复";s:7:"version";s:3:"1.1";s:7:"ability";s:33:"更方便的第三方接口设置";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:8:"recharge";a:19:{s:3:"mid";s:1:"5";s:4:"name";s:8:"recharge";s:4:"type";s:6:"system";s:5:"title";s:24:"会员中心充值模块";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"提供会员充值功能";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"custom";a:19:{s:3:"mid";s:1:"6";s:4:"name";s:6:"custom";s:4:"type";s:6:"system";s:5:"title";s:15:"多客服转接";s:7:"version";s:5:"1.0.0";s:7:"ability";s:36:"用来接入腾讯的多客服系统";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:17:"http://bbs.we7.cc";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:6:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:8:"location";i:4;s:4:"link";i:5;s:4:"text";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"images";a:19:{s:3:"mid";s:1:"7";s:4:"name";s:6:"images";s:4:"type";s:6:"system";s:5:"title";s:18:"基本图片回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"video";a:19:{s:3:"mid";s:1:"8";s:4:"name";s:5:"video";s:4:"type";s:6:"system";s:5:"title";s:18:"基本视频回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"voice";a:19:{s:3:"mid";s:1:"9";s:4:"name";s:5:"voice";s:4:"type";s:6:"system";s:5:"title";s:18:"基本语音回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供语音回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"chats";a:19:{s:3:"mid";s:2:"10";s:4:"name";s:5:"chats";s:4:"type";s:6:"system";s:5:"title";s:18:"发送客服消息";s:7:"version";s:3:"1.0";s:7:"ability";s:77:"公众号可以在粉丝最后发送消息的48小时内无限制发送消息";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"wxcard";a:19:{s:3:"mid";s:2:"11";s:4:"name";s:6:"wxcard";s:4:"type";s:6:"system";s:5:"title";s:18:"微信卡券回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"微信卡券回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:9:"paycenter";a:19:{s:3:"mid";s:2:"12";s:4:"name";s:9:"paycenter";s:4:"type";s:6:"system";s:5:"title";s:9:"收银台";s:7:"version";s:3:"1.0";s:7:"ability";s:9:"收银台";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:13:"ewei_shopping";a:19:{s:3:"mid";s:2:"15";s:4:"name";s:13:"ewei_shopping";s:4:"type";s:8:"business";s:5:"title";s:9:"微商城";s:7:"version";s:3:"6.8";s:7:"ability";s:9:"微商城";s:6:"author";s:20:"WeEngine Team & ewei";s:3:"url";s:0:"";s:8:"settings";s:1:"1";s:10:"subscribes";a:0:{}s:7:"handles";a:1:{i:0;s:4:"text";}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:2:"N;";s:7:"enabled";s:1:"1";s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"core";a:5:{s:5:"title";s:24:"系统事件处理模块";s:4:"name";s:4:"core";s:8:"issystem";i:1;s:7:"enabled";i:1;s:9:"isdisplay";i:0;}}'),
('modules', 'a:20:{s:5:"basic";a:17:{s:3:"mid";s:1:"1";s:4:"name";s:5:"basic";s:4:"type";s:6:"system";s:5:"title";s:18:"基本文字回复";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"和您进行简单对话";s:11:"description";s:201:"一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的回复内容.";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";b:0;s:7:"handles";b:0;s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";}s:4:"news";a:17:{s:3:"mid";s:1:"2";s:4:"name";s:4:"news";s:4:"type";s:6:"system";s:5:"title";s:24:"基本混合图文回复";s:7:"version";s:3:"1.0";s:7:"ability";s:33:"为你提供生动的图文资讯";s:11:"description";s:272:"一问一答得简单对话, 但是回复内容包括图片文字等更生动的媒体内容. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的图文回复内容.";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";b:0;s:7:"handles";b:0;s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";}s:5:"music";a:17:{s:3:"mid";s:1:"3";s:4:"name";s:5:"music";s:4:"type";s:6:"system";s:5:"title";s:18:"基本音乐回复";s:7:"version";s:3:"1.0";s:7:"ability";s:39:"提供语音、音乐等音频类回复";s:11:"description";s:183:"在回复规则中可选择具有语音、音乐等音频类的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝，实现一问一答得简单对话。";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";b:0;s:7:"handles";b:0;s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";}s:7:"userapi";a:17:{s:3:"mid";s:1:"4";s:4:"name";s:7:"userapi";s:4:"type";s:6:"system";s:5:"title";s:21:"自定义接口回复";s:7:"version";s:3:"1.1";s:7:"ability";s:33:"更方便的第三方接口设置";s:11:"description";s:141:"自定义接口又称第三方接口，可以让开发者更方便的接入微擎系统，高效的与微信公众平台进行对接整合。";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";b:0;s:7:"handles";b:0;s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";}s:8:"recharge";a:17:{s:3:"mid";s:1:"5";s:4:"name";s:8:"recharge";s:4:"type";s:6:"system";s:5:"title";s:24:"会员中心充值模块";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"提供会员充值功能";s:11:"description";s:0:"";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";b:0;s:7:"handles";b:0;s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";}s:6:"custom";a:17:{s:3:"mid";s:1:"6";s:4:"name";s:6:"custom";s:4:"type";s:6:"system";s:5:"title";s:15:"多客服转接";s:7:"version";s:5:"1.0.0";s:7:"ability";s:36:"用来接入腾讯的多客服系统";s:11:"description";s:0:"";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:17:"http://bbs.we7.cc";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:6:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:8:"location";i:4;s:4:"link";i:5;s:4:"text";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";}s:6:"images";a:17:{s:3:"mid";s:1:"7";s:4:"name";s:6:"images";s:4:"type";s:6:"system";s:5:"title";s:18:"基本图片回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:11:"description";s:132:"在回复规则中可选择具有图片的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝图片。";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";b:0;s:7:"handles";b:0;s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";}s:5:"video";a:17:{s:3:"mid";s:1:"8";s:4:"name";s:5:"video";s:4:"type";s:6:"system";s:5:"title";s:18:"基本视频回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:11:"description";s:132:"在回复规则中可选择具有视频的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝视频。";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";b:0;s:7:"handles";b:0;s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";}s:5:"voice";a:17:{s:3:"mid";s:1:"9";s:4:"name";s:5:"voice";s:4:"type";s:6:"system";s:5:"title";s:18:"基本语音回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供语音回复";s:11:"description";s:132:"在回复规则中可选择具有语音的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝语音。";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";b:0;s:7:"handles";b:0;s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";}s:5:"chats";a:17:{s:3:"mid";s:2:"10";s:4:"name";s:5:"chats";s:4:"type";s:6:"system";s:5:"title";s:18:"发送客服消息";s:7:"version";s:3:"1.0";s:7:"ability";s:77:"公众号可以在粉丝最后发送消息的48小时内无限制发送消息";s:11:"description";s:0:"";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";b:0;s:7:"handles";b:0;s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";}s:6:"wxcard";a:17:{s:3:"mid";s:2:"11";s:4:"name";s:6:"wxcard";s:4:"type";s:6:"system";s:5:"title";s:18:"微信卡券回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"微信卡券回复";s:11:"description";s:18:"微信卡券回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";b:0;s:7:"handles";b:0;s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";}s:9:"paycenter";a:17:{s:3:"mid";s:2:"12";s:4:"name";s:9:"paycenter";s:4:"type";s:6:"system";s:5:"title";s:9:"收银台";s:7:"version";s:3:"1.0";s:7:"ability";s:9:"收银台";s:11:"description";s:9:"收银台";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";b:0;s:7:"handles";b:0;s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";}s:12:"meepo_online";a:17:{s:3:"mid";s:2:"13";s:4:"name";s:12:"meepo_online";s:4:"type";s:8:"business";s:5:"title";s:18:"米波在线直播";s:7:"version";s:5:"1.3.7";s:7:"ability";s:18:"米波在线直播";s:11:"description";s:144:"米波在线直播、旨在为运营者赚钱、吸粉。主要有两大特色：node.js处理消息通知、全方位支持pc和手机浏览器";s:6:"author";s:12:"米波团队";s:3:"url";s:18:"http://bbs.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:1:{i:0;s:4:"text";}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:6:"a:0:{}";}s:13:"ewei_shopping";a:17:{s:3:"mid";s:2:"15";s:4:"name";s:13:"ewei_shopping";s:4:"type";s:8:"business";s:5:"title";s:9:"微商城";s:7:"version";s:3:"6.8";s:7:"ability";s:9:"微商城";s:11:"description";s:9:"微商城";s:6:"author";s:20:"WeEngine Team & ewei";s:3:"url";s:0:"";s:8:"settings";s:1:"1";s:10:"subscribes";a:0:{}s:7:"handles";a:1:{i:0;s:4:"text";}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:2:"N;";}s:10:"hc_article";a:17:{s:3:"mid";s:2:"16";s:4:"name";s:10:"hc_article";s:4:"type";s:8:"business";s:5:"title";s:12:"文章模块";s:7:"version";s:4:"1.71";s:7:"ability";s:12:"文章模块";s:11:"description";s:12:"文章模块";s:6:"author";s:12:"火池网络";s:3:"url";s:23:"http://www.weixiamen.cn";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:2:{i:0;s:4:"text";i:1;s:9:"subscribe";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:2:"N;";}s:11:"wisdom_kefu";a:17:{s:3:"mid";s:2:"17";s:4:"name";s:11:"wisdom_kefu";s:4:"type";s:8:"customer";s:5:"title";s:12:"智慧客服";s:7:"version";s:3:"1.2";s:7:"ability";s:36:"打造微擎最智能的客服系统";s:11:"description";s:15:"蚂蚁漏大牙";s:6:"author";s:13:"QQ:1006822260";s:3:"url";s:0:"";s:8:"settings";s:1:"1";s:10:"subscribes";a:0:{}s:7:"handles";a:1:{i:0;s:4:"text";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:2:"N;";}s:11:"meepo_nsign";a:17:{s:3:"mid";s:2:"18";s:4:"name";s:11:"meepo_nsign";s:4:"type";s:8:"business";s:5:"title";s:6:"签到";s:7:"version";s:3:"5.0";s:7:"ability";s:6:"签到";s:11:"description";s:6:"签到";s:6:"author";s:7:"imeepos";s:3:"url";s:18:"http://bbs.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";a:1:{i:0;s:4:"text";}s:7:"handles";a:1:{i:0;s:4:"text";}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:6:"a:0:{}";}s:8:"wei_qian";a:17:{s:3:"mid";s:2:"19";s:4:"name";s:8:"wei_qian";s:4:"type";s:8:"activity";s:5:"title";s:6:"签到";s:7:"version";s:3:"2.2";s:7:"ability";s:15:"签到送积分";s:11:"description";s:15:"签到送积分";s:6:"author";s:9:"zhouchong";s:3:"url";s:18:"http://bbs.we7.cc/";s:8:"settings";s:1:"1";s:10:"subscribes";a:14:{i:0;s:4:"text";i:1;s:5:"image";i:2;s:5:"voice";i:3;s:5:"video";i:4;s:10:"shortvideo";i:5;s:8:"location";i:6;s:4:"link";i:7;s:9:"subscribe";i:8;s:11:"unsubscribe";i:9;s:2:"qr";i:10;s:5:"trace";i:11;s:5:"click";i:12;s:4:"view";i:13;s:14:"merchant_order";}s:7:"handles";a:12:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:10:"shortvideo";i:4;s:8:"location";i:5;s:4:"link";i:6;s:9:"subscribe";i:7;s:2:"qr";i:8;s:5:"trace";i:9;s:5:"click";i:10;s:14:"merchant_order";i:11;s:4:"text";}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:6:"a:0:{}";}s:9:"zmcn_sign";a:17:{s:3:"mid";s:2:"20";s:4:"name";s:9:"zmcn_sign";s:4:"type";s:8:"customer";s:5:"title";s:12:"天天签到";s:7:"version";s:3:"3.8";s:7:"ability";s:138:"用户每天签到，送积分，增加用户对公众号的粘性。并有固定广告位和随机广告位两种，签到签出商机。";s:11:"description";s:540:"用户第一天签到，就赠送“首次签到积分”，然后连续每天签到都将递增“续签递增积分”，如果中断，将重新回到“首次签到积分”，然后再重新递增\n例如：首次签到积分为10；续签递增积分为2\n那么用户第一天签到赠送10个积分，第二天12个积分，第二天14个积分 （10+12+14+16+18+20……）\n但是如果有一天没签到（中断了）那么下次签到又从10分送起\n好处：用户每天签到，送积分，增加用户对公众号的粘性。";s:6:"author";s:6:"掌盟";s:3:"url";s:18:"http://bbs.we7.cc/";s:8:"settings";s:1:"1";s:10:"subscribes";a:0:{}s:7:"handles";a:1:{i:0;s:4:"text";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:2:"N;";}s:15:"wuhao_wactivity";a:17:{s:3:"mid";s:2:"21";s:4:"name";s:15:"wuhao_wactivity";s:4:"type";s:8:"business";s:5:"title";s:30:"活动报名收费签到系统";s:7:"version";s:3:"2.0";s:7:"ability";s:39:"活动发布，交费，统计，签到";s:11:"description";s:120:"活动发布，交费，统计，以及签到功能，只能在规定的时间范围内，规定的地点内签到有效";s:6:"author";s:5:"wuhao";s:3:"url";s:18:"http://bbs.we7.cc/";s:8:"settings";s:1:"1";s:10:"subscribes";a:14:{i:0;s:4:"text";i:1;s:5:"image";i:2;s:5:"voice";i:3;s:5:"video";i:4;s:10:"shortvideo";i:5;s:8:"location";i:6;s:4:"link";i:7;s:9:"subscribe";i:8;s:11:"unsubscribe";i:9;s:2:"qr";i:10;s:5:"trace";i:11;s:5:"click";i:12;s:4:"view";i:13;s:14:"merchant_order";}s:7:"handles";a:12:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:10:"shortvideo";i:4;s:8:"location";i:5;s:4:"link";i:6;s:9:"subscribe";i:7;s:2:"qr";i:8;s:5:"trace";i:9;s:5:"click";i:10;s:14:"merchant_order";i:11;s:4:"text";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:6:"a:0:{}";}}'),
('unisetting:', 'b:0;');
INSERT INTO `ims_core_cache` (`key`, `value`) VALUES
('unimodules::1', 'a:17:{s:5:"basic";a:19:{s:3:"mid";s:1:"1";s:4:"name";s:5:"basic";s:4:"type";s:6:"system";s:5:"title";s:18:"基本文字回复";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"和您进行简单对话";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"news";a:19:{s:3:"mid";s:1:"2";s:4:"name";s:4:"news";s:4:"type";s:6:"system";s:5:"title";s:24:"基本混合图文回复";s:7:"version";s:3:"1.0";s:7:"ability";s:33:"为你提供生动的图文资讯";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"music";a:19:{s:3:"mid";s:1:"3";s:4:"name";s:5:"music";s:4:"type";s:6:"system";s:5:"title";s:18:"基本音乐回复";s:7:"version";s:3:"1.0";s:7:"ability";s:39:"提供语音、音乐等音频类回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:7:"userapi";a:19:{s:3:"mid";s:1:"4";s:4:"name";s:7:"userapi";s:4:"type";s:6:"system";s:5:"title";s:21:"自定义接口回复";s:7:"version";s:3:"1.1";s:7:"ability";s:33:"更方便的第三方接口设置";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:8:"recharge";a:19:{s:3:"mid";s:1:"5";s:4:"name";s:8:"recharge";s:4:"type";s:6:"system";s:5:"title";s:24:"会员中心充值模块";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"提供会员充值功能";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"custom";a:19:{s:3:"mid";s:1:"6";s:4:"name";s:6:"custom";s:4:"type";s:6:"system";s:5:"title";s:15:"多客服转接";s:7:"version";s:5:"1.0.0";s:7:"ability";s:36:"用来接入腾讯的多客服系统";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:17:"http://bbs.we7.cc";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:6:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:8:"location";i:4;s:4:"link";i:5;s:4:"text";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"images";a:19:{s:3:"mid";s:1:"7";s:4:"name";s:6:"images";s:4:"type";s:6:"system";s:5:"title";s:18:"基本图片回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"video";a:19:{s:3:"mid";s:1:"8";s:4:"name";s:5:"video";s:4:"type";s:6:"system";s:5:"title";s:18:"基本视频回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"voice";a:19:{s:3:"mid";s:1:"9";s:4:"name";s:5:"voice";s:4:"type";s:6:"system";s:5:"title";s:18:"基本语音回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供语音回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"chats";a:19:{s:3:"mid";s:2:"10";s:4:"name";s:5:"chats";s:4:"type";s:6:"system";s:5:"title";s:18:"发送客服消息";s:7:"version";s:3:"1.0";s:7:"ability";s:77:"公众号可以在粉丝最后发送消息的48小时内无限制发送消息";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"wxcard";a:19:{s:3:"mid";s:2:"11";s:4:"name";s:6:"wxcard";s:4:"type";s:6:"system";s:5:"title";s:18:"微信卡券回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"微信卡券回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:9:"paycenter";a:19:{s:3:"mid";s:2:"12";s:4:"name";s:9:"paycenter";s:4:"type";s:6:"system";s:5:"title";s:9:"收银台";s:7:"version";s:3:"1.0";s:7:"ability";s:9:"收银台";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:12:"meepo_online";a:19:{s:3:"mid";s:2:"13";s:4:"name";s:12:"meepo_online";s:4:"type";s:8:"business";s:5:"title";s:18:"米波在线直播";s:7:"version";s:5:"1.3.7";s:7:"ability";s:18:"米波在线直播";s:6:"author";s:12:"米波团队";s:3:"url";s:18:"http://bbs.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:1:{i:0;s:4:"text";}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:6:"a:0:{}";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:13:"ewei_shopping";a:19:{s:3:"mid";s:2:"15";s:4:"name";s:13:"ewei_shopping";s:4:"type";s:8:"business";s:5:"title";s:9:"微商城";s:7:"version";s:3:"6.8";s:7:"ability";s:9:"微商城";s:6:"author";s:20:"WeEngine Team & ewei";s:3:"url";s:0:"";s:8:"settings";s:1:"1";s:10:"subscribes";a:0:{}s:7:"handles";a:1:{i:0;s:4:"text";}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:2:"N;";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:10:"hc_article";a:19:{s:3:"mid";s:2:"16";s:4:"name";s:10:"hc_article";s:4:"type";s:8:"business";s:5:"title";s:12:"文章模块";s:7:"version";s:4:"1.71";s:7:"ability";s:12:"文章模块";s:6:"author";s:12:"火池网络";s:3:"url";s:23:"http://www.weixiamen.cn";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:2:{i:0;s:4:"text";i:1;s:9:"subscribe";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:2:"N;";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:11:"wisdom_kefu";a:19:{s:3:"mid";s:2:"17";s:4:"name";s:11:"wisdom_kefu";s:4:"type";s:8:"customer";s:5:"title";s:12:"智慧客服";s:7:"version";s:3:"1.2";s:7:"ability";s:36:"打造微擎最智能的客服系统";s:6:"author";s:13:"QQ:1006822260";s:3:"url";s:0:"";s:8:"settings";s:1:"1";s:10:"subscribes";a:0:{}s:7:"handles";a:1:{i:0;s:4:"text";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:2:"N;";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"core";a:5:{s:5:"title";s:24:"系统事件处理模块";s:4:"name";s:4:"core";s:8:"issystem";i:1;s:7:"enabled";i:1;s:9:"isdisplay";i:0;}}'),
('checkupgrade:system', 'a:1:{s:10:"lastupdate";i:1470289099;}'),
('uniaccount:1', 'a:28:{s:4:"acid";s:1:"1";s:7:"uniacid";s:1:"1";s:5:"token";s:32:"omJNpZEhZeHj1ZxFECKkP48B5VFbk1HP";s:12:"access_token";s:0:"";s:14:"encodingaeskey";s:0:"";s:5:"level";s:1:"1";s:4:"name";s:7:"we7team";s:7:"account";s:0:"";s:8:"original";s:0:"";s:9:"signature";s:0:"";s:7:"country";s:0:"";s:8:"province";s:0:"";s:4:"city";s:0:"";s:8:"username";s:0:"";s:8:"password";s:0:"";s:10:"lastupdate";s:1:"0";s:3:"key";s:0:"";s:6:"secret";s:0:"";s:7:"styleid";s:1:"1";s:12:"subscribeurl";s:0:"";s:18:"auth_refresh_token";s:0:"";s:12:"default_acid";s:1:"1";s:4:"type";s:1:"1";s:3:"uid";N;s:9:"starttime";N;s:7:"endtime";N;s:6:"groups";a:1:{i:1;a:6:{s:7:"groupid";s:1:"1";s:7:"uniacid";s:1:"1";s:5:"title";s:15:"默认会员组";s:6:"credit";s:1:"0";s:9:"orderlist";s:1:"0";s:9:"isdefault";s:1:"1";}}s:10:"grouplevel";s:1:"0";}'),
('unisetting:1', 'a:22:{s:7:"uniacid";s:1:"1";s:8:"passport";a:3:{s:8:"focusreg";i:0;s:4:"item";s:5:"email";s:4:"type";s:8:"password";}s:5:"oauth";a:2:{s:6:"status";s:1:"0";s:7:"account";s:1:"0";}s:11:"jsauth_acid";s:1:"0";s:2:"uc";a:1:{s:6:"status";i:0;}s:6:"notify";a:1:{s:3:"sms";a:2:{s:7:"balance";i:0;s:9:"signature";s:0:"";}}s:11:"creditnames";a:5:{s:7:"credit1";a:2:{s:5:"title";s:6:"积分";s:7:"enabled";i:1;}s:7:"credit2";a:2:{s:5:"title";s:6:"余额";s:7:"enabled";i:1;}s:7:"credit3";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}s:7:"credit4";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}s:7:"credit5";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}}s:15:"creditbehaviors";a:2:{s:8:"activity";s:7:"credit1";s:8:"currency";s:7:"credit2";}s:7:"welcome";s:0:"";s:7:"default";s:0:"";s:15:"default_message";s:0:"";s:9:"shortcuts";s:0:"";s:7:"payment";a:4:{s:6:"credit";a:1:{s:6:"switch";b:0;}s:6:"alipay";a:4:{s:6:"switch";b:0;s:7:"account";s:0:"";s:7:"partner";s:0:"";s:6:"secret";s:0:"";}s:6:"wechat";a:5:{s:6:"switch";b:0;s:7:"account";b:0;s:7:"signkey";s:0:"";s:7:"partner";s:0:"";s:3:"key";s:0:"";}s:8:"delivery";a:1:{s:6:"switch";b:0;}}s:4:"stat";s:0:"";s:7:"menuset";s:0:"";s:12:"default_site";s:1:"1";s:4:"sync";s:1:"0";s:8:"recharge";s:0:"";s:9:"tplnotice";s:0:"";s:10:"grouplevel";s:1:"0";s:8:"mcplugin";s:0:"";s:15:"exchange_enable";s:1:"0";}'),
('unimodules:1:1', 'a:14:{s:5:"basic";a:19:{s:3:"mid";s:1:"1";s:4:"name";s:5:"basic";s:4:"type";s:6:"system";s:5:"title";s:18:"基本文字回复";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"和您进行简单对话";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"news";a:19:{s:3:"mid";s:1:"2";s:4:"name";s:4:"news";s:4:"type";s:6:"system";s:5:"title";s:24:"基本混合图文回复";s:7:"version";s:3:"1.0";s:7:"ability";s:33:"为你提供生动的图文资讯";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"music";a:19:{s:3:"mid";s:1:"3";s:4:"name";s:5:"music";s:4:"type";s:6:"system";s:5:"title";s:18:"基本音乐回复";s:7:"version";s:3:"1.0";s:7:"ability";s:39:"提供语音、音乐等音频类回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:7:"userapi";a:19:{s:3:"mid";s:1:"4";s:4:"name";s:7:"userapi";s:4:"type";s:6:"system";s:5:"title";s:21:"自定义接口回复";s:7:"version";s:3:"1.1";s:7:"ability";s:33:"更方便的第三方接口设置";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:8:"recharge";a:19:{s:3:"mid";s:1:"5";s:4:"name";s:8:"recharge";s:4:"type";s:6:"system";s:5:"title";s:24:"会员中心充值模块";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"提供会员充值功能";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"custom";a:19:{s:3:"mid";s:1:"6";s:4:"name";s:6:"custom";s:4:"type";s:6:"system";s:5:"title";s:15:"多客服转接";s:7:"version";s:5:"1.0.0";s:7:"ability";s:36:"用来接入腾讯的多客服系统";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:17:"http://bbs.we7.cc";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:6:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:8:"location";i:4;s:4:"link";i:5;s:4:"text";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"images";a:19:{s:3:"mid";s:1:"7";s:4:"name";s:6:"images";s:4:"type";s:6:"system";s:5:"title";s:18:"基本图片回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"video";a:19:{s:3:"mid";s:1:"8";s:4:"name";s:5:"video";s:4:"type";s:6:"system";s:5:"title";s:18:"基本视频回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"voice";a:19:{s:3:"mid";s:1:"9";s:4:"name";s:5:"voice";s:4:"type";s:6:"system";s:5:"title";s:18:"基本语音回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供语音回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"chats";a:19:{s:3:"mid";s:2:"10";s:4:"name";s:5:"chats";s:4:"type";s:6:"system";s:5:"title";s:18:"发送客服消息";s:7:"version";s:3:"1.0";s:7:"ability";s:77:"公众号可以在粉丝最后发送消息的48小时内无限制发送消息";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"wxcard";a:19:{s:3:"mid";s:2:"11";s:4:"name";s:6:"wxcard";s:4:"type";s:6:"system";s:5:"title";s:18:"微信卡券回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"微信卡券回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:9:"paycenter";a:19:{s:3:"mid";s:2:"12";s:4:"name";s:9:"paycenter";s:4:"type";s:6:"system";s:5:"title";s:9:"收银台";s:7:"version";s:3:"1.0";s:7:"ability";s:9:"收银台";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:13:"ewei_shopping";a:19:{s:3:"mid";s:2:"15";s:4:"name";s:13:"ewei_shopping";s:4:"type";s:8:"business";s:5:"title";s:9:"微商城";s:7:"version";s:3:"6.8";s:7:"ability";s:9:"微商城";s:6:"author";s:20:"WeEngine Team & ewei";s:3:"url";s:0:"";s:8:"settings";s:1:"1";s:10:"subscribes";a:0:{}s:7:"handles";a:1:{i:0;s:4:"text";}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:2:"N;";s:7:"enabled";s:1:"1";s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"core";a:5:{s:5:"title";s:24:"系统事件处理模块";s:4:"name";s:4:"core";s:8:"issystem";i:1;s:7:"enabled";i:1;s:9:"isdisplay";i:0;}}');

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_cron`
--

CREATE TABLE IF NOT EXISTS `ims_core_cron` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cloudid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `lastruntime` int(10) unsigned NOT NULL,
  `nextruntime` int(10) unsigned NOT NULL,
  `weekday` tinyint(3) NOT NULL,
  `day` tinyint(3) NOT NULL,
  `hour` tinyint(3) NOT NULL,
  `minute` varchar(255) NOT NULL,
  `extra` varchar(5000) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `createtime` (`createtime`),
  KEY `nextruntime` (`nextruntime`),
  KEY `uniacid` (`uniacid`),
  KEY `cloudid` (`cloudid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_cron_record`
--

CREATE TABLE IF NOT EXISTS `ims_core_cron_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  `note` varchar(500) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `tid` (`tid`),
  KEY `module` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_menu`
--

CREATE TABLE IF NOT EXISTS `ims_core_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL,
  `title` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(60) NOT NULL,
  `append_title` varchar(30) NOT NULL,
  `append_url` varchar(255) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_system` tinyint(3) unsigned NOT NULL,
  `permission_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=95 ;

--
-- 转存表中的数据 `ims_core_menu`
--

INSERT INTO `ims_core_menu` (`id`, `pid`, `title`, `name`, `url`, `append_title`, `append_url`, `displayorder`, `type`, `is_display`, `is_system`, `permission_name`) VALUES
(1, 0, '基础设置', 'platform', '', 'fa fa-cog', '', 0, 'url', 1, 1, ''),
(2, 1, '基本功能', 'platform', '', '', '', 0, 'url', 1, 1, 'platform_basic_function'),
(3, 2, '文字回复', 'platform', './index.php?c=platform&a=reply&m=basic', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=basic', 0, 'url', 1, 1, 'platform_reply_basic'),
(4, 2, '图文回复', 'platform', './index.php?c=platform&a=reply&m=news', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=news', 0, 'url', 1, 1, 'platform_reply_news'),
(5, 2, '音乐回复', 'platform', './index.php?c=platform&a=reply&m=music', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=music', 0, 'url', 1, 1, 'platform_reply_music'),
(6, 2, '图片回复', 'platform', './index.php?c=platform&a=reply&m=images', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=images', 0, 'url', 1, 1, 'platform_reply_images'),
(7, 2, '语音回复', 'platform', './index.php?c=platform&a=reply&m=voice', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=voice', 0, 'url', 1, 1, 'platform_reply_voice'),
(8, 2, '视频回复', 'platform', './index.php?c=platform&a=reply&m=video', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=video', 0, 'url', 1, 1, 'platform_reply_video'),
(9, 2, '微信卡券回复', 'platform', './index.php?c=platform&a=reply&m=wxcard', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=wxcard', 0, 'url', 1, 1, 'platform_reply_wxcard'),
(10, 2, '自定义接口回复', 'platform', './index.php?c=platform&a=reply&m=userapi', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=userapi', 0, 'url', 1, 1, 'platform_reply_userapi'),
(11, 2, '系统回复', 'platform', './index.php?c=platform&a=special&do=display&', '', '', 0, 'url', 1, 1, 'platform_reply_system'),
(12, 1, '高级功能', 'platform', '', '', '', 0, 'url', 1, 1, 'platform_high_function'),
(13, 12, '常用服务接入', 'platform', './index.php?c=platform&a=service&do=switch&', '', '', 0, 'url', 1, 1, 'platform_service'),
(14, 12, '自定义菜单', 'platform', './index.php?c=platform&a=menu&', '', '', 0, 'url', 1, 1, 'platform_menu'),
(15, 12, '特殊消息回复', 'platform', './index.php?c=platform&a=special&do=message&', '', '', 0, 'url', 1, 1, 'platform_special'),
(16, 12, '二维码管理', 'platform', './index.php?c=platform&a=qr&', '', '', 0, 'url', 1, 1, 'platform_qr'),
(17, 12, '多客服接入', 'platform', './index.php?c=platform&a=reply&m=custom', '', '', 0, 'url', 1, 1, 'platform_reply_custom'),
(18, 12, '长链接二维码', 'platform', './index.php?c=platform&a=url2qr&', '', '', 0, 'url', 1, 1, 'platform_url2qr'),
(19, 1, '数据统计', 'platform', '', '', '', 0, 'url', 1, 1, 'platform_stat'),
(20, 19, '聊天记录', 'platform', './index.php?c=platform&a=stat&do=history&', '', '', 0, 'url', 1, 1, 'platform_stat_history'),
(21, 19, '回复规则使用情况', 'platform', './index.php?c=platform&a=stat&do=rule&', '', '', 0, 'url', 1, 1, 'platform_stat_rule'),
(22, 19, '关键字命中情况', 'platform', './index.php?c=platform&a=stat&do=keyword&', '', '', 0, 'url', 1, 1, 'platform_stat_keyword'),
(23, 19, '参数', 'platform', './index.php?c=platform&a=stat&do=setting&', '', '', 0, 'url', 1, 1, 'platform_stat_setting'),
(24, 0, '微站功能', 'site', '', 'fa fa-life-bouy', '', 0, 'url', 1, 1, ''),
(25, 24, '微站管理', 'site', '', '', '', 0, 'url', 1, 1, 'site_manage'),
(26, 25, '站点管理', 'site', './index.php?c=site&a=multi&do=display&', 'fa fa-plus', './index.php?c=site&a=multi&do=post&', 0, 'url', 1, 1, 'site_multi_display'),
(27, 25, '站点添加/编辑', 'site', '', '', '', 0, 'permission', 0, 1, 'site_multi_post'),
(28, 25, '站点删除', 'site', '', '', '', 0, 'permission', 0, 1, 'site_multi_del'),
(29, 25, '模板管理', 'site', './index.php?c=site&a=style&do=template&', '', '', 0, 'url', 1, 1, 'site_style_template'),
(30, 25, '模块模板扩展', 'site', './index.php?c=site&a=style&do=module&', '', '', 0, 'url', 1, 1, 'site_style_module'),
(31, 24, '特殊页面管理', 'site', '', '', '', 0, 'url', 1, 1, 'site_special_page'),
(32, 31, '会员中心', 'site', './index.php?c=site&a=editor&do=uc&', '', '', 0, 'url', 1, 1, 'site_editor_uc'),
(33, 31, '专题页面', 'site', './index.php?c=site&a=editor&do=page&', 'fa fa-plus', './index.php?c=site&a=editor&do=design&', 0, 'url', 1, 1, 'site_editor_page'),
(34, 24, '功能组件', 'site', '', '', '', 0, 'url', 1, 1, 'site_article'),
(35, 34, '分类设置', 'site', './index.php?c=site&a=category&', '', '', 0, 'url', 1, 1, 'site_category'),
(36, 34, '文章管理', 'site', './index.php?c=site&a=article&', '', '', 0, 'url', 1, 1, 'site_article'),
(37, 0, '粉丝营销', 'mc', '', 'fa fa-gift', '', 0, 'url', 1, 1, ''),
(38, 37, '粉丝管理', 'mc', '', '', '', 0, 'url', 1, 1, 'mc_fans_manage'),
(39, 38, '粉丝分组', 'mc', './index.php?c=mc&a=fangroup&', '', '', 0, 'url', 1, 1, 'mc_fangroup'),
(40, 38, '粉丝', 'mc', './index.php?c=mc&a=fans&', '', '', 0, 'url', 1, 1, 'mc_fans'),
(41, 37, '会员中心', 'mc', '', '', '', 0, 'url', 1, 1, 'mc_members_manage'),
(42, 41, '会员中心关键字', 'mc', './index.php?c=platform&a=cover&do=mc&', '', '', 0, 'url', 1, 1, 'platform_cover_mc'),
(43, 41, '会员', 'mc', './index.php?c=mc&a=member', 'fa fa-plus', './index.php?c=mc&a=member&do=add', 0, 'url', 1, 1, 'mc_member'),
(44, 41, '会员组', 'mc', './index.php?c=mc&a=group&', '', '', 0, 'url', 1, 1, 'mc_group'),
(45, 37, '会员卡管理', 'mc', '', '', '', 0, 'url', 1, 1, 'mc_card_manage'),
(46, 45, '会员卡关键字', 'mc', './index.php?c=platform&a=cover&do=card&', '', '', 0, 'url', 1, 1, 'platform_cover_card'),
(47, 45, '会员卡管理', 'mc', './index.php?c=mc&a=card&do=manage', '', '', 0, 'url', 1, 1, 'mc_card_manage'),
(48, 45, '会员卡设置', 'mc', './index.php?c=mc&a=card&do=editor', '', '', 0, 'url', 1, 1, 'mc_card_editor'),
(49, 45, '会员卡其他功能', 'mc', './index.php?c=mc&a=card&do=other', '', '', 0, 'url', 1, 1, 'mc_card_other'),
(50, 37, '积分兑换', 'mc', '', '', '', 0, 'url', 1, 1, 'activity_discount_manage'),
(51, 50, '卡券兑换', 'mc', './index.php?c=activity&a=exchange&do=display&type=coupon', '', '', 0, 'url', 1, 1, 'activity_coupon_exchange'),
(94, 59, '卡券营销', 'mc', './index.php?c=activity&a=market', '', '', 0, 'url', 1, 1, 'activity_coupon_market'),
(55, 50, '真实物品兑换', 'mc', './index.php?c=activity&a=exchange&do=display&type=goods', '', '', 0, 'url', 1, 1, 'activity_goods_display'),
(56, 37, '微信素材&群发', 'mc', '', '', '', 0, 'url', 1, 1, 'material_manage'),
(57, 56, '素材&群发', 'mc', './index.php?c=material&a=display', '', '', 0, 'url', 1, 1, 'material_display'),
(58, 56, '定时群发', 'mc', './index.php?c=material&a=mass', '', '', 0, 'url', 1, 1, 'material_mass'),
(59, 37, '卡券管理', 'mc', '', '', '', 0, 'url', 1, 1, 'wechat_card_manage'),
(60, 59, '卡券列表', 'mc', './index.php?c=activity&a=coupon&do=display', '', '', 0, 'url', 1, 1, 'activity_coupon_display'),
(63, 37, '门店管理', 'mc', '', '', '', 0, 'url', 1, 1, 'activity_store_manage'),
(64, 63, '门店列表', 'mc', './index.php?c=activity&a=store', '', '', 0, 'url', 1, 1, 'activity_store_list'),
(65, 63, '店员列表', 'mc', './index.php?c=activity&a=clerk', '', '', 0, 'url', 1, 1, 'activity_clerk_list'),
(66, 37, '收银台', 'mc', '', '', '', 0, 'url', 1, 1, 'paycenter_manage'),
(67, 66, '微信刷卡收款', 'mc', './index.php?c=paycenter&a=wxmicro&do=pay', '', '', 0, 'url', 1, 1, 'paycenter_wxmicro_pay'),
(68, 66, '收银台关键字', 'mc', './index.php?c=platform&a=cover&do=clerk', '', '', 0, 'url', 1, 1, 'paycenter_clerk'),
(69, 37, '统计中心', 'mc', '', '', '', 0, 'url', 1, 1, 'stat_center'),
(70, 69, '会员积分统计', 'mc', './index.php?c=stat&a=credit1', '', '', 0, 'url', 1, 1, 'stat_credit1'),
(71, 69, '会员余额统计', 'mc', './index.php?c=stat&a=credit2', '', '', 0, 'url', 1, 1, 'stat_credit2'),
(72, 69, '会员现金消费统计', 'mc', './index.php?c=stat&a=cash', '', '', 0, 'url', 1, 1, 'stat_cash'),
(73, 69, '会员卡统计', 'mc', './index.php?c=stat&a=card', '', '', 0, 'url', 1, 1, 'stat_card'),
(74, 69, '收银台收款统计', 'mc', './index.php?c=stat&a=paycenter', '', '', 0, 'url', 1, 1, 'stat_paycenter'),
(75, 0, '功能选项', 'setting', '', 'fa fa-umbrella', '', 0, 'url', 1, 1, ''),
(76, 75, '公众号选项', 'setting', '', '', '', 0, 'url', 1, 1, 'account_setting'),
(77, 76, '支付参数', 'setting', './index.php?c=profile&a=payment&', '', '', 0, 'url', 1, 1, 'profile_payment'),
(78, 76, '借用 oAuth 权限', 'setting', './index.php?c=mc&a=passport&do=oauth&', '', '', 0, 'url', 1, 1, 'mc_passport_oauth'),
(79, 76, '借用 JS 分享权限', 'setting', './index.php?c=profile&a=jsauth&', '', '', 0, 'url', 1, 1, 'profile_jsauth'),
(80, 76, '会员字段管理', 'setting', './index.php?c=mc&a=fields', '', '', 0, 'url', 1, 1, 'mc_fields'),
(81, 76, '微信通知设置', 'setting', './index.php?c=mc&a=tplnotice', '', '', 0, 'url', 1, 1, 'mc_tplnotice'),
(82, 76, '工作台菜单设置', 'setting', './index.php?c=profile&a=deskmenu', '', '', 0, 'url', 1, 1, 'profile_deskmenu'),
(83, 76, '会员扩展功能', 'setting', './index.php?c=mc&a=plugin', '', '', 0, 'url', 1, 1, 'mc_plugin'),
(84, 75, '会员及粉丝选项', 'setting', '', '', '', 0, 'url', 1, 1, 'mc_setting'),
(85, 84, '积分设置', 'setting', './index.php?c=mc&a=credit&', '', '', 0, 'url', 1, 1, 'mc_credit'),
(86, 84, '注册设置', 'setting', './index.php?c=mc&a=passport&do=passport&', '', '', 0, 'url', 1, 1, 'mc_passport_passport'),
(87, 84, '粉丝同步设置', 'setting', './index.php?c=mc&a=passport&do=sync&', '', '', 0, 'url', 1, 1, 'mc_passport_sync'),
(88, 84, 'UC站点整合', 'setting', './index.php?c=mc&a=uc&', '', '', 0, 'url', 1, 1, 'mc_uc'),
(89, 84, '邮件通知参数', 'setting', './index.php?c=profile&a=notify', '', '', 0, 'url', 1, 1, 'profile_notify'),
(90, 75, '其他功能选项', 'setting', '', '', '', 0, 'url', 1, 1, 'others_setting'),
(91, 0, '扩展功能', 'ext', '', 'fa fa-cubes', '', 0, 'url', 1, 1, ''),
(92, 91, '管理', 'ext', '', '', '', 0, 'url', 1, 1, ''),
(93, 92, '扩展功能管理', 'ext', './index.php?c=profile&a=module&', '', '', 0, 'url', 1, 1, 'profile_module');

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_paylog`
--

CREATE TABLE IF NOT EXISTS `ims_core_paylog` (
  `plid` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `acid` int(10) NOT NULL,
  `openid` varchar(40) NOT NULL,
  `uniontid` varchar(64) NOT NULL,
  `tid` varchar(128) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `module` varchar(50) NOT NULL,
  `tag` varchar(2000) NOT NULL,
  `is_usecard` tinyint(3) unsigned NOT NULL,
  `card_type` tinyint(3) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `card_fee` decimal(10,2) unsigned NOT NULL,
  `encrypt_code` varchar(100) NOT NULL,
  PRIMARY KEY (`plid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_tid` (`tid`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `uniontid` (`uniontid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `ims_core_paylog`
--

INSERT INTO `ims_core_paylog` (`plid`, `type`, `uniacid`, `acid`, `openid`, `uniontid`, `tid`, `fee`, `status`, `module`, `tag`, `is_usecard`, `card_type`, `card_id`, `card_fee`, `encrypt_code`) VALUES
(1, '', 3, 3, '6', '', '1', '18.80', 0, 'ewei_shopping', '', 0, 0, '', '18.80', ''),
(2, '', 3, 3, '6', '', '2', '18.80', 0, 'ewei_shopping', '', 0, 0, '', '18.80', ''),
(3, 'wechat', 3, 3, '6', '2016070718434100001546429252', '3', '18.80', 0, 'ewei_shopping', '', 0, 0, '0', '18.80', ''),
(4, '', 3, 3, '2', '', '4', '18.80', 0, 'ewei_shopping', '', 0, 0, '', '18.80', ''),
(5, 'wechat', 3, 3, '6', '2016072020512100001586174668', '5', '163.00', 0, 'ewei_shopping', '', 0, 0, '0', '163.00', ''),
(6, '', 3, 3, '6', '', '6', '10.00', 0, 'ewei_shopping', '', 0, 0, '', '10.00', '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_performance`
--

CREATE TABLE IF NOT EXISTS `ims_core_performance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `runtime` varchar(10) NOT NULL,
  `runurl` varchar(512) NOT NULL,
  `runsql` varchar(512) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_queue`
--

CREATE TABLE IF NOT EXISTS `ims_core_queue` (
  `qid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `message` varchar(2000) NOT NULL,
  `params` varchar(1000) NOT NULL,
  `keyword` varchar(1000) NOT NULL,
  `response` varchar(2000) NOT NULL,
  `module` varchar(50) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`qid`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `module` (`module`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_resource`
--

CREATE TABLE IF NOT EXISTS `ims_core_resource` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `trunk` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `acid` (`uniacid`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_sendsms_log`
--

CREATE TABLE IF NOT EXISTS `ims_core_sendsms_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `createtime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_sessions`
--

CREATE TABLE IF NOT EXISTS `ims_core_sessions` (
  `sid` char(32) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `data` varchar(5000) NOT NULL,
  `expiretime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_core_sessions`
--

INSERT INTO `ims_core_sessions` (`sid`, `uniacid`, `openid`, `data`, `expiretime`) VALUES
('72a2205ea4ab754596af162a8cd40539', 3, '101.226.65.104', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"Pi4m";i:1469977899;}', 1469981499),
('702a9df97a00878a06bcea9b2a0a8d8e', 3, '117.136.88.23', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"RMXj";i:1469978364;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";', 1469981964),
('80ec315246b1f53d1f84bc022c0ff3bf', 3, '42.48.76.71', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"dccK";i:1469978850;s:4:"eH9h";i:1469978858;s:4:"d799";i:1469978866;s:4:"Nx52";i:1469978868;s:4:"fVv4";i:1469978870;s:4:"JxOd";i:1469978872;}dest_url|s:190:"http%3A%2F%2Fzhibo.huichong360.cn%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D19%26fd%3D368%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dsinglemessage%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s-6qUWT0jGqOBoJHNi3nqU8";oauth_acid|s:1:"5";openid|s:28:"oWHo2s-6qUWT0jGqOBoJHNi3nqU8";uid|s:1:"6";', 1469982472),
('b4f90ac36b0f24e59376372c629e9f82', 3, '101.226.99.195', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"rcR3";i:1469978951;}', 1469982551),
('4666ada4fca49b182dbd8cd0cc226d0a', 3, '101.226.99.197', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"NUxq";i:1469978975;}', 1469982575),
('56f0c1f6044a91dab941d1b61c99e94f', 3, '101.226.89.116', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"GUv9";i:1469978980;}', 1469982580),
('4f404070c39f3650bfb62fd5c3c0cb8e', 3, '101.226.65.106', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"u5pJ";i:1469978980;}', 1469982580),
('cc3af4a2e648db0146b8286158f651c9', 3, '101.226.65.106', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"EMsZ";i:1469978981;}', 1469982581),
('0b2e648a64c17e433b907410b3f9f7d2', 3, '180.153.205.254', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"Q8b8";i:1469978981;}', 1469982581),
('c8f0dc10e63ee07216b06b1256fa889f', 3, '101.226.69.246', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"JrUQ";i:1469978999;}', 1469982599),
('9618027c5eb99ee663429e28dcadb2d1', 3, '101.226.68.197', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"Ef2s";i:1469979011;}', 1469982611),
('a115ad222301040f383fd4bad469bbd9', 3, '101.226.99.195', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"wrRf";i:1469979014;}', 1469982614),
('042ac3f2956e122322790c96ec19661f', 3, '180.153.214.181', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"efAZ";i:1469979014;}', 1469982614),
('6210dde183dd5735553c3e1d7215c271', 3, '180.153.214.199', 'acid|s:1:"3";uniacid|i:3;token|a:2:{s:4:"NXMD";i:1469979016;s:4:"v8Bh";i:1469979016;}', 1469982616),
('63de3c5725344eb003a28c064f84011f', 3, '101.226.51.229', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"R4OG";i:1469979023;}', 1469982623),
('725851a49084e66cfb33267d98ad158c', 3, '180.153.206.24', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"eJj4";i:1469979024;}', 1469982624),
('d240457386229b590fd4c2a62409b6a9', 3, '101.226.33.204', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"QF0S";i:1469979029;}', 1469982629),
('d9f01e5180325b8dff6b5aa71a945804', 3, '101.226.69.246', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"BLy9";i:1469977504;}', 1469981104),
('0f5ddb29ebb0009d1c491c6dab648918', 3, '117.185.27.114', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"fbZM";i:1469977535;}', 1469981135),
('4780237c09b376324d683adfa5948e98', 3, '101.226.33.240', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"zi5U";i:1469977604;}', 1469981204),
('d92a3cc257457fa910eaad465cbe186f', 3, '101.226.65.104', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"MuyA";i:1469977614;}', 1469981214),
('501a79ed16f11cd75d4536de1b69218d', 3, '117.185.27.114', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"nNZC";i:1469977840;}', 1469981440),
('c47bba10668288e279d7967dc39bf034', 5, '101.226.33.217', 'acid|s:1:"5";uniacid|i:5;token|a:1:{s:4:"Ja1q";i:1469977876;}', 1469981476),
('f7250ed1422ceee4d43d68a323d2de5d', 5, '101.226.89.119', 'acid|s:1:"5";uniacid|i:5;token|a:1:{s:4:"AlFF";i:1469977876;}', 1469981476),
('6912edf719051fe39d545d9c926655de', 3, '175.0.66.240', 'acid|s:1:"3";uniacid|i:3;token|a:5:{s:4:"NaRV";i:1469977878;s:4:"YjJ7";i:1469977878;s:4:"Nt0L";i:1469977880;s:4:"cvVJ";i:1469977895;s:4:"h2d2";i:1469977897;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2swVVwIGz_Jnadm7MdZAoX3U";oauth_acid|s:1:"5";openid|s:28:"oWHo2swVVwIGz_Jnadm7MdZAoX3U";userinfo|s:720:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3dWVndJR3pfSm5hZG03TWRaQW9YM1UiO3M6ODoibmlja25hbWUiO3M6NzoiQ+S4q+WktCI7czozOiJzZXgiO2k6MjtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi6ZW/5rKZIjtzOjg6InByb3ZpbmNlIjtzOjY6Iua5luWNlyI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMzE6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vZTNSdmRKVmpyZDl5NVVsRkNNMUhjOE1Mc1JUWTJXbUxKbkZzemlhZUNsYWc2dVlpYkJ4ZmlheXJVWER3bjc1VjVZeERrU0JpYjFZVHNGN1l1dWt0YTRRaWFKemR1RURnNmFkWFcvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMxOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2UzUnZkSlZqcmQ5eTVVbEZDTTFIYzhNTHNSVFkyV21MSm5Gc3ppYWVDbGFnNnVZaWJCeGZpYXlyVVhEd243NVY1WXhEa1NCaWIxWVRzRjdZdXVrdGE0UWlhSnpkdUVEZzZhZFhXLzEzMiI7fQ==";uid|s:2:"85";', 1469981497),
('0cf73297a4bb1fc5edc947325923c5d3', 3, '42.48.76.71', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"vNQN";i:1469977383;s:4:"wr3g";i:1469977384;s:4:"o5YJ";i:1469977384;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s_AaKqd4TVHh6VlcBEARI9I";oauth_acid|s:1:"5";openid|s:28:"oWHo2s_AaKqd4TVHh6VlcBEARI9I";', 1469980984),
('f1fd44703013770ff60121ccc31a8ddb', 3, '175.0.107.69', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"hfFB";i:1469977815;s:4:"mk9i";i:1469977816;s:4:"pTyJ";i:1469977816;s:4:"E4OY";i:1469977817;s:4:"Okzl";i:1469977818;s:4:"mpOH";i:1469977876;}dest_url|s:156:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26listid%3D23%26topenid%3DoWHo2s2nESiy7Z5EkLnUWa5Z5MSM%26do%3Doauth_give%26m%3Dmeepo_online";oauth_openid|s:28:"oWHo2s2nESiy7Z5EkLnUWa5Z5MSM";oauth_acid|s:1:"5";openid|s:28:"oWHo2s2nESiy7Z5EkLnUWa5Z5MSM";userinfo|s:856:"YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzMm5FU2l5N1o1RWtMblVXYTVaNU1TTSI7czo4OiJuaWNrbmFtZSI7czo2OiLliJjliJgiO3M6Mzoic2V4IjtpOjI7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumVv+aymSI7czo4OiJwcm92aW5jZSI7czo2OiLmuZbljZciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTM1OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2lhUTVPQ0liVWdWVzg0R0ZpY0xBSjFXejZJcTd3WktOZFNpYUYzV1doS3hEbnAzM2xxc2N1eFR3MHNyaWExSjRxV0x5emliNGNBUnpQNlZndGljRkFpYVlzWjVpY0lFZzVCeW5EOElpYi8xMzIiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE0NTkzNDQ2NDA7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e31zOjY6ImF2YXRhciI7czoxMzU6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vaWFRNU9DSWJVZ1ZXODRHRmljTEFKMVd6NklxN3daS05kU2lhRjNXV2hLeERucDMzbHFzY3V4VHcwc3JpYTFKNHFXTHl6aWI0Y0FSelA2Vmd0aWNGQWlhWXNaNWljSUVnNUJ5bkQ4SWliLzEzMiI7fQ==";', 1469981476),
('6d3a5a0a035c9c9353425639a162f304', 3, '58.47.236.194', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"YY63";i:1469976493;s:4:"JlfO";i:1469976494;s:4:"eIr3";i:1469976494;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s4-NVMliyskNLxncuMiRkEs";oauth_acid|s:1:"5";openid|s:28:"oWHo2s4-NVMliyskNLxncuMiRkEs";', 1469980094),
('42f7be5571ae0f448ca6054820fe3aaa', 3, '223.150.15.191', 'acid|s:1:"3";uniacid|i:3;token|a:5:{s:4:"wgad";i:1469976851;s:4:"JtQx";i:1469976851;s:4:"n219";i:1469976853;s:4:"seAI";i:1469976856;s:4:"MZzJ";i:1469976857;}dest_url|s:209:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dgroupmessage%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s3pRCyLvvxZCIntABG9NF9k";oauth_acid|s:1:"5";openid|s:28:"oWHo2s3pRCyLvvxZCIntABG9NF9k";userinfo|s:712:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczNwUkN5THZ2eFpDSW50QUJHOU5GOWsiO3M6ODoibmlja25hbWUiO3M6OToi55Sr5LmL6L2pIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLluLjlvrciO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyNzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RINDJYR2VueEFwOUVCMjd1NFZpYkpKbXBRTVkyWlcxUEVNYmVtYzMwZWFjOHNaV0t0emZzbWhxa2w5cU43MUJmUGg3Y21WN0lxZ0x2SmtDSWg5dERBeDRzLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEyNzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RINDJYR2VueEFwOUVCMjd1NFZpYkpKbXBRTVkyWlcxUEVNYmVtYzMwZWFjOHNaV0t0emZzbWhxa2w5cU43MUJmUGg3Y21WN0lxZ0x2SmtDSWg5dERBeDRzLzEzMiI7fQ==";uid|s:2:"82";', 1469980457),
('5d6567f3b9a6943b2cea9d053df39d31', 3, '123.68.193.125', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"W2lV";i:1469977316;s:4:"JEOV";i:1469977317;s:4:"pc1b";i:1469977321;s:4:"tg3T";i:1469977322;s:4:"XRR7";i:1469977341;s:4:"H554";i:1469977345;}dest_url|s:162:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26do%3Dindex%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s4i_fVLvpZGqUo-0x6w2afY";oauth_acid|s:1:"5";openid|s:28:"oWHo2s4i_fVLvpZGqUo-0x6w2afY";userinfo|s:704:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczRpX2ZWTHZwWkdxVW8tMHg2dzJhZlkiO3M6ODoibmlja25hbWUiO3M6OToi5byg546y5a2QIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czowOiIiO3M6ODoicHJvdmluY2UiO3M6MDoiIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RINGxkemZ6TzVZZkt4Q0RtVHFnWndiNlljRm9hSGhUUjY5dWFZaWJoRUVDRDU0OXpMUjBFUDRBTE4zaWNpY0hkaklMTmJlZ1A3MkRkaWI2WGlhWVllc2VVM1JQWS8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzE6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4velluUlRKd09ESDRsZHpmek81WWZLeENEbVRxZ1p3YjZZY0ZvYUhoVFI2OXVhWWliaEVFQ0Q1NDl6TFIwRVA0QUxOM2ljaWNIZGpJTE5iZWdQNzJEZGliNlhpYVlZZXNlVTNSUFkvMTMyIjt9";uid|s:2:"83";', 1469980945),
('03bb07c234eca29c0df0499515f5a213', 3, '175.9.69.47', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"Dw77";i:1469979855;}dest_url|s:177:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26id%3D1%26do%3Ddetail%26m%3Dnews%26wxref%3Dmp.weixin.qq.com%26u%3D2%26from%3Dsinglemessage%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2swXfZtPilUuK2OhTCtnbTD4";oauth_acid|s:1:"5";openid|s:28:"oWHo2swXfZtPilUuK2OhTCtnbTD4";userinfo|s:840:"YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzd1hmWnRQaWxVdUsyT2hUQ3RuYlRENCI7czo4OiJuaWNrbmFtZSI7czo2OiLog6HliJsiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumVv+aymSI7czo4OiJwcm92aW5jZSI7czo2OiLmuZbljZciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMwOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2UzUnZkSlZqcmQ5eTVVbEZDTTFIY3lVb1dHamU3eVJyUkc4Mk9UbGFLbUJaaWNSdTV3aDcxV3dNelEwaWM3RU5RRmlhN21pYmdCRHhPYXlMZHVrNkVUYjdOUHNKRElscEJOaHAvMTMyIjtzOjE0OiJzdWJzY3JpYmVfdGltZSI7aToxNDQzMzU5MDcwO3M6NjoicmVtYXJrIjtzOjA6IiI7czo3OiJncm91cGlkIjtpOjA7czoxMDoidGFnaWRfbGlzdCI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMwOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2UzUnZkSlZqcmQ5eTVVbEZDTTFIY3lVb1dHamU3eVJyUkc4Mk9UbGFLbUJaaWNSdTV3aDcxV3dNelEwaWM3RU5RRmlhN21pYmdCRHhPYXlMZHVrNkVUYjdOUHNKRElscEJOaHAvMTMyIjt9";', 1469983455),
('e3d664d2e15c4524a86d1c4b8eb24da4', 3, '113.215.2.40', 'acid|s:1:"3";uniacid|i:3;token|a:4:{s:4:"U5PX";i:1469975995;s:4:"VbZ6";i:1469975995;s:4:"CLLc";i:1469975996;s:4:"P8q3";i:1469976001;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s5zUTQpqE2-OtDnU473VdeA";oauth_acid|s:1:"5";openid|s:28:"oWHo2s5zUTQpqE2-OtDnU473VdeA";', 1469979601),
('8d55b2c197cca3b5da7d16c2b750b671', 3, '180.153.212.13', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"FoOq";i:1469976132;}', 1469979732),
('3586c2343f1ed6dbd50018372a5a1e69', 3, 'of08Mw0yg4IvIlrUI4V07nO7wf_w', 'openid|s:28:"of08Mw0yg4IvIlrUI4V07nO7wf_w";', 1469979788),
('183022c06cd90aa80d6ac9d72b4a0db2', 3, '42.48.236.250', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"rddM";i:1469976283;s:4:"L3kT";i:1469976283;s:4:"lXxd";i:1469976284;s:4:"V0S2";i:1469976286;s:4:"KRrZ";i:1469976287;s:4:"yC7i";i:1469976498;}dest_url|s:209:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dgroupmessage%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s-EYif7C81ZXHvPQ4b4bo4Q";oauth_acid|s:1:"5";openid|s:28:"oWHo2s-EYif7C81ZXHvPQ4b4bo4Q";userinfo|s:720:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8ycy1FWWlmN0M4MVpYSHZQUTRiNGJvNFEiO3M6ODoibmlja25hbWUiO3M6OToi6LCt5pm65LitIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lM1J2ZEpWanJkOXk1VWxGQ00xSGM4R3o4S3dWZFphNjUwVThsMVZYaWFZb2pDUE1uOUlhUG9mcGljOFdjZmRjaWN4NGRwZzYwMmRuOG5OaGRnaWFhWDJIczJEWWxhdTlRcmo1LzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lM1J2ZEpWanJkOXk1VWxGQ00xSGM4R3o4S3dWZFphNjUwVThsMVZYaWFZb2pDUE1uOUlhUG9mcGljOFdjZmRjaWN4NGRwZzYwMmRuOG5OaGRnaWFhWDJIczJEWWxhdTlRcmo1LzEzMiI7fQ==";uid|s:2:"81";', 1469980098),
('9710ee518be7aee54894dfc1a0a83e5e', 3, '61.187.51.166', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"FnwX";i:1469975983;s:4:"v03L";i:1469975991;s:4:"zJjG";i:1469975995;s:4:"pLmg";i:1469976000;s:4:"yHJO";i:1469976005;s:4:"dwwl";i:1469976018;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2syTJDVmeY-Z8N34Ik8tLzNs";oauth_acid|s:1:"5";openid|s:28:"oWHo2syTJDVmeY-Z8N34Ik8tLzNs";', 1469979618),
('6fda38ca27afd23c4a9f349776155fbf', 3, '14.17.43.100', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"YnTr";i:1469975936;}dest_url|s:96:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26do%3Dindex%26m%3Dmeepo_online";', 1469979536),
('bea17b9df08b0bf52c682c0a167d6bfa', 3, '113.246.232.60', 'acid|s:1:"3";uniacid|i:3;token|a:5:{s:4:"jB11";i:1469975957;s:4:"i35P";i:1469975957;s:4:"ny45";i:1469975958;s:4:"hFEy";i:1469975961;s:4:"Uw03";i:1469975962;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2szYX1tPKAT3lZZLxQ5F9B9A";oauth_acid|s:1:"5";openid|s:28:"oWHo2szYX1tPKAT3lZZLxQ5F9B9A";userinfo|s:712:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3pZWDF0UEtBVDNsWlpMeFE1RjlCOUEiO3M6ODoibmlja25hbWUiO3M6Njoi6L6J54WMIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyOToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lM1J2ZEpWanJkaWJsamhOQWpwVEwyNXJRUDAwenEyZ2NwNU9aYWY4R2x6eFBOOUlhcXBQYndVOVZ3TEpZOHdJaWJJR25pY1RZR2pFTk9lSzFOZUVYcFZmYVB6Wk9YV0FGUFMvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTI5OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2UzUnZkSlZqcmRpYmxqaE5BanBUTDI1clFQMDB6cTJnY3A1T1phZjhHbHp4UE45SWFxcFBid1U5VndMSlk4d0lpYklHbmljVFlHakVOT2VLMU5lRVhwVmZhUHpaT1hXQUZQUy8xMzIiO30=";uid|s:2:"79";', 1469979562),
('50e8ad887bcc82e457c404babe082e65', 3, '180.153.206.17', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"MhyF";i:1469870843;}', 1469874443),
('bcd120d51724ca39a42035f870c34087', 3, 'of08Mw1y3od2iT4fX7xlaRvnihM4', 'openid|s:28:"of08Mw1y3od2iT4fX7xlaRvnihM4";', 1470102327),
('cd1fc3eed062631f8526e1cd1d64d78a', 3, '42.48.76.50', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"pb7j";i:1469880681;s:4:"z9GE";i:1469880683;s:4:"hSz6";i:1469880688;s:4:"gunj";i:1469880694;s:4:"o69t";i:1469880699;s:4:"S7xU";i:1469880700;}dest_url|s:74:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26eid%3D1";oauth_openid|s:28:"oWHo2s_AaKqd4TVHh6VlcBEARI9I";oauth_acid|s:1:"5";openid|s:28:"oWHo2s_AaKqd4TVHh6VlcBEARI9I";', 1469884300),
('8fdfa8cb09e4814a574f6387eb1affce', 3, '49.220.117.38', 'acid|s:1:"3";uniacid|i:3;token|a:4:{s:4:"vcwP";i:1469870564;s:4:"N7w0";i:1469870565;s:4:"ldzd";i:1469870566;s:4:"daQQ";i:1469870582;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D592%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s0gitP2JzcpxmQB-O0y9k_c";oauth_acid|s:1:"5";openid|s:28:"oWHo2s0gitP2JzcpxmQB-O0y9k_c";', 1469874182),
('3f354088e4d0783e55b68c9d3d933d5d', 3, '101.226.33.216', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"exkJ";i:1469870740;}', 1469874340),
('f703eeadd2725b253bd431088581b3e7', 3, '180.163.2.117', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"GMOQ";i:1469870744;}', 1469874344),
('3c53fc339ec262d932f7cb725e2a013b', 3, '112.90.82.196', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"B9rV";i:1469871125;}', 1469874725),
('683d52703133bd557f5ddf295155194f', 3, '42.48.76.50', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"KwRN";i:1469872207;}dest_url|s:74:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26eid%3D1";oauth_openid|s:28:"oWHo2s1rKD9SutcL7Yh9Sbi47ma4";oauth_acid|s:1:"5";openid|s:28:"oWHo2s1rKD9SutcL7Yh9Sbi47ma4";uid|s:1:"2";', 1469875807),
('c848763f397ada61f7ba3fb3971bbdaf', 3, '110.53.205.3', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"JNoC";i:1469871969;s:4:"km4f";i:1469871969;s:4:"K5H3";i:1469871970;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D592%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2sw_h47SboALCMs3NaeDSfFw";oauth_acid|s:1:"5";openid|s:28:"oWHo2sw_h47SboALCMs3NaeDSfFw";', 1469875570),
('3dafe09fc3155cad7d34a9c643e9ab7b', 3, '183.237.133.12', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"hcf5";i:1469871620;s:4:"P19n";i:1469871621;s:4:"yzQ4";i:1469871621;}dest_url|s:209:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dgroupmessage%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2swDGztqXimb9_FmhIWtjTsE";oauth_acid|s:1:"5";openid|s:28:"oWHo2swDGztqXimb9_FmhIWtjTsE";', 1469875221),
('fd798eeb52a4caac89169cbd655155d7', 3, '218.108.128.203', 'acid|s:1:"3";uniacid|i:3;token|a:4:{s:4:"MK8E";i:1469871652;s:4:"S70X";i:1469871652;s:4:"o7k3";i:1469871653;s:4:"ALj8";i:1469871658;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D591%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s5P2OFJ8xSuJjPUm5wCnyNY";oauth_acid|s:1:"5";openid|s:28:"oWHo2s5P2OFJ8xSuJjPUm5wCnyNY";', 1469875258),
('6b48d3943ccecc03cb981c9078ab7860', 3, '220.202.152.16', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"ClfW";i:1469872113;s:4:"D5P1";i:1469872114;s:4:"d76R";i:1469872115;}dest_url|s:128:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26do%3Ddetail%26m%3Dmeepo_online";oauth_openid|s:28:"oWHo2s-6qUWT0jGqOBoJHNi3nqU8";oauth_acid|s:1:"5";openid|s:28:"oWHo2s-6qUWT0jGqOBoJHNi3nqU8";uid|s:1:"6";', 1469875715),
('032db58bef79aeb1de79721d1582f335', 3, '175.11.67.66', 'acid|s:1:"3";uniacid|i:3;token|a:5:{s:4:"g9hD";i:1469873303;s:4:"EYWS";i:1469873303;s:4:"VRt4";i:1469873304;s:4:"UUPb";i:1469873306;s:4:"btz1";i:1469873307;}dest_url|s:155:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26do%3Ddetail%26m%3Dmeepo_online%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s4xDvpBhQkv4etF1PNL56ss";oauth_acid|s:1:"5";openid|s:28:"oWHo2s4xDvpBhQkv4etF1PNL56ss";userinfo|s:720:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczR4RHZwQmhRa3Y0ZXRGMVBOTDU2c3MiO3M6ODoibmlja25hbWUiO3M6MTA6IuiFiuaciOaXpS4iO3M6Mzoic2V4IjtpOjI7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumVv+aymSI7czo4OiJwcm92aW5jZSI7czo2OiLmuZbljZciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMwOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL0tuVWtCMzA2Znc2c01STGN6TkFyTWg1aWNEQ2liZDBkd3ZPeHVHWG5oTjgyd1IxekdrY1RqZDFSbFVnSnBpYWx0UlVac0s1ZTJYclpCV2dic1VlVkJYZmpaRjlSU0p1aWJDcDMvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMwOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL0tuVWtCMzA2Znc2c01STGN6TkFyTWg1aWNEQ2liZDBkd3ZPeHVHWG5oTjgyd1IxekdrY1RqZDFSbFVnSnBpYWx0UlVac0s1ZTJYclpCV2dic1VlVkJYZmpaRjlSU0p1aWJDcDMvMTMyIjt9";uid|s:2:"73";', 1469876907),
('8e64b6fc5a1cbdfeb39bb341f80a09a9', 3, '113.240.137.21', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"oWvA";i:1469873429;s:4:"rPga";i:1469873430;s:4:"zJJH";i:1469873431;}dest_url|s:128:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26do%3Ddetail%26m%3Dmeepo_online";oauth_openid|s:28:"oWHo2s_Yc0gB8jVWVMZSdud2wyVA";oauth_acid|s:1:"5";openid|s:28:"oWHo2s_Yc0gB8jVWVMZSdud2wyVA";', 1469877031),
('e91a6b28d007db7d55fd5e1d55fcb6b2', 3, '175.10.51.92', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"zY7v";i:1469874989;s:4:"f4Hy";i:1469874990;s:4:"JEx4";i:1469874990;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D592%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2swqxxBO-h6F7arZOTBRkDI8";oauth_acid|s:1:"5";openid|s:28:"oWHo2swqxxBO-h6F7arZOTBRkDI8";', 1469878590),
('1054638feecf290368cba15f5cf1ad16', 3, '106.19.60.207', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"RM33";i:1469875881;s:4:"T95A";i:1469875881;s:4:"mCYG";i:1469875882;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D591%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s1rKD9SutcL7Yh9Sbi47ma4";oauth_acid|s:1:"5";openid|s:28:"oWHo2s1rKD9SutcL7Yh9Sbi47ma4";uid|s:1:"2";', 1469879482),
('dad9678f34974b4e9364924f2799d3ad', 3, '58.20.20.153', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"X533";i:1469876690;s:4:"pZxE";i:1469876690;s:4:"skL2";i:1469876691;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s58LFBCjMk9lHiaJmmyh7lI";oauth_acid|s:1:"5";openid|s:28:"oWHo2s58LFBCjMk9lHiaJmmyh7lI";', 1469880291),
('9541d7b7a3474612e1c9b8f9f0ad6b18', 3, '111.22.4.50', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"mhK5";i:1469876804;s:4:"m8E5";i:1469876805;s:4:"y6n0";i:1469876807;}dest_url|s:209:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dgroupmessage%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2szL4xk8X4P6RoRoV6AUjm2g";oauth_acid|s:1:"5";openid|s:28:"oWHo2szL4xk8X4P6RoRoV6AUjm2g";', 1469880407),
('2edf3b2a49caa421b7bca4f96c5620fd', 3, '175.10.192.175', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"HgDX";i:1469877947;s:4:"Fj7g";i:1469877948;s:4:"EITI";i:1469877949;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D543%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s1Du6zW_u3FjJaT94vKwVmE";oauth_acid|s:1:"5";openid|s:28:"oWHo2s1Du6zW_u3FjJaT94vKwVmE";', 1469881549),
('abe4dd9333c1af1619d67b25dbecfe22', 3, '106.19.60.207', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"WdE0";i:1469878782;s:4:"T1W3";i:1469878783;s:4:"Oisq";i:1469878786;s:4:"eRfz";i:1469878792;s:4:"mfFF";i:1469878793;s:4:"mbCf";i:1469879037;}dest_url|s:74:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26eid%3D1";oauth_openid|s:28:"oWHo2s1rKD9SutcL7Yh9Sbi47ma4";oauth_acid|s:1:"5";openid|s:28:"oWHo2s1rKD9SutcL7Yh9Sbi47ma4";uid|s:1:"2";', 1469882637),
('335a55969d3c1c290440b593fa2dfb37', 3, '111.22.89.13', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"uolC";i:1469879549;s:4:"JP1n";i:1469879549;s:4:"IhaA";i:1469879550;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D592%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2sxLScTeJ0UNYuErnNd9e_g4";oauth_acid|s:1:"5";openid|s:28:"oWHo2sxLScTeJ0UNYuErnNd9e_g4";', 1469883150),
('6cd91b006888a1bb1c8b806662e3d986', 3, '111.23.149.115', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"w9L3";i:1469881652;s:4:"H2W1";i:1469881653;s:4:"gVcU";i:1469881654;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D543%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s3uI3YInyfLZ6IA8o49257I";oauth_acid|s:1:"5";openid|s:28:"oWHo2s3uI3YInyfLZ6IA8o49257I";uid|s:2:"41";', 1469885254),
('38e623ac97b6673c8ae39c099ea3173c', 3, '175.0.107.69', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"Qgx2";i:1469883429;}', 1469887029),
('0b04ebc949166c06b81ae96997d81bbd', 3, '175.4.117.199', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"uscM";i:1469890512;s:4:"i01N";i:1469890513;s:4:"I1vs";i:1469890516;s:4:"ZKi3";i:1469890516;s:4:"kv85";i:1469890554;s:4:"FsjM";i:1469890777;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D592%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s6R5f2R_RQmqz1D0Ul86_BU";oauth_acid|s:1:"5";openid|s:28:"oWHo2s6R5f2R_RQmqz1D0Ul86_BU";userinfo|s:724:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczZSNWYyUl9SUW1xejFEMFVsODZfQlUiO3M6ODoibmlja25hbWUiO3M6MTI6IuS6kea3oemjjua4hSI7czozOiJzZXgiO2k6MjtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi6ZW/5rKZIjtzOjg6InByb3ZpbmNlIjtzOjY6Iua5luWNlyI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMzA6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vaWNIcm5kSDZKQjRPcFlLNlp5eGlhTjBVMFZEc2hjZlJueWU4aWNqQ29HZHpKTUFQekdaYmcwTWFuWEVVbUFhVDJ0WmFwT3p6TEFkaktpYXo3M0JsZ2Zyb095SjlVUEg3dkVnai8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzA6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vaWNIcm5kSDZKQjRPcFlLNlp5eGlhTjBVMFZEc2hjZlJueWU4aWNqQ29HZHpKTUFQekdaYmcwTWFuWEVVbUFhVDJ0WmFwT3p6TEFkaktpYXo3M0JsZ2Zyb095SjlVUEg3dkVnai8xMzIiO30=";uid|s:2:"74";', 1469894377),
('f35af6e6494a4d7cd148cf5551df6df9', 3, '175.22.13.0', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"h6do";i:1469891721;s:4:"Lw74";i:1469891730;s:4:"IKnt";i:1469891732;s:4:"J62C";i:1469892015;s:4:"UWtl";i:1469892016;s:4:"eEp0";i:1469892021;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D508%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s5ibUGhmAyi1L7yM50F7Qq0";oauth_acid|s:1:"5";openid|s:28:"oWHo2s5ibUGhmAyi1L7yM50F7Qq0";userinfo|s:716:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczVpYlVHaG1BeWkxTDd5TTUwRjdRcTAiO3M6ODoibmlja25hbWUiO3M6Njoi6Zye6ZyeIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RINGxkemZ6TzVZZktpYzZOVm5lSlVlUXNpYjVpYlZwN1NUQ2ljTHFUSnQ5c0txcWJIUUJZZ2VFbFRVd3Jwcko5VjM3b2QzTFZFYnozdmlhY1JlazdUUXBmUU1mVS8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzE6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4velluUlRKd09ESDRsZHpmek81WWZLaWM2TlZuZUpVZVFzaWI1aWJWcDdTVENpY0xxVEp0OXNLcXFiSFFCWWdlRWxUVXdycHJKOVYzN29kM0xWRWJ6M3ZpYWNSZWs3VFFwZlFNZlUvMTMyIjt9";uid|s:2:"75";', 1469895621),
('0660fdb318b17f3a82fdb22af8515e99', 3, '101.226.33.220', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"mcm6";i:1469891906;}', 1469895506),
('043175ed184df61f60e270df212c28a1', 3, '101.226.65.102', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"U428";i:1469891908;}', 1469895508),
('bbcd4e2b45fa2a3a71cce7f39b365ee5', 3, '111.23.133.190', 'acid|s:1:"3";uniacid|i:3;token|a:2:{s:4:"HgrN";i:1469894899;s:4:"fiKi";i:1469894899;}dest_url|s:128:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26do%3Ddetail%26m%3Dmeepo_online";oauth_openid|s:28:"oWHo2symLLpFYIGRq19L803u-IpI";oauth_acid|s:1:"5";openid|s:28:"oWHo2symLLpFYIGRq19L803u-IpI";', 1469898499),
('461e9fdd5a846d05a547dae641051f43', 3, '101.226.33.219', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"JCcE";i:1469895085;}', 1469898685),
('15d56ed0a463a043f119f5e7f8dfa636', 0, '42.156.251.188', 'acid|N;uniacid|i:0;token|a:1:{s:4:"fc9E";i:1469926380;}', 1469929980),
('4c826ef3c94ebedcd7cf359cd842b86a', 3, '175.13.58.52', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"nnZ7";i:1469934286;s:4:"dMXa";i:1469934286;s:4:"Mf43";i:1469934288;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s21w-XzXctOP8vbf8mbWhh8";oauth_acid|s:1:"5";openid|s:28:"oWHo2s21w-XzXctOP8vbf8mbWhh8";uid|s:2:"53";', 1469937888),
('15422328e773ae953011bf296548b9cc', 3, '180.153.214.152', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"YLLr";i:1469934473;}', 1469938073),
('a2444f466e15e2aa3ddc63e910a779f4', 3, '119.147.146.189', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"Oq2n";i:1469935102;}', 1469938702),
('bc8de207581cb5114151b167355c158b', 3, '42.48.76.71', 'acid|s:1:"3";uniacid|i:3;token|a:5:{s:4:"TT3T";i:1469936318;s:4:"A926";i:1469936319;s:4:"Zpe3";i:1469936320;s:4:"nxvs";i:1469936326;s:4:"IyBg";i:1469936333;}dest_url|s:74:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26eid%3D1";oauth_openid|s:28:"oWHo2s_AaKqd4TVHh6VlcBEARI9I";oauth_acid|s:1:"5";openid|s:28:"oWHo2s_AaKqd4TVHh6VlcBEARI9I";', 1469939933),
('6d3a5799c6c537799ee56a6c12ac4ec1', 3, '101.226.68.197', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"iTXs";i:1469936506;}', 1469940106),
('f5b8265f76bfb52c4bfde891698719fa', 3, '175.13.90.159', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"GK3I";i:1469942209;s:4:"i92L";i:1469942210;s:4:"dG74";i:1469942213;}dest_url|s:209:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dgroupmessage%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s39TDwCgsnN-XhDwmExwYq0";oauth_acid|s:1:"5";openid|s:28:"oWHo2s39TDwCgsnN-XhDwmExwYq0";', 1469945813),
('dac8a92856909f86b63db287a00df046', 3, '42.48.76.71', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"qMy9";i:1469943453;s:4:"Go9P";i:1469943454;s:4:"fFUZ";i:1469943456;}dest_url|s:128:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26do%3Ddetail%26m%3Dmeepo_online";oauth_openid|s:28:"oWHo2s_AaKqd4TVHh6VlcBEARI9I";oauth_acid|s:1:"5";openid|s:28:"oWHo2s_AaKqd4TVHh6VlcBEARI9I";', 1469947056),
('68a64dca7d068cde90415ded426433d2', 3, '101.226.64.174', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"vDh5";i:1469959190;}', 1469962790),
('d406395386d02a6b2bfcb7c0d9c328f4', 3, '175.0.107.69', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"oc1k";i:1469979864;}dest_url|s:74:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26eid%3D1";oauth_openid|s:28:"oWHo2s1rKD9SutcL7Yh9Sbi47ma4";oauth_acid|s:1:"5";openid|s:28:"oWHo2s1rKD9SutcL7Yh9Sbi47ma4";uid|s:1:"2";', 1469983464),
('acaf7895bce93891b5180785a16ce119', 3, '101.226.233.142', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"vTAa";i:1469972163;}dest_url|s:139:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online";', 1469975763),
('5d1f699ca4989c0373834cf24f66af33', 3, '118.250.84.247', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"mkZe";i:1469974175;s:4:"eOS6";i:1469974176;s:4:"vd7u";i:1469974177;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s_df_yoCd2-Q-KjFHF4skRg";oauth_acid|s:1:"5";openid|s:28:"oWHo2s_df_yoCd2-Q-KjFHF4skRg";', 1469977777),
('befce28e0c66b8a03d541d6bee32a00d', 3, '175.13.252.54', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"JjE2";i:1469972210;s:4:"J0QE";i:1469972210;s:4:"cVVS";i:1469972211;}dest_url|s:209:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dgroupmessage%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s-G1ujIBQJ9ecazDQTQTeFc";oauth_acid|s:1:"5";openid|s:28:"oWHo2s-G1ujIBQJ9ecazDQTQTeFc";', 1469975811),
('84c944a0e4dde8bc544514e026cf9413', 3, '111.22.4.160', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"R7uu";i:1469972298;s:4:"qC61";i:1469972299;s:4:"B80A";i:1469972299;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s0rGzD-IQMgfC_FsOWJWPo8";oauth_acid|s:1:"5";openid|s:28:"oWHo2s0rGzD-IQMgfC_FsOWJWPo8";uid|s:2:"61";', 1469975899),
('a1695bae7a453d6e8e022b7c7a95401c', 3, '101.226.68.213', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"NN0K";i:1469972337;}', 1469975937),
('0fdfd7dc51f58e540b07c4f5b506405c', 3, '140.207.185.111', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"aZXD";i:1469972341;}', 1469975941),
('362ecdde45aacdaa1188adc0b9941195', 3, '180.153.206.17', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"H2yW";i:1469972389;}', 1469975989),
('33283108a5e52bde25c77a7e4f7daa1b', 3, '101.226.99.196', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"EK88";i:1469972465;}', 1469976065),
('8ad74b0900aa4f50f6fd2a2491af09d4', 3, '101.130.71.157', 'acid|s:1:"3";uniacid|i:3;token|a:5:{s:4:"ROeJ";i:1469973075;s:4:"X2Yg";i:1469973076;s:4:"gL32";i:1469973077;s:4:"XheH";i:1469973080;s:4:"Hryp";i:1469973081;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2szQ0Ord-yPB8ZkOMLb_cbSM";oauth_acid|s:1:"5";openid|s:28:"oWHo2szQ0Ord-yPB8ZkOMLb_cbSM";userinfo|s:716:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3pRME9yZC15UEI4WmtPTUxiX2NiU00iO3M6ODoibmlja25hbWUiO3M6Njoi5a6B6aaZIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lM1J2ZEpWanJkOXk1VWxGQ00xSGM4SUdyUGlhVDNveGQzdlNubTVuaWFjRGlib0VEWkZDZk9PMURuVmhjWDFQelh5UUQ1aWFnMU1uWERoYjA1dDZnemZrd2lhT0dYcHl6VFBPRy8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzE6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vZTNSdmRKVmpyZDl5NVVsRkNNMUhjOElHclBpYVQzb3hkM3ZTbm01bmlhY0RpYm9FRFpGQ2ZPTzFEblZoY1gxUHpYeVFENWlhZzFNblhEaGIwNXQ2Z3pma3dpYU9HWHB5elRQT0cvMTMyIjt9";uid|s:2:"76";', 1469976681),
('315c5b9d053ef7098cc5043ecd032c5b', 3, '58.20.82.203', 'acid|s:1:"3";uniacid|i:3;token|a:5:{s:4:"u8B0";i:1469973227;s:4:"qxBw";i:1469973227;s:4:"RlLL";i:1469973228;s:4:"REjk";i:1469973230;s:4:"gMxy";i:1469973231;}dest_url|s:155:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26do%3Ddetail%26m%3Dmeepo_online%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s7OQnV3V1aVVjHx320c6Vdc";oauth_acid|s:1:"5";openid|s:28:"oWHo2s7OQnV3V1aVVjHx320c6Vdc";userinfo|s:720:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczdPUW5WM1YxYVZWakh4MzIwYzZWZGMiO3M6ODoibmlja25hbWUiO3M6OToi6KiA6KW/5pepIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLlqITlupUiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9pYVE1T0NJYlVnVlc4NEdGaWNMQUoxV2liZnlNb2c2bTZzQWhldHQ4TDFRSldZcWljWWdKUmtmakU1NkNiTW1FUEpwVDdGbTRKd2pKZWZIS0lDN01aU0dLdXZsYVNQa3FjNmNQLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9pYVE1T0NJYlVnVlc4NEdGaWNMQUoxV2liZnlNb2c2bTZzQWhldHQ4TDFRSldZcWljWWdKUmtmakU1NkNiTW1FUEpwVDdGbTRKd2pKZWZIS0lDN01aU0dLdXZsYVNQa3FjNmNQLzEzMiI7fQ==";uid|s:2:"77";', 1469976831),
('467727efdf59fc0b983a5a10be028843', 3, '59.63.28.226', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"ZS61";i:1469974428;s:4:"lZ64";i:1469974453;s:4:"Rr0R";i:1469974491;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s6N5CAxw3GoozTAlos-c2kI";oauth_acid|s:1:"5";openid|s:28:"oWHo2s6N5CAxw3GoozTAlos-c2kI";uid|s:2:"47";', 1469978091),
('b0a4acb4c083337235fd3e77cdfbcbeb', 3, '101.226.33.225', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"PH3M";i:1469974477;}', 1469978077),
('705ae18447a308288a2a796c894308f6', 3, '14.17.43.105', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"uLx9";i:1469973514;}dest_url|s:139:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online";', 1469977114),
('9414ca733d5bc5631c52b3d4652584c8', 3, '222.240.215.103', 'acid|s:1:"3";uniacid|i:3;token|a:4:{s:4:"Ch1I";i:1469973668;s:4:"Kof0";i:1469973669;s:4:"AHw1";i:1469973670;s:4:"rGzb";i:1469973679;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s_HbKF-X0cMn4rg3E0Y9Ui4";oauth_acid|s:1:"5";openid|s:28:"oWHo2s_HbKF-X0cMn4rg3E0Y9Ui4";', 1469977279),
('7522c2f72e8651d41b1f7aee5f7dd34b', 3, '175.9.80.239', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"ufVc";i:1469973708;s:4:"Sy84";i:1469973709;s:4:"mPtg";i:1469973709;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s02AUJPN3zqVlANiB43RNOQ";oauth_acid|s:1:"5";openid|s:28:"oWHo2s02AUJPN3zqVlANiB43RNOQ";', 1469977309),
('b64d004ec4b1b841ab84f3db4639433f', 3, '101.226.33.219', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"z2lJ";i:1469973854;}', 1469977454),
('5843439d82a9b3428b5579dc231c0da4', 3, '113.246.232.60', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"M08D";i:1469974266;s:4:"sXiH";i:1469974266;s:4:"F246";i:1469974268;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2szYX1tPKAT3lZZLxQ5F9B9A";oauth_acid|s:1:"5";openid|s:28:"oWHo2szYX1tPKAT3lZZLxQ5F9B9A";', 1469977868),
('3889d662402640b164014ab8c1062dc6', 3, '42.48.104.66', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"AsMa";i:1469974292;s:4:"BKF8";i:1469974293;s:4:"ixC7";i:1469974294;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2swSytuvANHMR_xBSgRFAsQM";oauth_acid|s:1:"5";openid|s:28:"oWHo2swSytuvANHMR_xBSgRFAsQM";uid|s:2:"18";', 1469977894),
('311258093d3fd0c1b50e34da968736bd', 3, '101.226.33.225', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"q1r4";i:1469974362;}', 1469977962),
('ebcaa90a4d49ebbae731a7b7ae4ec224', 3, '118.249.217.157', 'acid|s:1:"3";uniacid|i:3;token|a:5:{s:4:"kV2w";i:1469974549;s:4:"P3LR";i:1469974550;s:4:"WtY2";i:1469974551;s:4:"V6d6";i:1469974563;s:4:"PbsI";i:1469974565;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2szkBYDt51g8czZLW7XwmJ5Q";oauth_acid|s:1:"5";openid|s:28:"oWHo2szkBYDt51g8czZLW7XwmJ5Q";userinfo|s:740:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3prQllEdDUxZzhjelpMVzdYd21KNVEiO3M6ODoibmlja25hbWUiO3M6MTU6IumbqOWQjuabtOa4heiEhiI7czozOiJzZXgiO2k6MjtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi6ZW/5rKZIjtzOjg6InByb3ZpbmNlIjtzOjY6Iua5luWNlyI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMzQ6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4velluUlRKd09ESDRkUWtEQnRheUVpYmlhdkhtSlR3RzFyRU9MaGlicE15RzdRbE1pY0hXQTdhTzMyaWI4SVdpYm90eHFqc1JvYkI3dllHamliaWJRbnA4TkNOd3ZRdVFXRjVVZFloSkgvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTM0OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL3pZblJUSndPREg0ZFFrREJ0YXlFaWJpYXZIbUpUd0cxckVPTGhpYnBNeUc3UWxNaWNIV0E3YU8zMmliOElXaWJvdHhxanNSb2JCN3ZZR2ppYmliUW5wOE5DTnd2UXVRV0Y1VWRZaEpILzEzMiI7fQ==";uid|s:2:"78";', 1469978165),
('5fd76159dd25fcac712dc459486b40ae', 3, '180.153.201.66', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"HF16";i:1469974608;}', 1469978208),
('29e2b1f1df62f9526ca48eb21d33b0e3', 3, '42.48.76.71', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"Lnvn";i:1469980947;s:4:"MxgW";i:1469980966;s:4:"ODcV";i:1469981048;}dest_url|s:74:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26eid%3D1";oauth_openid|s:28:"oWHo2s_AaKqd4TVHh6VlcBEARI9I";oauth_acid|s:1:"5";openid|s:28:"oWHo2s_AaKqd4TVHh6VlcBEARI9I";', 1469984648),
('df1df60f2b5dd02a564f73f0eb7f75db', 3, '175.9.7.222', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"YJC7";i:1469974697;s:4:"Ndbn";i:1469974697;s:4:"LOvA";i:1469974699;}dest_url|s:209:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dgroupmessage%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s9Won81w5bLYvgiOBNbEmZc";oauth_acid|s:1:"5";openid|s:28:"oWHo2s9Won81w5bLYvgiOBNbEmZc";', 1469978299),
('e0ddd6d70d79a8205fc4cd8e09a8287f', 3, '222.58.191.47', 'acid|s:1:"3";uniacid|i:3;token|a:4:{s:4:"GS1W";i:1469974710;s:4:"MaZe";i:1469974711;s:4:"f158";i:1469974711;s:4:"jPy1";i:1469974754;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s6N5CAxw3GoozTAlos-c2kI";oauth_acid|s:1:"5";openid|s:28:"oWHo2s6N5CAxw3GoozTAlos-c2kI";uid|s:2:"47";', 1469978354),
('f7d8a4d3be1ee9aeb4e193d75f8ea365', 3, '223.150.136.88', 'acid|s:1:"3";uniacid|i:3;token|a:2:{s:4:"n2Tq";i:1469974767;s:4:"Be98";i:1469974767;}dest_url|s:182:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dgroupmessage%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2sx4Nfus2jBMIemDoBrRPHY8";oauth_acid|s:1:"5";openid|s:28:"oWHo2sx4Nfus2jBMIemDoBrRPHY8";', 1469978367),
('bd2fd264f8e119c8a57cdaf490f00cc1', 3, '110.52.211.139', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"dHHe";i:1469985231;s:4:"Z815";i:1469985231;s:4:"LOvo";i:1469985233;}dest_url|s:209:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dgroupmessage%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2szuRF5Ary1r4JoVMVM6XR9g";oauth_acid|s:1:"5";openid|s:28:"oWHo2szuRF5Ary1r4JoVMVM6XR9g";', 1469988833),
('509d28418c982f12a632d6b7e7dfec43', 3, '101.226.64.174', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"LeCd";i:1469974773;}', 1469978373),
('dd1da5a22afd182838aa83e9a730fa14', 3, '101.226.64.174', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"K8ZV";i:1469974774;}', 1469978374),
('709656a53bafab2c77c6f6d3239f1eef', 3, '180.153.214.188', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"Sr8W";i:1469974876;}', 1469978476),
('b1250bac013236d130f3e023fa8de800', 3, '180.153.163.190', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"bUmE";i:1469974877;}', 1469978477),
('99f81f045a400ce4b611ff4a0586b1b8', 3, '180.153.211.172', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"Q8jv";i:1469974879;}', 1469978479),
('daed869a8fe66dee6025692358bcee1d', 3, '175.0.101.195', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"bmo7";i:1469975066;s:4:"lb57";i:1469975067;s:4:"P350";i:1469975068;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s8MV4TNctJbio7eVOEYoB-0";oauth_acid|s:1:"5";openid|s:28:"oWHo2s8MV4TNctJbio7eVOEYoB-0";', 1469978668),
('4dd0af786d5f41ae7e33b5c84850c0f3', 3, '111.0.74.62', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"dQiz";i:1469975328;s:4:"braS";i:1469975328;s:4:"bt6Q";i:1469975329;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2szHIrIwXt8e7NQncPhDhFMs";oauth_acid|s:1:"5";openid|s:28:"oWHo2szHIrIwXt8e7NQncPhDhFMs";uid|s:2:"49";', 1469978929),
('2d6148d0a1bd1f7a216c6ad76c992e2b', 3, '101.226.66.187', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"t4Vv";i:1469870022;}', 1469873622),
('f4942150d4531b8b7f62fbe5d0949db4', 3, '101.226.65.102', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"Vrri";i:1469870028;}', 1469873628),
('0be7e432af3163ee7eee53363873cd6b', 3, '101.226.33.224', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"lHS5";i:1469870029;}', 1469873629),
('0181933bea2da37f02615e0d0487ea58', 3, '101.226.65.108', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"Zz4o";i:1469870030;}', 1469873630),
('2e42fae6e41c9bc0fd9433fee492345f', 3, '180.163.2.117', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"ck94";i:1469870068;}', 1469873668),
('d4578229920b85a78374e718494c261d', 3, '175.10.81.165', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"LWyq";i:1469870775;}dest_url|s:155:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26do%3Ddetail%26m%3Dmeepo_online%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2szzSu5b6TcFIXeopE1P2NfY";oauth_acid|s:1:"5";openid|s:28:"oWHo2szzSu5b6TcFIXeopE1P2NfY";userinfo|s:716:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3p6U3U1YjZUY0ZJWGVvcEUxUDJOZlkiO3M6ODoibmlja25hbWUiO3M6OToi5ZGo6YeR5piOIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyOToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi83U1BPMG1SSnQ2QUZZUXladFp6RkVEZklwdDdhanczRmZEN0lUMU9LZlFreXg1Y3c2UmlhaWFOZWZhSVNvdW9taWJVblBrNktadGpxeThJMHZVcEVtVDZNYlRIZ1NVTlBwMDkvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTI5OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuLzdTUE8wbVJKdDZBRllReVp0WnpGRURmSXB0N2FqdzNGZkQ3SVQxT0tmUWt5eDVjdzZSaWFpYU5lZmFJU291b21pYlVuUGs2S1p0anF5OEkwdlVwRW1UNk1iVEhnU1VOUHAwOS8xMzIiO30=";uid|s:2:"72";', 1469874375),
('d5dffd484b1da014f95ab841438ab4b6', 3, '116.224.144.155', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"CUNO";i:1469868779;}', 1469872379),
('281b085e0589b7c4c98b0ec3ac9ddbe8', 3, '101.226.33.226', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"f927";i:1469868833;}', 1469872433),
('5a0ad3ef763e088e67734927a684ee4a', 3, '101.226.33.240', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"W772";i:1469868948;}', 1469872548),
('ba006f5a46c2921d6a06728bb252b09b', 3, '222.245.0.186', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"iRq0";i:1469869691;s:4:"Ld94";i:1469869692;s:4:"tf9F";i:1469869713;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s5zUTQpqE2-OtDnU473VdeA";oauth_acid|s:1:"5";openid|s:28:"oWHo2s5zUTQpqE2-OtDnU473VdeA";', 1469873313),
('ca729010ab005bb038fda99fff36f632', 3, '111.23.152.120', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"a1he";i:1469869841;s:4:"GI6O";i:1469869842;s:4:"YPyP";i:1469869843;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D592%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s7mMt0g0tBSVHfAsBQ03ccg";oauth_acid|s:1:"5";openid|s:28:"oWHo2s7mMt0g0tBSVHfAsBQ03ccg";', 1469873443),
('13f3d0516021efd512f77a868732ef12', 3, '111.22.7.181', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"l38X";i:1469868762;s:4:"PkJz";i:1469868762;s:4:"QJsU";i:1469868763;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D591%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s7hBRe_r0SM_w_F_lgKbh5k";oauth_acid|s:1:"5";openid|s:28:"oWHo2s7hBRe_r0SM_w_F_lgKbh5k";', 1469872363);
INSERT INTO `ims_core_sessions` (`sid`, `uniacid`, `openid`, `data`, `expiretime`) VALUES
('ae23ee9a0200e9a4530de0bd131caacb', 3, '58.47.175.26', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"R2AT";i:1469868736;s:4:"ha7A";i:1469868737;s:4:"wQGh";i:1469868737;}dest_url|s:209:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dgroupmessage%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s4-NVMliyskNLxncuMiRkEs";oauth_acid|s:1:"5";openid|s:28:"oWHo2s4-NVMliyskNLxncuMiRkEs";', 1469872337),
('fd560efa2789488b5564bd56aa3b0ca9', 3, '61.151.226.202', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"vl3s";i:1469868572;}', 1469872172),
('9c439dd6b460fbac0fcd8e4271f51c4d', 3, '101.226.233.142', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"jf10";i:1469868574;}dest_url|s:139:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D592%26do%3Ddetail%26m%3Dmeepo_online";', 1469872174),
('a93bacae3baec78d99a29dfa397da5f0', 3, '101.226.99.196', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"TQ1D";i:1469868611;}', 1469872211),
('3976dd71e2a60a78a32d4e0d474794b1', 3, '223.104.21.2', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"L1P5";i:1469868682;s:4:"SpA6";i:1469868698;s:4:"HXyX";i:1469868699;s:4:"awwG";i:1469868709;s:4:"V46o";i:1469868709;s:4:"pzkZ";i:1469868710;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D543%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s_SzNRLSM2h4f0Cazki8M7A";oauth_acid|s:1:"5";openid|s:28:"oWHo2s_SzNRLSM2h4f0Cazki8M7A";userinfo|s:720:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc19Tek5STFNNMmg0ZjBDYXpraThNN0EiO3M6ODoibmlja25hbWUiO3M6OToi5YiY5Yip5rCRIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9pYVE1T0NJYlVnVlVrUktOdUJRQk9rcjJQcWlhYW5EUHAyd3Y2ekhyVGJDMXYwaG5uSXRqNWFYaWJ6eWljcWlhcnljcG5CUndFRDVIN3paamtEQ2ZOVk9Hc01DaGM2dEkxVEE3Ry8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzE6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vaWFRNU9DSWJVZ1ZVa1JLTnVCUUJPa3IyUHFpYWFuRFBwMnd2NnpIclRiQzF2MGhubkl0ajVhWGlienlpY3FpYXJ5Y3BuQlJ3RUQ1SDd6WmprRENmTlZPR3NNQ2hjNnRJMVRBN0cvMTMyIjt9";uid|s:2:"71";', 1469872310),
('2d213291a7f2841e86b145a076240c97', 3, '118.249.198.34', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"FcH4";i:1469868663;s:4:"dHHE";i:1469868664;s:4:"iqs6";i:1469868664;}dest_url|s:176:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26id%3D1%26do%3Ddetail%26m%3Dnews%26wxref%3Dmp.weixin.qq.com%26u%3D2%26from%3Dgroupmessage%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2swAePNAdTtRYlHwanEv2u0w";oauth_acid|s:1:"5";openid|s:28:"oWHo2swAePNAdTtRYlHwanEv2u0w";', 1469872264),
('8ee916398afeb20b21f11156ed50ff35', 3, '14.17.43.108', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"BX7C";i:1469868519;}dest_url|s:139:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D543%26do%3Ddetail%26m%3Dmeepo_online";', 1469872119),
('f81e3c2f70dc805d668915d150ef9cd6', 3, '180.153.206.17', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"WW7G";i:1469868572;}', 1469872172),
('2487fd53cf1c484f3e755a7706f784fe', 3, '101.226.102.97', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"oP0V";i:1469868496;}', 1469872096),
('e45eac2eabac71e44af9928be1d82408', 3, '101.226.103.70', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"oS66";i:1469868503;}dest_url|s:139:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D592%26do%3Ddetail%26m%3Dmeepo_online";', 1469872103),
('a51e1ea92be52e7427da66c898f679e6', 3, '101.226.233.142', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"vqqz";i:1469868433;}dest_url|s:139:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D592%26do%3Ddetail%26m%3Dmeepo_online";', 1469872033),
('891d6f0c4301a1691a4e1ac3d8b66210', 3, '175.0.29.134', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"Yljg";i:1469868483;s:4:"Mu7n";i:1469868483;s:4:"ivvD";i:1469868485;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D591%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2swCp-T-ZUQN2mktmYJUEkm4";oauth_acid|s:1:"5";openid|s:28:"oWHo2swCp-T-ZUQN2mktmYJUEkm4";', 1469872085),
('4d25bb75830f0515890d80df9de81c9b', 3, '14.17.43.105', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"wWia";i:1469868310;}dest_url|s:139:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D591%26do%3Ddetail%26m%3Dmeepo_online";', 1469871910),
('f2152736caf1c3e2b2ea4e707ef6ab66', 3, '111.23.149.134', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"eM1C";i:1469868422;s:4:"MBVc";i:1469868429;s:4:"CGCg";i:1469868487;s:4:"EUaE";i:1469868500;s:4:"N52D";i:1469868559;s:4:"LNAn";i:1469868572;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D591%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2sxgHjl1ogyngMcUdO3RcZ4k";oauth_acid|s:1:"5";openid|s:28:"oWHo2sxgHjl1ogyngMcUdO3RcZ4k";userinfo|s:692:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3hnSGpsMW9neW5nTWNVZE8zUmNaNGsiO3M6ODoibmlja25hbWUiO3M6OToi6Ie06Z2S5pilIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czowOiIiO3M6ODoicHJvdmluY2UiO3M6MDoiIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyNjoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi83U1BPMG1SSnQ2Q1BKdklBaDdEQ0s0blhuSGU2c3QwaHVEWUF0Qm5YRVVBNExZV2c0MFVmMUdnSWc4VmRJWWdFQUU4ZlNrNjAwS0ZBdTMwcXBiNzY2ak1neUlhaFpoQjIvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTI2OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuLzdTUE8wbVJKdDZDUEp2SUFoN0RDSzRuWG5IZTZzdDBodURZQXRCblhFVUE0TFlXZzQwVWYxR2dJZzhWZElZZ0VBRThmU2s2MDBLRkF1MzBxcGI3NjZqTWd5SWFoWmhCMi8xMzIiO30=";uid|s:2:"70";', 1469872172),
('67b297a0058424b21451d18c74990e0a', 3, '111.22.4.89', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"DM3q";i:1469868282;s:4:"kn6v";i:1469868283;s:4:"Fsmy";i:1469868284;s:4:"HfDa";i:1469868286;s:4:"in69";i:1469868288;s:4:"iWuT";i:1469868308;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s6NK-gIV5VOj9x0mfpjSmmk";oauth_acid|s:1:"5";openid|s:28:"oWHo2s6NK-gIV5VOj9x0mfpjSmmk";userinfo|s:716:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczZOSy1nSVY1Vk9qOXgwbWZwalNtbWsiO3M6ODoibmlja25hbWUiO3M6Njoi5Y2B5LqMIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lM1J2ZEpWanJkaWNFVWxGelhvRUg5aWI0SDJpYlIxRjVieTFmR1dPaGpuQlFqU3BjbGYybllQdWUyZTdZWENVSlJKUE43dUduR2ljdXhXMTIxUVVFbXlpYnF6QmdQQkFmUjN3Ri8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzE6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vZTNSdmRKVmpyZGljRVVsRnpYb0VIOWliNEgyaWJSMUY1YnkxZkdXT2hqbkJRalNwY2xmMm5ZUHVlMmU3WVhDVUpSSlBON3VHbkdpY3V4VzEyMVFVRW15aWJxekJnUEJBZlIzd0YvMTMyIjt9";uid|s:2:"69";', 1469871908),
('05271be776d4a8dd55277e4edf153afb', 3, '111.22.4.89', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"LFXA";i:1469868282;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";', 1469871882),
('34154b2a6e33832d7de51336834d2ddd', 3, '222.241.68.221', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"P14i";i:1469868126;s:4:"lZ2F";i:1469868127;s:4:"lz82";i:1469868128;}dest_url|s:209:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dgroupmessage%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2szmd_GToje1pQ-bxskB_sic";oauth_acid|s:1:"5";openid|s:28:"oWHo2szmd_GToje1pQ-bxskB_sic";', 1469871728),
('94258df159f6b1eb612c672ef546e7d3', 3, '180.153.81.203', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"gHzZ";i:1469868172;}', 1469871772),
('bd598b6372259b07f73443900c24247d', 3, '101.226.89.115', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"Thcy";i:1469868177;}', 1469871777),
('c046847414c6d68ad12e5d469af1c3fc', 3, '101.226.33.224', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"A6ZA";i:1469868179;}', 1469871779),
('543d5ca45b2f3943c24ea0ae375ec91c', 3, '61.187.51.166', 'acid|s:1:"3";uniacid|i:3;token|a:4:{s:4:"G3FZ";i:1469868281;s:4:"Chx2";i:1469868281;s:4:"TxOG";i:1469868282;s:4:"Wr0B";i:1469868516;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2syTJDVmeY-Z8N34Ik8tLzNs";oauth_acid|s:1:"5";openid|s:28:"oWHo2syTJDVmeY-Z8N34Ik8tLzNs";', 1469872116),
('5d908bd210d43b04c648e08a77f284d0', 3, '119.39.84.66', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"Yje8";i:1469867891;s:4:"N45e";i:1469867891;s:4:"CyEz";i:1469867892;}dest_url|s:128:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26do%3Ddetail%26m%3Dmeepo_online";oauth_openid|s:28:"oWHo2syTLcQpgQioNDQF9I59-CsE";oauth_acid|s:1:"5";openid|s:28:"oWHo2syTLcQpgQioNDQF9I59-CsE";userinfo|s:880:"YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzeVRMY1FwZ1Fpb05EUUY5STU5LUNzRSI7czo4OiJuaWNrbmFtZSI7czozMDoi5rmW5Y2X55S15a2Q56eR5oqA5a2m6Zmi5YiY6LeDIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMjoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi83U1BPMG1SSnQ2RDY2T2lhZXIzTmlieGhmalVhV0lEUHpDeVJ3cWtlVW91U29iR01LUG5RY0FQMXpkTnZITW5MVUc2U000MFBZcXpKY1BzVk5pYVR0aWNzaWNpYk42WkVzdVpmcEgvMTMyIjtzOjE0OiJzdWJzY3JpYmVfdGltZSI7aToxNDYyMjkxMDk1O3M6NjoicmVtYXJrIjtzOjA6IiI7czo3OiJncm91cGlkIjtpOjA7czoxMDoidGFnaWRfbGlzdCI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMyOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuLzdTUE8wbVJKdDZENjZPaWFlcjNOaWJ4aGZqVWFXSURQekN5Undxa2VVb3VTb2JHTUtQblFjQVAxemROdkhNbkxVRzZTTTQwUFlxekpjUHNWTmlhVHRpY3NpY2liTjZaRXN1WmZwSC8xMzIiO30=";', 1469871492),
('2be27d5b6da9c3ba7beeab05c3d093d8', 3, '220.168.13.234', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"lCz4";i:1469867750;s:4:"sgjz";i:1469867751;s:4:"jA44";i:1469867751;s:4:"yAJJ";i:1469867774;s:4:"jkQJ";i:1469867991;s:4:"zpB7";i:1469868010;}dest_url|s:182:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dgroupmessage%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s6N5CAxw3GoozTAlos-c2kI";oauth_acid|s:1:"5";openid|s:28:"oWHo2s6N5CAxw3GoozTAlos-c2kI";uid|s:2:"47";', 1469871610),
('94249957303a155c1d62f59fed76c0ed', 3, '101.226.66.192', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"s15Z";i:1469866557;}', 1469870157),
('d28f7f80ee8cf47a428998281c4595ad', 3, '101.226.68.213', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"dHa0";i:1469866634;}', 1469870234),
('eeda930e83ecf70152d1a9000320d6b1', 3, '218.74.249.41', 'acid|s:1:"3";uniacid|i:3;token|a:2:{s:4:"Lnh5";i:1469866731;s:4:"N9lS";i:1469866732;}dest_url|s:128:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26do%3Ddetail%26m%3Dmeepo_online";oauth_openid|s:28:"oWHo2s8H7YBEZZhGNONey9-cj6xk";oauth_acid|s:1:"5";', 1469870332),
('71eeaaf1ae29073278fc3e58679439bb', 3, '101.226.33.225', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"n8bK";i:1469866748;}', 1469870348),
('47e92e5fea5d891ec8cdbb9b14f73d85', 3, '101.126.194.48', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"dM1r";i:1469866838;}', 1469870438),
('483f1804453b4bb36dd8910d6bd66c74', 3, '42.48.104.12', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"z1C6";i:1469867336;s:4:"PI7i";i:1469867346;s:4:"NUIn";i:1469867348;}dest_url|s:128:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26do%3Ddetail%26m%3Dmeepo_online";oauth_openid|s:28:"oWHo2s9Br7jXTevjLSK1bot7kKGo";oauth_acid|s:1:"5";openid|s:28:"oWHo2s9Br7jXTevjLSK1bot7kKGo";', 1469870948),
('43f5941a8821a0c9ad9607a2d3727d7a', 3, '222.247.102.179', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"IL18";i:1469866503;s:4:"ZAk1";i:1469866543;s:4:"Di6q";i:1469866561;s:4:"UVWX";i:1469866569;s:4:"Fios";i:1469866578;s:4:"Vfc7";i:1469866588;}dest_url|s:183:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D508%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dsinglemessage%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s1xmyDv85Orh0LF_cUhnRP8";oauth_acid|s:1:"5";openid|s:28:"oWHo2s1xmyDv85Orh0LF_cUhnRP8";uid|s:2:"35";', 1469870188),
('808c4c034e0e07fff7524094447a6dd2', 3, '61.186.94.146', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"A99S";i:1469866098;s:4:"J0H3";i:1469866109;s:4:"PLs5";i:1469866110;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2syADiZ7DIvzGNYL2DA9_F2s";oauth_acid|s:1:"5";openid|s:28:"oWHo2syADiZ7DIvzGNYL2DA9_F2s";', 1469869710),
('24ce59798bab54fb80b1ee7730a52d4b', 3, '101.226.33.239', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"Ac0X";i:1469865072;}', 1469868672),
('ce353e9b1b81be08b7ec3b39b0d3b762', 3, '42.48.76.50', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"DPBT";i:1469867870;s:4:"n3Ri";i:1469867872;s:4:"TPqP";i:1469867983;}dest_url|s:74:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26eid%3D1";oauth_openid|s:28:"oWHo2s1rKD9SutcL7Yh9Sbi47ma4";oauth_acid|s:1:"5";openid|s:28:"oWHo2s1rKD9SutcL7Yh9Sbi47ma4";uid|s:1:"2";', 1469871583),
('4dae47d3cdc6bb369f329b112b179d66', 3, '58.20.235.137', 'acid|s:1:"3";uniacid|i:3;token|a:5:{s:4:"a05C";i:1469864990;s:4:"PUqL";i:1469864990;s:4:"A4ws";i:1469864992;s:4:"Wv8z";i:1469864994;s:4:"grht";i:1469864996;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2synPWIHIhi2g1dqTOpbwN3E";oauth_acid|s:1:"5";openid|s:28:"oWHo2synPWIHIhi2g1dqTOpbwN3E";userinfo|s:724:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3luUFdJSEloaTJnMWRxVE9wYndOM0UiO3M6ODoibmlja25hbWUiO3M6Njoi6Iqz5a2QIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLmuZjmva0iO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9pYVE1T0NJYlVnVlVtTXlWTXpmclg1TU9TUm1aY1NvQ2FQWTJyaGQ2eWliaWFCaWNFZ3JwdHZrcUlabTZsdkRxVWxUanVwcHA5UGI4a2RpYTI2OHc2c0xpYVJkemJ6alpiRmlhc2dOLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9pYVE1T0NJYlVnVlVtTXlWTXpmclg1TU9TUm1aY1NvQ2FQWTJyaGQ2eWliaWFCaWNFZ3JwdHZrcUlabTZsdkRxVWxUanVwcHA5UGI4a2RpYTI2OHc2c0xpYVJkemJ6alpiRmlhc2dOLzEzMiI7fQ==";uid|s:2:"68";', 1469868596),
('1305db576a85c5b8227695cbe2c4a599', 3, '42.48.76.50', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"wMQ7";i:1469864885;}', 1469868485),
('8aeefd83a949b70f3c395e5f6a9b76c5', 3, '118.250.17.164', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"Ka3D";i:1469864892;s:4:"KFAs";i:1469864893;s:4:"GsAN";i:1469864894;}dest_url|s:209:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dgroupmessage%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s6QWpr5FFFuBBQ0_HXSMZSo";oauth_acid|s:1:"5";openid|s:28:"oWHo2s6QWpr5FFFuBBQ0_HXSMZSo";', 1469868494),
('5d4e032c8bed8d46d994b8c0b661e75d', 3, 'of08Mw2ImCvV1VgFdznR7jIOxNjE', 'openid|s:28:"of08Mw2ImCvV1VgFdznR7jIOxNjE";', 1470102926),
('379b61d1ff628e05ddb4629986e0bd3e', 3, '175.13.60.108', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"BM2V";i:1469864327;s:4:"Gk35";i:1469864328;s:4:"j9Tt";i:1469864329;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2sxL3JgzQ_AZPZrfMniMVBaM";oauth_acid|s:1:"5";openid|s:28:"oWHo2sxL3JgzQ_AZPZrfMniMVBaM";', 1469867929),
('98b94c2e9cb0d2bb1c00fb71f5e0817b', 3, '42.48.76.50', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"Zjk6";i:1469864582;s:4:"XWPi";i:1469864584;s:4:"AQz3";i:1469864592;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s1rKD9SutcL7Yh9Sbi47ma4";oauth_acid|s:1:"5";openid|s:28:"oWHo2s1rKD9SutcL7Yh9Sbi47ma4";uid|s:1:"2";', 1469868192),
('4e3617cf7f8b7caa1fa5097174378faa', 3, '42.48.76.50', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"TGJO";i:1469863921;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";', 1469867521),
('40c62c2be6df0f10d16514ae113d1dfa', 3, '113.108.21.69', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"T0o4";i:1469864884;}', 1469868484),
('8d0aaf3b0d37fe732cc4f5c88b943bf8', 3, '175.13.60.108', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"ejAJ";i:1469864327;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";', 1469867927),
('3eea1b9d1ba5dfb8be56dda01ef704fb', 3, '61.187.51.166', 'acid|s:1:"3";uniacid|i:3;token|a:2:{s:4:"hnra";i:1469863839;s:4:"FJcQ";i:1469863849;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2syKoqJu0LQP4UlTNzkpxuRE";oauth_acid|s:1:"5";openid|s:28:"oWHo2syKoqJu0LQP4UlTNzkpxuRE";', 1469867449),
('aea75e13be03e81daab58c64696c490f', 3, '180.153.206.23', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"wfiX";i:1469862492;}', 1469866092),
('e193f2c9144b1fb5065cb547e40ebec1', 3, '117.136.24.167', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"dcaS";i:1469863766;s:4:"JsCh";i:1469863767;s:4:"EjBB";i:1469863768;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s0rGzD-IQMgfC_FsOWJWPo8";oauth_acid|s:1:"5";openid|s:28:"oWHo2s0rGzD-IQMgfC_FsOWJWPo8";uid|s:2:"61";', 1469867368),
('ca5df10a6fe43f25268fe67c37e8860c', 3, '175.10.209.66', 'acid|s:1:"3";uniacid|i:3;token|a:5:{s:4:"Tp14";i:1469862305;s:4:"bh26";i:1469862306;s:4:"Or5H";i:1469862307;s:4:"fP6C";i:1469862315;s:4:"casU";i:1469862316;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2syVoVd6uFqvQjR4WERW4YdA";oauth_acid|s:1:"5";openid|s:28:"oWHo2syVoVd6uFqvQjR4WERW4YdA";userinfo|s:716:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3lWb1ZkNnVGcXZRalI0V0VSVzRZZEEiO3M6ODoibmlja25hbWUiO3M6OToi5p2o5reR5aqbIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czowOiIiO3M6ODoicHJvdmluY2UiO3M6MDoiIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzNToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9oZVBpYUlXTENNTjd5cmYycTdQQk9BaWNpY0FDWUNpY1M3VFJnaWFERFpPVXRGR05rT1lRcVBQbmlja2tIS2ljRFdVdUxGaWFwTTREaGtoZzRQYUFsd0laZEhEOGhFTzVVam9pYU5RMEcvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTM1OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2hlUGlhSVdMQ01ON3lyZjJxN1BCT0FpY2ljQUNZQ2ljUzdUUmdpYUREWk9VdEZHTmtPWVFxUFBuaWNra0hLaWNEV1V1TEZpYXBNNERoa2hnNFBhQWx3SVpkSEQ4aEVPNVVqb2lhTlEwRy8xMzIiO30=";uid|s:2:"67";', 1469865916),
('3707ce12432d877d5a76bdd7e3863b71', 3, '113.116.153.241', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"UZ8P";i:1469860860;s:4:"BogX";i:1469860861;s:4:"fbL9";i:1469860862;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2sxdhrMH3fapjvONfM1-3pX0";oauth_acid|s:1:"5";openid|s:28:"oWHo2sxdhrMH3fapjvONfM1-3pX0";', 1469864462),
('a8bba93b5ae2c970d9fca45b2ba2281f', 3, '175.10.209.66', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"B0gZ";i:1469862298;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";', 1469865898),
('a4e30a45622a14cf9161a74ef2f21755', 3, '175.10.209.66', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"M73b";i:1469862305;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";', 1469865905),
('d9fb253d5292b59bd1158fb0ca166478', 3, '101.226.61.206', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"q9kU";i:1469860738;}', 1469864338),
('d3c03d1bc07b7af4ef361080b9668d97', 3, '42.48.104.68', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"GQiE";i:1469860535;s:4:"WVof";i:1469860535;s:4:"uZJ7";i:1469860558;s:4:"hwaA";i:1469860577;s:4:"wvis";i:1469860593;s:4:"UooU";i:1469860594;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2swSytuvANHMR_xBSgRFAsQM";oauth_acid|s:1:"5";openid|s:28:"oWHo2swSytuvANHMR_xBSgRFAsQM";uid|s:2:"18";', 1469864194),
('c5fe29b180e88ba3e5713873255131ff', 3, '112.97.49.87', 'acid|s:1:"3";uniacid|i:3;token|a:4:{s:4:"BCld";i:1469860415;s:4:"aRz0";i:1469860415;s:4:"F2wY";i:1469860416;s:4:"Qslz";i:1469860621;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s3jimTSDP9d8qjqpneYPiQ8";oauth_acid|s:1:"5";openid|s:28:"oWHo2s3jimTSDP9d8qjqpneYPiQ8";', 1469864221),
('b87b8e494d2ccc5ac3e86153951e871c', 3, '42.48.104.68', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"R123";i:1469860534;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";', 1469864134),
('1283918ada1058f864997dde6da0fee5', 3, '101.130.111.129', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"mmVN";i:1469859642;s:4:"LH4N";i:1469859642;s:4:"IFB7";i:1469859643;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s3NOcNlU7NyzhaEOy58F7Xg";oauth_acid|s:1:"5";openid|s:28:"oWHo2s3NOcNlU7NyzhaEOy58F7Xg";', 1469863243),
('227877e1537a6ac0a7fdd57a02cb86f8', 3, '101.226.66.178', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"oVV2";i:1469859643;}', 1469863243),
('31d80efdfb33a868da59476fb4f4ae8a', 3, '180.153.214.180', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"t8nc";i:1469859652;}', 1469863252),
('496acb2205561373e50e2f10285f021e', 3, '180.153.214.176', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"j1ii";i:1469859660;}', 1469863260),
('ab391739a857ecdb9c8f25cf5c7bcbc3', 3, '117.136.89.131', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"ixWU";i:1469860364;s:4:"ynty";i:1469860365;s:4:"jZpU";i:1469860366;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s3vrR5FB3wO0nEKZqQO7AVw";oauth_acid|s:1:"5";openid|s:28:"oWHo2s3vrR5FB3wO0nEKZqQO7AVw";', 1469863966),
('cc5bff6c5a9e1b3ce5ee6d5192046d7f', 3, '42.48.76.50', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"do4N";i:1469859827;s:4:"Pk03";i:1469859829;s:4:"V28S";i:1469859831;s:4:"ivZp";i:1469859834;s:4:"ddMB";i:1469859839;s:4:"ME7q";i:1469859844;}', 1469863444),
('f3732e511c98ffe751f487c47be9394b', 3, '180.163.1.46', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"GXtd";i:1469859642;}', 1469863242),
('49ef6b065a0c34a921161d31c390da47', 3, '112.90.82.218', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"OoSU";i:1469859525;}', 1469863125),
('e12a459fecbd3d66529d09bb33957ab7', 3, '112.90.82.218', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"un4u";i:1469859525;}', 1469863125),
('20b7d7b10ae9ce98af6860954b493aef', 3, '180.153.163.190', 'acid|s:1:"3";uniacid|i:3;token|a:2:{s:4:"rv49";i:1469859628;s:4:"DmMP";i:1469859628;}', 1469863228),
('799a688cfb20a9f2a5ddf79c6b8025cf', 3, 'of08MwwUW3h3uKhGVE6TV0cf4Fw8', 'openid|s:28:"of08MwwUW3h3uKhGVE6TV0cf4Fw8";', 1470102441),
('695aa981f8f6c92893113172367c5a22', 3, '42.48.104.68', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"G1e9";i:1469859499;s:4:"LAYD";i:1469859500;s:4:"F9k6";i:1469859500;s:4:"Ir0w";i:1469859500;s:4:"Br46";i:1469859500;s:4:"FPfp";i:1469859501;}dest_url|s:74:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26eid%3D1";oauth_openid|s:28:"oWHo2swSytuvANHMR_xBSgRFAsQM";oauth_acid|s:1:"5";openid|s:28:"oWHo2swSytuvANHMR_xBSgRFAsQM";uid|s:2:"18";', 1469863101),
('8da0a1deb3acc66df090a7135ab5d886', 3, '220.168.13.234', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"LYhH";i:1469859450;s:4:"v5r9";i:1469859450;s:4:"Wrsi";i:1469859451;s:4:"zHOc";i:1469859470;s:4:"CltT";i:1469859475;s:4:"BOjc";i:1469859522;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s6N5CAxw3GoozTAlos-c2kI";oauth_acid|s:1:"5";openid|s:28:"oWHo2s6N5CAxw3GoozTAlos-c2kI";uid|s:2:"47";', 1469863122),
('083c1365dcb3ab019fd29f8ea48aa0a9', 3, '14.17.43.105', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"oXUx";i:1469859472;}dest_url|s:139:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online";', 1469863072),
('79092aedcfeb99bedccbf3814b593174', 3, '101.226.85.67', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"Gaf2";i:1469856153;}', 1469859753),
('9750622541fd02ecd37cf7dd36041e5e', 3, '175.11.89.136', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"Wyb2";i:1469858308;s:4:"Oh14";i:1469858308;s:4:"Mp00";i:1469858309;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s_Yc0gB8jVWVMZSdud2wyVA";oauth_acid|s:1:"5";openid|s:28:"oWHo2s_Yc0gB8jVWVMZSdud2wyVA";userinfo|s:896:"YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzX1ljMGdCOGpWV1ZNWlNkdWQyd3lWQSI7czo4OiJuaWNrbmFtZSI7czoyMToi5aW95aSn5YWr5aSn55qE54qA54mbIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjE0MzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9hak5WZHFIWkxMQVlqUjhMV2NDTGljSnpnWDZibVhEOHdieEZVZm1FR243djBYRUNLaEFLWGZrQjZhTVIxTWlhRnNxc1RpY3NveGZKeTUxRG9qdGQ1c2poVWlhN0FaamljbWlhaEc0MTl3bzVWU0ZaTS8xMzIiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE0NjI4OTQzMTk7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e31zOjY6ImF2YXRhciI7czoxNDM6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vYWpOVmRxSFpMTEFZalI4TFdjQ0xpY0p6Z1g2Ym1YRDh3YnhGVWZtRUduN3YwWEVDS2hBS1hma0I2YU1SMU1pYUZzcXNUaWNzb3hmSnk1MURvanRkNXNqaFVpYTdBWmppY21pYWhHNDE5d281VlNGWk0vMTMyIjt9";', 1469861909),
('9a1eee6857bfde6350e23a6d51fa22b2', 3, '220.178.0.62', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"OjhJ";i:1469858393;}', 1469861993),
('e547373ac0de99012330954ea5088be7', 3, '42.48.76.50', 'acid|s:1:"3";uniacid|i:3;token|a:4:{s:4:"m3F5";i:1469858573;s:4:"c1Fl";i:1469858574;s:4:"wd79";i:1469858574;s:4:"nwL2";i:1469858642;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s1rKD9SutcL7Yh9Sbi47ma4";oauth_acid|s:1:"5";openid|s:28:"oWHo2s1rKD9SutcL7Yh9Sbi47ma4";uid|s:1:"2";', 1469862242),
('4e677dc2352e7f79ccc16250c3468612', 3, '101.226.103.69', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"N1Ds";i:1469858643;}dest_url|s:139:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online";', 1469862243),
('040276ca99568e2e4b1808ceb0d6dc2c', 3, '175.10.83.32', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"NnNT";i:1469858741;s:4:"LQ3Q";i:1469858742;s:4:"fB8N";i:1469858742;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s0vynlARwiyAfsySLsDwmwo";oauth_acid|s:1:"5";openid|s:28:"oWHo2s0vynlARwiyAfsySLsDwmwo";', 1469862342),
('da8377b54e6b878284ad8a2783efb420', 3, '175.9.108.139', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"Y96H";i:1469858793;s:4:"o7B4";i:1469858798;s:4:"YP9q";i:1469858801;s:4:"ecK2";i:1469858802;s:4:"G9TY";i:1469858819;s:4:"xE4o";i:1469858819;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s_RFqlxCtTei3LvWzOFvMuc";oauth_acid|s:1:"5";openid|s:28:"oWHo2s_RFqlxCtTei3LvWzOFvMuc";userinfo|s:688:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc19SRnFseEN0VGVpM0x2V3pPRnZNdWMiO3M6ODoibmlja25hbWUiO3M6Njoi5pmT5YS/IjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyMDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9RM2F1SGd6d3pNNzVOaWJncGtoaWNvaWNPODRnNmZuUnBoYW42d0NOSGZmZ1NaOExXVGVJejdIR1Qyc3AxbnQ0UjZjT2wyM3JnRkFJaWFSa1VIQ0R1MEVNQVEvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTIwOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL1EzYXVIZ3p3ek03NU5pYmdwa2hpY29pY084NGc2Zm5ScGhhbjZ3Q05IZmZnU1o4TFdUZUl6N0hHVDJzcDFudDRSNmNPbDIzcmdGQUlpYVJrVUhDRHUwRU1BUS8xMzIiO30=";uid|s:2:"66";', 1469862419),
('832feb5f7d84d5c810e05ffdbcc2580b', 3, '175.13.202.242', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"i2fH";i:1469855958;s:4:"AwAD";i:1469855958;s:4:"b41U";i:1469855959;s:4:"C03I";i:1469855978;s:4:"XDOe";i:1469855982;s:4:"U3lW";i:1469855983;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2szSTUudDYyRkt9f-ULuizLA";oauth_acid|s:1:"5";openid|s:28:"oWHo2szSTUudDYyRkt9f-ULuizLA";userinfo|s:720:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3pTVFV1ZERZeVJrdDlmLVVMdWl6TEEiO3M6ODoibmlja25hbWUiO3M6MTI6IuW5s+a3oemjjui9uyI7czozOiJzZXgiO2k6MTtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi6ZW/5rKZIjtzOjg6InByb3ZpbmNlIjtzOjY6Iua5luWNlyI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMjg6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4velluUlRKd09ESDRkUWtEQnRheUVpYmpUR1RsdUxia01vMFhaak1KMElLQ05icjJuTlV3WHZaUk54WFVNMExIVllQVWljWVNjeWhidnZvSkprQ0lucHJIWjBlTEpoYlpsR0IvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTI4OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL3pZblJUSndPREg0ZFFrREJ0YXlFaWJqVEdUbHVMYmtNbzBYWmpNSjBJS0NOYnIybk5Vd1h2WlJOeFhVTTBMSFZZUFVpY1lTY3loYnZ2b0pKa0NJbnBySFowZUxKaGJabEdCLzEzMiI7fQ==";uid|s:2:"65";', 1469859583),
('5019deab2af2fa67f23611a26b8c4a34', 3, '175.12.31.113', 'acid|s:1:"3";uniacid|i:3;token|a:5:{s:4:"AaA9";i:1469855851;s:4:"HWI8";i:1469855851;s:4:"t5N2";i:1469855852;s:4:"VcbP";i:1469855855;s:4:"MEm6";i:1469855856;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D550%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s5NyQDS6pnC0vQk_anOvCF0";oauth_acid|s:1:"5";openid|s:28:"oWHo2s5NyQDS6pnC0vQk_anOvCF0";userinfo|s:724:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczVOeVFEUzZwbkMwdlFrX2FuT3ZDRjAiO3M6ODoibmlja25hbWUiO3M6OToi6I+c6I+c57G9IjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMjoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9pYVE1T0NJYlVnVlc4NEdGaWNMQUoxVzA0RFhjU2ljNGVMTXNlNXpCSkk3UlhrdlhraWJ5V2FlaWEySEY4Njg5TlJudEg0S0tlSFdGZFVDcWljSzdud1VtYjhaMGVvN0RhNmRTelAvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMyOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2lhUTVPQ0liVWdWVzg0R0ZpY0xBSjFXMDREWGNTaWM0ZUxNc2U1ekJKSTdSWGt2WGtpYnlXYWVpYTJIRjg2ODlOUm50SDRLS2VIV0ZkVUNxaWNLN253VW1iOFowZW83RGE2ZFN6UC8xMzIiO30=";uid|s:2:"64";', 1469859456),
('6872954edd094974bf0367cf0d3c80c6', 3, '101.226.33.208', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"S225";i:1469981135;}', 1469984735),
('71ec057e3ef6f4d3fbed70944b31deda', 3, '101.226.89.117', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"NZyQ";i:1469980917;}', 1469984517),
('280184c5be99f5b8a96f3d9fae03d1b3', 3, '180.153.214.199', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"xWlH";i:1469980925;}', 1469984525),
('8942c33c77760fd1c5d893cf8206b75b', 3, '42.48.76.71', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"dGIi";i:1469981368;s:4:"khkX";i:1469981405;s:4:"ewm0";i:1469981453;s:4:"s0No";i:1469981498;s:4:"cVjH";i:1469981501;s:4:"ZN4M";i:1469981504;}dest_url|s:98:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26id%3D1%26do%3Ddetail%26m%3Dnews";oauth_openid|s:28:"oWHo2s_AaKqd4TVHh6VlcBEARI9I";oauth_acid|s:1:"5";openid|s:28:"oWHo2s_AaKqd4TVHh6VlcBEARI9I";', 1469985104),
('030937d143be9156899d340b8bf02f04', 3, '42.48.76.71', 'acid|s:1:"3";uniacid|i:3;token|a:4:{s:4:"iJBK";i:1469981572;s:4:"f6i1";i:1469981573;s:4:"mt9Q";i:1469981573;s:4:"uq5R";i:1469981577;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s-6qUWT0jGqOBoJHNi3nqU8";oauth_acid|s:1:"5";openid|s:28:"oWHo2s-6qUWT0jGqOBoJHNi3nqU8";uid|s:1:"6";', 1469985177),
('7f6abf9d5675c53c24bedb1b70a9fca2', 3, 'of08Mw-iGNEBTDvZjWldnnwao5iI', 'openid|s:28:"of08Mw-iGNEBTDvZjWldnnwao5iI";', 1469985192),
('a4c6eb1ec22f77f96960174808a7c69f', 3, '122.139.147.31', 'acid|s:1:"3";uniacid|i:3;token|a:5:{s:4:"O7VG";i:1469986861;s:4:"n1g3";i:1469986862;s:4:"cymQ";i:1469986864;s:4:"E2i5";i:1469986867;s:4:"M52l";i:1469986868;}dest_url|s:209:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dgroupmessage%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2syo4oFxGYQqYdJLpJu0ECN8";oauth_acid|s:1:"5";openid|s:28:"oWHo2syo4oFxGYQqYdJLpJu0ECN8";userinfo|s:708:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3lvNG9GeEdZUXFZZEpMcEp1MEVDTjgiO3M6ODoibmlja25hbWUiO3M6NDoiQeWNoCI7czozOiJzZXgiO2k6MTtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi6ZW/5pilIjtzOjg6InByb3ZpbmNlIjtzOjY6IuWQieaelyI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMjg6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4velluUlRKd09ESDRsZHpmek81WWZLeVhITGQzY0FjNzF2ZDFvOXZoaWJ1M0RseUNVbHhXbjdkSjVaMkhzT1FGVmJVSkxSWUNaRTBvOWlhT0NkWmE5TXBYbWFIUkI3SkhmR04vMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTI4OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL3pZblJUSndPREg0bGR6ZnpPNVlmS3lYSExkM2NBYzcxdmQxbzl2aGlidTNEbHlDVWx4V243ZEo1WjJIc09RRlZiVUpMUllDWkUwbzlpYU9DZFphOU1wWG1hSFJCN0pIZkdOLzEzMiI7fQ==";uid|s:2:"86";', 1469990468),
('042d27ed4c23cd63f2e1cd75e1555fe1', 3, '59.37.23.180', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"y4zD";i:1469986904;s:4:"EH6e";i:1469986905;s:4:"oHZ4";i:1469986906;}dest_url|s:209:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dgroupmessage%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s_rY5C72UmJfV0J4jJ1bBt4";oauth_acid|s:1:"5";openid|s:28:"oWHo2s_rY5C72UmJfV0J4jJ1bBt4";', 1469990506),
('d55e68098537befe13954449e6750e62', 3, '119.39.227.113', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"WzOZ";i:1469997100;s:4:"fP1E";i:1469997102;s:4:"s3H3";i:1469997106;}dest_url|s:209:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dgroupmessage%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2s1dcYlqHSb7QgGj_FUSY2lQ";oauth_acid|s:1:"5";openid|s:28:"oWHo2s1dcYlqHSb7QgGj_FUSY2lQ";', 1470000706),
('3fedb610d1c28cc9cfe2e4eb33b95890', 3, '101.226.89.121', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"KAot";i:1469997277;}', 1470000877),
('0ac9f16e6af78fbc2543eeafc1ff25cf', 3, '14.103.200.101', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"NqMM";i:1470004506;s:4:"GfXx";i:1470004507;s:4:"MiiP";i:1470004508;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2sxdhrMH3fapjvONfM1-3pX0";oauth_acid|s:1:"5";openid|s:28:"oWHo2sxdhrMH3fapjvONfM1-3pX0";', 1470008108),
('7e91fd5689e596a26023fa69a0b530d5', 3, '222.244.2.25', 'acid|s:1:"3";uniacid|i:3;token|a:4:{s:4:"EBXp";i:1470005747;s:4:"i3LD";i:1470005750;s:4:"kcx9";i:1470005751;s:4:"lTmn";i:1470006035;}dest_url|s:182:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dgroupmessage%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s9IgVO2rGXKHxP8Wv770-Ug";oauth_acid|s:1:"5";openid|s:28:"oWHo2s9IgVO2rGXKHxP8Wv770-Ug";userinfo|s:708:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczlJZ1ZPMnJHWEtIeFA4V3Y3NzAtVWciO3M6ODoibmlja25hbWUiO3M6OToi54mn6ams5Lq6IjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czowOiIiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyOToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RIN2lhMVJIUXlOdFlScDUyWGpNdG1sV1NsUk1KeGdITWw3aWI4U2NWRVlYUWttQ3JZYU9ubmJJZ0hCemI0eFB4bjJ1OHY4WWlhWHltMmFVR3J0M0VCYjJLM2gvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTI5OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL3pZblJUSndPREg3aWExUkhReU50WVJwNTJYak10bWxXU2xSTUp4Z0hNbDdpYjhTY1ZFWVhRa21DcllhT25uYklnSEJ6YjR4UHhuMnU4djhZaWFYeW0yYVVHcnQzRUJiMkszaC8xMzIiO30=";uid|s:2:"87";', 1470009635),
('e649ba4b3d4fe17ecc57fac439d8ec83', 3, '112.90.82.218', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"f9Im";i:1470009646;}', 1470013246),
('2c6493c716673363cfac7e6ad9bb4688', 3, '42.48.76.71', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"BCAb";i:1470012718;s:4:"MoD2";i:1470012720;s:4:"YCSy";i:1470012758;}dest_url|s:177:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26id%3D1%26do%3Ddetail%26m%3Dnews%26wxref%3Dmp.weixin.qq.com%26u%3D2%26from%3Dsinglemessage%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2s1rKD9SutcL7Yh9Sbi47ma4";oauth_acid|s:1:"5";openid|s:28:"oWHo2s1rKD9SutcL7Yh9Sbi47ma4";uid|s:1:"2";', 1470016358),
('3924dc2d283e62ddff941ad6383f891e', 3, '58.20.82.139', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"uUIC";i:1470012821;s:4:"foP3";i:1470012822;s:4:"H558";i:1470012825;s:4:"HYAK";i:1470012826;s:4:"ZP8Q";i:1470012838;s:4:"Y1Xz";i:1470012839;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D531%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2sw0BGCiVLO70DeHP6hI_97M";oauth_acid|s:1:"5";openid|s:28:"oWHo2sw0BGCiVLO70DeHP6hI_97M";userinfo|s:724:"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3cwQkdDaVZMTzcwRGVIUDZoSV85N00iO3M6ODoibmlja25hbWUiO3M6Njoi5ZSQ5rOiIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lM1J2ZEpWanJkaWJ3OFZoNGNpY09BazRHZTVDYjU1a1Bia0IyQnNMS3o1SzNsRFhpYWZESTlZYjJqdWI1QUZ1NTB2eXp2aWM0Y2tjVmliZmd6T0M1aWIyaWFNcGF5OVk4SER1TWxVLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lM1J2ZEpWanJkaWJ3OFZoNGNpY09BazRHZTVDYjU1a1Bia0IyQnNMS3o1SzNsRFhpYWZESTlZYjJqdWI1QUZ1NTB2eXp2aWM0Y2tjVmliZmd6T0M1aWIyaWFNcGF5OVk4SER1TWxVLzEzMiI7fQ==";uid|s:2:"88";', 1470016439),
('37258cabb01bbb3867567e9da2baca78', 3, '101.226.33.208', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"FCcU";i:1470013007;}', 1470016607),
('afc75baf14eb7c64708ef549a97e79dd', 3, '175.9.69.47', 'acid|s:1:"3";uniacid|i:3;token|a:4:{s:4:"Ku1b";i:1470014006;s:4:"qWuZ";i:1470014007;s:4:"eHsc";i:1470014008;s:4:"t50C";i:1470014024;}dest_url|s:177:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26id%3D1%26do%3Ddetail%26m%3Dnews%26wxref%3Dmp.weixin.qq.com%26u%3D2%26from%3Dsinglemessage%26isappinstalled%3D0";oauth_openid|s:28:"oWHo2swXfZtPilUuK2OhTCtnbTD4";oauth_acid|s:1:"5";openid|s:28:"oWHo2swXfZtPilUuK2OhTCtnbTD4";', 1470017624),
('ca80dc0993d2e2774aef0c63a423ea66', 5, 'oWHo2s_AaKqd4TVHh6VlcBEARI9I', 'openid|s:28:"oWHo2s_AaKqd4TVHh6VlcBEARI9I";', 1470018856),
('6e30889166dd0d97b78b486af829832d', 3, '223.104.21.179', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"HRfR";i:1470016709;}dest_url|s:178:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0";', 1470020309),
('794614f5e6ccd013ad0b2cf59d24ec73', 3, '113.215.2.30', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"P73F";i:1470019467;}dest_url|s:182:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dgroupmessage%26isappinstalled%3D0";', 1470023067),
('e16fa322c81422c221958560a8d2a7c8', 3, '111.8.205.108', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"CCCI";i:1470023933;}dest_url|s:177:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26id%3D1%26do%3Ddetail%26m%3Dnews%26wxref%3Dmp.weixin.qq.com%26u%3D2%26from%3Dsinglemessage%26isappinstalled%3D0";', 1470027533),
('fb6cdcc12de1067e98f8c23692722625', 3, '101.226.64.174', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"lEu3";i:1470026688;}', 1470030288),
('95d1e2d2079968894bd952c7893d13ae', 3, '118.249.133.144', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"YNii";i:1470021525;s:4:"Fik6";i:1470021526;s:4:"Jyiv";i:1470021528;}dest_url|s:205:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D508%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dtimeline%26isappinstalled%3D0%26wxref%3Dmp.weixin.qq.com";oauth_openid|s:28:"oWHo2syz5exeRUUPXLfgNx_jTLp8";oauth_acid|s:1:"5";openid|s:28:"oWHo2syz5exeRUUPXLfgNx_jTLp8";', 1470025128),
('1d744f0c47ce8f1782474590c1aeffe4', 3, '180.153.214.178', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"nr02";i:1470021704;}', 1470025304),
('f41e51b7c1871e405b9c434d3761bc96', 3, '101.226.99.197', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"g368";i:1470021706;}', 1470025306),
('cfc132259dca844d29c7a0ddb5cbfeca', 3, '61.151.226.202', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"vI0T";i:1470021708;}', 1470025308),
('6959aebb12ae957d056c4779a8faad73', 3, '222.212.7.18', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"M0Ba";i:1470030985;}', 1470034585),
('26b1168241268f17fa5b61bb0bb4ab43', 3, '175.13.245.141', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"q959";i:1470033461;}dest_url|s:182:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D22%26fd%3D482%26do%3Ddetail%26m%3Dmeepo_online%26from%3Dgroupmessage%26isappinstalled%3D0";', 1470037061),
('bb6d7c79cd5a589aaf0ab118450e8a09', 3, '61.151.226.191', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"b4nq";i:1470033641;}', 1470037241),
('dabcffa8b58c9519515ec09eea39ea05', 3, '118.252.66.73', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"YBee";i:1470064598;}dest_url|s:177:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26id%3D1%26do%3Ddetail%26m%3Dnews%26wxref%3Dmp.weixin.qq.com%26u%3D2%26from%3Dsinglemessage%26isappinstalled%3D0";', 1470068198),
('10bbe4c0fedc28934428392681a2fb2e', 3, '175.9.162.172', 'acid|s:1:"3";uniacid|i:3;token|a:4:{s:4:"U9J3";i:1470064667;s:4:"w8g7";i:1470064710;s:4:"m2V3";i:1470064811;s:4:"glG3";i:1470064819;}dest_url|s:177:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26id%3D1%26do%3Ddetail%26m%3Dnews%26wxref%3Dmp.weixin.qq.com%26u%3D2%26from%3Dsinglemessage%26isappinstalled%3D0";', 1470068419),
('07cd55b61f4e0ccbe9e0972a01273bec', 3, '110.53.213.231', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"Sz6k";i:1470098785;s:4:"NfWg";i:1470098816;s:4:"c8z8";i:1470098819;s:4:"xON8";i:1470098825;s:4:"uhx5";i:1470098836;s:4:"WuTC";i:1470098841;}dest_url|s:74:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26eid%3D1";oauth_openid|s:28:"of08MwwUW3h3uKhGVE6TV0cf4Fw8";oauth_acid|s:1:"3";openid|s:28:"of08MwwUW3h3uKhGVE6TV0cf4Fw8";uid|s:2:"28";', 1470102441),
('956a8646e9af4602b470b61a602a67d7', 3, '110.53.213.231', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"QHg8";i:1470098765;s:4:"TbeM";i:1470098767;s:4:"ayh1";i:1470098769;s:4:"J4z4";i:1470098775;s:4:"s299";i:1470098780;s:4:"Mw9e";i:1470098936;}dest_url|s:74:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26eid%3D1";oauth_openid|s:28:"of08Mw1y3od2iT4fX7xlaRvnihM4";oauth_acid|s:1:"3";openid|s:28:"of08Mw1y3od2iT4fX7xlaRvnihM4";uid|s:2:"30";', 1470102536),
('56301a70d773c673a57511554d4fd3ef', 3, '180.153.214.152', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"Bqpm";i:1470098828;}', 1470102428),
('9c512c06d270c8ecbd4ffc5badaded27', 3, '180.163.2.117', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"Y1dG";i:1470098922;}', 1470102522),
('b1e8148e3827eea05ea9098bdd38f09d', 3, '101.226.66.177', 'acid|s:1:"3";uniacid|i:3;token|a:2:{s:4:"mNq1";i:1470098927;s:4:"Tf3U";i:1470098927;}', 1470102527),
('18b0e68118ae676e1ea8b1a8a66b3069', 3, '180.153.205.252', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"ZG3b";i:1470098934;}', 1470102534),
('40c420052accebe886fe701365ea02d2', 3, '180.153.214.178', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"B15Y";i:1470098999;}', 1470102599),
('a1bc16362d3f616cd99669d8c303f2a4', 3, '106.19.18.129', 'acid|s:1:"3";uniacid|i:3;token|a:2:{s:4:"F11T";i:1470103809;s:4:"P34h";i:1470103815;}dest_url|s:74:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26eid%3D1";oauth_openid|s:28:"of08Mw2ImCvV1VgFdznR7jIOxNjE";oauth_acid|s:1:"3";openid|s:28:"of08Mw2ImCvV1VgFdznR7jIOxNjE";uid|s:2:"32";', 1470107415),
('f8dd275771feec2dfe01521d2a95bd83', 3, '106.19.18.129', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"HMEj";i:1470099233;}dest_url|s:74:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26eid%3D1";', 1470102833),
('8d81b6f9079dc27be65b897a27141001', 5, '101.200.180.77', 'acid|s:1:"5";uniacid|i:5;token|a:1:{s:4:"Augr";i:1470104118;}', 1470107718),
('50368edd79b07ea0ca880f98954707e8', 3, '101.226.33.208', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"QtxA";i:1470099434;}', 1470103034),
('8755822b5e4a5b1d8d9a93f536addf4a', 3, '101.226.33.216', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"P25U";i:1470099544;}', 1470103144),
('48cd40b4f3228b85748f4ed82d4ba269', 3, '222.241.111.251', 'acid|s:1:"3";uniacid|i:3;token|a:5:{s:4:"YUmH";i:1470102236;s:4:"vsoq";i:1470102236;s:4:"gCit";i:1470102237;s:4:"guK0";i:1470102248;s:4:"Ty74";i:1470102290;}dest_url|s:189:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26categoryid%3D3%26listid%3D21%26fd%3D648%26do%3Ddetail_thumb%26m%3Dmeepo_online%26from%3Dsinglemessage%26isappinstalled%3D0";oauth_openid|s:28:"of08MwyJ5_VsCYc3o0GN6e46tLhc";oauth_acid|s:1:"3";openid|s:28:"of08MwyJ5_VsCYc3o0GN6e46tLhc";', 1470105890),
('84202a57040e2ade742ad9ccff0e9afd', 3, '222.241.111.251', 'acid|s:1:"3";uniacid|i:3;token|a:3:{s:4:"Lxei";i:1470102296;s:4:"ZqT8";i:1470102297;s:4:"RC33";i:1470102297;}dest_url|s:169:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26id%3D1%26do%3Ddetail%26m%3Dnews%26wxref%3Dmp.weixin.qq.com%26from%3Dsinglemessage%26isappinstalled%3D0";oauth_openid|s:28:"of08Mw1No57xAyiS-YW8VqITu71s";oauth_acid|s:1:"3";openid|s:28:"of08Mw1No57xAyiS-YW8VqITu71s";', 1470105897),
('ae4e11579d7592bd1d9cf1b72b051918', 3, '220.202.153.97', 'acid|s:1:"3";uniacid|i:3;token|a:6:{s:4:"X9G1";i:1470104487;s:4:"FmVw";i:1470104492;s:4:"WmjN";i:1470104492;s:4:"t6u8";i:1470104496;s:4:"IOMp";i:1470104503;s:4:"lHXd";i:1470104503;}dest_url|s:169:"http%3A%2F%2Fwww.010xr.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26id%3D1%26do%3Ddetail%26m%3Dnews%26wxref%3Dmp.weixin.qq.com%26from%3Dsinglemessage%26isappinstalled%3D0";oauth_openid|s:28:"of08Mw0D_cmHzISvhGcunZbW_asw";oauth_acid|s:1:"3";openid|s:28:"of08Mw0D_cmHzISvhGcunZbW_asw";uid|s:2:"89";', 1470108103);
INSERT INTO `ims_core_sessions` (`sid`, `uniacid`, `openid`, `data`, `expiretime`) VALUES
('532198df3e559ee36b9ad82c1f9d1f60', 3, 'of08Mw0D_cmHzISvhGcunZbW_asw', 'openid|s:28:"of08Mw0D_cmHzISvhGcunZbW_asw";', 1470107744),
('d353092a1612b12138505e7dfce88f1a', 3, '140.207.185.112', 'acid|s:1:"3";uniacid|i:3;token|a:1:{s:4:"imfJ";i:1470104641;}', 1470108241);

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_settings`
--

CREATE TABLE IF NOT EXISTS `ims_core_settings` (
  `key` varchar(200) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_core_settings`
--

INSERT INTO `ims_core_settings` (`key`, `value`) VALUES
('copyright', 'a:22:{s:6:"status";s:1:"0";s:10:"verifycode";s:1:"0";s:6:"reason";s:6:"备份";s:3:"url";s:20:"http://www.010xr.com";s:8:"statcode";s:0:"";s:10:"footerleft";s:0:"";s:11:"footerright";s:0:"";s:4:"icon";s:0:"";s:5:"flogo";s:0:"";s:6:"slides";s:2:"N;";s:6:"notice";s:0:"";s:5:"blogo";s:0:"";s:8:"baidumap";a:2:{s:3:"lng";s:0:"";s:3:"lat";s:0:"";}s:7:"company";s:0:"";s:7:"address";s:0:"";s:6:"person";s:0:"";s:5:"phone";s:0:"";s:2:"qq";s:0:"";s:5:"email";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";s:12:"showhomepage";i:1;}'),
('authmode', 'i:1;'),
('close', 'a:2:{s:6:"status";s:1:"0";s:6:"reason";s:0:"";}'),
('register', 'a:4:{s:4:"open";i:1;s:6:"verify";i:0;s:4:"code";i:1;s:7:"groupid";i:1;}'),
('site', 's:0:"";'),
('cloudip', 'a:2:{s:2:"ip";s:12:"125.39.6.164";s:6:"expire";i:1470305882;}'),
('sms.info', 'a:3:{s:3:"key";s:5:"61189";s:8:"sms_sign";a:0:{}s:9:"sms_count";i:0;}'),
('platform', 'a:5:{s:5:"token";s:32:"D66D3VZ560fF6v834vcF3oC0068v630z";s:14:"encodingaeskey";s:43:"mU8p7hxAstR2AUvH7sNrvd78Z7XxDKNLhhlDsP4txxs";s:9:"appsecret";s:0:"";s:5:"appid";s:0:"";s:9:"authstate";i:1;}'),
('module_receive_ban', 'a:0:{}');

-- --------------------------------------------------------

--
-- 表的结构 `ims_coupon`
--

CREATE TABLE IF NOT EXISTS `ims_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `type` varchar(15) NOT NULL,
  `logo_url` varchar(150) NOT NULL,
  `code_type` tinyint(3) unsigned NOT NULL,
  `brand_name` varchar(15) NOT NULL,
  `title` varchar(15) NOT NULL,
  `sub_title` varchar(20) NOT NULL,
  `color` varchar(15) NOT NULL,
  `notice` varchar(15) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `date_info` varchar(200) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `location_id_list` varchar(1000) NOT NULL,
  `use_custom_code` tinyint(3) NOT NULL,
  `bind_openid` tinyint(3) unsigned NOT NULL,
  `can_share` tinyint(3) unsigned NOT NULL,
  `can_give_friend` tinyint(3) unsigned NOT NULL,
  `get_limit` tinyint(3) unsigned NOT NULL,
  `service_phone` varchar(20) NOT NULL,
  `extra` varchar(1000) NOT NULL,
  `source` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `url_name_type` varchar(20) NOT NULL,
  `custom_url` varchar(100) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_selfconsume` tinyint(3) unsigned NOT NULL,
  `promotion_url_name` varchar(10) NOT NULL,
  `promotion_url` varchar(100) NOT NULL,
  `promotion_url_sub_title` varchar(10) NOT NULL,
  `dosage` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_coupon_activity`
--

CREATE TABLE IF NOT EXISTS `ims_coupon_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `msg_id` int(10) NOT NULL,
  `status` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` int(3) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `coupons` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `members` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_coupon_groups`
--

CREATE TABLE IF NOT EXISTS `ims_coupon_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `couponid` varchar(255) NOT NULL,
  `groupid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_coupon_location`
--

CREATE TABLE IF NOT EXISTS `ims_coupon_location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `sid` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `category` varchar(255) NOT NULL,
  `province` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `district` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `photo_list` varchar(10000) NOT NULL,
  `avg_price` int(10) unsigned NOT NULL,
  `open_time` varchar(50) NOT NULL,
  `recommend` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `offset_type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_coupon_modules`
--

CREATE TABLE IF NOT EXISTS `ims_coupon_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL DEFAULT '0',
  `card_id` varchar(50) NOT NULL,
  `module` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`couponid`),
  KEY `card_id` (`card_id`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `couponid` (`couponid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_coupon_record`
--

CREATE TABLE IF NOT EXISTS `ims_coupon_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `friend_openid` varchar(50) NOT NULL,
  `givebyfriend` tinyint(3) unsigned NOT NULL,
  `code` varchar(50) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  `usetime` int(10) unsigned NOT NULL,
  `status` tinyint(3) NOT NULL,
  `clerk_name` varchar(15) NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `grantmodule` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `card_id` (`card_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_coupon_setting`
--

CREATE TABLE IF NOT EXISTS `ims_coupon_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) NOT NULL,
  `logourl` varchar(150) NOT NULL,
  `whitelist` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_coupon_store`
--

CREATE TABLE IF NOT EXISTS `ims_coupon_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `couponid` varchar(255) NOT NULL,
  `storeid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `couponid` (`couponid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cover_reply`
--

CREATE TABLE IF NOT EXISTS `ims_cover_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  `do` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `ims_cover_reply`
--

INSERT INTO `ims_cover_reply` (`id`, `uniacid`, `multiid`, `rid`, `module`, `do`, `title`, `description`, `thumb`, `url`) VALUES
(1, 1, 0, 7, 'mc', '', '进入个人中心', '', '', './index.php?c=mc&a=home&i=1'),
(2, 1, 1, 8, 'site', '', '进入首页', '', '', './index.php?c=home&i=1&t=1'),
(3, 2, 0, 9, 'meepo_online', 'index', '直播首页', '', '', './index.php?i=2&c=entry&do=index&m=meepo_online'),
(4, 3, 0, 10, 'meepo_online', 'index', '直播首页', '超励志短片', 'images/3/2016/07/V4mwlb4CxWxl49s4m9t0mDyym6mFX6.jpg', './index.php?i=3&c=entry&do=index&m=meepo_online'),
(5, 4, 0, 11, 'meepo_online', 'index', '直播首页', '直播测试内容，谢谢观看', 'images/4/2016/07/cPctHc056gLF2T04Cotf5fcU4f04y0.jpg', './index.php?i=4&c=entry&do=index&m=meepo_online'),
(6, 5, 0, 14, 'meepo_online', 'index', '直播首页', '', 'images/5/2016/07/IXFYB7x8QP7Rfq6PB4sYpGB7FEXq8e.png', './index.php?i=5&c=entry&do=index&m=meepo_online');

-- --------------------------------------------------------

--
-- 表的结构 `ims_custom_reply`
--

CREATE TABLE IF NOT EXISTS `ims_custom_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `start1` int(10) NOT NULL,
  `end1` int(10) NOT NULL,
  `start2` int(10) NOT NULL,
  `end2` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_images_reply`
--

CREATE TABLE IF NOT EXISTS `ims_images_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card`
--

CREATE TABLE IF NOT EXISTS `ims_mc_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `color` varchar(255) NOT NULL,
  `background` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `format_type` tinyint(3) unsigned NOT NULL,
  `format` varchar(50) NOT NULL,
  `fields` varchar(1000) NOT NULL,
  `snpos` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `business` text NOT NULL,
  `discount_type` tinyint(3) unsigned NOT NULL,
  `discount` varchar(3000) NOT NULL,
  `grant` varchar(3000) NOT NULL,
  `grant_rate` varchar(20) NOT NULL,
  `offset_rate` int(10) unsigned NOT NULL,
  `offset_max` int(10) NOT NULL,
  `nums_status` tinyint(3) unsigned NOT NULL,
  `nums_text` varchar(15) NOT NULL,
  `nums` varchar(1000) NOT NULL,
  `times_status` tinyint(3) unsigned NOT NULL,
  `times_text` varchar(15) NOT NULL,
  `times` varchar(1000) NOT NULL,
  `params` longtext NOT NULL,
  `html` longtext NOT NULL,
  `recharge` varchar(500) NOT NULL,
  `description` varchar(512) NOT NULL,
  `recommend_status` tinyint(3) unsigned NOT NULL,
  `sign_status` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_care`
--

CREATE TABLE IF NOT EXISTS `ims_mc_card_care` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `groupid` int(10) unsigned NOT NULL,
  `credit1` int(10) unsigned NOT NULL,
  `credit2` int(10) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `granttime` int(10) unsigned NOT NULL,
  `days` int(10) unsigned NOT NULL,
  `time` tinyint(3) unsigned NOT NULL,
  `show_in_card` tinyint(3) unsigned NOT NULL,
  `content` varchar(1000) NOT NULL,
  `sms_notice` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_credit_set`
--

CREATE TABLE IF NOT EXISTS `ims_mc_card_credit_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `sign` varchar(1000) NOT NULL,
  `share` varchar(500) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_members`
--

CREATE TABLE IF NOT EXISTS `ims_mc_card_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) DEFAULT NULL,
  `openid` varchar(50) NOT NULL,
  `cid` int(10) NOT NULL,
  `cardsn` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `nums` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_notices`
--

CREATE TABLE IF NOT EXISTS `ims_mc_card_notices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `groupid` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_notices_unread`
--

CREATE TABLE IF NOT EXISTS `ims_mc_card_notices_unread` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `notice_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `is_new` tinyint(3) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`),
  KEY `notice_id` (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_recommend`
--

CREATE TABLE IF NOT EXISTS `ims_mc_card_recommend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_record`
--

CREATE TABLE IF NOT EXISTS `ims_mc_card_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `model` tinyint(3) unsigned NOT NULL,
  `fee` decimal(10,2) unsigned NOT NULL,
  `tag` varchar(10) NOT NULL,
  `note` varchar(255) NOT NULL,
  `remark` varchar(200) NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`),
  KEY `addtime` (`addtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_sign_record`
--

CREATE TABLE IF NOT EXISTS `ims_mc_card_sign_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `is_grant` tinyint(3) unsigned NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_cash_record`
--

CREATE TABLE IF NOT EXISTS `ims_mc_cash_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `fee` decimal(10,2) unsigned NOT NULL,
  `final_fee` decimal(10,2) unsigned NOT NULL,
  `credit1` int(10) unsigned NOT NULL,
  `credit1_fee` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `cash` decimal(10,2) unsigned NOT NULL,
  `return_cash` decimal(10,2) unsigned NOT NULL,
  `final_cash` decimal(10,2) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_chats_record`
--

CREATE TABLE IF NOT EXISTS `ims_mc_chats_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `flag` tinyint(3) unsigned NOT NULL,
  `openid` varchar(32) NOT NULL,
  `msgtype` varchar(15) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `openid` (`openid`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_credits_recharge`
--

CREATE TABLE IF NOT EXISTS `ims_mc_credits_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `tid` varchar(64) NOT NULL,
  `transid` varchar(30) NOT NULL,
  `fee` varchar(10) NOT NULL,
  `type` varchar(15) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `backtype` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid_uid` (`uniacid`,`uid`),
  KEY `idx_tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_credits_record`
--

CREATE TABLE IF NOT EXISTS `ims_mc_credits_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `uniacid` int(11) NOT NULL,
  `credittype` varchar(10) NOT NULL,
  `num` decimal(10,2) NOT NULL,
  `operator` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `remark` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`),
  KEY `remark` (`remark`),
  KEY `uid_2` (`uid`),
  KEY `operator` (`operator`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `ims_mc_credits_record`
--

INSERT INTO `ims_mc_credits_record` (`id`, `uid`, `uniacid`, `credittype`, `num`, `operator`, `module`, `clerk_id`, `store_id`, `clerk_type`, `createtime`, `remark`) VALUES
(1, 0, 5, 'credit1', '1.00', 0, 'zmcn_sign', 0, 0, 1, 1469677733, '每日签到：[H17]2016-07-28'),
(2, 0, 5, 'credit1', '1.00', 0, 'wei_qian', 0, 0, 1, 1469677906, '签到模块内消费i=5; c=entry; type=uids; do=qian; m=wei_qian; '),
(3, 0, 5, 'credit1', '1.00', 0, 'wei_qian', 0, 0, 1, 1469678337, '签到模块内消费i=5; c=entry; type=uids; do=qian; m=wei_qian; '),
(5, 0, 3, 'credit1', '2.00', 0, 'wei_qian', 0, 0, 1, 1469844042, '签到模块内消费i=3; c=entry; type=uids; do=qian; m=wei_qian; '),
(6, 6, 3, 'credit1', '2.00', 6, 'wei_qian', 0, 0, 1, 1469844075, '签到模块内消费i=3; c=entry; type=uids; do=qian; m=wei_qian; '),
(7, 0, 3, 'credit1', '2.00', 0, 'wei_qian', 0, 0, 1, 1469844121, '签到模块内消费i=3; c=entry; type=uids; do=qian; m=wei_qian; ');

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_fans_groups`
--

CREATE TABLE IF NOT EXISTS `ims_mc_fans_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `groups` varchar(10000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ims_mc_fans_groups`
--

INSERT INTO `ims_mc_fans_groups` (`id`, `uniacid`, `acid`, `groups`) VALUES
(1, 3, 3, 'a:1:{i:2;a:3:{s:2:"id";i:2;s:4:"name";s:9:"星标组";s:5:"count";i:0;}}');

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_fans_tag_mapping`
--

CREATE TABLE IF NOT EXISTS `ims_mc_fans_tag_mapping` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fanid` int(11) unsigned NOT NULL,
  `tagid` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mapping` (`fanid`,`tagid`),
  KEY `fanid_index` (`fanid`),
  KEY `tagid_index` (`tagid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_groups`
--

CREATE TABLE IF NOT EXISTS `ims_mc_groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `orderlist` tinyint(4) unsigned NOT NULL,
  `isdefault` tinyint(4) NOT NULL,
  PRIMARY KEY (`groupid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ims_mc_groups`
--

INSERT INTO `ims_mc_groups` (`groupid`, `uniacid`, `title`, `credit`, `orderlist`, `isdefault`) VALUES
(1, 1, '默认会员组', 0, 0, 1),
(2, 2, '默认会员组', 0, 0, 1),
(3, 3, '默认会员组', 0, 0, 1),
(4, 4, '默认会员组', 0, 0, 1),
(5, 5, '默认会员组', 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_handsel`
--

CREATE TABLE IF NOT EXISTS `ims_mc_handsel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `touid` int(10) unsigned NOT NULL,
  `fromuid` varchar(32) NOT NULL,
  `module` varchar(30) NOT NULL,
  `sign` varchar(100) NOT NULL,
  `action` varchar(20) NOT NULL,
  `credit_value` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`touid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_mapping_fans`
--

CREATE TABLE IF NOT EXISTS `ims_mc_mapping_fans` (
  `fanid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `unionid` varchar(64) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `groupid` varchar(30) NOT NULL,
  `salt` char(8) NOT NULL,
  `follow` tinyint(1) unsigned NOT NULL,
  `followtime` int(10) unsigned NOT NULL,
  `unfollowtime` int(10) unsigned NOT NULL,
  `tag` varchar(1000) NOT NULL,
  `updatetime` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`fanid`),
  UNIQUE KEY `openid` (`openid`),
  KEY `acid` (`acid`),
  KEY `uniacid` (`uniacid`),
  KEY `updatetime` (`updatetime`),
  KEY `nickname` (`nickname`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- 转存表中的数据 `ims_mc_mapping_fans`
--

INSERT INTO `ims_mc_mapping_fans` (`fanid`, `acid`, `uniacid`, `uid`, `openid`, `unionid`, `nickname`, `groupid`, `salt`, `follow`, `followtime`, `unfollowtime`, `tag`, `updatetime`) VALUES
(1, 2, 2, 1, 'oWHo2s_AaKqd4TVHh6VlcBEARI9I', '', '好资源', '0', 'Bx3gab3G', 1, 1467618704, 0, '', 1469677733),
(2, 3, 3, 2, 'oWHo2s1rKD9SutcL7Yh9Sbi47ma4', '', '好资源2波【美安智能科技】', '', 'VHQ17qoZ', 1, 1467278476, 0, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzMXJLRDlTdXRjTDdZaDlTYmk0N21hNCI7czo4OiJuaWNrbmFtZSI7czozMDoi6LCt5rOi44CQ576O5a6J5pm66IO956eR5oqA44CRIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyODoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi83U1BPMG1SSnQ2Q1BKdklBaDdEQ0szb1FnOGZyb2libnllZEs0cnRsbGtNYWhQaWFIdkM2UVpyUkEwT2dCTnFaTEg0ZWZON1ppYzZHWExmYXllbVNpY1hKbDZJMnJOUFI1MmRQLzAiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE0NjcyNzg0NzY7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e319', 1469606356),
(4, 3, 3, 4, 'oWHo2s4tXhKVmNBsqtYKjGmLVaaI', '', '米波网络科技@赞木 ', '', 'R473etfj', 1, 1467701965, 0, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzNHRYaEtWbU5Cc3F0WUtqR21MVmFhSSI7czo4OiJuaWNrbmFtZSI7czozMjoi57Gz5rOi572R57uc56eR5oqAQOi1nuacqO6QgiDukIIiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6Iuagqua0siI7czo4OiJwcm92aW5jZSI7czo2OiLmuZbljZciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTI2OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL3pZblJUSndPREg0bGR6ZnpPNVlmSzhPN0R5eHRidkxVTHNnbTczSENpY1VjSXg3VUFENzZJMFFHbGZleVF0UnlacXhBa01Cb2VZdUNOaDhoaWJnVlNVSTBXcDUxNDB2SHVXLzAiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE0Njc3MDE5NjU7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e319', 1469606417),
(5, 3, 3, 6, 'oWHo2s-6qUWT0jGqOBoJHNi3nqU8', '', '文达', '0', 'GvrVjS5z', 1, 1469678325, 0, 'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzLTZxVVdUMGpHcU9Cb0pITmkzbnFVOCI7czo4OiJuaWNrbmFtZSI7czo2OiLmlofovr4iO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumVv+aymSI7czo4OiJwcm92aW5jZSI7czo2OiLmuZbljZciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTI5OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2lhUTVPQ0liVWdWVzg0R0ZpY0xBSjFXeHhKMWRYR3lUZmJVOVdqMWc0YTVQQkxsVTNuU2pzU1VWTHd5SWRVWTlLc3EwV3FvM0N3QUdvbEFKbnRCWk9pYU56ZzkxZ29QWlpqRy8xMzIiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE0Njk2NzgzMjU7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e31zOjY6ImF2YXRhciI7czoxMjk6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vaWFRNU9DSWJVZ1ZXODRHRmljTEFKMVd4eEoxZFhHeVRmYlU5V2oxZzRhNVBCTGxVM25TanNTVVZMd3lJZFVZOUtzcTBXcW8zQ3dBR29sQUpudEJaT2lhTnpnOTFnb1BaWmpHLzEzMiI7fQ==', 1469069008),
(6, 3, 3, 7, 'oWHo2s1M4L96iY1KvZX3KPTLKHIk', '', '曹再兴-美安智能家居', '', 'c7po7GZm', 1, 1462271679, 0, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzMU00TDk2aVkxS3ZaWDNLUFRMS0hJayI7czo4OiJuaWNrbmFtZSI7czoyODoi5pu55YaN5YW0Lee+juWuieaZuuiDveWutuWxhSI7czozOiJzZXgiO2k6MTtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi6ZW/5rKZIjtzOjg6InByb3ZpbmNlIjtzOjY6Iua5luWNlyI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMjg6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vN1NQTzBtUkp0NkNQSnZJQWg3RENLOGw5RWNPdU4zSGpoUkdnMTU4YWFkTnk5RFJ3aWJVaWJjMEwzWWljcW84S1VpYXB0YjkyV2ZuZnBCSXlxTkRqVXBaSnkxVmdJWlBPYTZtbi8wIjtzOjE0OiJzdWJzY3JpYmVfdGltZSI7aToxNDYyMjcxNjc5O3M6NjoicmVtYXJrIjtzOjA6IiI7czo3OiJncm91cGlkIjtpOjA7czoxMDoidGFnaWRfbGlzdCI7YTowOnt9fQ==', 1469606417),
(7, 3, 3, 8, 'oWHo2s9s3vxwvFvUtyZFmAixmo1w', '', '柏友顺', '', 'NbBYB9bV', 1, 1467817015, 0, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzOXMzdnh3dkZ2VXR5WkZtQWl4bW8xdyI7czo4OiJuaWNrbmFtZSI7czo5OiLmn4/lj4vpoboiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumVv+aymSI7czo4OiJwcm92aW5jZSI7czo2OiLmuZbljZciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMyOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2lhUTVPQ0liVWdWVzg0R0ZpY0xBSjFXek43d3Z6ZmVwbGhFNUhCT2Z0NTlFZ2NpY2lhYm5seUg1NnNSazBRd2x2QzAzTlVSS09TUGlhalZRTUJBOHZHTU5TVGQzaWFMUzVpYWpDaWNJLzAiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE0Njc4MTcwMTU7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e319', 1469606356),
(8, 3, 3, 9, 'oWHo2s2VpuhluWQ8DTc99yYmCHQw', '', 'Bobbi', '', 'RIXaOmqA', 1, 1467861587, 0, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzMlZwdWhsdVdROERUYzk5eVltQ0hRdyI7czo4OiJuaWNrbmFtZSI7czo1OiJCb2JiaSI7czozOiJzZXgiO2k6MTtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi5bm/5beeIjtzOjg6InByb3ZpbmNlIjtzOjY6IuW5v+S4nCI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMjg6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4velluUlRKd09ESDRkUWtEQnRheUVpYm1IalNrR21Gck5TU0NtV3F5OUY0TnNPYWp3U2F0dEdHamRFZlEzTlhhZ1ZDWTdPVjFmVXJQbFN1Z0VpY0I4aWMwNzUyY1lBdlc5NWhpYy8wIjtzOjE0OiJzdWJzY3JpYmVfdGltZSI7aToxNDY3ODYxNTg3O3M6NjoicmVtYXJrIjtzOjA6IiI7czo3OiJncm91cGlkIjtpOjA7czoxMDoidGFnaWRfbGlzdCI7YTowOnt9fQ==', 1469606356),
(9, 3, 3, 10, 'oWHo2s3EbSwBqe2s2p4vfwlPDKGU', '', '杨兵', '0', 'GdJ0Z1FS', 0, 1467867727, 1467867761, 'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzM0ViU3dCcWUyczJwNHZmd2xQREtHVSI7czo4OiJuaWNrbmFtZSI7czo2OiLmnajlhbUiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6Iuagqua0siI7czo4OiJwcm92aW5jZSI7czo2OiLmuZbljZciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMzOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2lhUTVPQ0liVWdWVVZTTWJkdFV2a1dpYW9hMm1wZEhmYUNCdE1OSjRHSVhvbkM3RWRIZmRPRzVEd3VGM2hKWGljTFFuRjl6QkNBcG1GODVzVldhWHRvaWNMZ2lhTGljV1ZpY2N0Q2MvMTMyIjtzOjE0OiJzdWJzY3JpYmVfdGltZSI7aToxNDY3ODY3NzI3O3M6NjoicmVtYXJrIjtzOjA6IiI7czo3OiJncm91cGlkIjtpOjA7czoxMDoidGFnaWRfbGlzdCI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMzOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2lhUTVPQ0liVWdWVVZTTWJkdFV2a1dpYW9hMm1wZEhmYUNCdE1OSjRHSVhvbkM3RWRIZmRPRzVEd3VGM2hKWGljTFFuRjl6QkNBcG1GODVzVldhWHRvaWNMZ2lhTGljV1ZpY2N0Q2MvMTMyIjt9', NULL),
(10, 4, 4, 11, 'o4gcJwrF30OWjugMoLnvqxUjKcXg', '', '', '0', 'uILi9X42', 1, 1467880025, 0, '', NULL),
(11, 3, 3, 12, 'oWHo2s8Mzix0EatN9nqf35wJiKAs', '', '黄榑熏', '', 'u72a22cq', 1, 1467885208, 0, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzOE16aXgwRWF0TjlucWYzNXdKaUtBcyI7czo4OiJuaWNrbmFtZSI7czo5OiLpu4TmppHnho8iO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IuW5v+W3niI7czo4OiJwcm92aW5jZSI7czo2OiLlub/kuJwiO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTQwOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL1EzYXVIZ3p3ek03a1FvaWFHNll6QWxSWXJJbWJwTVViVHQ5QkFFOFVUQ2ttcmc2SnZIa2liY1NiaEZXd0tCMHNzZmJYSVRBaWNpYlU2NGxyWldaUEY3VllEQkpzSFQ2ZVV5N3NnMkFJUmliMzVRYU0vMCI7czoxNDoic3Vic2NyaWJlX3RpbWUiO2k6MTQ2Nzg4NTIwODtzOjY6InJlbWFyayI7czowOiIiO3M6NzoiZ3JvdXBpZCI7aTowO3M6MTA6InRhZ2lkX2xpc3QiO2E6MDp7fX0=', 1469606417),
(12, 3, 3, 13, 'oWHo2swEYWjJgBoZ3J2xvz1w-2V4', '', '麗芬', '', 'hi6dt7i3', 1, 1467885465, 0, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzd0VZV2pKZ0JvWjNKMnh2ejF3LTJWNCI7czo4OiJuaWNrbmFtZSI7czo2OiLpupfoiqwiO3M6Mzoic2V4IjtpOjI7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IuW5v+W3niI7czo4OiJwcm92aW5jZSI7czo2OiLlub/kuJwiO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTI5OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuLzdTUE8wbVJKdDZCNEppYWliRmljQTRYaHFWNXRyVmNZZFRTdW14ejFVd3VySWliZ051M3ZFclNGbGcyU2p2dmZwS25tVHJNSWREVTJDeWdHdjFZcVlDcG4wMnZDUHBnSGljUFc3LzAiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE0Njc4ODU0NjU7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e319', 1469606417),
(13, 3, 3, 14, 'oWHo2s_YIfaQjJA66wenHwWOCUT8', '', 'Sexy Boy', '', 'R48jXX9z', 0, 1467885648, 1470021372, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzX1lJZmFRakpBNjZ3ZW5Id1dPQ1VUOCI7czo4OiJuaWNrbmFtZSI7czoxMToiU2V4eSBCb3ninYAiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjA6IiI7czo4OiJwcm92aW5jZSI7czo5OiLlmInkuYnljr8iO3M6NzoiY291bnRyeSI7czoxMjoi5Lit5Zu95Y+w5rm+IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjExNToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi83U1BPMG1SSnQ2RGVrR1BKRm10anp5OEw0c2RrRkh1TXAzV3lNb21ENVFKZDY5TU9ZamdXTjlQQ1pGZ2lhMTFkVldYenNoanBQWlREMTBBYjdtUFpDencvMCI7czoxNDoic3Vic2NyaWJlX3RpbWUiO2k6MTQ2Nzg4NTY0ODtzOjY6InJlbWFyayI7czowOiIiO3M6NzoiZ3JvdXBpZCI7aTowO3M6MTA6InRhZ2lkX2xpc3QiO2E6MDp7fX0=', 1469606356),
(15, 3, 3, 16, 'oWHo2s638vVVHltLBmFDJA7dolSo', '', '桂哥', '', 'gOnNzC9A', 1, 1467887459, 0, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzNjM4dlZWSGx0TEJtRkRKQTdkb2xTbyI7czo4OiJuaWNrbmFtZSI7czo2OiLmoYLlk6UiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjk6Ium7lOS4nOWNlyI7czo4OiJwcm92aW5jZSI7czo2OiLotLXlt54iO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTI3OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL3pZblJUSndPREg0ZFFrREJ0YXlFaWJoN09RMDVDSGxTTzZYMnF4YmhyN2pYemo4ZWhlNmc5bENRNTdVNldoc2tYV0dmWHhNWHVQV3RJRm55V1ppYlF5cWljN1hSYjBBNkpaay8wIjtzOjE0OiJzdWJzY3JpYmVfdGltZSI7aToxNDY3ODg3NDU5O3M6NjoicmVtYXJrIjtzOjA6IiI7czo3OiJncm91cGlkIjtpOjA7czoxMDoidGFnaWRfbGlzdCI7YTowOnt9fQ==', 1469606417),
(14, 3, 3, 15, 'oWHo2s3ecVJZOpSTkzy13Z1NxbwY', '', '高魏栋', '0', 'RY2cPxYR', 0, 1467885650, 1467885736, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzM2VjVkpaT3BTVGt6eTEzWjFOeGJ3WSI7czo4OiJuaWNrbmFtZSI7czo5OiLpq5jprY/moIsiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IuWOpumXqCI7czo4OiJwcm92aW5jZSI7czo2OiLnpo/lu7oiO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTI5OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL1RSQVRQQkc3TU1MbVMycjdSVllpYUZHTlZCU2NURkxZbzdxZko5cFkyS01saWJta3Jzam9pY0tGYmpFeEFHeXgySmhRY1JobWRicFRwMktyemljaWNLdmYzNkVQMzNIZzU0TmJSLzAiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE0Njc4ODU2NTA7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e319', 1467885735),
(16, 3, 3, 17, 'oWHo2s6QjdL5v08DmMkFci2sfFnc', '', '梁峻豪', '', 'rys5UUMK', 1, 1467887717, 0, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzNlFqZEw1djA4RG1Na0ZjaTJzZkZuYyI7czo4OiJuaWNrbmFtZSI7czo5OiLmooHls7vosaoiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6Iua2qumZtSI7czo4OiJwcm92aW5jZSI7czo2OiLph43luoYiO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTE3OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuLzdTUE8wbVJKdDZBazRHWVhpYVloUDIwZUdUdGFUUnZvdEd3cnlWUnRSbm0zWXN6WFN1Y2tKUjhtUU9QYnU4T2lhbzY5N3VpYjU3M1g1dnFFTkxWSkhBT3pRLzAiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE0Njc4ODc3MTc7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e319', 1469606417),
(17, 3, 3, 18, 'oWHo2swSytuvANHMR_xBSgRFAsQM', '', 'VICO', '', 'llChjfCS', 1, 1468825020, 0, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzd1N5dHV2QU5ITVJfeEJTZ1JGQXNRTSI7czo4OiJuaWNrbmFtZSI7czo0OiJWSUNPIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czowOiIiO3M6ODoicHJvdmluY2UiO3M6Njoi5rKZ6L+mIjtzOjc6ImNvdW50cnkiO3M6MjQ6IumYv+aLieS8r+iBlOWQiOmFi+mVv+WbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMjg6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4velluUlRKd09ESDRkUWtEQnRheUVpYnRqNGljd2RSNFpLaEozdWgxNVo5QjFBVFZIc2ZVTHRsVkJDcGdTZ1ZFd0pNVHduVGZ0RTFFdjQzaWJvMGZZM2ljUkRIWUdsdDhXRUhjWS8wIjtzOjE0OiJzdWJzY3JpYmVfdGltZSI7aToxNDY4ODI1MDIwO3M6NjoicmVtYXJrIjtzOjA6IiI7czo3OiJncm91cGlkIjtpOjA7czoxMDoidGFnaWRfbGlzdCI7YTowOnt9fQ==', 1469606417),
(18, 0, 3, 19, '', '', '', '0', '', 0, 0, 0, '', 1469019077),
(29, 3, 3, 31, 'of08MwwjAHm5UEuCB0-pLWdVmJOk', '', '儿童玩具总经销', '', 't5dT75aw', 1, 1469772263, 0, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib2YwOE13d2pBSG01VUV1Q0IwLXBMV2RWbUpPayI7czo4OiJuaWNrbmFtZSI7czoyMToi5YS/56ul546p5YW35oC757uP6ZSAIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLluLjlvrciO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjExNzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9hak5WZHFIWkxMQnVGOWN0aWFYdGxpYTBkS01ram5oQllXcWNyVndpYkZnUHZkeWU0QjhZV0NFWkVxN2theFlOZHlhTXpMNE1SREhDR3h4RzRCYzYxYmtUdy8wIjtzOjE0OiJzdWJzY3JpYmVfdGltZSI7aToxNDY5NzcyMjYzO3M6NjoicmVtYXJrIjtzOjA6IiI7czo3OiJncm91cGlkIjtpOjA7czoxMDoidGFnaWRfbGlzdCI7YTowOnt9fQ==', 1469772305),
(19, 3, 3, 20, 'oWHo2s_AIds9dre7OP476sZDLxZQ', '', '涛', '', 'f5OWZU9Q', 1, 1469356851, 0, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzX0FJZHM5ZHJlN09QNDc2c1pETHhaUSI7czo4OiJuaWNrbmFtZSI7czozOiLmtpsiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumVv+aymSI7czo4OiJwcm92aW5jZSI7czo2OiLmuZbljZciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTI2OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2UzUnZkSlZqcmRpYlgwNXpiSTVxR3gxTmJsWHpiTE9JYms5RXpqQjlZZjVsMmF0SjhTelRUbkdFaWNPcEJUWGxBWU5yYXBXZmxUTWRrYWtCdUR1RjNlcEZsN2RIZVVoSE01LzAiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE0NjkzNTY4NTE7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e319', 1469606417),
(21, 3, 3, 23, 'oWHo2s-vzkXsIihtaDZEy6-h1AT0', '', '智家招商网-王磊13027711883', '', 'B6t0tt3i', 1, 1469527350, 0, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzLXZ6a1hzSWlodGFEWkV5Ni1oMUFUMCI7czo4OiJuaWNrbmFtZSI7czozMzoi5pm65a625oub5ZWG572RLeeOi+ejijEzMDI3NzExODgzIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czowOiIiO3M6ODoicHJvdmluY2UiO3M6MDoiIjtzOjc6ImNvdW50cnkiO3M6OToi5a6J6YGT5bCUIjtzOjEwOiJoZWFkaW1ndXJsIjtzOjExODoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RING5ZN1pXeTlwSkpwb2RqcFg5amd2R3JhMHFocTJFR0FQcU9oSFB6aWI1SXB5cGxTUXM0aE9jam1wNGlhc2liMzRpYXhzZ0t3cDdYc0Zjc0EvMCI7czoxNDoic3Vic2NyaWJlX3RpbWUiO2k6MTQ2OTUyNzM1MDtzOjY6InJlbWFyayI7czowOiIiO3M6NzoiZ3JvdXBpZCI7aTowO3M6MTA6InRhZ2lkX2xpc3QiO2E6MDp7fX0=', 1469606417),
(22, 5, 5, 24, 'oWHo2sxHH91YBwgdS6e5uTJq0woQ', '', '董高兴', '', 'KAKAwJAM', 1, 1469674519, 0, 'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzeEhIOTFZQndnZFM2ZTV1VEpxMHdvUSI7czo4OiJuaWNrbmFtZSI7czo5OiLokaPpq5jlhbQiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumVv+aymSI7czo4OiJwcm92aW5jZSI7czo2OiLmuZbljZciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMxOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL3pZblJUSndPREg2aWJia1dpY3FpYUhZZHZsOWpCSjE0MXB2OWQyNWljdmZBT1NnSGY1a0Iya1QwMU1UdUc5bDNHR1E4Y0kwQ0h3VnVERExpY3NRYlp3M0pPQlh3aFJWSTQ3V1YwLzEzMiI7czoxNDoic3Vic2NyaWJlX3RpbWUiO2k6MTQ2OTY3NDUxOTtzOjY6InJlbWFyayI7czowOiIiO3M6NzoiZ3JvdXBpZCI7aTowO3M6MTA6InRhZ2lkX2xpc3QiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RINmliYmtXaWNxaWFIWWR2bDlqQkoxNDFwdjlkMjVpY3ZmQU9TZ0hmNWtCMmtUMDFNVHVHOWwzR0dROGNJMENId1Z1RERMaWNzUWJadzNKT0JYd2hSVkk0N1dWMC8xMzIiO30=', NULL),
(25, 3, 3, 27, 'of08Mw-iGNEBTDvZjWldnnwao5iI', '', '文达', '', 'YQDd954b', 1, 1469981592, 0, 'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib2YwOE13LWlHTkVCVER2WmpXbGRubndhbzVpSSI7czo4OiJuaWNrbmFtZSI7czo2OiLmlofovr4iO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumVv+aymSI7czo4OiJwcm92aW5jZSI7czo2OiLmuZbljZciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTI5OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL3ExSFRpYlU3VkpFY1daNGY1a3VZVU5YdVhpYVBNcXB0cHBSSzgwekJZTlJnNzNmRkVCRTFnRjFJWUpUWHo3WUZEbXk5MXpZZ3Rvb0R0Y01SaWI2c3pRSmNac0luRVJHRmJzNy8xMzIiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE0Njk5ODE1OTI7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e31zOjY6ImF2YXRhciI7czoxMjk6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vcTFIVGliVTdWSkVjV1o0ZjVrdVlVTlh1WGlhUE1xcHRwcFJLODB6QllOUmc3M2ZGRUJFMWdGMUlZSlRYejdZRkRteTkxellndG9vRHRjTVJpYjZzelFKY1pzSW5FUkdGYnM3LzEzMiI7fQ==', 1469690566),
(26, 3, 3, 28, 'of08MwwUW3h3uKhGVE6TV0cf4Fw8', '', 'VICO', '', 'xXI68cRJ', 1, 1469692891, 0, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib2YwOE13d1VXM2gzdUtoR1ZFNlRWMGNmNEZ3OCI7czo4OiJuaWNrbmFtZSI7czo0OiJWSUNPIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czowOiIiO3M6ODoicHJvdmluY2UiO3M6Njoi5rKZ6L+mIjtzOjc6ImNvdW50cnkiO3M6MjQ6IumYv+aLieS8r+iBlOWQiOmFi+mVv+WbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMzI6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vTTJpYUVWSzdaQ1dkVlVpYVZpYUVWU01pYVg0MmxWMzE0enVzdUZlczBLdFNjaWFEdlhwRU5jNzh2MkRTT1JnUGpRSHBqNlNkdlVxb2liV3JkSkRHUzdyd1hKeDAxUnZUWGliR3NpYUcvMCI7czoxNDoic3Vic2NyaWJlX3RpbWUiO2k6MTQ2OTY5Mjg5MTtzOjY6InJlbWFyayI7czowOiIiO3M6NzoiZ3JvdXBpZCI7aTowO3M6MTA6InRhZ2lkX2xpc3QiO2E6MDp7fX0=', 1469692942),
(27, 3, 3, 29, 'of08MwwOYxXcwzemuwrkvLjlvKyE', '', '李长武', '', 'gORB19V0', 1, 1469716366, 0, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib2YwOE13d09ZeFhjd3plbXV3cmt2TGpsdkt5RSI7czo4OiJuaWNrbmFtZSI7czo5OiLmnY7plb/mraYiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IuatpuaxiSI7czo4OiJwcm92aW5jZSI7czo2OiLmuZbljJciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTI4OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL3ExSFRpYlU3VkpFZGUzTU42WlU4VVZBajZNVXo2ZEFPcm9ua0lqbDdTRVhCbHFPZ0pxa2ljdEtIZEJDMkhLSDdScXE3dWFKU1NpYWlhdlJkWW1udDNHbElCcklEZ0RRcnBUNWYvMCI7czoxNDoic3Vic2NyaWJlX3RpbWUiO2k6MTQ2OTcxNjM2NjtzOjY6InJlbWFyayI7czowOiIiO3M6NzoiZ3JvdXBpZCI7aTowO3M6MTA6InRhZ2lkX2xpc3QiO2E6MDp7fX0=', 1469721908),
(28, 3, 3, 30, 'of08Mw1y3od2iT4fX7xlaRvnihM4', '', '好资源', '', 'n5AuXLhT', 1, 1468894012, 0, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib2YwOE13MXkzb2QyaVQ0Zlg3eGxhUnZuaWhNNCI7czo4OiJuaWNrbmFtZSI7czo2OiLmnY7okIwiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumVv+aymSI7czo4OiJwcm92aW5jZSI7czo2OiLmuZbljZciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTI5OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL0F2aWJkWTdIYUExbXo3VjRwcHpuR2xMN1c3MGFraWFtTVNqMGZXYmd5SGFCcFBOMHNTcmlhTzduZTh0RWdoOUVYeEhkTnZhM05NV2lhdlFzeXZWc1VpYUYzQjA1ZHhFWEpYNVNhLzAiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE0Njg4OTQwMTI7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e319', 1469767716),
(30, 3, 3, 32, 'of08Mw2ImCvV1VgFdznR7jIOxNjE', '', '好资源2波【美安智能科技】', '', 'diOiUwiQ', 1, 1469774071, 0, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib2YwOE13MkltQ3ZWMVZnRmR6blI3aklPeE5qRSI7czo4OiJuaWNrbmFtZSI7czozMDoi6LCt5rOi44CQ576O5a6J5pm66IO956eR5oqA44CRIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi8yMllEMm9CY1ZVYmliUlFnZklKeUhBVkxpYWNUa29VaWJtSWlhemNRRVpDV05FQlpzMTY5cmgyV21qeWljWXZpYkRST29HTXRqT1FEWmJhdGZNQmtmUnBzSlptdTN0RWhLYzJJSlovMCI7czoxNDoic3Vic2NyaWJlX3RpbWUiO2k6MTQ2OTc3NDA3MTtzOjY6InJlbWFyayI7czowOiIiO3M6NzoiZ3JvdXBpZCI7aTowO3M6MTA6InRhZ2lkX2xpc3QiO2E6MDp7fX0=', 1469779567),
(32, 3, 3, 34, 'of08Mw9YgmwBrNcoaL_fxiARHEig', '', '刘刘', '', 'X1O2BL21', 0, 1469796622, 1469796943, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib2YwOE13OVlnbXdCck5jb2FMX2Z4aUFSSEVpZyI7czo4OiJuaWNrbmFtZSI7czo2OiLliJjliJgiO3M6Mzoic2V4IjtpOjI7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumVv+aymSI7czo4OiJwcm92aW5jZSI7czo2OiLmuZbljZciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTI3OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL3ExSFRpYlU3VkpFY1daNGY1a3VZVU5aYjVSbUhqWDdzTGxXOWR5VU5NWnZwbXRWNlE5MUNld2tpYmhJbXNXZnpJcVRSbmdlRnVEVENQaWE5ZzlZa1NHSGpCOGpMeGc5MkhueS8wIjtzOjE0OiJzdWJzY3JpYmVfdGltZSI7aToxNDY5Nzk2NjIyO3M6NjoicmVtYXJrIjtzOjA6IiI7czo3OiJncm91cGlkIjtpOjA7czoxMDoidGFnaWRfbGlzdCI7YTowOnt9fQ==', 1469796675),
(31, 3, 3, 33, 'of08Mw8KmgUl8AtFNEMvcg8-cQOc', '', '颖儿', '', 'VW1113wq', 1, 1469777289, 0, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib2YwOE13OEttZ1VsOEF0Rk5FTXZjZzgtY1FPYyI7czo4OiJuaWNrbmFtZSI7czo2OiLpopblhL8iO3M6Mzoic2V4IjtpOjI7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumVv+aymSI7czo4OiJwcm92aW5jZSI7czo2OiLmuZbljZciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTI5OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2RkNkZsVHgwR1djRFBRMlE5RDZGMEJMZUxFOWlibWQ4M1B5WEZ0bkI0N2ljUHhDcGljRDFBY0kyZ1o0bVQyQnRyc3hpYzhEWWliamYwU0ZMMHJUWFdHWVNlOGxaNUlCV1o5bmt2LzAiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE0Njk3NzcyODk7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e319', 1469779567),
(33, 3, 3, 35, 'oWHo2s1xmyDv85Orh0LF_cUhnRP8', '', 'Ada', '', 'yW7TDqfZ', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczF4bXlEdjg1T3JoMExGX2NVaG5SUDgiO3M6ODoibmlja25hbWUiO3M6MzoiQWRhIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMjoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lM1J2ZEpWanJkaWNQWjNpY29kNEhsVTUwRXMzaWI1TGN1b0tFbWlhTlRQV3Y0NHJVaWJRZ0p0bXNqcm02TlpiNlY1Mnc5aWNlbzRyNk5QQzM5a1llREFFNUF6VFdrRzdtZTBFYWYvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMyOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2UzUnZkSlZqcmRpY1BaM2ljb2Q0SGxVNTBFczNpYjVMY3VvS0VtaWFOVFBXdjQ0clVpYlFnSnRtc2pybTZOWmI2VjUydzlpY2VvNHI2TlBDMzlrWWVEQUU1QXpUV2tHN21lMEVhZi8xMzIiO30=', 1469797108),
(34, 3, 3, 36, 'oWHo2sxGmZ-KjDYGjZ-HCOzHn7Ys', '', '蓝天', '', 'W4AYKYfi', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3hHbVotS2pEWUdqWi1IQ096SG43WXMiO3M6ODoibmlja25hbWUiO3M6Njoi6JOd5aSpIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lM1J2ZEpWanJkOWhtM3lFZ3YxeFNjS0ZnN1NlMTRpYWliUVhMaWFia3JPeUhESTlBWEdqQUtpYXZqVTNXTWxQNGhtZEpzWTNIbXRVREI3NjlHV1c0SWI0Smg1dDZjaWM5RXJkUS8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzE6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vZTNSdmRKVmpyZDlobTN5RWd2MXhTY0tGZzdTZTE0aWFpYlFYTGlhYmtyT3lIREk5QVhHakFLaWF2alUzV01sUDRobWRKc1kzSG10VURCNzY5R1dXNEliNEpoNXQ2Y2ljOUVyZFEvMTMyIjt9', 1469798359),
(35, 3, 3, 37, 'oWHo2s2vr6arZntFm7zPguhGbFtg', '', '前程远大', '', 'jHidqXMi', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczJ2cjZhclpudEZtN3pQZ3VoR2JGdGciO3M6ODoibmlja25hbWUiO3M6MTI6IuWJjeeoi+i/nOWkpyI7czozOiJzZXgiO2k6MTtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi6KGh5rC0IjtzOjg6InByb3ZpbmNlIjtzOjY6Iuays+WMlyI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxNDY6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vYWpOVmRxSFpMTERSSHJpYjFmYU0xZFFpYXJGeWljZ2JIdXcyOVQ3QWRLUTFiV3p2Z0FmNHV3WjF2dFdjVk9FTWFpYUVUY01OaWNNaWJmNDdlZmFUVjZRdGVEaWJjMmljMWFWQUtnY0pMUWFqOXpmaWFBR3MvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTQ2OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2FqTlZkcUhaTExEUkhyaWIxZmFNMWRRaWFyRnlpY2diSHV3MjlUN0FkS1ExYld6dmdBZjR1d1oxdnRXY1ZPRU1haWFFVGNNTmljTWliZjQ3ZWZhVFY2UXRlRGliYzJpYzFhVkFLZ2NKTFFhajl6ZmlhQUdzLzEzMiI7fQ==', 1469798181),
(36, 3, 3, 38, 'oWHo2s-sBk5RZssob0n47wsT1NAc', '', '好资源2灵', '', 'Kvdu28a3', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8ycy1zQms1Ulpzc29iMG40N3dzVDFOQWMiO3M6ODoibmlja25hbWUiO3M6Njoi6LCt54G1IjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lM1J2ZEpWanJkOXk1VWxGQ00xSGM5RUlReXppY3BwMUdCdVIxSkppYldDRjc1bW1Nblc3RmxKZTVLeXB6dmRma0dVQ2tYVkt6eUpiVzROTlIwaWJHWTJvdGpuaWFLMWsyZ2lhWi8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzE6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vZTNSdmRKVmpyZDl5NVVsRkNNMUhjOUVJUXl6aWNwcDFHQnVSMUpKaWJXQ0Y3NW1tTW5XN0ZsSmU1S3lwenZkZmtHVUNrWFZLenlKYlc0Tk5SMGliR1kyb3RqbmlhSzFrMmdpYVovMTMyIjt9', 1469798447),
(37, 3, 3, 39, 'oWHo2s9fXrZIJL-BIWMG9IVYSZwk', '', '味道', '', 'FrrZbM0b', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczlmWHJaSUpMLUJJV01HOUlWWVNad2siO3M6ODoibmlja25hbWUiO3M6Njoi5ZGz6YGTIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLpnZLlspsiO3M6ODoicHJvdmluY2UiO3M6Njoi5bGx5LicIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyODoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9pYVE1T0NJYlVnVlc4NEdGaWNMQUoxV3hiUjlzdWZCMWZ2eVZGaFAzeUNjc1JBa0gydFBVOXRiNVpCdXFabVN0ejdVcU5kV2tTVWtReXQ0VHAzSVpXa2VNMEdoMWpuanI5Si8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMjg6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vaWFRNU9DSWJVZ1ZXODRHRmljTEFKMVd4YlI5c3VmQjFmdnlWRmhQM3lDY3NSQWtIMnRQVTl0YjVaQnVxWm1TdHo3VXFOZFdrU1VrUXl0NFRwM0laV2tlTTBHaDFqbmpyOUovMTMyIjt9', 1469798480),
(38, 3, 3, 40, 'oWHo2s0aRvrY10kpaDWX1doMl6ik', '', '梦想', '', 'dqk2pzLs', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczBhUnZyWTEwa3BhRFdYMWRvTWw2aWsiO3M6ODoibmlja25hbWUiO3M6Njoi5qKm5oOzIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLmrabmsYkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5YyXIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9Mck5MdlJpYWs0aWNuaWJXZUUzNFJwQzhLbHkzWjhETDY5NlBWeklBSWR4eHFCemlhaWNLVFFLeEc4cG93NWJqNEpRV3F1eUUxZEppYmN4R3U3a0Jma25pYzBreHJMQTdIQ3lSWHZ5LzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9Mck5MdlJpYWs0aWNuaWJXZUUzNFJwQzhLbHkzWjhETDY5NlBWeklBSWR4eHFCemlhaWNLVFFLeEc4cG93NWJqNEpRV3F1eUUxZEppYmN4R3U3a0Jma25pYzBreHJMQTdIQ3lSWHZ5LzEzMiI7fQ==', 1469798749),
(39, 3, 3, 41, 'oWHo2s3uI3YInyfLZ6IA8o49257I', '', '钟金红', '', 'hyq27dDE', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczN1STNZSW55ZkxaNklBOG80OTI1N0kiO3M6ODoibmlja25hbWUiO3M6OToi6ZKf6YeR57qiIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyNzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi83U1BPMG1SSnQ2QWdnYWtPQnZXSHU1Y1JybVQxM2pONG11VkE2cG8yVkdHMEdjWEQ4NTZ4ZER5SjE2Z0pYYmtybGpUcjFrSG1FUGUwdENGWVdWT2NWaWNIWXhhaFRjSVg0LzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEyNzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi83U1BPMG1SSnQ2QWdnYWtPQnZXSHU1Y1JybVQxM2pONG11VkE2cG8yVkdHMEdjWEQ4NTZ4ZER5SjE2Z0pYYmtybGpUcjFrSG1FUGUwdENGWVdWT2NWaWNIWXhhaFRjSVg0LzEzMiI7fQ==', 1469798831),
(40, 3, 3, 42, 'oWHo2s6Es3zZuUSozUo_P4fnReFg', '', '冯静芳', '', 'oLX4LVax', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczZFczN6WnVVU296VW9fUDRmblJlRmciO3M6ODoibmlja25hbWUiO3M6OToi5Yav6Z2Z6IqzIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyNzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RINGxkemZ6TzVZZkt6QmlhUjhSS3V6MURrREFsUGhzWDV2RUQ4WDZSWDBzYzhyQ0tJYnUxWmtyVWdRbkdJbE5GcU5OVHZwM1BUQms5cUdkTWpPZzdaejlJLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEyNzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RINGxkemZ6TzVZZkt6QmlhUjhSS3V6MURrREFsUGhzWDV2RUQ4WDZSWDBzYzhyQ0tJYnUxWmtyVWdRbkdJbE5GcU5OVHZwM1BUQms5cUdkTWpPZzdaejlJLzEzMiI7fQ==', 1469799655),
(41, 3, 3, 43, 'oWHo2s_51AF3lPyikkBI36iD8yF4', '', 'yang xiang', '', 'XR12f5gl', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc181MUFGM2xQeWlra0JJMzZpRDh5RjQiO3M6ODoibmlja25hbWUiO3M6MTI6InlhbmfigIZ4aWFuZyI7czozOiJzZXgiO2k6MjtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi6ZW/5rKZIjtzOjg6InByb3ZpbmNlIjtzOjY6Iua5luWNlyI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMzI6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4velluUlRKd09ESDRsZHpmek81WWZLOW44cDBTRlN2YldMN255V3d6MnZyeU9GNWlhU1RpYTdpYjZScVk3NUlpY3Fob0hCSnhhUXY2azhKOXBxU2N1cUhneHJwaEh6UW9pYWliQzZoLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMjoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RINGxkemZ6TzVZZks5bjhwMFNGU3ZiV0w3bnlXd3oydnJ5T0Y1aWFTVGlhN2liNlJxWTc1SWljcWhvSEJKeGFRdjZrOEo5cHFTY3VxSGd4cnBoSHpRb2lhaWJDNmgvMTMyIjt9', 1469800347),
(42, 3, 3, 44, 'oWHo2s4nKp1KP2JfGHoHwCpnqbvI', '', 'hhl', '', 'vQMCS4y6', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczRuS3AxS1AySmZHSG9Id0NwbnFidkkiO3M6ODoibmlja25hbWUiO3M6MzoiaGhsIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czowOiIiO3M6ODoicHJvdmluY2UiO3M6MDoiIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzNDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9UUkFUUEJHN01NTG1TMnI3UlZZaWFGQ3RZc0ppYVFZZ0FjeVltWmU3WEVMNjhpYWliTzhlTGtpYUluaWM3NndvUUJEazFyT0FGU1FpYWtWR2UzYnBJaWFFRXZHWHBwSjhsNG5uZkEycC8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzQ6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vVFJBVFBCRzdNTUxtUzJyN1JWWWlhRkN0WXNKaWFRWWdBY3lZbVplN1hFTDY4aWFpYk84ZUxraWFJbmljNzZ3b1FCRGsxck9BRlNRaWFrVkdlM2JwSWlhRUV2R1hwcEo4bDRubmZBMnAvMTMyIjt9', 1469800510),
(43, 3, 3, 45, 'oWHo2s90GObDzaolLUeKkbS9JSAo', '', '奔波的葱蒜', '', 'U361vD9q', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczkwR09iRHphb2xMVWVLa2JTOUpTQW8iO3M6ODoibmlja25hbWUiO3M6MTU6IuWllOazoueahOiRseiSnCI7czozOiJzZXgiO2k6MTtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi6ZW/5rKZIjtzOjg6InByb3ZpbmNlIjtzOjY6Iua5luWNlyI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMzI6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vZTNSdmRKVmpyZDl4b0Y4TjdtQVV1ajlVTW1zN0xPZ1VyZEVNZ3F6WVRZRktpYkRpYnNqWlF3d2ZTVGVmeDV6dVlzSTd2eGlhNExpYnhxTGRua0V4OGFLaWE3dll3aWJNT0Q4d0tyLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMjoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lM1J2ZEpWanJkOXhvRjhON21BVXVqOVVNbXM3TE9nVXJkRU1ncXpZVFlGS2liRGlic2paUXd3ZlNUZWZ4NXp1WXNJN3Z4aWE0TGlieHFMZG5rRXg4YUtpYTd2WXdpYk1PRDh3S3IvMTMyIjt9', 1469800593),
(44, 3, 3, 46, 'oWHo2s8cFPAqiXcMK-Gs9ruS-4Ao', '', '大音  希声', '', 'l991mUub', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczhjRlBBcWlYY01LLUdzOXJ1Uy00QW8iO3M6ODoibmlja25hbWUiO3M6MTc6IuWkp+mfsyDugKMg5biM5aOwIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLluLjlvrciO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9pYVE1T0NJYlVnVlVtTXlWTXpmclg1TWFVVlFRZDdZc29zQkhpY1VRd3FoajBqd2NRMlM1azZlTll0MTJFak5YaWJDeTdjN28wUEZtbWpVaGlhQldFZzJtNXpGaWFacERBeUNtNS8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzE6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vaWFRNU9DSWJVZ1ZVbU15Vk16ZnJYNU1hVVZRUWQ3WXNvc0JIaWNVUXdxaGowandjUTJTNWs2ZU5ZdDEyRWpOWGliQ3k3YzdvMFBGbW1qVWhpYUJXRWcybTV6RmlhWnBEQXlDbTUvMTMyIjt9', 1469800941),
(45, 3, 3, 47, 'oWHo2s6N5CAxw3GoozTAlos-c2kI', '', '心语', '', 'cr4r4PPr', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczZONUNBeHczR29velRBbG9zLWMya0kiO3M6ODoibmlja25hbWUiO3M6Njoi5b+D6K+tIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyNzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RINDlGb29JRU1wZ3hxRmFJWG5UZHJjYUM0emc1VkZEY05wQXVLU1MyWDd0eWQ5OVBpYjVDdm5mdnIyeHBrT2JJMldCb0lRMDRHOHlmb3NhdWV3WlN3VmVXLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEyNzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RINDlGb29JRU1wZ3hxRmFJWG5UZHJjYUM0emc1VkZEY05wQXVLU1MyWDd0eWQ5OVBpYjVDdm5mdnIyeHBrT2JJMldCb0lRMDRHOHlmb3NhdWV3WlN3VmVXLzEzMiI7fQ==', 1469800897),
(46, 3, 3, 48, 'oWHo2s9T4m9_eWVC-md0LHQtX_l0', '', '竹叶青', '', 'dPDopb49', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczlUNG05X2VXVkMtbWQwTEhRdFhfbDAiO3M6ODoibmlja25hbWUiO3M6OToi56u55Y+26Z2SIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyODoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RINzdZSURZTTAyVmJ1OWhxRWE5RzhqTTVaMk5ocW9Qczc5Y295RTM4NGpLaHZHakY5dEdmODQ4aWFvS0l1VGliYUtuSU5PZERxc2hoUlluVlJRSjBqeURidy8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMjg6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4velluUlRKd09ESDc3WUlEWU0wMlZidTlocUVhOUc4ak01WjJOaHFvUHM3OWNveUUzODRqS2h2R2pGOXRHZjg0OGlhb0tJdVRpYmFLbklOT2REcXNoaFJZblZSUUowanlEYncvMTMyIjt9', 1469800985),
(47, 3, 3, 49, 'oWHo2szHIrIwXt8e7NQncPhDhFMs', '', '哈尼', '', 'k9XUryi0', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3pISXJJd1h0OGU3TlFuY1BoRGhGTXMiO3M6ODoibmlja25hbWUiO3M6Njoi5ZOI5bC8IjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLmna3lt54iO3M6ODoicHJvdmluY2UiO3M6Njoi5rWZ5rGfIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lM1J2ZEpWanJkOXk1VWxGQ00xSGMwVmlhUUFYMHA4OTNHaHR2VmNIYkQ5MHBLZ1ppY2JyS1E1YmNJR0lpYmdHS2NLR3NsTXR1WkJ5TzdpYTNRSktUeVlsT1daWGNCY3NpY0NyQS8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzE6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vZTNSdmRKVmpyZDl5NVVsRkNNMUhjMFZpYVFBWDBwODkzR2h0dlZjSGJEOTBwS2daaWNicktRNWJjSUdJaWJnR0tjS0dzbE10dVpCeU83aWEzUUpLVHlZbE9XWlhjQmNzaWNDckEvMTMyIjt9', 1469801942),
(48, 3, 3, 50, 'oWHo2s0pA-Zskfw2OnecBg0GnR6g', '', 'lz', '', 'MPnSSyYV', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczBwQS1ac2tmdzJPbmVjQmcwR25SNmciO3M6ODoibmlja25hbWUiO3M6MjoibHoiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6Iuilv+WuiSI7czo4OiJwcm92aW5jZSI7czo2OiLpmZXopb8iO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTM3OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL3NwZDBDYzBHZ3VSNnQ0VGxpYUxpYTNUbVRjSmljQmF1aWI5TW9YdENrZ1BiQ2tlbFVpY3hDQ1FjemlhVzBXaWE2VFlybnd6MjRqa3NBcHE5R1I1aWJLblppY2lhbDVpYVBDOTNBbU1NQ2g1LzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzNzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9zcGQwQ2MwR2d1UjZ0NFRsaWFMaWEzVG1UY0ppY0JhdWliOU1vWHRDa2dQYkNrZWxVaWN4Q0NRY3ppYVcwV2lhNlRZcm53ejI0amtzQXBxOUdSNWliS25aaWNpYWw1aWFQQzkzQW1NTUNoNS8xMzIiO30=', 1469802339),
(49, 3, 3, 51, 'oWHo2s6WKywEEKYEQpbSk59CDYvc', '', '石小兰', '', 'W1tpP8TS', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczZXS3l3RUVLWUVRcGJTazU5Q0RZdmMiO3M6ODoibmlja25hbWUiO3M6OToi55+z5bCP5YWwIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RINGxkemZ6TzVZZks3WTVjY0tpYk84RzRNaWNJSVdjbTBpYkJ3SkFXSkxaZTlvN0N5N3Y1ZHE1UktDYlFXbktGWjRubUM4UUxpY2h6ZjZoTnkwSnZiaFFVNEtGLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RINGxkemZ6TzVZZks3WTVjY0tpYk84RzRNaWNJSVdjbTBpYkJ3SkFXSkxaZTlvN0N5N3Y1ZHE1UktDYlFXbktGWjRubUM4UUxpY2h6ZjZoTnkwSnZiaFFVNEtGLzEzMiI7fQ==', 1469804526),
(50, 3, 3, 52, 'oWHo2s1mTGB4huHuZptrUvGldheQ', '', '唐朝中', '', 'G5W5rUZ2', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczFtVEdCNGh1SHVacHRyVXZHbGRoZVEiO3M6ODoibmlja25hbWUiO3M6OToi5ZSQ5pyd5LitIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLojYbpl6giO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5YyXIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjExODoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9RM2F1SGd6d3pNNm9KbDdpYktMQzlQc3pHczBncHJIV05KaHA2SnRGY3F0V3FpY0ZFcmVwTXltSnF2NTVUcXlzWGhCYktld01ianNacmx3dE0xd0hHdlVRLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjExODoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9RM2F1SGd6d3pNNm9KbDdpYktMQzlQc3pHczBncHJIV05KaHA2SnRGY3F0V3FpY0ZFcmVwTXltSnF2NTVUcXlzWGhCYktld01ianNacmx3dE0xd0hHdlVRLzEzMiI7fQ==', 1469808320),
(51, 3, 3, 53, 'oWHo2s21w-XzXctOP8vbf8mbWhh8', '', '1十@咖啡', '', 'iAd0Q2QN', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczIxdy1YelhjdE9QOHZiZjhtYldoaDgiO3M6ODoibmlja25hbWUiO3M6MTE6IjHljYFA5ZKW5ZWhIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMjoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lM1J2ZEpWanJkOVQwY1BxcDhtRVZpY3dWQ3VrUzJmRWhjM2ljRXlzeW42aWNuUFRocXpnbVd0cnptaWE1WklMYTJDUHBwdzU4OHk3UDFXYUdhaWNxQWZ4dVQ5Rlh4UjhWQWwxaWIvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMyOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2UzUnZkSlZqcmQ5VDBjUHFwOG1FVmljd1ZDdWtTMmZFaGMzaWNFeXN5bjZpY25QVGhxemdtV3Ryem1pYTVaSUxhMkNQcHB3NTg4eTdQMVdhR2FpY3FBZnh1VDlGWHhSOFZBbDFpYi8xMzIiO30=', 1469815094),
(52, 3, 3, 54, 'oWHo2s7NC6K3aZy_SCBONZVZl2o0', '', '陶彦', '', 'RS66aCqB', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczdOQzZLM2FaeV9TQ0JPTlpWWmwybzAiO3M6ODoibmlja25hbWUiO3M6Njoi6Zm25b2mIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9pYVE1T0NJYlVnVlZRa3A2Q1h3b2ljT2dYT0VabHE2NTh2VlB6cTlUQlM2cEtyT2lhVTNacXg4WmtjTG9kd3U5Z3VrMGlhSERNQjk5SXVQY2NkdzRONG9pYk9sQjBGSGljQWFVeWliLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9pYVE1T0NJYlVnVlZRa3A2Q1h3b2ljT2dYT0VabHE2NTh2VlB6cTlUQlM2cEtyT2lhVTNacXg4WmtjTG9kd3U5Z3VrMGlhSERNQjk5SXVQY2NkdzRONG9pYk9sQjBGSGljQWFVeWliLzEzMiI7fQ==', 1469831773),
(53, 3, 3, 55, 'oWHo2swCaxveLO0rosgM6HnsdWOU', '', '快乐就好', '', 'A413Bp3M', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3dDYXh2ZUxPMHJvc2dNNkhuc2RXT1UiO3M6ODoibmlja25hbWUiO3M6MTI6IuW/q+S5kOWwseWlvSI7czozOiJzZXgiO2k6MTtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi5a6d6bihIjtzOjg6InByb3ZpbmNlIjtzOjY6IumZleilvyI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMjg6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vaWFRNU9DSWJVZ1ZYNTR5QUhSSVpOOFJIbmpwNWxrUVRidFpvYjJwM1Y0MkJuU2RBeTdERnVPMzJLUGRSZlFhWTdHWlVrUjZsQTY3TGljNlRwODR2RFNMMk9GRUU2SzJLNVQvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTI4OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2lhUTVPQ0liVWdWWDU0eUFIUklaTjhSSG5qcDVsa1FUYnRab2IycDNWNDJCblNkQXk3REZ1TzMyS1BkUmZRYVk3R1pVa1I2bEE2N0xpYzZUcDg0dkRTTDJPRkVFNksySzVULzEzMiI7fQ==', 1469836232),
(54, 3, 3, 56, 'oWHo2s70q7pvNZ1tcRnxqOqLVwmk', '', '海哥', '', 'HI8m8TVr', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczcwcTdwdk5aMXRjUm54cU9xTFZ3bWsiO3M6ODoibmlja25hbWUiO3M6Njoi5rW35ZOlIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czowOiIiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyOToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RINlFjcEtJM0tBUVdsajFaTXFuWllSckNEYklEQUZQQ2liMWF5ZE1CTHA1d21pY3NpY3N4UmQzMDlldHNhMmFuQmpmR3VjREJtTmtEd05XS0dscmZyVHBEMDkvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTI5OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL3pZblJUSndPREg2UWNwS0kzS0FRV2xqMVpNcW5aWVJyQ0RiSURBRlBDaWIxYXlkTUJMcDV3bWljc2ljc3hSZDMwOWV0c2EyYW5CamZHdWNEQm1Oa0R3TldLR2xyZnJUcEQwOS8xMzIiO30=', 1469839535),
(55, 3, 3, 57, 'oWHo2s8D2FWkhpVHKlVutDTHHXAY', '', '张', '', 'H2C3aNg2', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczhEMkZXa2hwVkhLbFZ1dERUSEhYQVkiO3M6ODoibmlja25hbWUiO3M6Mzoi5bygIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RIN0s2VzFIRVA5UlVVa0VQazJmRjdaUWdTeURYN2s4d0FWZjFBS01qaWFpYVowMnRMaG1iNEZTMTczZDRsanZvTDBDbFNuS1dLUWJodkRJQU5pYmlieTJHTGt5LzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RIN0s2VzFIRVA5UlVVa0VQazJmRjdaUWdTeURYN2s4d0FWZjFBS01qaWFpYVowMnRMaG1iNEZTMTczZDRsanZvTDBDbFNuS1dLUWJodkRJQU5pYmlieTJHTGt5LzEzMiI7fQ==', 1469839859),
(56, 3, 3, 58, 'oWHo2s1qbYNUqriq5Tu5wQFMcD5s', '', '翠宝', '', 'V3iiIDSq', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczFxYllOVXFyaXE1VHU1d1FGTWNENXMiO3M6ODoibmlja25hbWUiO3M6Njoi57+g5a6dIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RINTh4WDRMNDgxRlVMZ3RUUlhYRXZSVUdTc3ZEZ04xaWJwTmJJVHVVWnVnaGljY0U0NEg0aWMxR3dqeTNua0Q4bE9PSkRPT0VDYmtvMXlMa1c3MHY4TW1pYmN2LzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RINTh4WDRMNDgxRlVMZ3RUUlhYRXZSVUdTc3ZEZ04xaWJwTmJJVHVVWnVnaGljY0U0NEg0aWMxR3dqeTNua0Q4bE9PSkRPT0VDYmtvMXlMa1c3MHY4TW1pYmN2LzEzMiI7fQ==', 1469841639),
(57, 3, 3, 59, 'oWHo2szMDKbk0GoFfBsMmbBo859A', '', '冯坤仕', '', 'AA2O2oNd', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3pNREtiazBHb0ZmQnNNbWJCbzg1OUEiO3M6ODoibmlja25hbWUiO3M6OToi5Yav5Z2k5LuVIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czowOiIiO3M6ODoicHJvdmluY2UiO3M6MDoiIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyODoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi83U1BPMG1SSnQ2QXF6cjB2NWliTDRkZEVESlZhMVJLVzdnNDY0MGF2Q0xNR0UxdWJOMUl5TkxhSnlyN3Zta3ZqR1VrWlFCNm01aGMzRHBkNmNuR2xQeThkR3Q1MUNGUmlibS8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMjg6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vN1NQTzBtUkp0NkFxenIwdjVpYkw0ZGRFREpWYTFSS1c3ZzQ2NDBhdkNMTUdFMXViTjFJeU5MYUp5cjd2bWt2akdVa1pRQjZtNWhjM0RwZDZjbkdsUHk4ZEd0NTFDRlJpYm0vMTMyIjt9', 1469843243),
(58, 3, 3, 60, 'oWHo2s7VHmpruqqVLzUKebILZOjc', '', '', '', 'eEQGr5Lp', 0, 0, 0, 'YTo0OntzOjc6ImVycmNvZGUiO2k6NDAwMDE7czo2OiJlcnJtc2ciO3M6OTI6ImludmFsaWQgY3JlZGVudGlhbCwgYWNjZXNzX3Rva2VuIGlzIGludmFsaWQgb3Igbm90IGxhdGVzdCwgaGludHM6IFsgcmVxX2lkOiAyZHZ6dWEwOTQxbnM4NiBdIjtzOjg6Im5pY2tuYW1lIjtzOjA6IiI7czo2OiJhdmF0YXIiO047fQ==', 1469844919),
(59, 3, 3, 61, 'oWHo2s0rGzD-IQMgfC_FsOWJWPo8', '', '夏末@将至', '', 'vRvLN7NR', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczByR3pELUlRTWdmQ19Gc09XSldQbzgiO3M6ODoibmlja25hbWUiO3M6MTM6IuWkj+acq0DlsIboh7MiO3M6Mzoic2V4IjtpOjI7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjA6IiI7czo4OiJwcm92aW5jZSI7czowOiIiO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTI4OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL3pZblJUSndPREg1WmljOWZVc2M3OGlib042ZnFPYzdMRkxvOEhvMXQ0REhnUnVZY3RlNTFiM3RtYUpyWkQ2bEd3d1c5NzJZZEdZTDZaSzQwYTBtQnMySEhqWUR1WHFtZFZuLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEyODoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RINVppYzlmVXNjNzhpYm9ONmZxT2M3TEZMbzhIbzF0NERIZ1J1WWN0ZTUxYjN0bWFKclpENmxHd3dXOTcyWWRHWUw2Wks0MGEwbUJzMkhIallEdVhxbWRWbi8xMzIiO30=', 1469852475),
(60, 3, 3, 62, 'of08Mw9KgFkkCK081-yGr4QWAf9A', '', '夏末@将至', '', 'eT1B7K9D', 1, 1469852483, 0, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib2YwOE13OUtnRmtrQ0swODEteUdyNFFXQWY5QSI7czo4OiJuaWNrbmFtZSI7czoxMzoi5aSP5pyrQOWwhuiHsyI7czozOiJzZXgiO2k6MjtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjk6IueZvuaFleWkpyI7czoxMDoiaGVhZGltZ3VybCI7czoxMjY6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vTTJpYUVWSzdaQ1djbUJST2Fuclc1YmpWY0d5OFJPYjE3Z2ljZEhZZkpXSGxvbjV6MjFaTmJzdTRJUGY1SXhjYUJKN1V6MmxuWnBGbjJDN0ljUTlJNG0xS0FDclQ2c3k4MDkvMCI7czoxNDoic3Vic2NyaWJlX3RpbWUiO2k6MTQ2OTg1MjQ4MztzOjY6InJlbWFyayI7czowOiIiO3M6NzoiZ3JvdXBpZCI7aTowO3M6MTA6InRhZ2lkX2xpc3QiO2E6MDp7fX0=', 1469852490),
(61, 3, 3, 63, 'oWHo2s108sJiTI7g1GdpFhSAzoMY', '', '自由', '', 'P5Ro9NIC', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczEwOHNKaVRJN2cxR2RwRmhTQXpvTVkiO3M6ODoibmlja25hbWUiO3M6Njoi6Ieq55SxIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzNToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9pYVE1T0NJYlVnVlc4NEdGaWNMQUoxV3owTE5jblhmRTN3WTJCcmxoTjVZcXBBdUI5NVNZSGlia3JRNXRKaWFpY2ljT1ZTTU85dk9pYTVHYTgwMWpPYW5WSkQ1ZGljMGhpYW1hUUVPR20vMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTM1OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2lhUTVPQ0liVWdWVzg0R0ZpY0xBSjFXejBMTmNuWGZFM3dZMkJybGhONVlxcEF1Qjk1U1lIaWJrclE1dEppYWljaWNPVlNNTzl2T2lhNUdhODAxak9hblZKRDVkaWMwaGlhbWFRRU9HbS8xMzIiO30=', 1469853289),
(62, 3, 3, 64, 'oWHo2s5NyQDS6pnC0vQk_anOvCF0', '', '菜菜籽', '', 'xkMEBrkr', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczVOeVFEUzZwbkMwdlFrX2FuT3ZDRjAiO3M6ODoibmlja25hbWUiO3M6OToi6I+c6I+c57G9IjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMjoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9pYVE1T0NJYlVnVlc4NEdGaWNMQUoxVzA0RFhjU2ljNGVMTXNlNXpCSkk3UlhrdlhraWJ5V2FlaWEySEY4Njg5TlJudEg0S0tlSFdGZFVDcWljSzdud1VtYjhaMGVvN0RhNmRTelAvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMyOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2lhUTVPQ0liVWdWVzg0R0ZpY0xBSjFXMDREWGNTaWM0ZUxNc2U1ekJKSTdSWGt2WGtpYnlXYWVpYTJIRjg2ODlOUm50SDRLS2VIV0ZkVUNxaWNLN253VW1iOFowZW83RGE2ZFN6UC8xMzIiO30=', 1469855855),
(63, 3, 3, 65, 'oWHo2szSTUudDYyRkt9f-ULuizLA', '', '平淡风轻', '', 'c62rBEO9', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3pTVFV1ZERZeVJrdDlmLVVMdWl6TEEiO3M6ODoibmlja25hbWUiO3M6MTI6IuW5s+a3oemjjui9uyI7czozOiJzZXgiO2k6MTtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi6ZW/5rKZIjtzOjg6InByb3ZpbmNlIjtzOjY6Iua5luWNlyI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMjg6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4velluUlRKd09ESDRkUWtEQnRheUVpYmpUR1RsdUxia01vMFhaak1KMElLQ05icjJuTlV3WHZaUk54WFVNMExIVllQVWljWVNjeWhidnZvSkprQ0lucHJIWjBlTEpoYlpsR0IvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTI4OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL3pZblJUSndPREg0ZFFrREJ0YXlFaWJqVEdUbHVMYmtNbzBYWmpNSjBJS0NOYnIybk5Vd1h2WlJOeFhVTTBMSFZZUFVpY1lTY3loYnZ2b0pKa0NJbnBySFowZUxKaGJabEdCLzEzMiI7fQ==', 1469855982),
(64, 3, 3, 66, 'oWHo2s_RFqlxCtTei3LvWzOFvMuc', '', '晓儿', '', 'b7Exb0e5', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc19SRnFseEN0VGVpM0x2V3pPRnZNdWMiO3M6ODoibmlja25hbWUiO3M6Njoi5pmT5YS/IjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyMDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9RM2F1SGd6d3pNNzVOaWJncGtoaWNvaWNPODRnNmZuUnBoYW42d0NOSGZmZ1NaOExXVGVJejdIR1Qyc3AxbnQ0UjZjT2wyM3JnRkFJaWFSa1VIQ0R1MEVNQVEvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTIwOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL1EzYXVIZ3p3ek03NU5pYmdwa2hpY29pY084NGc2Zm5ScGhhbjZ3Q05IZmZnU1o4TFdUZUl6N0hHVDJzcDFudDRSNmNPbDIzcmdGQUlpYVJrVUhDRHUwRU1BUS8xMzIiO30=', 1469858819),
(65, 3, 3, 67, 'oWHo2syVoVd6uFqvQjR4WERW4YdA', '', '杨淑媛', '', 'kD09Ml8V', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3lWb1ZkNnVGcXZRalI0V0VSVzRZZEEiO3M6ODoibmlja25hbWUiO3M6OToi5p2o5reR5aqbIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czowOiIiO3M6ODoicHJvdmluY2UiO3M6MDoiIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzNToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9oZVBpYUlXTENNTjd5cmYycTdQQk9BaWNpY0FDWUNpY1M3VFJnaWFERFpPVXRGR05rT1lRcVBQbmlja2tIS2ljRFdVdUxGaWFwTTREaGtoZzRQYUFsd0laZEhEOGhFTzVVam9pYU5RMEcvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTM1OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2hlUGlhSVdMQ01ON3lyZjJxN1BCT0FpY2ljQUNZQ2ljUzdUUmdpYUREWk9VdEZHTmtPWVFxUFBuaWNra0hLaWNEV1V1TEZpYXBNNERoa2hnNFBhQWx3SVpkSEQ4aEVPNVVqb2lhTlEwRy8xMzIiO30=', 1469862315),
(66, 3, 3, 68, 'oWHo2synPWIHIhi2g1dqTOpbwN3E', '', '芳子', '', 'ezEQ4eTe', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3luUFdJSEloaTJnMWRxVE9wYndOM0UiO3M6ODoibmlja25hbWUiO3M6Njoi6Iqz5a2QIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLmuZjmva0iO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9pYVE1T0NJYlVnVlVtTXlWTXpmclg1TU9TUm1aY1NvQ2FQWTJyaGQ2eWliaWFCaWNFZ3JwdHZrcUlabTZsdkRxVWxUanVwcHA5UGI4a2RpYTI2OHc2c0xpYVJkemJ6alpiRmlhc2dOLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9pYVE1T0NJYlVnVlVtTXlWTXpmclg1TU9TUm1aY1NvQ2FQWTJyaGQ2eWliaWFCaWNFZ3JwdHZrcUlabTZsdkRxVWxUanVwcHA5UGI4a2RpYTI2OHc2c0xpYVJkemJ6alpiRmlhc2dOLzEzMiI7fQ==', 1469864994),
(67, 3, 3, 69, 'oWHo2s6NK-gIV5VOj9x0mfpjSmmk', '', '十二', '', 'YfF12KH1', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczZOSy1nSVY1Vk9qOXgwbWZwalNtbWsiO3M6ODoibmlja25hbWUiO3M6Njoi5Y2B5LqMIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lM1J2ZEpWanJkaWNFVWxGelhvRUg5aWI0SDJpYlIxRjVieTFmR1dPaGpuQlFqU3BjbGYybllQdWUyZTdZWENVSlJKUE43dUduR2ljdXhXMTIxUVVFbXlpYnF6QmdQQkFmUjN3Ri8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzE6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vZTNSdmRKVmpyZGljRVVsRnpYb0VIOWliNEgyaWJSMUY1YnkxZkdXT2hqbkJRalNwY2xmMm5ZUHVlMmU3WVhDVUpSSlBON3VHbkdpY3V4VzEyMVFVRW15aWJxekJnUEJBZlIzd0YvMTMyIjt9', 1469868286),
(68, 3, 3, 70, 'oWHo2sxgHjl1ogyngMcUdO3RcZ4k', '', '致青春', '', 'pffEW138', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3hnSGpsMW9neW5nTWNVZE8zUmNaNGsiO3M6ODoibmlja25hbWUiO3M6OToi6Ie06Z2S5pilIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czowOiIiO3M6ODoicHJvdmluY2UiO3M6MDoiIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyNjoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi83U1BPMG1SSnQ2Q1BKdklBaDdEQ0s0blhuSGU2c3QwaHVEWUF0Qm5YRVVBNExZV2c0MFVmMUdnSWc4VmRJWWdFQUU4ZlNrNjAwS0ZBdTMwcXBiNzY2ak1neUlhaFpoQjIvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTI2OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuLzdTUE8wbVJKdDZDUEp2SUFoN0RDSzRuWG5IZTZzdDBodURZQXRCblhFVUE0TFlXZzQwVWYxR2dJZzhWZElZZ0VBRThmU2s2MDBLRkF1MzBxcGI3NjZqTWd5SWFoWmhCMi8xMzIiO30=', 1469868421);
INSERT INTO `ims_mc_mapping_fans` (`fanid`, `acid`, `uniacid`, `uid`, `openid`, `unionid`, `nickname`, `groupid`, `salt`, `follow`, `followtime`, `unfollowtime`, `tag`, `updatetime`) VALUES
(69, 3, 3, 71, 'oWHo2s_SzNRLSM2h4f0Cazki8M7A', '', '刘利民', '', 'AnezE48N', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc19Tek5STFNNMmg0ZjBDYXpraThNN0EiO3M6ODoibmlja25hbWUiO3M6OToi5YiY5Yip5rCRIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9pYVE1T0NJYlVnVlVrUktOdUJRQk9rcjJQcWlhYW5EUHAyd3Y2ekhyVGJDMXYwaG5uSXRqNWFYaWJ6eWljcWlhcnljcG5CUndFRDVIN3paamtEQ2ZOVk9Hc01DaGM2dEkxVEE3Ry8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzE6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vaWFRNU9DSWJVZ1ZVa1JLTnVCUUJPa3IyUHFpYWFuRFBwMnd2NnpIclRiQzF2MGhubkl0ajVhWGlienlpY3FpYXJ5Y3BuQlJ3RUQ1SDd6WmprRENmTlZPR3NNQ2hjNnRJMVRBN0cvMTMyIjt9', 1469868698),
(70, 3, 3, 72, 'oWHo2szzSu5b6TcFIXeopE1P2NfY', '', '周金明', '', 's0lQz834', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3p6U3U1YjZUY0ZJWGVvcEUxUDJOZlkiO3M6ODoibmlja25hbWUiO3M6OToi5ZGo6YeR5piOIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyOToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi83U1BPMG1SSnQ2QUZZUXladFp6RkVEZklwdDdhanczRmZEN0lUMU9LZlFreXg1Y3c2UmlhaWFOZWZhSVNvdW9taWJVblBrNktadGpxeThJMHZVcEVtVDZNYlRIZ1NVTlBwMDkvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTI5OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuLzdTUE8wbVJKdDZBRllReVp0WnpGRURmSXB0N2FqdzNGZkQ3SVQxT0tmUWt5eDVjdzZSaWFpYU5lZmFJU291b21pYlVuUGs2S1p0anF5OEkwdlVwRW1UNk1iVEhnU1VOUHAwOS8xMzIiO30=', 1469870215),
(71, 3, 3, 73, 'oWHo2s4xDvpBhQkv4etF1PNL56ss', '', '腊月日.', '', 'jn05C5q0', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczR4RHZwQmhRa3Y0ZXRGMVBOTDU2c3MiO3M6ODoibmlja25hbWUiO3M6MTA6IuiFiuaciOaXpS4iO3M6Mzoic2V4IjtpOjI7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumVv+aymSI7czo4OiJwcm92aW5jZSI7czo2OiLmuZbljZciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMwOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL0tuVWtCMzA2Znc2c01STGN6TkFyTWg1aWNEQ2liZDBkd3ZPeHVHWG5oTjgyd1IxekdrY1RqZDFSbFVnSnBpYWx0UlVac0s1ZTJYclpCV2dic1VlVkJYZmpaRjlSU0p1aWJDcDMvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMwOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL0tuVWtCMzA2Znc2c01STGN6TkFyTWg1aWNEQ2liZDBkd3ZPeHVHWG5oTjgyd1IxekdrY1RqZDFSbFVnSnBpYWx0UlVac0s1ZTJYclpCV2dic1VlVkJYZmpaRjlSU0p1aWJDcDMvMTMyIjt9', 1469873306),
(72, 3, 3, 74, 'oWHo2s6R5f2R_RQmqz1D0Ul86_BU', '', '云淡风清', '', 'qKw3Oe62', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczZSNWYyUl9SUW1xejFEMFVsODZfQlUiO3M6ODoibmlja25hbWUiO3M6MTI6IuS6kea3oemjjua4hSI7czozOiJzZXgiO2k6MjtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi6ZW/5rKZIjtzOjg6InByb3ZpbmNlIjtzOjY6Iua5luWNlyI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMzA6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vaWNIcm5kSDZKQjRPcFlLNlp5eGlhTjBVMFZEc2hjZlJueWU4aWNqQ29HZHpKTUFQekdaYmcwTWFuWEVVbUFhVDJ0WmFwT3p6TEFkaktpYXo3M0JsZ2Zyb095SjlVUEg3dkVnai8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzA6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vaWNIcm5kSDZKQjRPcFlLNlp5eGlhTjBVMFZEc2hjZlJueWU4aWNqQ29HZHpKTUFQekdaYmcwTWFuWEVVbUFhVDJ0WmFwT3p6TEFkaktpYXo3M0JsZ2Zyb095SjlVUEg3dkVnai8xMzIiO30=', 1469890554),
(73, 3, 3, 75, 'oWHo2s5ibUGhmAyi1L7yM50F7Qq0', '', '霞霞', '', 'Vx3FxTYB', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczVpYlVHaG1BeWkxTDd5TTUwRjdRcTAiO3M6ODoibmlja25hbWUiO3M6Njoi6Zye6ZyeIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RINGxkemZ6TzVZZktpYzZOVm5lSlVlUXNpYjVpYlZwN1NUQ2ljTHFUSnQ5c0txcWJIUUJZZ2VFbFRVd3Jwcko5VjM3b2QzTFZFYnozdmlhY1JlazdUUXBmUU1mVS8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzE6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4velluUlRKd09ESDRsZHpmek81WWZLaWM2TlZuZUpVZVFzaWI1aWJWcDdTVENpY0xxVEp0OXNLcXFiSFFCWWdlRWxUVXdycHJKOVYzN29kM0xWRWJ6M3ZpYWNSZWs3VFFwZlFNZlUvMTMyIjt9', 1469892015),
(74, 3, 3, 76, 'oWHo2szQ0Ord-yPB8ZkOMLb_cbSM', '', '宁香', '', 'Q61761Rk', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3pRME9yZC15UEI4WmtPTUxiX2NiU00iO3M6ODoibmlja25hbWUiO3M6Njoi5a6B6aaZIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lM1J2ZEpWanJkOXk1VWxGQ00xSGM4SUdyUGlhVDNveGQzdlNubTVuaWFjRGlib0VEWkZDZk9PMURuVmhjWDFQelh5UUQ1aWFnMU1uWERoYjA1dDZnemZrd2lhT0dYcHl6VFBPRy8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzE6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vZTNSdmRKVmpyZDl5NVVsRkNNMUhjOElHclBpYVQzb3hkM3ZTbm01bmlhY0RpYm9FRFpGQ2ZPTzFEblZoY1gxUHpYeVFENWlhZzFNblhEaGIwNXQ2Z3pma3dpYU9HWHB5elRQT0cvMTMyIjt9', 1469973080),
(75, 3, 3, 77, 'oWHo2s7OQnV3V1aVVjHx320c6Vdc', '', '言西早', '', 'wqW7xLZ2', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczdPUW5WM1YxYVZWakh4MzIwYzZWZGMiO3M6ODoibmlja25hbWUiO3M6OToi6KiA6KW/5pepIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLlqITlupUiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9pYVE1T0NJYlVnVlc4NEdGaWNMQUoxV2liZnlNb2c2bTZzQWhldHQ4TDFRSldZcWljWWdKUmtmakU1NkNiTW1FUEpwVDdGbTRKd2pKZWZIS0lDN01aU0dLdXZsYVNQa3FjNmNQLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9pYVE1T0NJYlVnVlc4NEdGaWNMQUoxV2liZnlNb2c2bTZzQWhldHQ4TDFRSldZcWljWWdKUmtmakU1NkNiTW1FUEpwVDdGbTRKd2pKZWZIS0lDN01aU0dLdXZsYVNQa3FjNmNQLzEzMiI7fQ==', 1469973230),
(76, 3, 3, 78, 'oWHo2szkBYDt51g8czZLW7XwmJ5Q', '', '雨后更清脆', '', 'i6c5WWaf', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3prQllEdDUxZzhjelpMVzdYd21KNVEiO3M6ODoibmlja25hbWUiO3M6MTU6IumbqOWQjuabtOa4heiEhiI7czozOiJzZXgiO2k6MjtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi6ZW/5rKZIjtzOjg6InByb3ZpbmNlIjtzOjY6Iua5luWNlyI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMzQ6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4velluUlRKd09ESDRkUWtEQnRheUVpYmlhdkhtSlR3RzFyRU9MaGlicE15RzdRbE1pY0hXQTdhTzMyaWI4SVdpYm90eHFqc1JvYkI3dllHamliaWJRbnA4TkNOd3ZRdVFXRjVVZFloSkgvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTM0OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL3pZblJUSndPREg0ZFFrREJ0YXlFaWJpYXZIbUpUd0cxckVPTGhpYnBNeUc3UWxNaWNIV0E3YU8zMmliOElXaWJvdHhxanNSb2JCN3ZZR2ppYmliUW5wOE5DTnd2UXVRV0Y1VWRZaEpILzEzMiI7fQ==', 1469974563),
(77, 3, 3, 79, 'oWHo2szYX1tPKAT3lZZLxQ5F9B9A', '', '辉煌', '', 'M2B4yTGA', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3pZWDF0UEtBVDNsWlpMeFE1RjlCOUEiO3M6ODoibmlja25hbWUiO3M6Njoi6L6J54WMIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyOToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lM1J2ZEpWanJkaWJsamhOQWpwVEwyNXJRUDAwenEyZ2NwNU9aYWY4R2x6eFBOOUlhcXBQYndVOVZ3TEpZOHdJaWJJR25pY1RZR2pFTk9lSzFOZUVYcFZmYVB6Wk9YV0FGUFMvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTI5OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2UzUnZkSlZqcmRpYmxqaE5BanBUTDI1clFQMDB6cTJnY3A1T1phZjhHbHp4UE45SWFxcFBid1U5VndMSlk4d0lpYklHbmljVFlHakVOT2VLMU5lRVhwVmZhUHpaT1hXQUZQUy8xMzIiO30=', 1469975961),
(78, 3, 3, 80, 'of08Mw0yg4IvIlrUI4V07nO7wf_w', '', '胡创', '', 'VnWUZ3js', 1, 1469976188, 0, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib2YwOE13MHlnNEl2SWxyVUk0VjA3bk83d2ZfdyI7czo4OiJuaWNrbmFtZSI7czo2OiLog6HliJsiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumVv+aymSI7czo4OiJwcm92aW5jZSI7czo2OiLmuZbljZciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTI4OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL0F2aWJkWTdIYUExbFpoUDhxdUVqbkQzTjlqMWF3eXJUSUl6SXZwV3RpYkRSUEVxZk9qYTJHdjE5TWJoSjJvSVlpYzhWZFI5SnNjWGVad2Z6V2UzaWJaWFhzWGVGQk1zeGNFTWovMCI7czoxNDoic3Vic2NyaWJlX3RpbWUiO2k6MTQ2OTk3NjE4ODtzOjY6InJlbWFyayI7czowOiIiO3M6NzoiZ3JvdXBpZCI7aTowO3M6MTA6InRhZ2lkX2xpc3QiO2E6MDp7fX0=', 1469980222),
(84, 3, 3, 86, 'oWHo2syo4oFxGYQqYdJLpJu0ECN8', '', 'A占', '', 'owceKP6e', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3lvNG9GeEdZUXFZZEpMcEp1MEVDTjgiO3M6ODoibmlja25hbWUiO3M6NDoiQeWNoCI7czozOiJzZXgiO2k6MTtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi6ZW/5pilIjtzOjg6InByb3ZpbmNlIjtzOjY6IuWQieaelyI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMjg6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4velluUlRKd09ESDRsZHpmek81WWZLeVhITGQzY0FjNzF2ZDFvOXZoaWJ1M0RseUNVbHhXbjdkSjVaMkhzT1FGVmJVSkxSWUNaRTBvOWlhT0NkWmE5TXBYbWFIUkI3SkhmR04vMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTI4OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL3pZblJUSndPREg0bGR6ZnpPNVlmS3lYSExkM2NBYzcxdmQxbzl2aGlidTNEbHlDVWx4V243ZEo1WjJIc09RRlZiVUpMUllDWkUwbzlpYU9DZFphOU1wWG1hSFJCN0pIZkdOLzEzMiI7fQ==', 1469986867),
(79, 3, 3, 81, 'oWHo2s-EYif7C81ZXHvPQ4b4bo4Q', '', '好资源2智中', '', 'ZWCaiazb', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8ycy1FWWlmN0M4MVpYSHZQUTRiNGJvNFEiO3M6ODoibmlja25hbWUiO3M6OToi6LCt5pm65LitIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lM1J2ZEpWanJkOXk1VWxGQ00xSGM4R3o4S3dWZFphNjUwVThsMVZYaWFZb2pDUE1uOUlhUG9mcGljOFdjZmRjaWN4NGRwZzYwMmRuOG5OaGRnaWFhWDJIczJEWWxhdTlRcmo1LzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lM1J2ZEpWanJkOXk1VWxGQ00xSGM4R3o4S3dWZFphNjUwVThsMVZYaWFZb2pDUE1uOUlhUG9mcGljOFdjZmRjaWN4NGRwZzYwMmRuOG5OaGRnaWFhWDJIczJEWWxhdTlRcmo1LzEzMiI7fQ==', 1469976498),
(80, 3, 3, 82, 'oWHo2s3pRCyLvvxZCIntABG9NF9k', '', '甫之轩', '', 'Sh8GeZAH', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczNwUkN5THZ2eFpDSW50QUJHOU5GOWsiO3M6ODoibmlja25hbWUiO3M6OToi55Sr5LmL6L2pIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLluLjlvrciO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyNzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RINDJYR2VueEFwOUVCMjd1NFZpYkpKbXBRTVkyWlcxUEVNYmVtYzMwZWFjOHNaV0t0emZzbWhxa2w5cU43MUJmUGg3Y21WN0lxZ0x2SmtDSWg5dERBeDRzLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEyNzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RINDJYR2VueEFwOUVCMjd1NFZpYkpKbXBRTVkyWlcxUEVNYmVtYzMwZWFjOHNaV0t0emZzbWhxa2w5cU43MUJmUGg3Y21WN0lxZ0x2SmtDSWg5dERBeDRzLzEzMiI7fQ==', 1469976856),
(81, 3, 3, 83, 'oWHo2s4i_fVLvpZGqUo-0x6w2afY', '', '张玲子', '', 'C2TwlwtQ', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczRpX2ZWTHZwWkdxVW8tMHg2dzJhZlkiO3M6ODoibmlja25hbWUiO3M6OToi5byg546y5a2QIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czowOiIiO3M6ODoicHJvdmluY2UiO3M6MDoiIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RINGxkemZ6TzVZZkt4Q0RtVHFnWndiNlljRm9hSGhUUjY5dWFZaWJoRUVDRDU0OXpMUjBFUDRBTE4zaWNpY0hkaklMTmJlZ1A3MkRkaWI2WGlhWVllc2VVM1JQWS8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzE6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4velluUlRKd09ESDRsZHpmek81WWZLeENEbVRxZ1p3YjZZY0ZvYUhoVFI2OXVhWWliaEVFQ0Q1NDl6TFIwRVA0QUxOM2ljaWNIZGpJTE5iZWdQNzJEZGliNlhpYVlZZXNlVTNSUFkvMTMyIjt9', 1469977321),
(82, 5, 5, 84, 'oWHo2s2nESiy7Z5EkLnUWa5Z5MSM', '', '刘刘', '', 'oA5q52di', 1, 1459344640, 0, 'YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib1dIbzJzMm5FU2l5N1o1RWtMblVXYTVaNU1TTSI7czo4OiJuaWNrbmFtZSI7czo2OiLliJjliJgiO3M6Mzoic2V4IjtpOjI7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjY6IumVv+aymSI7czo4OiJwcm92aW5jZSI7czo2OiLmuZbljZciO3M6NzoiY291bnRyeSI7czo2OiLkuK3lm70iO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTM1OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2lhUTVPQ0liVWdWVzg0R0ZpY0xBSjFXejZJcTd3WktOZFNpYUYzV1doS3hEbnAzM2xxc2N1eFR3MHNyaWExSjRxV0x5emliNGNBUnpQNlZndGljRkFpYVlzWjVpY0lFZzVCeW5EOElpYi8xMzIiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE0NTkzNDQ2NDA7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e31zOjY6ImF2YXRhciI7czoxMzU6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vaWFRNU9DSWJVZ1ZXODRHRmljTEFKMVd6NklxN3daS05kU2lhRjNXV2hLeERucDMzbHFzY3V4VHcwc3JpYTFKNHFXTHl6aWI0Y0FSelA2Vmd0aWNGQWlhWXNaNWljSUVnNUJ5bkQ4SWliLzEzMiI7fQ==', 1469977696),
(83, 3, 3, 85, 'oWHo2swVVwIGz_Jnadm7MdZAoX3U', '', 'C丫头', '', 'bw9N3kwL', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3dWVndJR3pfSm5hZG03TWRaQW9YM1UiO3M6ODoibmlja25hbWUiO3M6NzoiQ+S4q+WktCI7czozOiJzZXgiO2k6MjtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi6ZW/5rKZIjtzOjg6InByb3ZpbmNlIjtzOjY6Iua5luWNlyI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMzE6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vZTNSdmRKVmpyZDl5NVVsRkNNMUhjOE1Mc1JUWTJXbUxKbkZzemlhZUNsYWc2dVlpYkJ4ZmlheXJVWER3bjc1VjVZeERrU0JpYjFZVHNGN1l1dWt0YTRRaWFKemR1RURnNmFkWFcvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMxOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL2UzUnZkSlZqcmQ5eTVVbEZDTTFIYzhNTHNSVFkyV21MSm5Gc3ppYWVDbGFnNnVZaWJCeGZpYXlyVVhEd243NVY1WXhEa1NCaWIxWVRzRjdZdXVrdGE0UWlhSnpkdUVEZzZhZFhXLzEzMiI7fQ==', 1469977895),
(85, 3, 3, 87, 'oWHo2s9IgVO2rGXKHxP8Wv770-Ug', '', '牧马人', '', 'nDVlEEDT', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yczlJZ1ZPMnJHWEtIeFA4V3Y3NzAtVWciO3M6ODoibmlja25hbWUiO3M6OToi54mn6ams5Lq6IjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czowOiIiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyOToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi96WW5SVEp3T0RIN2lhMVJIUXlOdFlScDUyWGpNdG1sV1NsUk1KeGdITWw3aWI4U2NWRVlYUWttQ3JZYU9ubmJJZ0hCemI0eFB4bjJ1OHY4WWlhWHltMmFVR3J0M0VCYjJLM2gvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTI5OiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL3pZblJUSndPREg3aWExUkhReU50WVJwNTJYak10bWxXU2xSTUp4Z0hNbDdpYjhTY1ZFWVhRa21DcllhT25uYklnSEJ6YjR4UHhuMnU4djhZaWFYeW0yYVVHcnQzRUJiMkszaC8xMzIiO30=', 1470005750),
(86, 3, 3, 88, 'oWHo2sw0BGCiVLO70DeHP6hI_97M', '', '唐波', '', 'CAV21T9i', 0, 0, 0, 'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9XSG8yc3cwQkdDaVZMTzcwRGVIUDZoSV85N00iO3M6ODoibmlja25hbWUiO3M6Njoi5ZSQ5rOiIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lM1J2ZEpWanJkaWJ3OFZoNGNpY09BazRHZTVDYjU1a1Bia0IyQnNMS3o1SzNsRFhpYWZESTlZYjJqdWI1QUZ1NTB2eXp2aWM0Y2tjVmliZmd6T0M1aWIyaWFNcGF5OVk4SER1TWxVLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9lM1J2ZEpWanJkaWJ3OFZoNGNpY09BazRHZTVDYjU1a1Bia0IyQnNMS3o1SzNsRFhpYWZESTlZYjJqdWI1QUZ1NTB2eXp2aWM0Y2tjVmliZmd6T0M1aWIyaWFNcGF5OVk4SER1TWxVLzEzMiI7fQ==', 1470012838),
(87, 3, 3, 89, 'of08Mw0D_cmHzISvhGcunZbW_asw', '', '大 地 金 沙', '', 'lgUefxN2', 1, 1470102628, 0, 'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib2YwOE13MERfY21IeklTdmhHY3VuWmJXX2FzdyI7czo4OiJuaWNrbmFtZSI7czoxNToi5aSnIOWcsCDph5Eg5rKZIjtzOjM6InNleCI7aToyO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfVFciO3M6NDoiY2l0eSI7czo2OiLplb/mspkiO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyNjoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9BdmliZFk3SGFBMWxaaFA4cXVFam5EMVhxaWN6MzZCcDZ2Zmo3eThodkdwOVJXWWpqTXU1RzNBdXVoSDV6eEhRbUhyVnozMGxDVTRuNGd2TDZaSjlrRFN4b29ia1lqVG8xTy8wIjtzOjE0OiJzdWJzY3JpYmVfdGltZSI7aToxNDcwMTAyNjI4O3M6NjoicmVtYXJrIjtzOjA6IiI7czo3OiJncm91cGlkIjtpOjA7czoxMDoidGFnaWRfbGlzdCI7YTowOnt9fQ==', 1470102656);

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_mapping_ucenter`
--

CREATE TABLE IF NOT EXISTS `ims_mc_mapping_ucenter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `centeruid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_mass_record`
--

CREATE TABLE IF NOT EXISTS `ims_mc_mass_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `groupname` varchar(50) NOT NULL,
  `fansnum` int(10) unsigned NOT NULL,
  `msgtype` varchar(10) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `group` int(10) NOT NULL,
  `attach_id` int(10) unsigned NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `cron_id` int(10) unsigned NOT NULL,
  `sendtime` int(10) unsigned NOT NULL,
  `finalsendtime` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_members`
--

CREATE TABLE IF NOT EXISTS `ims_mc_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` varchar(8) NOT NULL,
  `groupid` int(11) NOT NULL,
  `credit1` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `credit3` decimal(10,2) unsigned NOT NULL,
  `credit4` decimal(10,2) unsigned NOT NULL,
  `credit5` decimal(10,2) unsigned NOT NULL,
  `credit6` decimal(10,2) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `vip` tinyint(3) unsigned NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) unsigned NOT NULL,
  `birthmonth` tinyint(3) unsigned NOT NULL,
  `birthday` tinyint(3) unsigned NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `groupid` (`groupid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=90 ;

--
-- 转存表中的数据 `ims_mc_members`
--

INSERT INTO `ims_mc_members` (`uid`, `uniacid`, `mobile`, `email`, `password`, `salt`, `groupid`, `credit1`, `credit2`, `credit3`, `credit4`, `credit5`, `credit6`, `createtime`, `realname`, `nickname`, `avatar`, `qq`, `vip`, `gender`, `birthyear`, `birthmonth`, `birthday`, `constellation`, `zodiac`, `telephone`, `idcard`, `studentid`, `grade`, `address`, `zipcode`, `nationality`, `resideprovince`, `residecity`, `residedist`, `graduateschool`, `company`, `education`, `occupation`, `position`, `revenue`, `affectivestatus`, `lookingfor`, `bloodtype`, `height`, `weight`, `alipay`, `msn`, `taobao`, `site`, `bio`, `interest`) VALUES
(1, 2, '', 'f42750a2c151eadca7b08a439ee738ca@we7.cc', '3f7402841910e84977fff7fa3ccec8f2', 'U7MaEiYM', 2, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1467618714, '', '好资源', 'http://wx.qlogo.cn/mmopen/e3RvdJVjrdibSxwJwnic4ZAPYuHa7FibAHRMljIUZ35Kx0oktHLkkpcK9MCJZJTowugheW4MoctowQyXxzx4WlibwZmia5uvxU8vZ/132', '', 0, 1, 0, 0, 0, '', '', '', '', '', '', '', '', '中国', '河北省', '长沙市', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2, 3, '', '4e7e65d60f8969a007f17e29a5dd9e92@we7.cc', 'fdbb16e53363a424d00659551a3c5af4', 'RMgod4WG', 3, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1467621813, '', '好资源2波【美安智能科技】', 'http://wx.qlogo.cn/mmopen/7SPO0mRJt6CPJvIAh7DCK3oQg8froibnyedK4rtllkMahPiaHvC6QZrRA0OgBNqZLH4efN7Zic6GXLfayemSicXJl6I2rNPR52dP/132', '', 0, 1, 0, 0, 0, '', '', '', '', '', '', '河北省长沙市开福区金帆小区', '', '中国', '河北省', '长沙市', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(4, 3, '', 'f3b6b6134b988bfebee57352d46355a3@we7.cc', '58ced71dca9ec360c03e37078790ddc0', 'dq2q2OEz', 3, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1467701965, '', '米波网络科技@赞木 ', 'http://wx.qlogo.cn/mmopen/zYnRTJwODH4ldzfzO5YfK8O7DyxtbvLULsgm73HCicUcIx7UAD76I0QGlfeyQtRyZqxAkMBoeYuCNh8hibgVSUI0Wp5140vHuW/132', '', 0, 1, 0, 0, 0, '', '', '', '', '', '', '', '', '中国', '河北省', '株洲市', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(31, 3, '', '1668d8ee9b6bdba504b9b45c25f7d106@we7.cc', 'e927a17f2244c6cd279947e1ce6ca828', 'R819SSjk', 3, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1469772263, '', '儿童玩具总经销', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBuF9ctiaXtlia0dKMkjnhBYWqcrVwibFgPvdye4B8YWCEZEq7kaxYNdyaMzL4MRDHCGxxG4Bc61bkTw/132', '', 0, 1, 0, 0, 0, '', '', '', '', '', '', '', '', '中国', '河北省', '常德市', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(6, 3, '', '045b5ba15d571a5a83cf14546967be55@we7.cc', '8a27ae6eab42aa467c0c17b020487d2c', 'x6lIIlES', 3, '2.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1467702556, '', '文达', 'http://wx.qlogo.cn/mmopen/iaQ5OCIbUgVW84GFicLAJ1WxxJ1dXGyTfbU9Wj1g4a5PBLlU3nSjsSUVLwyIdUY9Ksq0Wqo3CwAGolAJntBZOiaNzg91goPZZjG/132', '', 0, 1, 0, 0, 0, '', '', '', '', '', '', '河北省长沙市开福区德雅路1420', '', '中国', '河北省', '长沙市', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_member_address`
--

CREATE TABLE IF NOT EXISTS `ims_mc_member_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(50) unsigned NOT NULL,
  `username` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `province` varchar(32) NOT NULL,
  `city` varchar(32) NOT NULL,
  `district` varchar(32) NOT NULL,
  `address` varchar(512) NOT NULL,
  `isdefault` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uinacid` (`uniacid`),
  KEY `idx_uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `ims_mc_member_address`
--

INSERT INTO `ims_mc_member_address` (`id`, `uniacid`, `uid`, `username`, `mobile`, `zipcode`, `province`, `city`, `district`, `address`, `isdefault`) VALUES
(1, 3, 6, '好资源', '18011111111', '', '河北省', '长沙市', '开福区', '德雅路1420', 1),
(2, 3, 0, 'limeng', '18670727221', '', '北京市', '北京辖区', '东城区', '的的', 0),
(3, 3, 0, 'limeng', '18670727221', '', '北京市', '北京辖区', '崇文区', '范德萨120发', 1),
(4, 3, 2, '好资源2', '18011111111', '', '河北省', '长沙市', '开福区', '金帆小区', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_member_fields`
--

CREATE TABLE IF NOT EXISTS `ims_mc_member_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `fieldid` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `displayorder` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_fieldid` (`fieldid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=145 ;

--
-- 转存表中的数据 `ims_mc_member_fields`
--

INSERT INTO `ims_mc_member_fields` (`id`, `uniacid`, `fieldid`, `title`, `available`, `displayorder`) VALUES
(1, 2, 1, '真实姓名', 1, 0),
(2, 2, 2, '昵称', 1, 1),
(3, 2, 3, '头像', 1, 1),
(4, 2, 4, 'QQ号', 1, 0),
(5, 2, 5, '手机号码', 1, 0),
(6, 2, 6, 'VIP级别', 1, 0),
(7, 2, 7, '性别', 1, 0),
(8, 2, 8, '出生生日', 1, 0),
(9, 2, 9, '星座', 1, 0),
(10, 2, 10, '生肖', 1, 0),
(11, 2, 11, '固定电话', 1, 0),
(12, 2, 12, '证件号码', 1, 0),
(13, 2, 13, '学号', 1, 0),
(14, 2, 14, '班级', 1, 0),
(15, 2, 15, '邮寄地址', 1, 0),
(16, 2, 16, '邮编', 1, 0),
(17, 2, 17, '国籍', 1, 0),
(18, 2, 18, '居住地址', 1, 0),
(19, 2, 19, '毕业学校', 1, 0),
(20, 2, 20, '公司', 1, 0),
(21, 2, 21, '学历', 1, 0),
(22, 2, 22, '职业', 1, 0),
(23, 2, 23, '职位', 1, 0),
(24, 2, 24, '年收入', 1, 0),
(25, 2, 25, '情感状态', 1, 0),
(26, 2, 26, ' 交友目的', 1, 0),
(27, 2, 27, '血型', 1, 0),
(28, 2, 28, '身高', 1, 0),
(29, 2, 29, '体重', 1, 0),
(30, 2, 30, '支付宝帐号', 1, 0),
(31, 2, 31, 'MSN', 1, 0),
(32, 2, 32, '电子邮箱', 1, 0),
(33, 2, 33, '阿里旺旺', 1, 0),
(34, 2, 34, '主页', 1, 0),
(35, 2, 35, '自我介绍', 1, 0),
(36, 2, 36, '兴趣爱好', 1, 0),
(37, 3, 1, '真实姓名', 1, 0),
(38, 3, 2, '昵称', 1, 1),
(39, 3, 3, '头像', 1, 1),
(40, 3, 4, 'QQ号', 1, 0),
(41, 3, 5, '手机号码', 1, 0),
(42, 3, 6, 'VIP级别', 1, 0),
(43, 3, 7, '性别', 1, 0),
(44, 3, 8, '出生生日', 1, 0),
(45, 3, 9, '星座', 1, 0),
(46, 3, 10, '生肖', 1, 0),
(47, 3, 11, '固定电话', 1, 0),
(48, 3, 12, '证件号码', 1, 0),
(49, 3, 13, '学号', 1, 0),
(50, 3, 14, '班级', 1, 0),
(51, 3, 15, '邮寄地址', 1, 0),
(52, 3, 16, '邮编', 1, 0),
(53, 3, 17, '国籍', 1, 0),
(54, 3, 18, '居住地址', 1, 0),
(55, 3, 19, '毕业学校', 1, 0),
(56, 3, 20, '公司', 1, 0),
(57, 3, 21, '学历', 1, 0),
(58, 3, 22, '职业', 1, 0),
(59, 3, 23, '职位', 1, 0),
(60, 3, 24, '年收入', 1, 0),
(61, 3, 25, '情感状态', 1, 0),
(62, 3, 26, ' 交友目的', 1, 0),
(63, 3, 27, '血型', 1, 0),
(64, 3, 28, '身高', 1, 0),
(65, 3, 29, '体重', 1, 0),
(66, 3, 30, '支付宝帐号', 1, 0),
(67, 3, 31, 'MSN', 1, 0),
(68, 3, 32, '电子邮箱', 1, 0),
(69, 3, 33, '阿里旺旺', 1, 0),
(70, 3, 34, '主页', 1, 0),
(71, 3, 35, '自我介绍', 1, 0),
(72, 3, 36, '兴趣爱好', 1, 0),
(73, 4, 1, '真实姓名', 1, 0),
(74, 4, 2, '昵称', 1, 1),
(75, 4, 3, '头像', 1, 1),
(76, 4, 4, 'QQ号', 1, 0),
(77, 4, 5, '手机号码', 1, 0),
(78, 4, 6, 'VIP级别', 1, 0),
(79, 4, 7, '性别', 1, 0),
(80, 4, 8, '出生生日', 1, 0),
(81, 4, 9, '星座', 1, 0),
(82, 4, 10, '生肖', 1, 0),
(83, 4, 11, '固定电话', 1, 0),
(84, 4, 12, '证件号码', 1, 0),
(85, 4, 13, '学号', 1, 0),
(86, 4, 14, '班级', 1, 0),
(87, 4, 15, '邮寄地址', 1, 0),
(88, 4, 16, '邮编', 1, 0),
(89, 4, 17, '国籍', 1, 0),
(90, 4, 18, '居住地址', 1, 0),
(91, 4, 19, '毕业学校', 1, 0),
(92, 4, 20, '公司', 1, 0),
(93, 4, 21, '学历', 1, 0),
(94, 4, 22, '职业', 1, 0),
(95, 4, 23, '职位', 1, 0),
(96, 4, 24, '年收入', 1, 0),
(97, 4, 25, '情感状态', 1, 0),
(98, 4, 26, ' 交友目的', 1, 0),
(99, 4, 27, '血型', 1, 0),
(100, 4, 28, '身高', 1, 0),
(101, 4, 29, '体重', 1, 0),
(102, 4, 30, '支付宝帐号', 1, 0),
(103, 4, 31, 'MSN', 1, 0),
(104, 4, 32, '电子邮箱', 1, 0),
(105, 4, 33, '阿里旺旺', 1, 0),
(106, 4, 34, '主页', 1, 0),
(107, 4, 35, '自我介绍', 1, 0),
(108, 4, 36, '兴趣爱好', 1, 0),
(109, 5, 1, '真实姓名', 1, 0),
(110, 5, 2, '昵称', 1, 1),
(111, 5, 3, '头像', 1, 1),
(112, 5, 4, 'QQ号', 1, 0),
(113, 5, 5, '手机号码', 1, 0),
(114, 5, 6, 'VIP级别', 1, 0),
(115, 5, 7, '性别', 1, 0),
(116, 5, 8, '出生生日', 1, 0),
(117, 5, 9, '星座', 1, 0),
(118, 5, 10, '生肖', 1, 0),
(119, 5, 11, '固定电话', 1, 0),
(120, 5, 12, '证件号码', 1, 0),
(121, 5, 13, '学号', 1, 0),
(122, 5, 14, '班级', 1, 0),
(123, 5, 15, '邮寄地址', 1, 0),
(124, 5, 16, '邮编', 1, 0),
(125, 5, 17, '国籍', 1, 0),
(126, 5, 18, '居住地址', 1, 0),
(127, 5, 19, '毕业学校', 1, 0),
(128, 5, 20, '公司', 1, 0),
(129, 5, 21, '学历', 1, 0),
(130, 5, 22, '职业', 1, 0),
(131, 5, 23, '职位', 1, 0),
(132, 5, 24, '年收入', 1, 0),
(133, 5, 25, '情感状态', 1, 0),
(134, 5, 26, ' 交友目的', 1, 0),
(135, 5, 27, '血型', 1, 0),
(136, 5, 28, '身高', 1, 0),
(137, 5, 29, '体重', 1, 0),
(138, 5, 30, '支付宝帐号', 1, 0),
(139, 5, 31, 'MSN', 1, 0),
(140, 5, 32, '电子邮箱', 1, 0),
(141, 5, 33, '阿里旺旺', 1, 0),
(142, 5, 34, '主页', 1, 0),
(143, 5, 35, '自我介绍', 1, 0),
(144, 5, 36, '兴趣爱好', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_oauth_fans`
--

CREATE TABLE IF NOT EXISTS `ims_mc_oauth_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oauth_openid` varchar(50) NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_oauthopenid_acid` (`oauth_openid`,`acid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ims_mc_oauth_fans`
--

INSERT INTO `ims_mc_oauth_fans` (`id`, `oauth_openid`, `acid`, `uid`, `openid`) VALUES
(1, 'oWHo2s_AaKqd4TVHh6VlcBEARI9I', 4, 11, 'o4gcJwrF30OWjugMoLnvqxUjKcXg');

-- --------------------------------------------------------

--
-- 表的结构 `ims_menu_event`
--

CREATE TABLE IF NOT EXISTS `ims_menu_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `keyword` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `picmd5` varchar(32) NOT NULL,
  `openid` varchar(128) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `picmd5` (`picmd5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mobilenumber`
--

CREATE TABLE IF NOT EXISTS `ims_mobilenumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `dateline` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules`
--

CREATE TABLE IF NOT EXISTS `ims_modules` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `version` varchar(10) NOT NULL,
  `ability` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `settings` tinyint(1) NOT NULL,
  `subscribes` varchar(500) NOT NULL,
  `handles` varchar(500) NOT NULL,
  `isrulefields` tinyint(1) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL,
  `target` int(10) unsigned NOT NULL,
  `iscard` tinyint(3) unsigned NOT NULL,
  `permissions` varchar(5000) NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- 转存表中的数据 `ims_modules`
--

INSERT INTO `ims_modules` (`mid`, `name`, `type`, `title`, `version`, `ability`, `description`, `author`, `url`, `settings`, `subscribes`, `handles`, `isrulefields`, `issystem`, `target`, `iscard`, `permissions`) VALUES
(1, 'basic', 'system', '基本文字回复', '1.0', '和您进行简单对话', '一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的回复内容.', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, ''),
(2, 'news', 'system', '基本混合图文回复', '1.0', '为你提供生动的图文资讯', '一问一答得简单对话, 但是回复内容包括图片文字等更生动的媒体内容. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的图文回复内容.', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, ''),
(3, 'music', 'system', '基本音乐回复', '1.0', '提供语音、音乐等音频类回复', '在回复规则中可选择具有语音、音乐等音频类的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝，实现一问一答得简单对话。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, ''),
(4, 'userapi', 'system', '自定义接口回复', '1.1', '更方便的第三方接口设置', '自定义接口又称第三方接口，可以让开发者更方便的接入微擎系统，高效的与微信公众平台进行对接整合。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, ''),
(5, 'recharge', 'system', '会员中心充值模块', '1.0', '提供会员充值功能', '', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 0, 1, 0, 0, ''),
(6, 'custom', 'system', '多客服转接', '1.0.0', '用来接入腾讯的多客服系统', '', 'WeEngine Team', 'http://bbs.we7.cc', 0, 'a:0:{}', 'a:6:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:8:"location";i:4;s:4:"link";i:5;s:4:"text";}', 1, 1, 0, 0, ''),
(7, 'images', 'system', '基本图片回复', '1.0', '提供图片回复', '在回复规则中可选择具有图片的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝图片。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, ''),
(8, 'video', 'system', '基本视频回复', '1.0', '提供图片回复', '在回复规则中可选择具有视频的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝视频。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, ''),
(9, 'voice', 'system', '基本语音回复', '1.0', '提供语音回复', '在回复规则中可选择具有语音的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝语音。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, ''),
(10, 'chats', 'system', '发送客服消息', '1.0', '公众号可以在粉丝最后发送消息的48小时内无限制发送消息', '', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 0, 1, 0, 0, ''),
(11, 'wxcard', 'system', '微信卡券回复', '1.0', '微信卡券回复', '微信卡券回复', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, ''),
(12, 'paycenter', 'system', '收银台', '1.0', '收银台', '收银台', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, ''),
(15, 'ewei_shopping', 'business', '微商城', '6.8', '微商城', '微商城', 'WeEngine Team & ewei', '', 1, 'a:0:{}', 'a:1:{i:0;s:4:"text";}', 0, 0, 0, 0, 'N;');

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_bindings`
--

CREATE TABLE IF NOT EXISTS `ims_modules_bindings` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(30) NOT NULL,
  `entry` varchar(10) NOT NULL,
  `call` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `do` varchar(30) NOT NULL,
  `state` varchar(200) NOT NULL,
  `direct` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `displayorder` tinyint(255) unsigned NOT NULL,
  PRIMARY KEY (`eid`),
  KEY `idx_module` (`module`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `ims_modules_bindings`
--

INSERT INTO `ims_modules_bindings` (`eid`, `module`, `entry`, `call`, `title`, `do`, `state`, `direct`, `url`, `icon`, `displayorder`) VALUES
(9, 'ewei_shopping', 'cover', '', '商城入口设置', 'list', '', 0, '', '', 0),
(10, 'ewei_shopping', 'menu', '', '订单管理', 'order', '', 0, '', '', 0),
(11, 'ewei_shopping', 'menu', '', '商品管理', 'goods', '', 0, '', '', 0),
(12, 'ewei_shopping', 'menu', '', '商品分类', 'category', '', 0, '', '', 0),
(13, 'ewei_shopping', 'menu', '', '物流管理', 'express', '', 0, '', '', 0),
(14, 'ewei_shopping', 'menu', '', '配送方式', 'dispatch', '', 0, '', '', 0),
(15, 'ewei_shopping', 'menu', '', '幻灯片管理', 'adv', '', 0, '', '', 0),
(16, 'ewei_shopping', 'menu', '', '维权与告警', 'notice', '', 0, '', '', 0),
(17, 'ewei_shopping', 'home', '', '商城', 'list', '', 0, '', '', 0),
(18, 'ewei_shopping', 'profile', '', '我的订单', 'myorder', '', 0, '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_recycle`
--

CREATE TABLE IF NOT EXISTS `ims_modules_recycle` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `modulename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modulename` (`modulename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_music_reply`
--

CREATE TABLE IF NOT EXISTS `ims_music_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` varchar(300) NOT NULL,
  `hqurl` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_news_reply`
--

CREATE TABLE IF NOT EXISTS `ims_news_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `parent_id` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `url` varchar(255) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ims_news_reply`
--

INSERT INTO `ims_news_reply` (`id`, `rid`, `parent_id`, `title`, `author`, `description`, `thumb`, `content`, `url`, `displayorder`, `incontent`, `createtime`) VALUES
(1, 19, 0, '欢迎关注好资源社区', '好资源源码', '“好资源源码”是好资源源码旗下流媒体技术转化成果，精心搭建和挖掘围绕企业 、客户、价值的全球云（EaaS)生态，', 'images/3/2016/07/Y0gYH9mZcp9E33ieCDDS00HOBPDc0C.jpg', '<p style="text-indent: 0em; line-height: 1.5em; margin-top: 10px;"><strong><span style="color: rgb(0, 112, 192);"><img src="http://www.010xr.com/attachment/images/3/2016/07/U3b71qk060ZPuuu8RRbffpV6r7V0Rq.jpg" width="100%" alt="好资源源码-公众号二维码.jpg"/></span></strong></p><p style="text-indent: 0em; line-height: 1.5em; margin-top: 10px; text-align: center;"><span style="color:#0070c0"><strong>请长按识别以上二维码，或<a href="http://www.010xr.com/app/index.php?i=2&c=entry&yid=1&do=index&m=mon_yjgz" target="_blank"><span style="color: rgb(192, 0, 0);">点击此处</span>关注公众号</a></strong></span></p><p style="text-indent: 0em; line-height: 1.5em; margin-top: 10px;"><strong><span style="color: rgb(0, 112, 192);"><br/></span></strong></p><p style="text-indent: 0em; line-height: 1.5em; margin-top: 10px;"><strong><span style="color: rgb(0, 112, 192);">好资源源码，感恩相识，让我们为您创造价值！</span></strong></p><p style="text-indent: 0em; line-height: 1.5em; margin-top: 10px;">“好资源源码”是好资源源码旗下流媒体软件即服务（SaaS)平台，致力于搭建和挖掘围绕企业 、客户、价值的全球云生态即服务（EaaS)平台，好资源源码在全球范围提供专业领先的视频云服务（如CDN、云点播、云直播、Data+），好资源源码全面支持新一代3G/4G WIFI 有线网络传输技术 、4K 高清图传技术、H.265 /H.264数字视频压缩技术，是业界领先的企业级网络直播服务平台。</p><p style="text-indent: 0em; line-height: 1.5em; margin-top: 10px;">我们以创新的方式和服务进入移动互联网+视频直播这一领域，致力于帮助行业用户在移动互联网时代更加便捷、快速、有效、低成本地建立用户联系和流量变现，我们前期推出的针对自媒体企业的”微直播“系统、针对展销型企业的”微展销“系统、针对教育培训机构的”微课堂“系统，针对政府行政部门的”智慧监管“系统，成功为多家企业、学校、政府部门提供专业服务，广泛得到好评。</p><p style="line-height: 1.5em; text-indent: 0em;"><br/></p><p style="text-indent: 0em; line-height: 1.5em; margin-top: 10px;"><strong><span style="color: rgb(0, 112, 192);">好资源源码，从视频直播入手拉近现场与观众的距离！</span></strong></p><p style="text-indent: 0em; line-height: 1.5em; margin-top: 10px;">当今，各种图片文字信息充斥于我们每天的日常工作和生活中，信息爆炸、信息过剩让我们无所适从，真真假假无法识别，而音视频现场直播这种新媒体信息传播方式，无须像制作电视广告、剪辑电影般精心美化；就让企业活动、会议、新品发布、产品演示、教学等等，这些现场都通过音视频直播最真实的呈现给观众，让观众感受到信息的真实，无需过多的求证与甄别，从而拉近现场与观众、企业与用户、主办方与接受方的时空距离，让有限的现场也有无限的观众。</p><p style="line-height: 1.5em; text-indent: 0em;"><br/></p><p style="text-indent: 0em; line-height: 1.5em; margin-top: 10px;"><strong><span style="color: rgb(0, 112, 192);">好资源源码，打造以“流量变现”为核心的直播！</span></strong></p><p style="text-indent: 0em; line-height: 1.5em; margin-top: 10px;">好资源源码为您提供：全球的视频分发网络、精准数据统计、互动引擎、精准营销，电子商务；让您方便有效的传递信息的同时，将观众变为粉丝、将粉丝变成消费者，将一次用户变成长期合作伙伴。使用好资源源码平台进行直播，可轻松建立起自己的直播频道，并可连续推送音视频、图文、PPT等组合消息，还能嵌入到您的官网或微信公众号中，帮助您维护及联系客户，建立与客户之间的互动关系。让网络时代的流量转化变现，是好资源源码始终坚持的核心目标。</p><p style="line-height: 1.5em; text-indent: 0em;"><br/></p><p style="text-indent: 0em; line-height: 1.5em; margin-top: 10px;"><span style="color: rgb(0, 112, 192);">专业不止于此，我们始终坚持做有价值的产品，我们始终努力让服务变的更好。</span><br/><br/>电话：0731-8511-8588<br/>手机：18011111111（好资源2先生）<br/>邮箱：342069854@qq.com<br/>网址：http://www.010xr.com<br/></p><p style="text-indent: 0em;">地址：湖南长沙市开福区三一大道君泰城市快线18F</p><p style="text-indent: 0em;"><br/></p>', '', 0, 1, 1469980941);

-- --------------------------------------------------------

--
-- 表的结构 `ims_paycenter_order`
--

CREATE TABLE IF NOT EXISTS `ims_paycenter_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `uniontid` varchar(40) NOT NULL,
  `transaction_id` varchar(40) NOT NULL,
  `type` varchar(10) NOT NULL,
  `trade_type` varchar(10) NOT NULL,
  `body` varchar(255) NOT NULL,
  `fee` varchar(15) NOT NULL,
  `final_fee` decimal(10,2) unsigned NOT NULL,
  `credit1` int(10) unsigned NOT NULL,
  `credit1_fee` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `cash` decimal(10,2) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  `auth_code` varchar(30) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `follow` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `credit_status` tinyint(3) unsigned NOT NULL,
  `paytime` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_profile_fields`
--

CREATE TABLE IF NOT EXISTS `ims_profile_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `displayorder` smallint(6) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `unchangeable` tinyint(1) NOT NULL,
  `showinregister` tinyint(1) NOT NULL,
  `field_length` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- 转存表中的数据 `ims_profile_fields`
--

INSERT INTO `ims_profile_fields` (`id`, `field`, `available`, `title`, `description`, `displayorder`, `required`, `unchangeable`, `showinregister`, `field_length`) VALUES
(1, 'realname', 1, '真实姓名', '', 0, 1, 1, 1, 0),
(2, 'nickname', 1, '昵称', '', 1, 1, 0, 1, 0),
(3, 'avatar', 1, '头像', '', 1, 0, 0, 0, 0),
(4, 'qq', 1, 'QQ号', '', 0, 0, 0, 1, 0),
(5, 'mobile', 1, '手机号码', '', 0, 0, 0, 0, 0),
(6, 'vip', 1, 'VIP级别', '', 0, 0, 0, 0, 0),
(7, 'gender', 1, '性别', '', 0, 0, 0, 0, 0),
(8, 'birthyear', 1, '出生生日', '', 0, 0, 0, 0, 0),
(9, 'constellation', 1, '星座', '', 0, 0, 0, 0, 0),
(10, 'zodiac', 1, '生肖', '', 0, 0, 0, 0, 0),
(11, 'telephone', 1, '固定电话', '', 0, 0, 0, 0, 0),
(12, 'idcard', 1, '证件号码', '', 0, 0, 0, 0, 0),
(13, 'studentid', 1, '学号', '', 0, 0, 0, 0, 0),
(14, 'grade', 1, '班级', '', 0, 0, 0, 0, 0),
(15, 'address', 1, '邮寄地址', '', 0, 0, 0, 0, 0),
(16, 'zipcode', 1, '邮编', '', 0, 0, 0, 0, 0),
(17, 'nationality', 1, '国籍', '', 0, 0, 0, 0, 0),
(18, 'resideprovince', 1, '居住地址', '', 0, 0, 0, 0, 0),
(19, 'graduateschool', 1, '毕业学校', '', 0, 0, 0, 0, 0),
(20, 'company', 1, '公司', '', 0, 0, 0, 0, 0),
(21, 'education', 1, '学历', '', 0, 0, 0, 0, 0),
(22, 'occupation', 1, '职业', '', 0, 0, 0, 0, 0),
(23, 'position', 1, '职位', '', 0, 0, 0, 0, 0),
(24, 'revenue', 1, '年收入', '', 0, 0, 0, 0, 0),
(25, 'affectivestatus', 1, '情感状态', '', 0, 0, 0, 0, 0),
(26, 'lookingfor', 1, ' 交友目的', '', 0, 0, 0, 0, 0),
(27, 'bloodtype', 1, '血型', '', 0, 0, 0, 0, 0),
(28, 'height', 1, '身高', '', 0, 0, 0, 0, 0),
(29, 'weight', 1, '体重', '', 0, 0, 0, 0, 0),
(30, 'alipay', 1, '支付宝帐号', '', 0, 0, 0, 0, 0),
(31, 'msn', 1, 'MSN', '', 0, 0, 0, 0, 0),
(32, 'email', 1, '电子邮箱', '', 0, 0, 0, 0, 0),
(33, 'taobao', 1, '阿里旺旺', '', 0, 0, 0, 0, 0),
(34, 'site', 1, '主页', '', 0, 0, 0, 0, 0),
(35, 'bio', 1, '自我介绍', '', 0, 0, 0, 0, 0),
(36, 'interest', 1, '兴趣爱好', '', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_qrcode`
--

CREATE TABLE IF NOT EXISTS `ims_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `extra` int(10) unsigned NOT NULL,
  `qrcid` bigint(20) NOT NULL,
  `scene_str` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `model` tinyint(1) unsigned NOT NULL,
  `ticket` varchar(250) NOT NULL,
  `url` varchar(256) NOT NULL,
  `expire` int(10) unsigned NOT NULL,
  `subnum` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qrcid` (`qrcid`),
  KEY `uniacid` (`uniacid`),
  KEY `ticket` (`ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_qrcode_stat`
--

CREATE TABLE IF NOT EXISTS `ims_qrcode_stat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `qid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `qrcid` bigint(20) unsigned NOT NULL,
  `scene_str` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_rule`
--

CREATE TABLE IF NOT EXISTS `ims_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `ims_rule`
--

INSERT INTO `ims_rule` (`id`, `uniacid`, `name`, `module`, `displayorder`, `status`) VALUES
(1, 0, '城市天气', 'userapi', 255, 1),
(2, 0, '百度百科', 'userapi', 255, 1),
(3, 0, '即时翻译', 'userapi', 255, 1),
(4, 0, '今日老黄历', 'userapi', 255, 1),
(5, 0, '看新闻', 'userapi', 255, 1),
(6, 0, '快递查询', 'userapi', 255, 1),
(7, 1, '个人中心入口设置', 'cover', 0, 1),
(8, 1, '微擎团队入口设置', 'cover', 0, 1),
(9, 2, '直播首页', 'cover', 0, 1),
(10, 3, '直播首页', 'cover', 0, 1),
(11, 4, '直播首页', 'cover', 0, 1),
(12, 4, 'ceshi', 'basic', 0, 1),
(14, 5, '直播首页', 'cover', 0, 1),
(18, 3, '欢迎信息', 'basic', 0, 1),
(19, 3, '好资源源码', 'news', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_rule_keyword`
--

CREATE TABLE IF NOT EXISTS `ims_rule_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `content` varchar(255) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_content` (`content`),
  KEY `idx_rid` (`rid`),
  KEY `idx_uniacid_type_content` (`uniacid`,`type`,`content`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- 转存表中的数据 `ims_rule_keyword`
--

INSERT INTO `ims_rule_keyword` (`id`, `rid`, `uniacid`, `module`, `content`, `type`, `displayorder`, `status`) VALUES
(1, 1, 0, 'userapi', '^.+天气$', 3, 255, 1),
(2, 2, 0, 'userapi', '^百科.+$', 3, 255, 1),
(3, 2, 0, 'userapi', '^定义.+$', 3, 255, 1),
(4, 3, 0, 'userapi', '^@.+$', 3, 255, 1),
(5, 4, 0, 'userapi', '日历', 1, 255, 1),
(6, 4, 0, 'userapi', '万年历', 1, 255, 1),
(7, 4, 0, 'userapi', '黄历', 1, 255, 1),
(8, 4, 0, 'userapi', '几号', 1, 255, 1),
(9, 5, 0, 'userapi', '新闻', 1, 255, 1),
(10, 6, 0, 'userapi', '^(申通|圆通|中通|汇通|韵达|顺丰|EMS) *[a-z0-9]{1,}$', 3, 255, 1),
(11, 7, 1, 'cover', '个人中心', 1, 0, 1),
(12, 8, 1, 'cover', '首页', 1, 0, 1),
(13, 9, 2, 'cover', '11', 1, 0, 1),
(26, 10, 3, 'cover', '直播', 1, 0, 1),
(22, 11, 4, 'cover', '111', 1, 0, 1),
(16, 12, 4, 'basic', '测试', 1, 0, 1),
(20, 14, 5, 'cover', '直播', 1, 0, 1),
(27, 18, 3, 'basic', '欢迎', 1, 0, 1),
(34, 19, 3, 'news', '好资源源码', 1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_shopping_adv`
--

CREATE TABLE IF NOT EXISTS `ims_shopping_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `advname` varchar(50) DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_enabled` (`enabled`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_shopping_cart`
--

CREATE TABLE IF NOT EXISTS `ims_shopping_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `goodsid` int(11) NOT NULL,
  `goodstype` tinyint(1) NOT NULL DEFAULT '1',
  `from_user` varchar(50) NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `optionid` int(10) DEFAULT '0',
  `marketprice` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `idx_openid` (`from_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_shopping_category`
--

CREATE TABLE IF NOT EXISTS `ims_shopping_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `thumb` varchar(255) NOT NULL COMMENT '分类图片',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID,0为第一级',
  `isrecommand` int(10) DEFAULT '0',
  `description` varchar(500) NOT NULL COMMENT '分类介绍',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ims_shopping_category`
--

INSERT INTO `ims_shopping_category` (`id`, `weid`, `name`, `thumb`, `parentid`, `isrecommand`, `description`, `displayorder`, `enabled`) VALUES
(1, 3, '智能家居', 'images/3/2016/07/pv5uxrx5U3cR805xACr84bXx1X30NX.jpg', 0, 1, '', 0, 1),
(2, 3, '方太厨具', 'images/3/2016/07/Vc7cCCPCjRb84PcC0tTFZ246bTrA16.png', 0, 0, '', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_shopping_dispatch`
--

CREATE TABLE IF NOT EXISTS `ims_shopping_dispatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `dispatchname` varchar(50) DEFAULT '',
  `dispatchtype` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `firstprice` decimal(10,2) DEFAULT '0.00',
  `secondprice` decimal(10,2) DEFAULT '0.00',
  `firstweight` int(11) DEFAULT '0',
  `secondweight` int(11) DEFAULT '0',
  `express` int(11) DEFAULT '0',
  `enabled` int(11) NOT NULL DEFAULT '0',
  `description` text,
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ims_shopping_dispatch`
--

INSERT INTO `ims_shopping_dispatch` (`id`, `weid`, `dispatchname`, `dispatchtype`, `displayorder`, `firstprice`, `secondprice`, `firstweight`, `secondweight`, `express`, `enabled`, `description`) VALUES
(2, 3, '免邮', 0, 1, '0.00', '0.00', 1000, 1000, 0, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_shopping_express`
--

CREATE TABLE IF NOT EXISTS `ims_shopping_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `express_name` varchar(50) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `express_price` varchar(10) DEFAULT '',
  `express_area` varchar(100) DEFAULT '',
  `express_url` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_shopping_feedback`
--

CREATE TABLE IF NOT EXISTS `ims_shopping_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1为维权，2为告擎',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态0未解决，1用户同意，2用户拒绝',
  `feedbackid` varchar(30) NOT NULL COMMENT '投诉单号',
  `transid` varchar(30) NOT NULL COMMENT '订单号',
  `reason` varchar(1000) NOT NULL COMMENT '理由',
  `solution` varchar(1000) NOT NULL COMMENT '期待解决方案',
  `remark` varchar(1000) NOT NULL COMMENT '备注',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_weid` (`weid`),
  KEY `idx_feedbackid` (`feedbackid`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_transid` (`transid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_shopping_goods`
--

CREATE TABLE IF NOT EXISTS `ims_shopping_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `pcate` int(10) unsigned NOT NULL DEFAULT '0',
  `ccate` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1为实体，2为虚拟',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `unit` varchar(5) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `goodssn` varchar(50) NOT NULL DEFAULT '',
  `productsn` varchar(50) NOT NULL DEFAULT '',
  `marketprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `productprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `costprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `originalprice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '原价',
  `total` int(10) unsigned NOT NULL DEFAULT '0',
  `totalcnf` int(11) DEFAULT '0' COMMENT '0 拍下减库存 1 付款减库存 2 永久不减',
  `sales` int(10) unsigned NOT NULL DEFAULT '0',
  `spec` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `weight` decimal(10,2) NOT NULL DEFAULT '0.00',
  `credit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `maxbuy` int(11) DEFAULT '0',
  `usermaxbuy` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户最多购买数量',
  `hasoption` int(11) DEFAULT '0',
  `dispatch` int(11) DEFAULT '0',
  `thumb_url` text,
  `isnew` int(11) DEFAULT '0',
  `ishot` int(11) DEFAULT '0',
  `isdiscount` int(11) DEFAULT '0',
  `isrecommand` int(11) DEFAULT '0',
  `istime` int(11) DEFAULT '0',
  `timestart` int(11) DEFAULT '0',
  `timeend` int(11) DEFAULT '0',
  `viewcount` int(11) DEFAULT '0',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ims_shopping_goods`
--

INSERT INTO `ims_shopping_goods` (`id`, `weid`, `pcate`, `ccate`, `type`, `status`, `displayorder`, `title`, `thumb`, `unit`, `description`, `content`, `goodssn`, `productsn`, `marketprice`, `productprice`, `costprice`, `originalprice`, `total`, `totalcnf`, `sales`, `spec`, `createtime`, `weight`, `credit`, `maxbuy`, `usermaxbuy`, `hasoption`, `dispatch`, `thumb_url`, `isnew`, `ishot`, `isdiscount`, `isrecommand`, `istime`, `timestart`, `timeend`, `viewcount`, `deleted`) VALUES
(1, 3, 1, 0, 1, 0, 0, '脐橙', 'images/3/2016/07/gTTHPs9ilGGRtUtgHGTUxRTQQTTHGt.jpg', '斤', '', '', '', '', '18.80', '18.80', '0.00', '0.00', 50000, 1, 366, '', 1467887403, '500.00', '0.00', 1000, 1000, 0, 0, 'a:0:{}', 1, 1, 1, 1, 0, 1467887280, 1467887280, 27, 0),
(2, 3, 2, 0, 1, 1, 0, '方太套餐A 7月23日特惠 油烟机EM03T+燃气灶FD1B+热水器1306或消毒柜WH5', 'images/3/2016/07/h2314Za0Aizk3K0WK1b75DRY022NYN.jpg', '套', '', '<p style="text-align: center;"><span style="font-size:24px;color:#ff0000;"><strong>方太油烟机EM03T</strong></span></p><p style="text-align: center;"><span style="font-size:24px;color:#ff0000;"></span></p><p><img src="http://zhibo.huichong360.cn/attachment/images/3/2016/07/m5y1s5k6QvgwpVkGGSKgyS60gS8J1y.jpg" width="100%" style=""/></p><p><img src="http://zhibo.huichong360.cn/attachment/images/3/2016/07/y3INYVYNn4WvyyWu4ieyYqnnv1Y15q.jpg" width="100%" style=""/></p><p style="text-align: center;"><span style="font-size:24px;color:#ff0000;"><strong>方太燃气灶FD1B</strong></span></p><p style="text-align: center;"><span style="font-size:24px;color:#ff0000;"><strong><img src="http://zhibo.huichong360.cn/attachment/images/3/2016/07/Zy7f077zgJWPjGGJf55O0ky5m0g8zO.png" width="100%" alt="5785b2ce92e37.png"/></strong></span></p><p style="text-align: center;"><span style="font-size:24px;color:#ff0000;"></span></p><p><img src="http://zhibo.huichong360.cn/attachment/images/3/2016/07/na18VZoAK8a2PrV571ovVM25ou2vvM.jpg" width="100%"/><img src="http://zhibo.huichong360.cn/attachment/images/3/2016/07/R2UfzKnNrXf4ZhqFC04204M555QkN5.jpg" width="100%" alt="5785b34ae1d90.jpg"/></p><p><br/></p><p style="text-align: center;"><span style="font-size:24px;color:#ff0000;"><strong><strong><span style="font-size:24px;color:#ff0000;">方太热水器1306</span></strong></strong></span><br/></p><p style="text-align: center;"><span style="font-size:24px;color:#ff0000;"><strong><strong><span style="font-size:24px;color:#ff0000;"></span></strong></strong></span></p><p><img src="http://zhibo.huichong360.cn/attachment/images/3/2016/07/M4JzAqZcfVuUJmFsUSTViJUgCsBsA2.jpg" width="100%" style=""/></p><p><img src="http://zhibo.huichong360.cn/attachment/images/3/2016/07/HVLTFllsSFV2DhY2V9YsEV7h7E7DLD.jpg" width="100%" style=""/></p><p><img src="http://zhibo.huichong360.cn/attachment/images/3/2016/07/vzk3Kz9LU6kpy3ZL5o34yu4UYO6BK9.jpg" width="100%" style=""/></p><p style="text-align: center;"><strong><span style="font-size:24px;color:#ff6666;">方太消毒柜WH5</span></strong></p><p style="text-align: center;"><img src="http://zhibo.huichong360.cn/attachment/images/3/2016/07/dobDnSXfConODF6I5C5BOcs55658I5.jpg" width="100%" alt="images/3/2016/07/dobDnSXfConODF6I5C5BOcs55658I5.jpg"/><img src="http://zhibo.huichong360.cn/attachment/images/3/2016/07/na18VZoAK8a2PrV571ovVM25ou2vvM.jpg" width="100%" alt="5785b6ddc9ba7.jpg"/><img src="http://zhibo.huichong360.cn/attachment/images/3/2016/07/sgJy5ygI9ezZ19e5eKfvfelMvtj5VY.png" width="100%" alt="images/3/2016/07/sgJy5ygI9ezZ19e5eKfvfelMvtj5VY.png"/><span style="font-size:24px;color:#ff0000;"><strong><strong><span style="font-size:24px;color:#ff0000;"><br/></span></strong></strong></span><br/></p>', '', '', '7967.00', '7967.00', '0.00', '12195.00', 10, 1, 1, '', 1469017470, '30000.00', '0.00', 1, 1, 1, 0, 'a:2:{i:0;s:51:"images/3/2016/07/paRir53I833wrT3R8i3T5l738L8v5W.png";i:1;s:51:"images/3/2016/07/PJObI7KgrMUj7z7D5jSyihva75HdsD.jpg";}', 0, 0, 0, 1, 1, 1469253600, 1469264400, 9, 0),
(3, 3, 2, 0, 1, 1, 0, '方太套餐B 油烟机JQ01TS+燃气灶JA6B+水槽洗碗机Q3- 7月23日特惠', 'images/3/2016/07/Tot8v7OPTT7d5soK2HQOOCs6eEtHk8.jpg', '套', '', '<p style="text-align: center;"><strong><span style="font-size:24px;color:#ff0000;">方太油烟机JQ01TS</span></strong><strong><span style="font-size:24px;color:#ff0000;"><br/></span></strong></p><p style="text-align: center;"><strong><span style="font-size:24px;color:#ff0000;"></span></strong></p><p><img src="http://zhibo.huichong360.cn/attachment/images/3/2016/07/cXHcHxXTXTh4AllA1wAX7C7GgtPl74.jpg" width="100%" style=""/></p><p><img src="http://zhibo.huichong360.cn/attachment/images/3/2016/07/gNa5jEkgj9z9215g952g58en2ee3G5.png" width="100%"/><img src="http://zhibo.huichong360.cn/attachment/images/3/2016/07/WO6OAq5I6B3isooz3QIQyQ1G73i99s.jpg" width="100%" alt="5785ba0411ce5.jpg"/></p><p style="text-align: center;"><strong><span style="font-size:24px;color:#ff0000;"><strong><span style="font-size:24px;color:#ff0000;">方太燃气灶JA6B</span></strong></span></strong><br/></p><p style="text-align: center;"><strong><span style="font-size:24px;color:#ff0000;"><strong><span style="font-size:24px;color:#ff0000;"></span></strong></span></strong></p><p><img src="http://zhibo.huichong360.cn/attachment/images/3/2016/07/uovLooODV3wlQOQ4vwvUwqZWy2oOv3.jpg" width="100%" style=""/></p><p><img src="http://zhibo.huichong360.cn/attachment/images/3/2016/07/QUUe5l555L6i5J5u4Hz5Z5h8LFDsQD.jpg" width="100%" style=""/></p><p><img src="http://zhibo.huichong360.cn/attachment/images/3/2016/07/kmp9x8V0Vk0KSqW6Xlrx6RX858r09i.jpg" width="100%" style=""/></p><p style="text-align: center;"><strong><span style="font-size:24px;color:#ff0000;">方太水槽洗碗机Q3</span></strong></p><p><img src="http://zhibo.huichong360.cn/attachment/images/3/2016/07/wxz0XRfwPM1qYsRFL0xP7pc19iiRrI.png" width="100%"/><img src="http://zhibo.huichong360.cn/attachment/images/3/2016/07/QsDSyPc1usCCeDZSSDIsJJUILLcsVH.png" width="100%" alt="c2.png"/><img src="http://zhibo.huichong360.cn/attachment/images/3/2016/07/u5341OiH15113rE1ZH3ZjtaaXOSu5p.png" width="100%" alt="c3.png"/></p><p style="text-align: center;"><strong><span style="font-size:24px;color:#ff0000;"><strong><span style="font-size:24px;color:#ff0000;"><br/></span></strong></span></strong><br/></p>', '', '', '13439.00', '13439.00', '0.00', '19507.00', 10, 1, 0, '', 1469020146, '30000.00', '0.00', 1, 1, 1, 0, 'a:2:{i:0;s:51:"images/3/2016/07/IBH4IfK991tUk9QiuWiAWbQu99Bh1Q.jpg";i:1;s:51:"images/3/2016/07/OK70O4gQqRqr87Up1Kcx9u0r777p2c.jpg";}', 0, 0, 0, 1, 0, 1469020080, 1469020080, 25, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_shopping_goods_option`
--

CREATE TABLE IF NOT EXISTS `ims_shopping_goods_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `thumb` varchar(60) DEFAULT '',
  `productprice` decimal(10,2) DEFAULT '0.00',
  `marketprice` decimal(10,2) DEFAULT '0.00',
  `costprice` decimal(10,2) DEFAULT '0.00',
  `stock` int(11) DEFAULT '0',
  `weight` decimal(10,2) DEFAULT '0.00',
  `displayorder` int(11) DEFAULT '0',
  `specs` text,
  PRIMARY KEY (`id`),
  KEY `indx_goodsid` (`goodsid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ims_shopping_goods_option`
--

INSERT INTO `ims_shopping_goods_option` (`id`, `goodsid`, `title`, `thumb`, `productprice`, `marketprice`, `costprice`, `stock`, `weight`, `displayorder`, `specs`) VALUES
(1, 3, 'B套餐优惠券', '', '19507.00', '10.00', '0.00', 10, '10000.00', 0, '1'),
(2, 2, 'A套餐10元优惠券', '', '12195.00', '10.00', '0.00', 10, '10.00', 0, '2');

-- --------------------------------------------------------

--
-- 表的结构 `ims_shopping_goods_param`
--

CREATE TABLE IF NOT EXISTS `ims_shopping_goods_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `value` text,
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_goodsid` (`goodsid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_shopping_order`
--

CREATE TABLE IF NOT EXISTS `ims_shopping_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `ordersn` varchar(20) NOT NULL,
  `price` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '-1取消状态，0普通状态，1为已付款，2为已发货，3为成功',
  `sendtype` tinyint(1) unsigned NOT NULL COMMENT '1为快递，2为自提',
  `paytype` tinyint(1) unsigned NOT NULL COMMENT '1为余额，2为在线，3为到付',
  `transid` varchar(30) NOT NULL DEFAULT '0' COMMENT '微信支付单号',
  `goodstype` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `remark` varchar(1000) NOT NULL DEFAULT '',
  `address` varchar(1024) NOT NULL DEFAULT '' COMMENT '收货地址信息',
  `expresscom` varchar(30) NOT NULL DEFAULT '',
  `expresssn` varchar(50) NOT NULL DEFAULT '',
  `express` varchar(200) NOT NULL DEFAULT '',
  `goodsprice` decimal(10,2) DEFAULT '0.00',
  `dispatchprice` decimal(10,2) DEFAULT '0.00',
  `dispatch` int(10) DEFAULT '0',
  `paydetail` varchar(255) NOT NULL COMMENT '支付详情',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `ims_shopping_order`
--

INSERT INTO `ims_shopping_order` (`id`, `weid`, `from_user`, `ordersn`, `price`, `status`, `sendtype`, `paytype`, `transid`, `goodstype`, `remark`, `address`, `expresscom`, `expresssn`, `express`, `goodsprice`, `dispatchprice`, `dispatch`, `paydetail`, `createtime`) VALUES
(3, 3, 'oWHo2s-6qUWT0jGqOBoJHNi3nqU8', '07075810', '18.8', -1, 1, 0, '0', 1, '', '好资源|18011111111||河北省|长沙市|开福区|德雅路1420', '', '', '', '18.80', '0.00', 0, '', 1467888212),
(4, 3, 'oWHo2s1rKD9SutcL7Yh9Sbi47ma4', '07098418', '18.8', 0, 1, 0, '0', 1, '', '好资源2|18011111111||河北省|长沙市|开福区|金帆小区', '', '', '', '18.80', '0.00', 0, '', 1468032348);

-- --------------------------------------------------------

--
-- 表的结构 `ims_shopping_order_goods`
--

CREATE TABLE IF NOT EXISTS `ims_shopping_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `orderid` int(10) unsigned NOT NULL,
  `goodsid` int(10) unsigned NOT NULL,
  `price` decimal(10,2) DEFAULT '0.00',
  `total` int(10) unsigned NOT NULL DEFAULT '1',
  `optionid` int(10) DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL,
  `optionname` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `ims_shopping_order_goods`
--

INSERT INTO `ims_shopping_order_goods` (`id`, `weid`, `orderid`, `goodsid`, `price`, `total`, `optionid`, `createtime`, `optionname`) VALUES
(1, 3, 1, 1, '18.80', 1, 0, 1467887824, NULL),
(2, 3, 2, 1, '18.80', 1, 0, 1467887876, NULL),
(3, 3, 3, 1, '18.80', 1, 0, 1467888212, NULL),
(4, 3, 4, 1, '18.80', 1, 0, 1468032348, NULL),
(5, 3, 5, 2, '10.00', 1, 0, 1469019074, NULL),
(6, 3, 6, 3, '10.00', 1, 0, 1469020807, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ims_shopping_product`
--

CREATE TABLE IF NOT EXISTS `ims_shopping_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) NOT NULL,
  `productsn` varchar(50) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `marketprice` decimal(10,0) unsigned NOT NULL,
  `productprice` decimal(10,0) unsigned NOT NULL,
  `total` int(11) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `spec` varchar(5000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_goodsid` (`goodsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_shopping_spec`
--

CREATE TABLE IF NOT EXISTS `ims_shopping_spec` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `displaytype` tinyint(3) unsigned NOT NULL,
  `content` text NOT NULL,
  `goodsid` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ims_shopping_spec`
--

INSERT INTO `ims_shopping_spec` (`id`, `weid`, `title`, `description`, `displaytype`, `content`, `goodsid`, `displayorder`) VALUES
(1, 3, '拍下优惠券，到店享实惠', '', 0, 'a:1:{i:0;s:1:"1";}', 3, 0),
(2, 3, 'A套餐优惠券', '', 0, 'a:1:{i:0;s:1:"2";}', 2, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_shopping_spec_item`
--

CREATE TABLE IF NOT EXISTS `ims_shopping_spec_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) DEFAULT '0',
  `specid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `show` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`weid`),
  KEY `indx_specid` (`specid`),
  KEY `indx_show` (`show`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ims_shopping_spec_item`
--

INSERT INTO `ims_shopping_spec_item` (`id`, `weid`, `specid`, `title`, `thumb`, `show`, `displayorder`) VALUES
(1, 3, 1, '10元优惠券', 'images/3/2016/07/kzPZpvkKLqBfvZkPKPyZwpv4lRgGzv.gif', 1, 0),
(2, 3, 2, 'A套餐10元优惠券', 'images/3/2016/07/kzPZpvkKLqBfvZkPKPyZwpv4lRgGzv.gif', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_article`
--

CREATE TABLE IF NOT EXISTS `ims_site_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `iscommend` tinyint(1) NOT NULL,
  `ishot` tinyint(1) unsigned NOT NULL,
  `pcate` int(10) unsigned NOT NULL,
  `ccate` int(10) unsigned NOT NULL,
  `template` varchar(300) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL,
  `linkurl` varchar(500) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `credit` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_iscommend` (`iscommend`),
  KEY `idx_ishot` (`ishot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_category`
--

CREATE TABLE IF NOT EXISTS `ims_site_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `nid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `parentid` int(10) unsigned NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `icon` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `linkurl` varchar(500) NOT NULL,
  `ishomepage` tinyint(1) NOT NULL,
  `icontype` tinyint(1) unsigned NOT NULL,
  `css` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_multi`
--

CREATE TABLE IF NOT EXISTS `ims_site_multi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `site_info` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `bindhost` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `bindhost` (`bindhost`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ims_site_multi`
--

INSERT INTO `ims_site_multi` (`id`, `uniacid`, `title`, `styleid`, `site_info`, `status`, `bindhost`) VALUES
(1, 1, '微擎团队', 1, '', 1, ''),
(2, 2, '美安智能科技', 2, '', 0, ''),
(3, 3, '美安智能科技', 3, 'a:4:{s:5:"thumb";s:0:"";s:7:"keyword";s:0:"";s:11:"description";s:18:"好资源源码平台";s:6:"footer";s:53:"好资源源码 (c) 2015-2017 www.010xr.com 版权所有";}', 0, 'zhibo.huichong360.cn'),
(4, 4, '乐云TV', 4, '', 0, ''),
(5, 5, '美安智能科技', 5, '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_nav`
--

CREATE TABLE IF NOT EXISTS `ims_site_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `section` tinyint(4) NOT NULL,
  `module` varchar(50) NOT NULL,
  `displayorder` smallint(5) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `position` tinyint(4) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(500) NOT NULL,
  `css` varchar(1000) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `categoryid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_page`
--

CREATE TABLE IF NOT EXISTS `ims_site_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `params` longtext NOT NULL,
  `html` longtext NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `goodnum` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ims_site_page`
--

INSERT INTO `ims_site_page` (`id`, `uniacid`, `multiid`, `title`, `description`, `params`, `html`, `type`, `status`, `createtime`, `goodnum`) VALUES
(1, 1, 0, '快捷菜单', '', '{"navStyle":"2","bgColor":"#f4f4f4","menus":[{"title":"\\u4f1a\\u5458\\u5361","url":".\\/index.php?c=mc&a=bond&do=card&i=1","submenus":[],"icon":{"name":"fa fa-credit-card","color":"#969696"},"image":"","hoverimage":"","hovericon":[]},{"title":"\\u5151\\u6362","url":".\\/index.php?c=activity&a=coupon&do=display&&i=1","submenus":[],"icon":{"name":"fa fa-money","color":"#969696"},"image":"","hoverimage":"","hovericon":[]},{"title":"\\u4ed8\\u6b3e","url":"\\" data-target=\\"#scan\\" data-toggle=\\"modal\\" href=\\"javascript:void();","submenus":[],"icon":{"name":"fa fa-qrcode","color":"#969696"},"image":"","hoverimage":"","hovericon":""},{"title":"\\u4e2a\\u4eba\\u4e2d\\u5fc3","url":".\\/index.php?i=1&c=mc&","submenus":[],"icon":{"name":"fa fa-user","color":"#969696"},"image":"","hoverimage":"","hovericon":[]}],"extend":[],"position":{"homepage":true,"usercenter":true,"page":true,"article":true},"ignoreModules":[]}', '<div style="background-color: rgb(244, 244, 244);" class="js-quickmenu nav-menu-app has-nav-0  has-nav-4"   ><ul class="nav-group clearfix"><li class="nav-group-item " ><a href="./index.php?c=mc&a=bond&do=card&i=1" style="background-position: center 2px;" ><i style="color: rgb(150, 150, 150);"  class="fa fa-credit-card"  js-onclass-name="" js-onclass-color="" ></i><span style="color: rgb(150, 150, 150);" class=""  js-onclass-color="">会员卡</span></a></li><li class="nav-group-item " ><a href="./index.php?c=activity&a=coupon&do=display&&i=1" style="background-position: center 2px;" ><i style="color: rgb(150, 150, 150);"  class="fa fa-money"  js-onclass-name="" js-onclass-color="" ></i><span style="color: rgb(150, 150, 150);" class=""  js-onclass-color="">兑换</span></a></li><li class="nav-group-item " ><a href="" data-target="#scan" data-toggle="modal" href="javascript:void();" style="background-position: center 2px;" ><i style="color: rgb(150, 150, 150);"  class="fa fa-qrcode"  js-onclass-name="" js-onclass-color="" ></i><span style="color: rgb(150, 150, 150);" class=""  js-onclass-color="">付款</span></a></li><li class="nav-group-item " ><a href="./index.php?i=1&c=mc&" style="background-position: center 2px;" ><i style="color: rgb(150, 150, 150);"  class="fa fa-user"  js-onclass-name="" js-onclass-color="" ></i><span style="color: rgb(150, 150, 150);" class=""  js-onclass-color="">个人中心</span></a></li></ul></div>', 4, 1, 1440242655, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_slide`
--

CREATE TABLE IF NOT EXISTS `ims_site_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `displayorder` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_styles`
--

CREATE TABLE IF NOT EXISTS `ims_site_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `templateid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ims_site_styles`
--

INSERT INTO `ims_site_styles` (`id`, `uniacid`, `templateid`, `name`) VALUES
(1, 1, 1, '微站默认模板_gC5C'),
(2, 2, 1, '微站默认模板_yzlN'),
(3, 3, 1, '微站默认模板_EuPp'),
(4, 4, 1, '微站默认模板_HAkx'),
(5, 5, 1, '微站默认模板_mI3T');

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_styles_vars`
--

CREATE TABLE IF NOT EXISTS `ims_site_styles_vars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `templateid` int(10) unsigned NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `variable` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_templates`
--

CREATE TABLE IF NOT EXISTS `ims_site_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `version` varchar(64) NOT NULL,
  `description` varchar(500) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `sections` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ims_site_templates`
--

INSERT INTO `ims_site_templates` (`id`, `name`, `title`, `version`, `description`, `author`, `url`, `type`, `sections`) VALUES
(1, 'default', '微站默认模板', '', '由微擎提供默认微站模板套系', '微擎团队', 'http://we7.cc', '1', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_fans`
--

CREATE TABLE IF NOT EXISTS `ims_stat_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `new` int(10) unsigned NOT NULL,
  `cancel` int(10) unsigned NOT NULL,
  `cumulate` int(10) NOT NULL,
  `date` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`date`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=103 ;

--
-- 转存表中的数据 `ims_stat_fans`
--

INSERT INTO `ims_stat_fans` (`id`, `uniacid`, `new`, `cancel`, `cumulate`, `date`) VALUES
(1, 1, 0, 0, 0, '20160701'),
(2, 1, 0, 0, 0, '20160630'),
(3, 1, 0, 0, 0, '20160629'),
(4, 1, 0, 0, 0, '20160628'),
(5, 1, 0, 0, 0, '20160627'),
(6, 1, 0, 0, 0, '20160626'),
(7, 1, 0, 0, 0, '20160625'),
(8, 1, 0, 0, 0, '20160703'),
(9, 1, 0, 0, 0, '20160702'),
(10, 2, 1, 1, 64, '20160703'),
(11, 2, 1, 0, 64, '20160702'),
(12, 2, 1, 0, 63, '20160701'),
(13, 2, 1, 1, 62, '20160630'),
(14, 2, 0, 1, 62, '20160629'),
(15, 2, 0, 0, 63, '20160628'),
(16, 2, 0, 0, 63, '20160627'),
(17, 3, 1, 1, 64, '20160703'),
(18, 3, 1, 0, 64, '20160702'),
(19, 3, 1, 0, 63, '20160701'),
(20, 3, 1, 1, 62, '20160630'),
(21, 3, 0, 1, 62, '20160629'),
(22, 3, 0, 0, 63, '20160628'),
(23, 3, 0, 0, 63, '20160627'),
(24, 3, 0, 0, 64, '20160704'),
(25, 3, 2, 1, 65, '20160705'),
(26, 4, 0, 0, 0, '20160705'),
(27, 4, 0, 0, 0, '20160704'),
(28, 4, 0, 0, 0, '20160703'),
(29, 4, 0, 0, 0, '20160702'),
(30, 4, 0, 0, 0, '20160701'),
(31, 4, 0, 0, 0, '20160630'),
(32, 4, 0, 0, 0, '20160629'),
(33, 3, 1, 0, 66, '20160706'),
(34, 3, 8, 2, 72, '20160707'),
(35, 4, 0, 0, 0, '20160706'),
(36, 3, 0, 0, 72, '20160708'),
(37, 3, 0, 0, 72, '20160709'),
(38, 3, 0, 0, 72, '20160710'),
(39, 3, 0, 0, 72, '20160717'),
(40, 3, 0, 0, 72, '20160716'),
(41, 3, 0, 0, 72, '20160715'),
(42, 3, 0, 0, 72, '20160714'),
(43, 3, 0, 0, 72, '20160713'),
(44, 3, 0, 0, 72, '20160712'),
(45, 3, 0, 0, 72, '20160711'),
(46, 3, 1, 0, 73, '20160718'),
(47, 3, 0, 0, 73, '20160719'),
(48, 4, 0, 0, 1, '20160719'),
(49, 4, 0, 0, 1, '20160718'),
(50, 4, 0, 0, 1, '20160717'),
(51, 4, 0, 0, 1, '20160716'),
(52, 4, 0, 0, 1, '20160715'),
(53, 4, 0, 0, 1, '20160714'),
(54, 4, 0, 0, 1, '20160713'),
(55, 3, 0, 0, 73, '20160720'),
(56, 3, 0, 1, 72, '20160721'),
(57, 3, 1, 0, 73, '20160724'),
(58, 3, 0, 0, 72, '20160723'),
(59, 3, 0, 0, 72, '20160722'),
(60, 3, 0, 0, 73, '20160725'),
(61, 3, 1, 0, 74, '20160726'),
(62, 1, 0, 0, 0, '20160726'),
(63, 1, 0, 0, 0, '20160725'),
(64, 1, 0, 0, 0, '20160724'),
(65, 1, 0, 0, 0, '20160723'),
(66, 1, 0, 0, 0, '20160722'),
(67, 1, 0, 0, 0, '20160721'),
(68, 1, 0, 0, 0, '20160720'),
(69, 5, 1, 0, 74, '20160726'),
(70, 5, 0, 0, 73, '20160725'),
(71, 5, 1, 0, 73, '20160724'),
(72, 5, 0, 0, 72, '20160723'),
(73, 5, 0, 0, 72, '20160722'),
(74, 5, 0, 1, 72, '20160721'),
(75, 5, 0, 0, 73, '20160720'),
(76, 3, 0, 0, 2, '20160727'),
(77, 5, 0, 0, 74, '20160727'),
(78, 4, 0, 0, 1, '20160727'),
(79, 4, 0, 0, 1, '20160726'),
(80, 4, 0, 0, 1, '20160725'),
(81, 4, 0, 0, 1, '20160724'),
(82, 4, 0, 0, 1, '20160723'),
(83, 4, 0, 0, 1, '20160722'),
(84, 4, 0, 0, 1, '20160721'),
(85, 5, 2, 0, 76, '20160728'),
(86, 3, 4, 0, 6, '20160728'),
(87, 3, 5, 3, 8, '20160729'),
(88, 3, 1, 0, 9, '20160730'),
(89, 5, 0, 0, 76, '20160729'),
(90, 3, 1, 0, 10, '20160731'),
(91, 3, 1, 1, 10, '20160801'),
(92, 5, 1, 2, 75, '20160801'),
(93, 5, 0, 0, 76, '20160731'),
(94, 5, 0, 0, 76, '20160730'),
(95, 3, 1, 0, 0, '20160802'),
(96, 1, 0, 0, 0, '20160802'),
(97, 1, 0, 0, 0, '20160801'),
(98, 1, 0, 0, 0, '20160731'),
(99, 1, 0, 0, 0, '20160730'),
(100, 1, 0, 0, 0, '20160729'),
(101, 1, 0, 0, 0, '20160728'),
(102, 1, 0, 0, 0, '20160727');

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_keyword`
--

CREATE TABLE IF NOT EXISTS `ims_stat_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` varchar(10) NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `ims_stat_keyword`
--

INSERT INTO `ims_stat_keyword` (`id`, `uniacid`, `rid`, `kid`, `hit`, `lastupdate`, `createtime`) VALUES
(1, 2, '9', 13, 1, 1467618704, 1467561600),
(2, 3, '10', 14, 2, 1467621813, 1467561600),
(3, 3, '10', 14, 1, 1467684895, 1467648000),
(4, 4, '11', 18, 1, 1467880079, 1467820800),
(5, 3, '10', 14, 1, 1467886660, 1467820800),
(6, 3, '10', 14, 1, 1468825146, 1468771200),
(7, 5, '14', 20, 1, 1469668434, 1469635200),
(8, 4, '11', 18, 1, 1469668959, 1469635200),
(11, 3, '16', 24, 2, 1469681271, 1469635200),
(12, 3, '10', 26, 1, 1469688172, 1469635200),
(13, 3, '10', 26, 1, 1469750748, 1469721600),
(14, 3, '18', 27, 6, 1469796622, 1469721600),
(15, 3, '19', 28, 1, 1469767661, 1469721600),
(16, 3, '18', 27, 1, 1469852483, 1469808000),
(17, 3, '18', 27, 1, 1469976188, 1469894400),
(18, 3, '18', 27, 1, 1469981592, 1469980800),
(19, 3, '18', 27, 1, 1470102628, 1470067200);

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_msg_history`
--

CREATE TABLE IF NOT EXISTS `ims_stat_msg_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `type` varchar(10) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=237 ;

--
-- 转存表中的数据 `ims_stat_msg_history`
--

INSERT INTO `ims_stat_msg_history` (`id`, `uniacid`, `rid`, `kid`, `from_user`, `module`, `message`, `type`, `createtime`) VALUES
(1, 2, 9, 13, 'oWHo2s_AaKqd4TVHh6VlcBEARI9I', 'cover', 'a:4:{s:7:"content";s:2:"11";s:8:"original";N;s:11:"redirection";b:0;s:6:"source";N;}', 'text', 1467618704),
(236, 3, 0, 0, 'of08Mw0D_cmHzISvhGcunZbW_asw', 'default', '', 'event', 1470104144);

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_rule`
--

CREATE TABLE IF NOT EXISTS `ims_stat_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=214 ;

--
-- 转存表中的数据 `ims_stat_rule`
--

INSERT INTO `ims_stat_rule` (`id`, `uniacid`, `rid`, `hit`, `lastupdate`, `createtime`) VALUES
(1, 2, 9, 1, 1467618704, 1467561600),
(213, 3, 0, 1, 1470104144, 1470067200);

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account`
--

CREATE TABLE IF NOT EXISTS `ims_uni_account` (
  `uniacid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `default_acid` int(10) unsigned NOT NULL,
  `rank` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ims_uni_account`
--

INSERT INTO `ims_uni_account` (`uniacid`, `groupid`, `name`, `description`, `default_acid`, `rank`) VALUES
(1, -1, '微擎团队', '一个朝气蓬勃的团队', 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_group`
--

CREATE TABLE IF NOT EXISTS `ims_uni_account_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `groupid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `ims_uni_account_group`
--

INSERT INTO `ims_uni_account_group` (`id`, `uniacid`, `groupid`) VALUES
(1, 2, -1),
(2, 3, -1),
(3, 3, 1),
(6, 4, -1),
(7, 5, -1),
(8, 5, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_menus`
--

CREATE TABLE IF NOT EXISTS `ims_uni_account_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `menuid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `sex` tinyint(3) unsigned NOT NULL,
  `group_id` int(10) NOT NULL,
  `client_platform_type` tinyint(3) unsigned NOT NULL,
  `area` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `isdeleted` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `menuid` (`menuid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ims_uni_account_menus`
--

INSERT INTO `ims_uni_account_menus` (`id`, `uniacid`, `menuid`, `type`, `title`, `sex`, `group_id`, `client_platform_type`, `area`, `data`, `status`, `createtime`, `isdeleted`) VALUES
(1, 3, 0, 2, '好资源源码', 0, -1, 0, '', 'YToyOntzOjY6ImJ1dHRvbiI7YToxOntpOjA7YTozOntzOjQ6Im5hbWUiO3M6Njoi55u05pKtIjtzOjQ6InR5cGUiO3M6NDoidmlldyI7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly93eC5sZXl1bnR2LnR2L2FwcC9pbmRleC5waHA/aT0zJmM9ZW50cnkmZWlkPTEiO319czo5OiJtYXRjaHJ1bGUiO2E6MDp7fX0=', 0, 1469687809, 1),
(2, 3, 0, 1, '好资源源码', 0, -1, 0, '', 'YTozOntzOjY6ImJ1dHRvbiI7YToxOntpOjA7YTo0OntzOjQ6InR5cGUiO3M6NDoidmlldyI7czo0OiJuYW1lIjtzOjY6IuebtOaSrSI7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly93eC5sZXl1bnR2LnR2L2FwcC9pbmRleC5waHA/aT0zJmM9ZW50cnkmZWlkPTEiO3M6MTA6InN1Yl9idXR0b24iO2E6MDp7fX19czo0OiJ0eXBlIjtpOjE7czo5OiJtYXRjaHJ1bGUiO2E6MDp7fX0=', 1, 1469687809, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_modules`
--

CREATE TABLE IF NOT EXISTS `ims_uni_account_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `settings` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_module` (`module`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

--
-- 转存表中的数据 `ims_uni_account_modules`
--

INSERT INTO `ims_uni_account_modules` (`id`, `uniacid`, `module`, `enabled`, `settings`) VALUES
(1, 1, 'basic', 1, ''),
(2, 1, 'news', 1, ''),
(3, 1, 'music', 1, ''),
(4, 1, 'userapi', 1, ''),
(5, 1, 'recharge', 1, ''),
(12, 1, 'ewei_shopping', 1, ''),
(13, 3, 'ewei_shopping', 1, ''),
(19, 5, 'ewei_shopping', 1, ''),
(48, 2, 'ewei_shopping', 1, ''),
(53, 4, 'ewei_shopping', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_users`
--

CREATE TABLE IF NOT EXISTS `ims_uni_account_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `role` varchar(255) NOT NULL,
  `rank` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_memberid` (`uid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_group`
--

CREATE TABLE IF NOT EXISTS `ims_uni_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `modules` varchar(10000) NOT NULL,
  `templates` varchar(5000) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ims_uni_group`
--

INSERT INTO `ims_uni_group` (`id`, `name`, `modules`, `templates`, `uniacid`) VALUES
(1, '体验套餐服务', 'a:6:{i:0;s:12:"meepo_online";i:1;s:11:"meepo_nsign";i:2;s:8:"wei_qian";i:3;s:9:"zmcn_sign";i:4;s:15:"wuhao_wactivity";i:5;s:12:"pack_modules";}', 'N;', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_settings`
--

CREATE TABLE IF NOT EXISTS `ims_uni_settings` (
  `uniacid` int(10) unsigned NOT NULL,
  `passport` varchar(200) NOT NULL,
  `oauth` varchar(100) NOT NULL,
  `jsauth_acid` int(10) unsigned NOT NULL,
  `uc` varchar(500) NOT NULL,
  `notify` varchar(2000) NOT NULL,
  `creditnames` varchar(500) NOT NULL,
  `creditbehaviors` varchar(500) NOT NULL,
  `welcome` varchar(60) NOT NULL,
  `default` varchar(60) NOT NULL,
  `default_message` varchar(2000) NOT NULL,
  `shortcuts` varchar(5000) NOT NULL,
  `payment` varchar(2000) NOT NULL,
  `stat` varchar(300) NOT NULL,
  `menuset` text NOT NULL,
  `default_site` int(10) unsigned DEFAULT NULL,
  `sync` tinyint(3) unsigned NOT NULL,
  `recharge` varchar(500) NOT NULL,
  `tplnotice` varchar(1000) NOT NULL,
  `grouplevel` tinyint(3) unsigned NOT NULL,
  `mcplugin` varchar(500) NOT NULL,
  `exchange_enable` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_uni_settings`
--

INSERT INTO `ims_uni_settings` (`uniacid`, `passport`, `oauth`, `jsauth_acid`, `uc`, `notify`, `creditnames`, `creditbehaviors`, `welcome`, `default`, `default_message`, `shortcuts`, `payment`, `stat`, `menuset`, `default_site`, `sync`, `recharge`, `tplnotice`, `grouplevel`, `mcplugin`, `exchange_enable`) VALUES
(1, 'a:3:{s:8:"focusreg";i:0;s:4:"item";s:5:"email";s:4:"type";s:8:"password";}', 'a:2:{s:6:"status";s:1:"0";s:7:"account";s:1:"0";}', 0, 'a:1:{s:6:"status";i:0;}', 'a:1:{s:3:"sms";a:2:{s:7:"balance";i:0;s:9:"signature";s:0:"";}}', 'a:5:{s:7:"credit1";a:2:{s:5:"title";s:6:"积分";s:7:"enabled";i:1;}s:7:"credit2";a:2:{s:5:"title";s:6:"余额";s:7:"enabled";i:1;}s:7:"credit3";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}s:7:"credit4";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}s:7:"credit5";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}}', 'a:2:{s:8:"activity";s:7:"credit1";s:8:"currency";s:7:"credit2";}', '', '', '', '', 'a:4:{s:6:"credit";a:1:{s:6:"switch";b:0;}s:6:"alipay";a:4:{s:6:"switch";b:0;s:7:"account";s:0:"";s:7:"partner";s:0:"";s:6:"secret";s:0:"";}s:6:"wechat";a:5:{s:6:"switch";b:0;s:7:"account";b:0;s:7:"signkey";s:0:"";s:7:"partner";s:0:"";s:3:"key";s:0:"";}s:8:"delivery";a:1:{s:6:"switch";b:0;}}', '', '', 1, 0, '', '', 0, '', 0),
(2, '', '', 0, '', '', 'a:2:{s:7:"credit1";a:2:{s:5:"title";s:6:"积分";s:7:"enabled";i:1;}s:7:"credit2";a:2:{s:5:"title";s:6:"余额";s:7:"enabled";i:1;}}', 'a:2:{s:8:"activity";s:7:"credit1";s:8:"currency";s:7:"credit2";}', '', '', '', '', '', '', '', 2, 0, '', '', 0, '', 0),
(3, '', 'a:2:{s:4:"host";s:20:"http://www.010xr.com";s:7:"account";i:0;}', 0, '', 'a:1:{s:3:"sms";a:1:{s:7:"balance";i:0;}}', 'a:2:{s:7:"credit1";a:2:{s:5:"title";s:6:"积分";s:7:"enabled";i:1;}s:7:"credit2";a:2:{s:5:"title";s:6:"余额";s:7:"enabled";i:1;}}', 'a:2:{s:8:"activity";s:7:"credit1";s:8:"currency";s:7:"credit2";}', '欢迎', '欢迎关注乐云在线服务，专业搭建企业级直播频道', '', '', 'a:8:{s:6:"credit";a:1:{s:6:"switch";b:0;}s:6:"alipay";a:4:{s:6:"switch";b:0;s:7:"account";s:0:"";s:7:"partner";s:0:"";s:6:"secret";s:0:"";}s:6:"wechat";a:8:{s:6:"switch";b:0;s:7:"account";s:1:"3";s:7:"signkey";s:32:"t6H7sQ0hXV8AeQ6X80l76sdA4g0xeata";s:7:"partner";s:0:"";s:3:"key";s:0:"";s:7:"version";s:1:"2";s:5:"mchid";s:10:"1362558502";s:6:"apikey";s:32:"t6H7sQ0hXV8AeQ6X80l76sdA4g0xeata";}s:8:"delivery";a:1:{s:6:"switch";b:0;}s:8:"unionpay";a:3:{s:6:"switch";b:0;s:11:"signcertpwd";s:0:"";s:5:"merid";s:0:"";}s:8:"baifubao";a:3:{s:6:"switch";b:0;s:7:"signkey";s:0:"";s:5:"mchid";s:0:"";}s:4:"card";a:1:{s:6:"switch";i:1;}s:4:"line";a:2:{s:6:"switch";b:0;s:7:"message";s:0:"";}}', '', '', 3, 1, 'a:0:{}', 'a:8:{s:8:"recharge";a:1:{s:3:"tpl";s:3:"111";}s:7:"credit1";a:1:{s:3:"tpl";s:3:"333";}s:7:"credit2";a:1:{s:3:"tpl";s:2:"22";}s:5:"group";a:1:{s:3:"tpl";s:2:"44";}s:9:"nums_plus";a:1:{s:3:"tpl";s:2:"55";}s:10:"nums_times";a:1:{s:3:"tpl";s:2:"66";}s:10:"times_plus";a:1:{s:3:"tpl";s:2:"77";}s:11:"times_times";a:1:{s:3:"tpl";s:2:"88";}}', 0, '', 0),
(4, '', 'a:2:{s:4:"host";s:20:"http://www.010xr.com";s:7:"account";i:5;}', 5, '', '', 'a:2:{s:7:"credit1";a:2:{s:5:"title";s:6:"积分";s:7:"enabled";i:1;}s:7:"credit2";a:2:{s:5:"title";s:6:"余额";s:7:"enabled";i:1;}}', 'a:2:{s:8:"activity";s:7:"credit1";s:8:"currency";s:7:"credit2";}', '', '', '', '', '', '', '', 4, 0, '', '', 0, '', 0),
(5, '', 'a:2:{s:7:"account";s:1:"5";s:4:"host";s:0:"";}', 0, '', '', 'a:2:{s:7:"credit1";a:2:{s:5:"title";s:6:"积分";s:7:"enabled";i:1;}s:7:"credit2";a:2:{s:5:"title";s:6:"余额";s:7:"enabled";i:1;}}', 'a:2:{s:8:"activity";s:7:"credit1";s:8:"currency";s:7:"credit2";}', '', '', '', '', 'a:7:{s:6:"credit";a:1:{s:6:"switch";b:0;}s:6:"alipay";a:4:{s:6:"switch";b:0;s:7:"account";s:0:"";s:7:"partner";s:0:"";s:6:"secret";s:0:"";}s:6:"wechat";a:8:{s:6:"switch";b:1;s:7:"account";s:1:"5";s:7:"signkey";s:32:"TKP40xu0700wNUU024UXdp900U0J29Zj";s:7:"partner";s:0:"";s:3:"key";s:0:"";s:7:"version";s:1:"2";s:5:"mchid";s:10:"1362558502";s:6:"apikey";s:32:"TKP40xu0700wNUU024UXdp900U0J29Zj";}s:8:"delivery";a:1:{s:6:"switch";b:0;}s:8:"unionpay";a:3:{s:6:"switch";b:0;s:11:"signcertpwd";s:0:"";s:5:"merid";s:0:"";}s:8:"baifubao";a:3:{s:6:"switch";b:0;s:7:"signkey";s:0:"";s:5:"mchid";s:0:"";}s:4:"line";a:2:{s:6:"switch";b:0;s:7:"message";s:0:"";}}', '', '', 5, 0, '', '', 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_verifycode`
--

CREATE TABLE IF NOT EXISTS `ims_uni_verifycode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `verifycode` varchar(6) NOT NULL,
  `total` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ims_uni_verifycode`
--

INSERT INTO `ims_uni_verifycode` (`id`, `uniacid`, `receiver`, `verifycode`, `total`, `createtime`) VALUES
(1, 3, '18670727221', '219842', 1, 1467887686);

-- --------------------------------------------------------

--
-- 表的结构 `ims_userapi_cache`
--

CREATE TABLE IF NOT EXISTS `ims_userapi_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(32) NOT NULL,
  `content` text NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_userapi_reply`
--

CREATE TABLE IF NOT EXISTS `ims_userapi_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `description` varchar(300) NOT NULL,
  `apiurl` varchar(300) NOT NULL,
  `token` varchar(32) NOT NULL,
  `default_text` varchar(100) NOT NULL,
  `cachetime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `ims_userapi_reply`
--

INSERT INTO `ims_userapi_reply` (`id`, `rid`, `description`, `apiurl`, `token`, `default_text`, `cachetime`) VALUES
(1, 1, '"城市名+天气", 如: "北京天气"', 'weather.php', '', '', 0),
(2, 2, '"百科+查询内容" 或 "定义+查询内容", 如: "百科姚明", "定义自行车"', 'baike.php', '', '', 0),
(3, 3, '"@查询内容(中文或英文)"', 'translate.php', '', '', 0),
(4, 4, '"日历", "万年历", "黄历"或"几号"', 'calendar.php', '', '', 0),
(5, 5, '"新闻"', 'news.php', '', '', 0),
(6, 6, '"快递+单号", 如: "申通1200041125"', 'express.php', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_users`
--

CREATE TABLE IF NOT EXISTS `ims_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` int(10) unsigned NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `joindate` int(10) unsigned NOT NULL,
  `joinip` varchar(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL,
  `lastip` varchar(15) NOT NULL,
  `remark` varchar(500) NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ims_users`
--

INSERT INTO `ims_users` (`uid`, `groupid`, `username`, `password`, `salt`, `type`, `status`, `joindate`, `joinip`, `lastvisit`, `lastip`, `remark`, `starttime`, `endtime`) VALUES
(1, 0, 'admin', '3cb929557eb9cb08fbb4a8b2c4b44b6c3b74469c', 'dd19584a', 0, 0, 1467435716, '', 1470289096, '127.0.0.1', '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_failed_login`
--

CREATE TABLE IF NOT EXISTS `ims_users_failed_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `username` varchar(32) NOT NULL,
  `count` tinyint(1) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip_username` (`ip`,`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_group`
--

CREATE TABLE IF NOT EXISTS `ims_users_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `package` varchar(5000) NOT NULL,
  `maxaccount` int(10) unsigned NOT NULL,
  `maxsubaccount` int(10) unsigned NOT NULL,
  `timelimit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ims_users_group`
--

INSERT INTO `ims_users_group` (`id`, `name`, `package`, `maxaccount`, `maxsubaccount`, `timelimit`) VALUES
(1, '体验用户组', 'a:1:{i:0;i:1;}', 1, 1, 30),
(2, '白金用户组', 'a:1:{i:0;i:1;}', 1, 2, 365),
(3, '黄金用户组', 'a:1:{i:0;i:1;}', 3, 3, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_invitation`
--

CREATE TABLE IF NOT EXISTS `ims_users_invitation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `fromuid` int(10) unsigned NOT NULL,
  `inviteuid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_permission`
--

CREATE TABLE IF NOT EXISTS `ims_users_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(30) NOT NULL,
  `permission` varchar(10000) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_profile`
--

CREATE TABLE IF NOT EXISTS `ims_users_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `fakeid` varchar(30) NOT NULL,
  `vip` tinyint(3) unsigned NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) unsigned NOT NULL,
  `birthmonth` tinyint(3) unsigned NOT NULL,
  `birthday` tinyint(3) unsigned NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  `workerid` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_video_reply`
--

CREATE TABLE IF NOT EXISTS `ims_video_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_voice_reply`
--

CREATE TABLE IF NOT EXISTS `ims_voice_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wactivity_baoming`
--

CREATE TABLE IF NOT EXISTS `ims_wactivity_baoming` (
  `baomingid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `matchid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double(11,2) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `baomingstatus` varchar(255) DEFAULT NULL,
  `paystatus` tinyint(1) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `uniacid` int(11) NOT NULL,
  `realstatus` tinyint(1) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`baomingid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wactivity_groups`
--

CREATE TABLE IF NOT EXISTS `ims_wactivity_groups` (
  `groupid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(255) NOT NULL,
  `groupmaster` varchar(255) DEFAULT NULL,
  `groupphone` int(12) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `uniacid` int(11) NOT NULL,
  `ticketsnum` int(11) DEFAULT NULL,
  `baomingnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wactivity_matches`
--

CREATE TABLE IF NOT EXISTS `ims_wactivity_matches` (
  `matchid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL,
  `place` varchar(255) NOT NULL,
  `peoplenum` int(11) NOT NULL,
  `duishou` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `content` text NOT NULL,
  `create_time` datetime NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `uniacid` int(11) NOT NULL,
  `time1` datetime NOT NULL,
  `timeqiandao` datetime NOT NULL,
  `timeqiandao1` datetime NOT NULL,
  PRIMARY KEY (`matchid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ims_wactivity_matches`
--

INSERT INTO `ims_wactivity_matches` (`matchid`, `title`, `time`, `place`, `peoplenum`, `duishou`, `price`, `content`, `create_time`, `img`, `uniacid`, `time1`, `timeqiandao`, `timeqiandao1`) VALUES
(1, '联通公司内训', '2016-07-28 11:14:10', '湖南', 0, '', 0, '测试内容', '2016-07-28 11:15:05', 'images/3/2016/07/A2bu6Lq2LmJGgDzQ2gKQ2g6zdFml5Q.jpg', 3, '2016-07-28 11:14:10', '2016-07-28 11:14:10', '2016-07-28 11:14:10');

-- --------------------------------------------------------

--
-- 表的结构 `ims_wactivity_players`
--

CREATE TABLE IF NOT EXISTS `ims_wactivity_players` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` bigint(13) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `clothesno` int(11) DEFAULT NULL,
  `clothesnum` int(11) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `intime` date DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `idcard` bigint(19) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `weixin` varchar(255) DEFAULT NULL,
  `qq` int(19) DEFAULT NULL,
  `account` double DEFAULT NULL,
  `car` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `uniacid` int(11) NOT NULL,
  `groupname` varchar(255) NOT NULL,
  `joinnum` int(11) DEFAULT NULL,
  `totalnum` int(11) DEFAULT NULL,
  `chuqinratio` double(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wechat_attachment`
--

CREATE TABLE IF NOT EXISTS `ims_wechat_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `media_id` varchar(255) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `model` varchar(25) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `media_id` (`media_id`),
  KEY `acid` (`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wechat_news`
--

CREATE TABLE IF NOT EXISTS `ims_wechat_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned DEFAULT NULL,
  `attach_id` int(10) unsigned NOT NULL,
  `thumb_media_id` varchar(60) NOT NULL,
  `thumb_url` varchar(255) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(30) NOT NULL,
  `digest` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `content_source_url` varchar(200) NOT NULL,
  `show_cover_pic` tinyint(3) unsigned NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `attach_id` (`attach_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wxcard_reply`
--

CREATE TABLE IF NOT EXISTS `ims_wxcard_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `cid` int(10) unsigned NOT NULL,
  `brand_name` varchar(30) NOT NULL,
  `logo_url` varchar(255) NOT NULL,
  `success` varchar(255) NOT NULL,
  `error` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
