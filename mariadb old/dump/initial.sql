-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.6.2-MariaDB-1:10.6.2+maria~focal - mariadb.org binary distribution
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping database structure for hesk
CREATE DATABASE IF NOT EXISTS `hesk` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `hesk`;

-- Dumping structure for table hesk.hesk_attachments
CREATE TABLE IF NOT EXISTS `hesk_attachments` (
  `att_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` varchar(13) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `saved_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `real_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `size` int(10) unsigned NOT NULL DEFAULT 0,
  `type` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`att_id`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table hesk.hesk_attachments: 0 rows
/*!40000 ALTER TABLE `hesk_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_attachments` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_banned_emails
CREATE TABLE IF NOT EXISTS `hesk_banned_emails` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `banned_by` smallint(5) unsigned NOT NULL,
  `dt` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table hesk.hesk_banned_emails: 0 rows
/*!40000 ALTER TABLE `hesk_banned_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_banned_emails` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_banned_ips
CREATE TABLE IF NOT EXISTS `hesk_banned_ips` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `ip_from` int(10) unsigned NOT NULL DEFAULT 0,
  `ip_to` int(10) unsigned NOT NULL DEFAULT 0,
  `ip_display` varchar(100) NOT NULL,
  `banned_by` smallint(5) unsigned NOT NULL,
  `dt` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table hesk.hesk_banned_ips: 0 rows
/*!40000 ALTER TABLE `hesk_banned_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_banned_ips` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_categories
CREATE TABLE IF NOT EXISTS `hesk_categories` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `cat_order` smallint(5) unsigned NOT NULL DEFAULT 0,
  `autoassign` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `type` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `priority` enum('0','1','2','3') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table hesk.hesk_categories: 1 rows
/*!40000 ALTER TABLE `hesk_categories` DISABLE KEYS */;
INSERT IGNORE INTO `hesk_categories` (`id`, `name`, `cat_order`, `autoassign`, `type`, `priority`) VALUES
	(1, 'General', 10, '1', '0', '3');
/*!40000 ALTER TABLE `hesk_categories` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_custom_fields
CREATE TABLE IF NOT EXISTS `hesk_custom_fields` (
  `id` tinyint(3) unsigned NOT NULL,
  `use` enum('0','1','2') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `place` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'text',
  `req` enum('0','1','2') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `category` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order` smallint(5) unsigned NOT NULL DEFAULT 10,
  PRIMARY KEY (`id`),
  KEY `useType` (`use`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table hesk.hesk_custom_fields: 50 rows
/*!40000 ALTER TABLE `hesk_custom_fields` DISABLE KEYS */;
INSERT IGNORE INTO `hesk_custom_fields` (`id`, `use`, `place`, `type`, `req`, `category`, `name`, `value`, `order`) VALUES
	(1, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(2, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(3, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(4, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(5, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(6, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(7, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(8, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(9, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(10, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(11, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(12, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(13, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(14, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(15, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(16, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(17, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(18, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(19, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(20, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(21, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(22, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(23, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(24, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(25, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(26, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(27, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(28, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(29, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(30, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(31, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(32, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(33, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(34, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(35, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(36, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(37, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(38, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(39, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(40, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(41, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(42, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(43, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(44, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(45, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(46, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(47, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(48, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(49, '0', '0', 'text', '0', NULL, '', NULL, 1000),
	(50, '0', '0', 'text', '0', NULL, '', NULL, 1000);
/*!40000 ALTER TABLE `hesk_custom_fields` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_custom_statuses
CREATE TABLE IF NOT EXISTS `hesk_custom_statuses` (
  `id` tinyint(3) unsigned NOT NULL,
  `name` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` varchar(6) COLLATE utf8mb3_unicode_ci NOT NULL,
  `can_customers_change` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `order` smallint(5) unsigned NOT NULL DEFAULT 10,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table hesk.hesk_custom_statuses: 0 rows
/*!40000 ALTER TABLE `hesk_custom_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_custom_statuses` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_kb_articles
CREATE TABLE IF NOT EXISTS `hesk_kb_articles` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL,
  `dt` timestamp NOT NULL DEFAULT current_timestamp(),
  `author` smallint(5) unsigned NOT NULL,
  `subject` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `keywords` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `rating` float NOT NULL DEFAULT 0,
  `votes` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `views` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `type` enum('0','1','2') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `html` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `sticky` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `art_order` smallint(5) unsigned NOT NULL DEFAULT 0,
  `history` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `attachments` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `sticky` (`sticky`),
  KEY `type` (`type`),
  FULLTEXT KEY `subject` (`subject`,`content`,`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table hesk.hesk_kb_articles: 0 rows
/*!40000 ALTER TABLE `hesk_kb_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_kb_articles` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_kb_attachments
CREATE TABLE IF NOT EXISTS `hesk_kb_attachments` (
  `att_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `saved_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `real_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `size` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`att_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table hesk.hesk_kb_attachments: 0 rows
/*!40000 ALTER TABLE `hesk_kb_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_kb_attachments` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_kb_categories
CREATE TABLE IF NOT EXISTS `hesk_kb_categories` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `parent` smallint(5) unsigned NOT NULL,
  `articles` smallint(5) unsigned NOT NULL DEFAULT 0,
  `articles_private` smallint(5) unsigned NOT NULL DEFAULT 0,
  `articles_draft` smallint(5) unsigned NOT NULL DEFAULT 0,
  `cat_order` smallint(5) unsigned NOT NULL,
  `type` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table hesk.hesk_kb_categories: 1 rows
/*!40000 ALTER TABLE `hesk_kb_categories` DISABLE KEYS */;
INSERT IGNORE INTO `hesk_kb_categories` (`id`, `name`, `parent`, `articles`, `articles_private`, `articles_draft`, `cat_order`, `type`) VALUES
	(1, 'Knowledgebase', 0, 0, 0, 0, 10, '0');
/*!40000 ALTER TABLE `hesk_kb_categories` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_logins
CREATE TABLE IF NOT EXISTS `hesk_logins` (
  `ip` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `number` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `last_attempt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table hesk.hesk_logins: 0 rows
/*!40000 ALTER TABLE `hesk_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_logins` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_log_overdue
CREATE TABLE IF NOT EXISTS `hesk_log_overdue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dt` timestamp NOT NULL DEFAULT current_timestamp(),
  `ticket` mediumint(8) unsigned NOT NULL,
  `category` smallint(5) unsigned NOT NULL,
  `priority` enum('0','1','2','3') COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `owner` smallint(5) unsigned NOT NULL DEFAULT 0,
  `due_date` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `comments` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket` (`ticket`),
  KEY `category` (`category`),
  KEY `priority` (`priority`),
  KEY `status` (`status`),
  KEY `owner` (`owner`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table hesk.hesk_log_overdue: 0 rows
/*!40000 ALTER TABLE `hesk_log_overdue` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_log_overdue` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_mail
CREATE TABLE IF NOT EXISTS `hesk_mail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from` smallint(5) unsigned NOT NULL,
  `to` smallint(5) unsigned NOT NULL,
  `subject` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `dt` timestamp NOT NULL DEFAULT current_timestamp(),
  `read` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `deletedby` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `from` (`from`),
  KEY `to` (`to`,`read`,`deletedby`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table hesk.hesk_mail: 1 rows
/*!40000 ALTER TABLE `hesk_mail` DISABLE KEYS */;
INSERT IGNORE INTO `hesk_mail` (`id`, `from`, `to`, `subject`, `message`, `dt`, `read`, `deletedby`) VALUES
	(1, 9999, 1, 'HESK quick start guide', '</p><div style="text-align:justify; padding-left: 10px; padding-right: 10px;">\r\n\r\n<p>&nbsp;<br /><b>Welcome to HESK! You\'ll find it is a great tool for improving your customer support.</b></p>\r\n\r\n<p><b>Here is a short guide to get you started.</b><br />&nbsp;</p>\r\n\r\n<hr />\r\nSTEP #1: set up your profile\r\n<hr />\r\n<ol>\r\n<li>go to <a href="profile.php">Profile</a>,</li>\r\n<li>set your name and email address.</li>\r\n</ol>\r\n\r\n&nbsp;\r\n\r\n<hr />\r\nSTEP #2: configure HESK\r\n<hr />\r\n<ol>\r\n<li>go to <a href="admin_settings_general.php">Settings</a>,</li>\r\n<li>for a quick start, just modify these on the "General" tab:<br /><br />\r\nWebsite title<br />\r\nWebsite URL<br />\r\nWebmaster email<br />&nbsp;\r\n</li>\r\n<li>you can come back to the settings page later and explore all the options. To view details about a setting, click the [?]</li>\r\n</ol>\r\n\r\n&nbsp;\r\n\r\n<hr />\r\nSTEP #3: add ticket categories\r\n<hr />\r\n<p>Go to <a href="manage_categories.php">Categories</a> to add ticket categories.</p>\r\n<p>You cannot delete the default category, but you can rename it.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\nSTEP #4: add staff accounts\r\n<hr />\r\n<p>Go to <a href="manage_users.php">Team</a> to create new staff accounts.</p>\r\n<p>You can use two user types in HESK:</p>\r\n<ul>\r\n<li><b>Administrators</b>, who have full access to all HESK features</li>\r\n<li><b>Staff</b>, who have access to limited privileges and categories</li>\r\n</ul>\r\n\r\n&nbsp;\r\n\r\n<hr />\r\nSTEP #5: useful tools\r\n<hr />\r\n<p>You can do a lot on the <a href="banned_emails.php">Tools</a> page, for example:</p>\r\n<ul>\r\n<li>create custom ticket statuses,</li>\r\n<li>add custom input fields to the "Submit a ticket" form,</li>\r\n<li>modify email templates,</li>\r\n<li>and more.</li>\r\n</ul>\r\n\r\n&nbsp;\r\n\r\n<hr />\r\nSTEP #6: create a knowledgebase\r\n<hr />\r\n<p>A clear and comprehensive knowledgebase can drastically reduce the number of support tickets you receive, thereby saving you significant time and effort in the long run.</p>\r\n<p>Go to <a href="manage_knowledgebase.php">Knowledgebase</a> to create categories and write articles for your knowledgebase.</p>\r\n\r\n&nbsp;\r\n\r\n<hr />\r\nSTEP #7: don\'t repeat yourself\r\n<hr />\r\n<p>Sometimes several support tickets are addressing the same issues - allowing you to use pre-written (&quot;canned&quot;) responses.</p>\r\n<p>To compose canned responses go to <a href="manage_canned.php">Canned</a> page.</p>\r\n\r\n&nbsp;\r\n\r\n<hr />\r\nSTEP #8: secure your help desk\r\n<hr />\r\n<p>Make sure your help desk is as secure as possible by going through <a href="https://www.hesk.com/knowledgebase/?article=82">HESK security check list</a></p>\r\n\r\n&nbsp;\r\n\r\n<hr />\r\nSTEP #9: stay updated\r\n<hr />\r\n<p>HESK regularly receives improvements and bug fixes; make sure you know about them!</p>\r\n<ul>\r\n<li>for fast notifications, <a href="https://twitter.com/HESKdotCOM">follow us on <b>Twitter</b></a></li>\r\n<li>for email notifications, subscribe to our low-volume zero-spam <a href="https://www.hesk.com/newsletter.php">newsletter</a></li>\r\n</ul>\r\n\r\n&nbsp;\r\n\r\n<hr />\r\nSTEP #10: look professional\r\n<hr />\r\n<p>To look more professional and not advertise the tools you use, <a href="https://www.hesk.com/buy.php">remove &quot;Powered by&quot; links</a> from your help desk.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Again, welcome to HESK and enjoy using it!</p>\r\n\r\n<p>Klemen<br />\r\n<a href="https://www.hesk.com">https://www.hesk.com</a></p>\r\n\r\n</div><p>', '2021-07-03 06:41:35', '0', 9999);
/*!40000 ALTER TABLE `hesk_mail` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_notes
CREATE TABLE IF NOT EXISTS `hesk_notes` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ticket` mediumint(8) unsigned NOT NULL,
  `who` smallint(5) unsigned NOT NULL,
  `dt` timestamp NOT NULL DEFAULT current_timestamp(),
  `message` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `attachments` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticketid` (`ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table hesk.hesk_notes: 0 rows
/*!40000 ALTER TABLE `hesk_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_notes` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_online
CREATE TABLE IF NOT EXISTS `hesk_online` (
  `user_id` smallint(5) unsigned NOT NULL,
  `dt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tmp` int(11) unsigned NOT NULL DEFAULT 0,
  UNIQUE KEY `user_id` (`user_id`),
  KEY `dt` (`dt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table hesk.hesk_online: 0 rows
/*!40000 ALTER TABLE `hesk_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_online` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_pipe_loops
CREATE TABLE IF NOT EXISTS `hesk_pipe_loops` (
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `hits` smallint(1) unsigned NOT NULL DEFAULT 0,
  `message_hash` char(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dt` timestamp NOT NULL DEFAULT current_timestamp(),
  KEY `email` (`email`,`hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table hesk.hesk_pipe_loops: 0 rows
/*!40000 ALTER TABLE `hesk_pipe_loops` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_pipe_loops` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_replies
CREATE TABLE IF NOT EXISTS `hesk_replies` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `replyto` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `message` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `message_html` mediumtext COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dt` timestamp NOT NULL DEFAULT current_timestamp(),
  `attachments` mediumtext COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `staffid` smallint(5) unsigned NOT NULL DEFAULT 0,
  `rating` enum('1','5') COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `read` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `replyto` (`replyto`),
  KEY `dt` (`dt`),
  KEY `staffid` (`staffid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table hesk.hesk_replies: 0 rows
/*!40000 ALTER TABLE `hesk_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_replies` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_reply_drafts
CREATE TABLE IF NOT EXISTS `hesk_reply_drafts` (
  `owner` smallint(5) unsigned NOT NULL,
  `ticket` mediumint(8) unsigned NOT NULL,
  `message` mediumtext CHARACTER SET utf8mb3 NOT NULL,
  `message_html` mediumtext CHARACTER SET utf8mb3 DEFAULT NULL,
  `dt` timestamp NOT NULL DEFAULT current_timestamp(),
  KEY `owner` (`owner`),
  KEY `ticket` (`ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table hesk.hesk_reply_drafts: 0 rows
/*!40000 ALTER TABLE `hesk_reply_drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_reply_drafts` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_reset_password
CREATE TABLE IF NOT EXISTS `hesk_reset_password` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user` smallint(5) unsigned NOT NULL,
  `hash` char(40) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `dt` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Dumping data for table hesk.hesk_reset_password: 0 rows
/*!40000 ALTER TABLE `hesk_reset_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_reset_password` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_service_messages
CREATE TABLE IF NOT EXISTS `hesk_service_messages` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `dt` timestamp NOT NULL DEFAULT current_timestamp(),
  `author` smallint(5) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `language` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `style` enum('0','1','2','3','4') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `type` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `order` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table hesk.hesk_service_messages: 0 rows
/*!40000 ALTER TABLE `hesk_service_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_service_messages` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_std_replies
CREATE TABLE IF NOT EXISTS `hesk_std_replies` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `message` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `message_html` mediumtext COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reply_order` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table hesk.hesk_std_replies: 0 rows
/*!40000 ALTER TABLE `hesk_std_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_std_replies` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_tickets
CREATE TABLE IF NOT EXISTS `hesk_tickets` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `trackid` varchar(13) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(1000) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `category` smallint(5) unsigned NOT NULL DEFAULT 1,
  `priority` enum('0','1','2','3') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '3',
  `subject` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `message` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `message_html` mediumtext COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dt` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `lastchange` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `firstreply` timestamp NULL DEFAULT NULL,
  `closedat` timestamp NULL DEFAULT NULL,
  `articles` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `openedby` mediumint(8) DEFAULT 0,
  `firstreplyby` smallint(5) unsigned DEFAULT NULL,
  `closedby` mediumint(8) DEFAULT NULL,
  `replies` smallint(5) unsigned NOT NULL DEFAULT 0,
  `staffreplies` smallint(5) unsigned NOT NULL DEFAULT 0,
  `owner` smallint(5) unsigned NOT NULL DEFAULT 0,
  `assignedby` mediumint(8) DEFAULT NULL,
  `time_worked` time NOT NULL DEFAULT '00:00:00',
  `lastreplier` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `replierid` smallint(5) unsigned DEFAULT NULL,
  `archive` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `locked` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `attachments` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `merged` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `history` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom1` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom2` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom3` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom4` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom5` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom6` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom7` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom8` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom9` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom10` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom11` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom12` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom13` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom14` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom15` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom16` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom17` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom18` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom19` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom20` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom21` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom22` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom23` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom24` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom25` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom26` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom27` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom28` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom29` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom30` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom31` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom32` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom33` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom34` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom35` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom36` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom37` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom38` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom39` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom40` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom41` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom42` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom43` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom44` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom45` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom46` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom47` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom48` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom49` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom50` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `due_date` timestamp NULL DEFAULT NULL,
  `overdue_email_sent` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `trackid` (`trackid`),
  KEY `archive` (`archive`),
  KEY `categories` (`category`),
  KEY `statuses` (`status`),
  KEY `owner` (`owner`),
  KEY `openedby` (`openedby`,`firstreplyby`,`closedby`),
  KEY `dt` (`dt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table hesk.hesk_tickets: 0 rows
/*!40000 ALTER TABLE `hesk_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_tickets` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_ticket_templates
CREATE TABLE IF NOT EXISTS `hesk_ticket_templates` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `message` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `message_html` mediumtext COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tpl_order` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table hesk.hesk_ticket_templates: 0 rows
/*!40000 ALTER TABLE `hesk_ticket_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_ticket_templates` ENABLE KEYS */;

-- Dumping structure for table hesk.hesk_users
CREATE TABLE IF NOT EXISTS `hesk_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `pass` char(40) COLLATE utf8mb3_unicode_ci NOT NULL,
  `isadmin` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `signature` varchar(1000) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `categories` varchar(500) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `afterreply` enum('0','1','2') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `autostart` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `autoreload` smallint(5) unsigned NOT NULL DEFAULT 0,
  `notify_customer_new` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_customer_reply` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `show_suggested` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_new_unassigned` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_new_my` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_reply_unassigned` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_reply_my` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_assigned` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_pm` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_note` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_overdue_unassigned` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `notify_overdue_my` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `default_list` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `autoassign` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `heskprivileges` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ratingneg` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `ratingpos` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `rating` float NOT NULL DEFAULT 0,
  `replies` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `autoassign` (`autoassign`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table hesk.hesk_users: 1 rows
/*!40000 ALTER TABLE `hesk_users` DISABLE KEYS */;
INSERT IGNORE INTO `hesk_users` (`id`, `user`, `pass`, `isadmin`, `name`, `email`, `signature`, `language`, `categories`, `afterreply`, `autostart`, `autoreload`, `notify_customer_new`, `notify_customer_reply`, `show_suggested`, `notify_new_unassigned`, `notify_new_my`, `notify_reply_unassigned`, `notify_reply_my`, `notify_assigned`, `notify_pm`, `notify_note`, `notify_overdue_unassigned`, `notify_overdue_my`, `default_list`, `autoassign`, `heskprivileges`, `ratingneg`, `ratingpos`, `rating`, `replies`) VALUES
	(1, 'HeskAdminFduxe', 'a11f95093a9d471c1ac34fc472e516fa32aa8d2c', '1', 'Your name', 'spamdenato@gmail.com', '', NULL, '', '0', '1', 0, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '', '1', '', 0, 0, 0, 0);
/*!40000 ALTER TABLE `hesk_users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

CREATE USER 'heskDBUser'@'%' IDENTIFIED BY 'Qqf-S4Ka8!KB5u93_Ty3y$EgNdN9@nfu';

GRANT Insert ON hesk.* TO 'heskDBUser'@'%';
GRANT Delete ON hesk.* TO 'heskDBUser'@'%';
GRANT Create ON hesk.* TO 'heskDBUser'@'%';
GRANT Select ON hesk.* TO 'heskDBUser'@'%';
GRANT Update ON hesk.* TO 'heskDBUser'@'%';
