-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 11 2016 г., 23:23
-- Версия сервера: 5.5.45
-- Версия PHP: 5.4.44

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `wp_reasanik`
--

-- --------------------------------------------------------

--
-- Структура таблицы `wqkbf_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wqkbf_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `wqkbf_comments`
--

CREATE TABLE IF NOT EXISTS `wqkbf_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `wqkbf_comments`
--

INSERT INTO `wqkbf_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Мистер WordPress', '', 'https://wordpress.org/', '', '2016-08-12 16:11:15', '2016-08-12 13:11:15', 'Привет! Это комментарий.\nЧтобы удалить его, авторизуйтесь и просмотрите комментарии к записи. Там будут ссылки для их изменения или удаления.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wqkbf_gdrts_itemmeta`
--

CREATE TABLE IF NOT EXISTS `wqkbf_gdrts_itemmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `item_id` (`item_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `wqkbf_gdrts_items`
--

CREATE TABLE IF NOT EXISTS `wqkbf_gdrts_items` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `entity` varchar(32) NOT NULL DEFAULT 'posts' COMMENT 'posts,comments,users,terms',
  `name` varchar(64) NOT NULL DEFAULT 'post',
  `id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `latest` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'gmt',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `entity_name_id` (`entity`,`name`,`id`),
  KEY `entity` (`entity`),
  KEY `name` (`name`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `wqkbf_gdrts_items`
--

INSERT INTO `wqkbf_gdrts_items` (`item_id`, `entity`, `name`, `id`, `latest`) VALUES
(1, 'posts', 'page', 12, '0000-00-00 00:00:00'),
(2, 'posts', 'page', 2, '0000-00-00 00:00:00'),
(3, 'posts', 'page', 14, '0000-00-00 00:00:00'),
(4, 'posts', 'page', 17, '0000-00-00 00:00:00'),
(5, 'posts', 'attachment', 70, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `wqkbf_gdrts_logmeta`
--

CREATE TABLE IF NOT EXISTS `wqkbf_gdrts_logmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `log_id` (`log_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `wqkbf_gdrts_logs`
--

CREATE TABLE IF NOT EXISTS `wqkbf_gdrts_logs` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'from gdrs_items table',
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `ref_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'reference id for revotes from this same table',
  `action` varchar(128) NOT NULL DEFAULT 'vote' COMMENT 'vote,revote,queue',
  `status` varchar(128) NOT NULL DEFAULT 'active' COMMENT 'active,replaced',
  `method` varchar(128) NOT NULL DEFAULT 'stars-rating',
  `logged` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'gmt',
  `ip` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`log_id`),
  KEY `item_id` (`item_id`),
  KEY `user_id` (`user_id`),
  KEY `action` (`action`),
  KEY `ref_id` (`ref_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `wqkbf_links`
--

CREATE TABLE IF NOT EXISTS `wqkbf_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `wqkbf_ngg_album`
--

CREATE TABLE IF NOT EXISTS `wqkbf_ngg_album` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `previewpic` bigint(20) NOT NULL DEFAULT '0',
  `albumdesc` mediumtext,
  `sortorder` longtext NOT NULL,
  `pageid` bigint(20) NOT NULL DEFAULT '0',
  `extras_post_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `extras_post_id_key` (`extras_post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `wqkbf_ngg_album`
--

INSERT INTO `wqkbf_ngg_album` (`id`, `name`, `slug`, `previewpic`, `albumdesc`, `sortorder`, `pageid`, `extras_post_id`) VALUES
(1, 'Фото', 'foto', 13, '', 'WyIxIiwiMiJd', 0, 64);

-- --------------------------------------------------------

--
-- Структура таблицы `wqkbf_ngg_gallery`
--

CREATE TABLE IF NOT EXISTS `wqkbf_ngg_gallery` (
  `gid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `path` mediumtext,
  `title` mediumtext,
  `galdesc` mediumtext,
  `pageid` bigint(20) NOT NULL DEFAULT '0',
  `previewpic` bigint(20) NOT NULL DEFAULT '0',
  `author` bigint(20) NOT NULL DEFAULT '0',
  `extras_post_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gid`),
  KEY `extras_post_id_key` (`extras_post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `wqkbf_ngg_gallery`
--

INSERT INTO `wqkbf_ngg_gallery` (`gid`, `name`, `slug`, `path`, `title`, `galdesc`, `pageid`, `previewpic`, `author`, `extras_post_id`) VALUES
(1, 'vodopad', 'Водопад', '\\wp-content\\gallery\\vodopad', 'Водопад', NULL, 0, 1, 1, 24);

-- --------------------------------------------------------

--
-- Структура таблицы `wqkbf_ngg_pictures`
--

CREATE TABLE IF NOT EXISTS `wqkbf_ngg_pictures` (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT,
  `image_slug` varchar(255) NOT NULL,
  `post_id` bigint(20) NOT NULL DEFAULT '0',
  `galleryid` bigint(20) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL,
  `description` mediumtext,
  `alttext` mediumtext,
  `imagedate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exclude` tinyint(4) DEFAULT '0',
  `sortorder` bigint(20) NOT NULL DEFAULT '0',
  `meta_data` longtext,
  `extras_post_id` bigint(20) NOT NULL DEFAULT '0',
  `updated_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `extras_post_id_key` (`extras_post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Дамп данных таблицы `wqkbf_ngg_pictures`
--

INSERT INTO `wqkbf_ngg_pictures` (`pid`, `image_slug`, `post_id`, `galleryid`, `filename`, `description`, `alttext`, `imagedate`, `exclude`, `sortorder`, `meta_data`, `extras_post_id`, `updated_at`) VALUES
(1, '02-4', 0, 1, '02-4.jpg', '', '02-4', '2016-08-12 14:03:50', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiIwMi00LmpwZyIsIndpZHRoIjo2MDAsImhlaWdodCI6Mzk5LCJnZW5lcmF0ZWQiOiIwLjc1NDA3NDAwIDE0NzEwMTA2MzAifSwid2lkdGgiOjYwMCwiaGVpZ2h0IjozOTksImZ1bGwiOnsid2lkdGgiOjYwMCwiaGVpZ2h0IjozOTksImZpbGVuYW1lIjoiMDItNC5qcGciLCJnZW5lcmF0ZWQiOiIwLjgxNTQyOTAwIDE0Nzg4OTUwNDYifSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic18wMi00LmpwZyIsImdlbmVyYXRlZCI6IjAuMTgyNDU1MDAgMTQ3MTAxMDYzMSJ9LCJhcGVydHVyZSI6ZmFsc2UsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6ZmFsc2UsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6ZmFsc2UsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6ZmFsc2UsImlzbyI6ZmFsc2UsInNodXR0ZXJfc3BlZWQiOmZhbHNlLCJmbGFzaCI6ZmFsc2UsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJzYXZlZCI6dHJ1ZSwibmdnMGR5bi0weDI1MC0wMGYwdzAxMWMwMTByMTEwZjExMHIwMTB0MDEwIjp7IndpZHRoIjozNzYsImhlaWdodCI6MjUwLCJmaWxlbmFtZSI6IjAyLTQuanBnLW5nZ2lkMDExLW5nZzBkeW4tMHgyNTAtMDBmMHcwMTFjMDEwcjExMGYxMTByMDEwdDAxMC5qcGciLCJnZW5lcmF0ZWQiOiIwLjU5MTc5NjAwIDE0Nzg4OTQyNTcifSwibmdnMGR5bi0zMDB4MjAweDkwLTAwZjB3MDEwYzAxMXIxMTBmMTEwcjAxMHQwM2pwZyI6eyJ3aWR0aCI6MzAwLCJoZWlnaHQiOjIwMCwiZmlsZW5hbWUiOiIwMi00LmpwZy1uZ2dpZDAxMS1uZ2cwZHluLTMwMHgyMDB4OTAtMDBmMHcwMTBjMDExcjExMGYxMTByMDEwdDAzanBnLmpwZyIsImdlbmVyYXRlZCI6IjAuNzczNTE1MDAgMTQ3NTQyMzI0NiJ9LCJuZ2cwZHluLTkxeDY4LTAwZjB3MDEwYzAxMXIxMTBmMTEwcjAxMHQwMTAiOnsid2lkdGgiOjkxLCJoZWlnaHQiOjY4LCJmaWxlbmFtZSI6IjAyLTQuanBnLW5nZ2lkMDExLW5nZzBkeW4tOTF4NjgtMDBmMHcwMTBjMDExcjExMGYxMTByMDEwdDAxMC5qcGciLCJnZW5lcmF0ZWQiOiIwLjI5Mzk0NTAwIDE0Nzg4OTQ0MTkifSwibmdnMGR5bi14MjUweDEwMC0wMGYwdzAxMWMwMTByMTEwZjExMHIwMTB0MDEwIjp7IndpZHRoIjozNzYsImhlaWdodCI6MjUwLCJmaWxlbmFtZSI6IjAyLTQuanBnLW5nZ2lkMDExLW5nZzBkeW4tMHgyNTB4MTAwLTAwZjB3MDExYzAxMHIxMTBmMTEwcjAxMHQwMTAuanBnIiwiZ2VuZXJhdGVkIjoiMC40NzE2NzkwMCAxNDc4ODk0MTg1In0sIm5nZzBkeW4tMjIweDIyMHgxMDAtMDBmMHcwMTBjMDExcjExMGYxMTByMDEwdDAxMCI6eyJ3aWR0aCI6MjIwLCJoZWlnaHQiOjIyMCwiZmlsZW5hbWUiOiIwMi00LmpwZy1uZ2dpZDAxMS1uZ2cwZHluLTIyMHgyMjB4MTAwLTAwZjB3MDEwYzAxMXIxMTBmMTEwcjAxMHQwMTAuanBnIiwiZ2VuZXJhdGVkIjoiMC4xMzM3ODkwMCAxNDc4ODk0Mzg3In0sIm5nZzBkeW4tMzUweDM1MC0wMGYwdzAxMGMwMTByMTEwZjExMHIwMTB0MDEwIjp7IndpZHRoIjozNTAsImhlaWdodCI6MjMzLCJmaWxlbmFtZSI6IjAyLTQuanBnLW5nZ2lkMDExLW5nZzBkeW4tMzUweDM1MC0wMGYwdzAxMGMwMTByMTEwZjExMHIwMTB0MDEwLmpwZyIsImdlbmVyYXRlZCI6IjAuNDQyMzgyMDAgMTQ3ODg5NTA5MSJ9fQ==', 23, 1478895091),
(2, '2_3-6', 0, 1, '2_3-6.jpg', '', '2_3-6', '2016-08-12 14:03:54', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiIyXzMtNi5qcGciLCJ3aWR0aCI6NjQwLCJoZWlnaHQiOjI3OCwiZ2VuZXJhdGVkIjoiMC4wNzU5MTgwMCAxNDcxMDEwNjM0In0sIndpZHRoIjo2NDAsImhlaWdodCI6Mjc4LCJmdWxsIjp7IndpZHRoIjo2NDAsImhlaWdodCI6Mjc4LCJmaWxlbmFtZSI6IjJfMy02LmpwZyIsImdlbmVyYXRlZCI6IjAuNDk3MDcwMDAgMTQ3ODg5NTA0NyJ9LCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzXzJfMy02LmpwZyIsImdlbmVyYXRlZCI6IjAuNTE2MzI5MDAgMTQ3MTAxMDYzNCJ9LCJhcGVydHVyZSI6ZmFsc2UsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6ZmFsc2UsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6ZmFsc2UsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6ZmFsc2UsImlzbyI6ZmFsc2UsInNodXR0ZXJfc3BlZWQiOmZhbHNlLCJmbGFzaCI6ZmFsc2UsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJzYXZlZCI6dHJ1ZSwibmdnMGR5bi0yMjB4MjIweDEwMC0wMGYwdzAxMGMwMTFyMTEwZjExMHIwMTB0MDEwIjp7IndpZHRoIjoyMjAsImhlaWdodCI6MjIwLCJmaWxlbmFtZSI6IjJfMy02LmpwZy1uZ2dpZDAxMi1uZ2cwZHluLTIyMHgyMjB4MTAwLTAwZjB3MDEwYzAxMXIxMTBmMTEwcjAxMHQwMTAuanBnIiwiZ2VuZXJhdGVkIjoiMC4xMDE1NjIwMCAxNDc4ODk0Mzg3In19', 26, 1478895047),
(3, '2-5', 0, 1, '2-5.jpg', '', '2-5', '2016-08-12 14:03:57', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiIyLTUuanBnIiwid2lkdGgiOjY0MCwiaGVpZ2h0Ijo0NzIsImdlbmVyYXRlZCI6IjAuMTkwMDY5MDAgMTQ3MTAxMDYzNyJ9LCJ3aWR0aCI6NjQwLCJoZWlnaHQiOjQ3MiwiZnVsbCI6eyJ3aWR0aCI6NjQwLCJoZWlnaHQiOjQ3MiwiZmlsZW5hbWUiOiIyLTUuanBnIiwiZ2VuZXJhdGVkIjoiMC4yMDUwNzgwMCAxNDc4ODk1MDQ4In0sInRodW1ibmFpbCI6eyJ3aWR0aCI6MjQwLCJoZWlnaHQiOjE2MCwiZmlsZW5hbWUiOiJ0aHVtYnNfMi01LmpwZyIsImdlbmVyYXRlZCI6IjAuNjE3NzkxMDAgMTQ3MTAxMDYzNyJ9LCJhcGVydHVyZSI6ZmFsc2UsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6ZmFsc2UsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6ZmFsc2UsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6ZmFsc2UsImlzbyI6ZmFsc2UsInNodXR0ZXJfc3BlZWQiOmZhbHNlLCJmbGFzaCI6ZmFsc2UsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJzYXZlZCI6dHJ1ZSwibmdnMGR5bi0yMjB4MjIweDEwMC0wMGYwdzAxMGMwMTFyMTEwZjExMHIwMTB0MDEwIjp7IndpZHRoIjoyMjAsImhlaWdodCI6MjIwLCJmaWxlbmFtZSI6IjItNS5qcGctbmdnaWQwMTMtbmdnMGR5bi0yMjB4MjIweDEwMC0wMGYwdzAxMGMwMTFyMTEwZjExMHIwMTB0MDEwLmpwZyIsImdlbmVyYXRlZCI6IjAuNzUwMDAwMDAgMTQ3ODg5NDM4OSJ9fQ==', 28, 1478895048),
(4, '03-7', 0, 1, '03-7.jpg', '', '03-7', '2016-08-12 14:04:01', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiIwMy03LmpwZyIsIndpZHRoIjozMDAsImhlaWdodCI6MjAwLCJnZW5lcmF0ZWQiOiIwLjY0MjMzNDAwIDE0NzEwMTA2NDEifSwid2lkdGgiOjMwMCwiaGVpZ2h0IjoyMDAsImZ1bGwiOnsid2lkdGgiOjMwMCwiaGVpZ2h0IjoyMDAsImZpbGVuYW1lIjoiMDMtNy5qcGciLCJnZW5lcmF0ZWQiOiIwLjg0NzY1NjAwIDE0Nzg4OTUwNDgifSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic18wMy03LmpwZyIsImdlbmVyYXRlZCI6IjAuMDU2Mzc5MDAgMTQ3MTAxMDY0MiJ9LCJhcGVydHVyZSI6ZmFsc2UsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6ZmFsc2UsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6ZmFsc2UsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6ZmFsc2UsImlzbyI6ZmFsc2UsInNodXR0ZXJfc3BlZWQiOmZhbHNlLCJmbGFzaCI6ZmFsc2UsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJzYXZlZCI6dHJ1ZSwibmdnMGR5bi0yMjB4MjIweDEwMC0wMGYwdzAxMGMwMTFyMTEwZjExMHIwMTB0MDEwIjp7IndpZHRoIjoyMjAsImhlaWdodCI6MjAwLCJmaWxlbmFtZSI6IjAzLTcuanBnLW5nZ2lkMDE0LW5nZzBkeW4tMjIweDIyMHgxMDAtMDBmMHcwMTBjMDExcjExMGYxMTByMDEwdDAxMC5qcGciLCJnZW5lcmF0ZWQiOiIwLjE3MDg5ODAwIDE0Nzg4OTQzODkifX0=', 30, 1478895048),
(5, '3_1-9', 0, 1, '3_1-9.jpg', '', '3_1-9', '2016-08-12 14:04:05', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiIzXzEtOS5qcGciLCJ3aWR0aCI6NjQwLCJoZWlnaHQiOjQ3NCwiZ2VuZXJhdGVkIjoiMC4xMTY1NjEwMCAxNDcxMDEwNjQ1In0sIndpZHRoIjo2NDAsImhlaWdodCI6NDc0LCJmdWxsIjp7IndpZHRoIjo2NDAsImhlaWdodCI6NDc0LCJmaWxlbmFtZSI6IjNfMS05LmpwZyIsImdlbmVyYXRlZCI6IjAuNTU2NjQwMDAgMTQ3ODg5NTA0OSJ9LCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzXzNfMS05LmpwZyIsImdlbmVyYXRlZCI6IjAuOTM3MTU2MDAgMTQ3MTAxMDY0NSJ9LCJhcGVydHVyZSI6ZmFsc2UsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6ZmFsc2UsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6ZmFsc2UsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6ZmFsc2UsImlzbyI6ZmFsc2UsInNodXR0ZXJfc3BlZWQiOmZhbHNlLCJmbGFzaCI6ZmFsc2UsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJzYXZlZCI6dHJ1ZSwibmdnMGR5bi0yMjB4MjIweDEwMC0wMGYwdzAxMGMwMTFyMTEwZjExMHIwMTB0MDEwIjp7IndpZHRoIjoyMjAsImhlaWdodCI6MjIwLCJmaWxlbmFtZSI6IjNfMS05LmpwZy1uZ2dpZDAxNS1uZ2cwZHluLTIyMHgyMjB4MTAwLTAwZjB3MDEwYzAxMXIxMTBmMTEwcjAxMHQwMTAuanBnIiwiZ2VuZXJhdGVkIjoiMC4zNzUwMDAwMCAxNDc4ODk0Mzg3In19', 32, 1478895049),
(6, '3-8', 0, 1, '3-8.jpg', '', '3-8', '2016-08-12 14:16:53', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiIzLTguanBnIiwid2lkdGgiOjY5NCwiaGVpZ2h0Ijo0NDMsImdlbmVyYXRlZCI6IjAuNDY1MTA1MDAgMTQ3MTAxMTQxMyJ9LCJ3aWR0aCI6Njk0LCJoZWlnaHQiOjQ0MywiZnVsbCI6eyJ3aWR0aCI6Njk0LCJoZWlnaHQiOjQ0MywiZmlsZW5hbWUiOiIzLTguanBnIiwiZ2VuZXJhdGVkIjoiMC4yNzczNDMwMCAxNDc4ODk1MDUwIn0sInRodW1ibmFpbCI6eyJ3aWR0aCI6MjQwLCJoZWlnaHQiOjE2MCwiZmlsZW5hbWUiOiJ0aHVtYnNfMy04LmpwZyIsImdlbmVyYXRlZCI6IjAuMzY2OTM1MDAgMTQ3MTAxMTQxNCJ9LCJhcGVydHVyZSI6ZmFsc2UsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6ZmFsc2UsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6ZmFsc2UsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6ZmFsc2UsImlzbyI6ZmFsc2UsInNodXR0ZXJfc3BlZWQiOmZhbHNlLCJmbGFzaCI6ZmFsc2UsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJzYXZlZCI6dHJ1ZSwibmdnMGR5bi0yMjB4MjIweDEwMC0wMGYwdzAxMGMwMTFyMTEwZjExMHIwMTB0MDEwIjp7IndpZHRoIjoyMjAsImhlaWdodCI6MjIwLCJmaWxlbmFtZSI6IjMtOC5qcGctbmdnaWQwMTYtbmdnMGR5bi0yMjB4MjIweDEwMC0wMGYwdzAxMGMwMTFyMTEwZjExMHIwMTB0MDEwLmpwZyIsImdlbmVyYXRlZCI6IjAuMjUwOTc2MDAgMTQ3ODg5NDM4OSJ9fQ==', 35, 1478895050),
(7, '04-10', 0, 1, '04-10.jpg', '', '04-10', '2016-08-12 14:16:57', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiIwNC0xMC5qcGciLCJ3aWR0aCI6MzAwLCJoZWlnaHQiOjIwMCwiZ2VuZXJhdGVkIjoiMC41OTQ5MDUwMCAxNDcxMDExNDE3In0sIndpZHRoIjozMDAsImhlaWdodCI6MjAwLCJmdWxsIjp7IndpZHRoIjozMDAsImhlaWdodCI6MjAwLCJmaWxlbmFtZSI6IjA0LTEwLmpwZyIsImdlbmVyYXRlZCI6IjAuODk1NTA3MDAgMTQ3ODg5NTA1MCJ9LCJ0aHVtYm5haWwiOnsid2lkdGgiOjI0MCwiaGVpZ2h0IjoxNjAsImZpbGVuYW1lIjoidGh1bWJzXzA0LTEwLmpwZyIsImdlbmVyYXRlZCI6IjAuOTQ0MjA2MDAgMTQ3MTAxMTQxNyJ9LCJhcGVydHVyZSI6ZmFsc2UsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6ZmFsc2UsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6ZmFsc2UsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6ZmFsc2UsImlzbyI6ZmFsc2UsInNodXR0ZXJfc3BlZWQiOmZhbHNlLCJmbGFzaCI6ZmFsc2UsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJzYXZlZCI6dHJ1ZSwibmdnMGR5bi0yMjB4MjIweDEwMC0wMGYwdzAxMGMwMTFyMTEwZjExMHIwMTB0MDEwIjp7IndpZHRoIjoyMjAsImhlaWdodCI6MjAwLCJmaWxlbmFtZSI6IjA0LTEwLmpwZy1uZ2dpZDAxNy1uZ2cwZHluLTIyMHgyMjB4MTAwLTAwZjB3MDEwYzAxMXIxMTBmMTEwcjAxMHQwMTAuanBnIiwiZ2VuZXJhdGVkIjoiMC41NjczODIwMCAxNDc4ODk0Mzg4In19', 37, 1478895050),
(8, '4_1-11', 0, 1, '4_1-11.jpg', '', '4_1-11', '2016-08-12 14:17:00', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiI0XzEtMTEuanBnIiwid2lkdGgiOjY0MCwiaGVpZ2h0Ijo0MjYsImdlbmVyYXRlZCI6IjAuODYxMDk4MDAgMTQ3MTAxMTQyMCJ9LCJ3aWR0aCI6NjQwLCJoZWlnaHQiOjQyNiwiZnVsbCI6eyJ3aWR0aCI6NjQwLCJoZWlnaHQiOjQyNiwiZmlsZW5hbWUiOiI0XzEtMTEuanBnIiwiZ2VuZXJhdGVkIjoiMC42MDU0NjgwMCAxNDc4ODk1MDUxIn0sInRodW1ibmFpbCI6eyJ3aWR0aCI6MjQwLCJoZWlnaHQiOjE2MCwiZmlsZW5hbWUiOiJ0aHVtYnNfNF8xLTExLmpwZyIsImdlbmVyYXRlZCI6IjAuMjkyODIwMDAgMTQ3MTAxMTQyMSJ9LCJhcGVydHVyZSI6ZmFsc2UsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6ZmFsc2UsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6ZmFsc2UsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6ZmFsc2UsImlzbyI6ZmFsc2UsInNodXR0ZXJfc3BlZWQiOmZhbHNlLCJmbGFzaCI6ZmFsc2UsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJzYXZlZCI6dHJ1ZSwibmdnMGR5bi0yMjB4MjIweDEwMC0wMGYwdzAxMGMwMTFyMTEwZjExMHIwMTB0MDEwIjp7IndpZHRoIjoyMjAsImhlaWdodCI6MjIwLCJmaWxlbmFtZSI6IjRfMS0xMS5qcGctbmdnaWQwMTgtbmdnMGR5bi0yMjB4MjIweDEwMC0wMGYwdzAxMGMwMTFyMTEwZjExMHIwMTB0MDEwLmpwZyIsImdlbmVyYXRlZCI6IjAuMzc2OTUzMDAgMTQ3ODg5NDM4OSJ9fQ==', 39, 1478895051),
(9, '5_1-12', 0, 1, '5_1-12.jpg', '', '5_1-12', '2016-08-12 14:17:04', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiI1XzEtMTIuanBnIiwid2lkdGgiOjY5NCwiaGVpZ2h0Ijo0NjQsImdlbmVyYXRlZCI6IjAuNDA3MDMzMDAgMTQ3MTAxMTQyNCJ9LCJ3aWR0aCI6Njk0LCJoZWlnaHQiOjQ2NCwiZnVsbCI6eyJ3aWR0aCI6Njk0LCJoZWlnaHQiOjQ2NCwiZmlsZW5hbWUiOiI1XzEtMTIuanBnIiwiZ2VuZXJhdGVkIjoiMC4yOTg4MjgwMCAxNDc4ODk1MDUyIn0sInRodW1ibmFpbCI6eyJ3aWR0aCI6MjQwLCJoZWlnaHQiOjE2MCwiZmlsZW5hbWUiOiJ0aHVtYnNfNV8xLTEyLmpwZyIsImdlbmVyYXRlZCI6IjAuODAwMTQ0MDAgMTQ3MTAxMTQyNCJ9LCJhcGVydHVyZSI6ZmFsc2UsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6ZmFsc2UsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6ZmFsc2UsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6ZmFsc2UsImlzbyI6ZmFsc2UsInNodXR0ZXJfc3BlZWQiOmZhbHNlLCJmbGFzaCI6ZmFsc2UsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJzYXZlZCI6dHJ1ZSwibmdnMGR5bi0yMjB4MjIweDEwMC0wMGYwdzAxMGMwMTFyMTEwZjExMHIwMTB0MDEwIjp7IndpZHRoIjoyMjAsImhlaWdodCI6MjIwLCJmaWxlbmFtZSI6IjVfMS0xMi5qcGctbmdnaWQwMTktbmdnMGR5bi0yMjB4MjIweDEwMC0wMGYwdzAxMGMwMTFyMTEwZjExMHIwMTB0MDEwLmpwZyIsImdlbmVyYXRlZCI6IjAuMzc0MDIzMDAgMTQ3ODg5NDM4OCJ9fQ==', 41, 1478895052),
(10, '7_3-13', 0, 1, '7_3-13.jpg', '', '7_3-13', '2016-08-12 14:17:07', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiI3XzMtMTMuanBnIiwid2lkdGgiOjY0MCwiaGVpZ2h0Ijo0ODAsImdlbmVyYXRlZCI6IjAuODMyMDUxMDAgMTQ3MTAxMTQyNyJ9LCJ3aWR0aCI6NjQwLCJoZWlnaHQiOjQ4MCwiZnVsbCI6eyJ3aWR0aCI6NjQwLCJoZWlnaHQiOjQ4MCwiZmlsZW5hbWUiOiI3XzMtMTMuanBnIiwiZ2VuZXJhdGVkIjoiMC4wMTA3NDIwMCAxNDc4ODk1MDUzIn0sInRodW1ibmFpbCI6eyJ3aWR0aCI6MjQwLCJoZWlnaHQiOjE2MCwiZmlsZW5hbWUiOiJ0aHVtYnNfN18zLTEzLmpwZyIsImdlbmVyYXRlZCI6IjAuMzcyMTE0MDAgMTQ3MTAxMTQyOCJ9LCJhcGVydHVyZSI6ZmFsc2UsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6ZmFsc2UsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6ZmFsc2UsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6ZmFsc2UsImlzbyI6ZmFsc2UsInNodXR0ZXJfc3BlZWQiOmZhbHNlLCJmbGFzaCI6ZmFsc2UsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJzYXZlZCI6dHJ1ZSwibmdnMGR5bi0yMjB4MjIweDEwMC0wMGYwdzAxMGMwMTFyMTEwZjExMHIwMTB0MDEwIjp7IndpZHRoIjoyMjAsImhlaWdodCI6MjIwLCJmaWxlbmFtZSI6IjdfMy0xMy5qcGctbmdnaWQwMjEwLW5nZzBkeW4tMjIweDIyMHgxMDAtMDBmMHcwMTBjMDExcjExMGYxMTByMDEwdDAxMC5qcGciLCJnZW5lcmF0ZWQiOiIwLjI2MTcxODAwIDE0Nzg4OTQzOTAifX0=', 43, 1478895053),
(11, '54s_3-1', 0, 1, '54s_3-1.jpg', '', '54s_3-1', '2016-08-12 14:19:44', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiI1NHNfMy0xLmpwZyIsIndpZHRoIjo2NDAsImhlaWdodCI6NDIxLCJnZW5lcmF0ZWQiOiIwLjEyMzIxMDAwIDE0NzEwMTE1ODQifSwid2lkdGgiOjY0MCwiaGVpZ2h0Ijo0MjEsImZ1bGwiOnsid2lkdGgiOjY0MCwiaGVpZ2h0Ijo0MjEsImZpbGVuYW1lIjoiNTRzXzMtMS5qcGciLCJnZW5lcmF0ZWQiOiIwLjY5OTIxODAwIDE0Nzg4OTUwNTMifSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic181NHNfMy0xLmpwZyIsImdlbmVyYXRlZCI6IjAuNTY3Mzc0MDAgMTQ3MTAxMTU4NCJ9LCJhcGVydHVyZSI6ZmFsc2UsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6ZmFsc2UsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6ZmFsc2UsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6ZmFsc2UsImlzbyI6ZmFsc2UsInNodXR0ZXJfc3BlZWQiOmZhbHNlLCJmbGFzaCI6ZmFsc2UsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJzYXZlZCI6dHJ1ZSwibmdnMGR5bi0yMjB4MjIweDEwMC0wMGYwdzAxMGMwMTFyMTEwZjExMHIwMTB0MDEwIjp7IndpZHRoIjoyMjAsImhlaWdodCI6MjIwLCJmaWxlbmFtZSI6IjU0c18zLTEuanBnLW5nZ2lkMDIxMS1uZ2cwZHluLTIyMHgyMjB4MTAwLTAwZjB3MDEwYzAxMXIxMTBmMTEwcjAxMHQwMTAuanBnIiwiZ2VuZXJhdGVkIjoiMC4wMDU4NTkwMCAxNDc4ODk0MzkwIn19', 45, 1478895053),
(12, '24_1-14', 0, 1, '24_1-14.jpg', '', '24_1-14', '2016-08-12 14:19:54', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiIyNF8xLTE0LmpwZyIsIndpZHRoIjo2NDAsImhlaWdodCI6NDI4LCJnZW5lcmF0ZWQiOiIwLjQyMzMxMTAwIDE0NzEwMTE1OTQifSwid2lkdGgiOjY0MCwiaGVpZ2h0Ijo0MjgsImZ1bGwiOnsid2lkdGgiOjY0MCwiaGVpZ2h0Ijo0MjgsImZpbGVuYW1lIjoiMjRfMS0xNC5qcGciLCJnZW5lcmF0ZWQiOiIwLjQxMzA4NTAwIDE0Nzg4OTUwNTQifSwidGh1bWJuYWlsIjp7IndpZHRoIjoyNDAsImhlaWdodCI6MTYwLCJmaWxlbmFtZSI6InRodW1ic18yNF8xLTE0LmpwZyIsImdlbmVyYXRlZCI6IjAuNTI2MTE5MDAgMTQ3MTAxMTU5NSJ9LCJhcGVydHVyZSI6ZmFsc2UsImNyZWRpdCI6ZmFsc2UsImNhbWVyYSI6ZmFsc2UsImNhcHRpb24iOmZhbHNlLCJjcmVhdGVkX3RpbWVzdGFtcCI6ZmFsc2UsImNvcHlyaWdodCI6ZmFsc2UsImZvY2FsX2xlbmd0aCI6ZmFsc2UsImlzbyI6ZmFsc2UsInNodXR0ZXJfc3BlZWQiOmZhbHNlLCJmbGFzaCI6ZmFsc2UsInRpdGxlIjpmYWxzZSwia2V5d29yZHMiOmZhbHNlLCJzYXZlZCI6dHJ1ZSwibmdnMGR5bi0yMjB4MjIweDEwMC0wMGYwdzAxMGMwMTFyMTEwZjExMHIwMTB0MDEwIjp7IndpZHRoIjoyMjAsImhlaWdodCI6MjIwLCJmaWxlbmFtZSI6IjI0XzEtMTQuanBnLW5nZ2lkMDIxMi1uZ2cwZHluLTIyMHgyMjB4MTAwLTAwZjB3MDEwYzAxMXIxMTBmMTEwcjAxMHQwMTAuanBnIiwiZ2VuZXJhdGVkIjoiMC40NDUzMTIwMCAxNDc4ODk0MzkwIn19', 47, 1478895054);

-- --------------------------------------------------------

--
-- Структура таблицы `wqkbf_options`
--

CREATE TABLE IF NOT EXISTS `wqkbf_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2653 ;

--
-- Дамп данных таблицы `wqkbf_options`
--

INSERT INTO `wqkbf_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/wordpress', 'yes'),
(2, 'home', 'http://localhost/wordpress', 'yes'),
(3, 'blogname', 'Reasanik', 'yes'),
(4, 'blogdescription', 'Ещё один сайт на WordPress', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'admin@reasanik.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'd.m.Y', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'd.m.Y H:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:212:{s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:48:"ngg_tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?ngg_tag=$matches[1]&feed=$matches[2]";s:43:"ngg_tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?ngg_tag=$matches[1]&feed=$matches[2]";s:24:"ngg_tag/([^/]+)/embed/?$";s:40:"index.php?ngg_tag=$matches[1]&embed=true";s:36:"ngg_tag/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?ngg_tag=$matches[1]&paged=$matches[2]";s:18:"ngg_tag/([^/]+)/?$";s:29:"index.php?ngg_tag=$matches[1]";s:37:"ngg_album/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"ngg_album/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:67:"ngg_album/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"ngg_album/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"ngg_album/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:43:"ngg_album/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:26:"ngg_album/([^/]+)/embed/?$";s:42:"index.php?ngg_album=$matches[1]&embed=true";s:30:"ngg_album/([^/]+)/trackback/?$";s:36:"index.php?ngg_album=$matches[1]&tb=1";s:38:"ngg_album/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?ngg_album=$matches[1]&paged=$matches[2]";s:45:"ngg_album/([^/]+)/comment-page-([0-9]{1,})/?$";s:49:"index.php?ngg_album=$matches[1]&cpage=$matches[2]";s:34:"ngg_album/([^/]+)(?:/([0-9]+))?/?$";s:48:"index.php?ngg_album=$matches[1]&page=$matches[2]";s:26:"ngg_album/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:36:"ngg_album/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:56:"ngg_album/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"ngg_album/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"ngg_album/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:32:"ngg_album/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:39:"ngg_gallery/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:49:"ngg_gallery/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:69:"ngg_gallery/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:64:"ngg_gallery/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:64:"ngg_gallery/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:45:"ngg_gallery/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:28:"ngg_gallery/([^/]+)/embed/?$";s:44:"index.php?ngg_gallery=$matches[1]&embed=true";s:32:"ngg_gallery/([^/]+)/trackback/?$";s:38:"index.php?ngg_gallery=$matches[1]&tb=1";s:40:"ngg_gallery/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?ngg_gallery=$matches[1]&paged=$matches[2]";s:47:"ngg_gallery/([^/]+)/comment-page-([0-9]{1,})/?$";s:51:"index.php?ngg_gallery=$matches[1]&cpage=$matches[2]";s:36:"ngg_gallery/([^/]+)(?:/([0-9]+))?/?$";s:50:"index.php?ngg_gallery=$matches[1]&page=$matches[2]";s:28:"ngg_gallery/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:38:"ngg_gallery/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:58:"ngg_gallery/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:53:"ngg_gallery/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:53:"ngg_gallery/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:34:"ngg_gallery/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:40:"ngg_pictures/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:50:"ngg_pictures/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:70:"ngg_pictures/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"ngg_pictures/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"ngg_pictures/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:46:"ngg_pictures/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:29:"ngg_pictures/([^/]+)/embed/?$";s:45:"index.php?ngg_pictures=$matches[1]&embed=true";s:33:"ngg_pictures/([^/]+)/trackback/?$";s:39:"index.php?ngg_pictures=$matches[1]&tb=1";s:41:"ngg_pictures/([^/]+)/page/?([0-9]{1,})/?$";s:52:"index.php?ngg_pictures=$matches[1]&paged=$matches[2]";s:48:"ngg_pictures/([^/]+)/comment-page-([0-9]{1,})/?$";s:52:"index.php?ngg_pictures=$matches[1]&cpage=$matches[2]";s:37:"ngg_pictures/([^/]+)(?:/([0-9]+))?/?$";s:51:"index.php?ngg_pictures=$matches[1]&page=$matches[2]";s:29:"ngg_pictures/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:39:"ngg_pictures/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:59:"ngg_pictures/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"ngg_pictures/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"ngg_pictures/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:35:"ngg_pictures/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:44:"lightbox_library/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:54:"lightbox_library/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:74:"lightbox_library/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:69:"lightbox_library/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:69:"lightbox_library/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:50:"lightbox_library/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:33:"lightbox_library/([^/]+)/embed/?$";s:49:"index.php?lightbox_library=$matches[1]&embed=true";s:37:"lightbox_library/([^/]+)/trackback/?$";s:43:"index.php?lightbox_library=$matches[1]&tb=1";s:45:"lightbox_library/([^/]+)/page/?([0-9]{1,})/?$";s:56:"index.php?lightbox_library=$matches[1]&paged=$matches[2]";s:52:"lightbox_library/([^/]+)/comment-page-([0-9]{1,})/?$";s:56:"index.php?lightbox_library=$matches[1]&cpage=$matches[2]";s:41:"lightbox_library/([^/]+)(?:/([0-9]+))?/?$";s:55:"index.php?lightbox_library=$matches[1]&page=$matches[2]";s:33:"lightbox_library/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:43:"lightbox_library/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:63:"lightbox_library/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"lightbox_library/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"lightbox_library/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:39:"lightbox_library/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:45:"displayed_gallery/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:55:"displayed_gallery/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:75:"displayed_gallery/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"displayed_gallery/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"displayed_gallery/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:51:"displayed_gallery/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:34:"displayed_gallery/([^/]+)/embed/?$";s:50:"index.php?displayed_gallery=$matches[1]&embed=true";s:38:"displayed_gallery/([^/]+)/trackback/?$";s:44:"index.php?displayed_gallery=$matches[1]&tb=1";s:46:"displayed_gallery/([^/]+)/page/?([0-9]{1,})/?$";s:57:"index.php?displayed_gallery=$matches[1]&paged=$matches[2]";s:53:"displayed_gallery/([^/]+)/comment-page-([0-9]{1,})/?$";s:57:"index.php?displayed_gallery=$matches[1]&cpage=$matches[2]";s:42:"displayed_gallery/([^/]+)(?:/([0-9]+))?/?$";s:56:"index.php?displayed_gallery=$matches[1]&page=$matches[2]";s:34:"displayed_gallery/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:44:"displayed_gallery/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:64:"displayed_gallery/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"displayed_gallery/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"displayed_gallery/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:40:"displayed_gallery/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:40:"display_type/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:50:"display_type/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:70:"display_type/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"display_type/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"display_type/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:46:"display_type/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:29:"display_type/([^/]+)/embed/?$";s:45:"index.php?display_type=$matches[1]&embed=true";s:33:"display_type/([^/]+)/trackback/?$";s:39:"index.php?display_type=$matches[1]&tb=1";s:41:"display_type/([^/]+)/page/?([0-9]{1,})/?$";s:52:"index.php?display_type=$matches[1]&paged=$matches[2]";s:48:"display_type/([^/]+)/comment-page-([0-9]{1,})/?$";s:52:"index.php?display_type=$matches[1]&cpage=$matches[2]";s:37:"display_type/([^/]+)(?:/([0-9]+))?/?$";s:51:"index.php?display_type=$matches[1]&page=$matches[2]";s:29:"display_type/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:39:"display_type/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:59:"display_type/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"display_type/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"display_type/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:35:"display_type/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:46:"gal_display_source/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:56:"gal_display_source/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:76:"gal_display_source/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:71:"gal_display_source/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:71:"gal_display_source/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:52:"gal_display_source/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:35:"gal_display_source/([^/]+)/embed/?$";s:51:"index.php?gal_display_source=$matches[1]&embed=true";s:39:"gal_display_source/([^/]+)/trackback/?$";s:45:"index.php?gal_display_source=$matches[1]&tb=1";s:47:"gal_display_source/([^/]+)/page/?([0-9]{1,})/?$";s:58:"index.php?gal_display_source=$matches[1]&paged=$matches[2]";s:54:"gal_display_source/([^/]+)/comment-page-([0-9]{1,})/?$";s:58:"index.php?gal_display_source=$matches[1]&cpage=$matches[2]";s:43:"gal_display_source/([^/]+)(?:/([0-9]+))?/?$";s:57:"index.php?gal_display_source=$matches[1]&page=$matches[2]";s:35:"gal_display_source/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"gal_display_source/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:"gal_display_source/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"gal_display_source/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"gal_display_source/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:41:"gal_display_source/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:27:"comment-page-([0-9]{1,})/?$";s:38:"index.php?&page_id=2&cpage=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:58:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:68:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:88:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:64:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:53:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$";s:91:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1";s:77:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:65:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]";s:61:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]";s:47:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:53:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]";s:51:"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:38:"([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:6:{i:0;s:36:"contact-form-7/wp-contact-form-7.php";i:1;s:22:"cyr2lat/cyr-to-lat.php";i:2;s:35:"fancybox-for-wordpress/fancybox.php";i:4;s:29:"nextgen-gallery/nggallery.php";i:5;s:27:"wp-pagenavi/wp-pagenavi.php";i:6;s:29:"wp-postviews/wp-postviews.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '3', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:5:{i:0;s:80:"C:\\OpenServer\\domains\\localhost\\wordpress/wp-content/plugins/akismet/akismet.php";i:1;s:70:"Z:\\home\\localhost\\www\\wordpress/wp-content/plugins/akismet/akismet.php";i:2;s:72:"Z:\\home\\localhost\\www\\wordpress/wp-content/plugins/example1/example1.php";i:3;s:80:"Z:\\home\\localhost\\www\\wordpress/wp-content/plugins/face-gallery/face-gallery.php";i:4;s:73:"Z:\\home\\localhost\\www\\wordpress/wp-content/plugins/cyr2lat/cyr-to-lat.php";}', 'no'),
(40, 'template', 'reasanik', 'yes'),
(41, 'stylesheet', 'reasanik', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '37965', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '0', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:1:{s:27:"wp-pagenavi/wp-pagenavi.php";s:14:"__return_false";}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '2', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'initial_db_version', '36686', 'yes'),
(92, 'wqkbf_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:72:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:14:"gdrts_standard";b:1;s:24:"NextGEN Gallery overview";b:1;s:19:"NextGEN Use TinyMCE";b:1;s:21:"NextGEN Upload images";b:1;s:22:"NextGEN Manage gallery";b:1;s:19:"NextGEN Manage tags";b:1;s:29:"NextGEN Manage others gallery";b:1;s:18:"NextGEN Edit album";b:1;s:20:"NextGEN Change style";b:1;s:22:"NextGEN Change options";b:1;s:24:"NextGEN Attach Interface";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(93, 'WPLANG', 'ru_RU', 'yes'),
(94, 'widget_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-posts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'sidebars_widgets', 'a:5:{s:19:"wp_inactive_widgets";a:0:{}s:18:"orphaned_widgets_1";a:0:{}s:18:"orphaned_widgets_2";N;s:18:"orphaned_widgets_3";N;s:13:"array_version";i:3;}', 'yes'),
(100, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(101, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'cron', 'a:6:{i:1478895889;a:1:{s:29:"ngg_delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"ngg_custom";s:4:"args";a:0:{}s:8:"interval";i:900;}}}i:1478913080;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1478916000;a:1:{s:32:"gdrts_cron_daily_maintenance_job";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1478956316;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1478958349;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(134, 'theme_mods_twentysixteen', 'a:2:{s:18:"nav_menu_locations";a:2:{s:7:"primary";i:2;s:6:"footer";i:0;}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1475957743;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:0:{}}}}', 'yes'),
(135, 'current_theme', 'Reasanik', 'yes'),
(136, 'theme_mods_twentyfourteen', 'a:3:{i:0;b:0;s:18:"nav_menu_locations";a:0:{}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1471012597;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(137, 'theme_switched', '', 'yes'),
(138, 'widget_widget_twentyfourteen_ephemera', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(147, 'pagenavi_options', 'a:15:{s:10:"pages_text";s:50:"Страница %CURRENT_PAGE% из %TOTAL_PAGES%";s:12:"current_text";s:13:"%PAGE_NUMBER%";s:9:"page_text";s:13:"%PAGE_NUMBER%";s:10:"first_text";s:20:"&laquo; Первая";s:9:"last_text";s:26:"Последняя &raquo;";s:9:"prev_text";s:7:"&laquo;";s:9:"next_text";s:7:"&raquo;";s:12:"dotleft_text";s:3:"...";s:13:"dotright_text";s:3:"...";s:9:"num_pages";i:5;s:23:"num_larger_page_numbers";i:3;s:28:"larger_page_numbers_multiple";i:10;s:11:"always_show";b:0;s:16:"use_pagenavi_css";b:1;s:5:"style";i:1;}', 'yes'),
(148, 'recently_activated', 'a:0:{}', 'yes'),
(176, 'mfbfw', 'a:47:{s:6:"border";s:0:"";s:11:"borderColor";s:7:"#BBBBBB";s:15:"showCloseButton";s:2:"on";s:11:"closeHorPos";s:5:"right";s:11:"closeVerPos";s:3:"top";s:12:"paddingColor";s:7:"#FFFFFF";s:7:"padding";s:2:"10";s:11:"overlayShow";s:2:"on";s:12:"overlayColor";s:7:"#666666";s:14:"overlayOpacity";s:3:"0.3";s:9:"titleShow";s:2:"on";s:13:"titlePosition";s:6:"inside";s:10:"titleColor";s:7:"#333333";s:13:"showNavArrows";s:2:"on";s:11:"zoomOpacity";s:2:"on";s:11:"zoomSpeedIn";s:3:"500";s:12:"zoomSpeedOut";s:3:"500";s:15:"zoomSpeedChange";s:3:"300";s:12:"transitionIn";s:4:"fade";s:13:"transitionOut";s:4:"fade";s:6:"easing";s:0:"";s:8:"easingIn";s:11:"easeOutBack";s:9:"easingOut";s:10:"easeInBack";s:12:"easingChange";s:14:"easeInOutQuart";s:10:"imageScale";s:2:"on";s:14:"centerOnScroll";s:2:"on";s:18:"hideOnContentClick";s:0:"";s:18:"hideOnOverlayClick";s:2:"on";s:18:"enableEscapeButton";s:2:"on";s:6:"cyclic";s:0:"";s:10:"mouseWheel";s:0:"";s:11:"galleryType";s:3:"all";s:16:"customExpression";s:74:"jQuery(thumbnails).addClass("fancybox").attr("rel","fancybox").getTitle();";s:14:"autoDimensions";s:2:"on";s:10:"frameWidth";s:3:"560";s:11:"frameHeight";s:3:"340";s:12:"loadAtFooter";s:0:"";s:14:"callbackEnable";s:0:"";s:15:"callbackOnStart";s:31:"function() { alert("Start!"); }";s:16:"callbackOnCancel";s:32:"function() { alert("Cancel!"); }";s:18:"callbackOnComplete";s:34:"function() { alert("Complete!"); }";s:17:"callbackOnCleanup";s:33:"function() { alert("CleanUp!"); }";s:15:"callbackOnClose";s:31:"function() { alert("Close!"); }";s:8:"nojQuery";s:0:"";s:16:"extraCallsEnable";s:0:"";s:14:"extraCallsData";s:0:"";s:9:"uninstall";s:0:"";}', 'yes'),
(177, 'mfbfw_active_version', '3.0.6', 'yes'),
(178, 'wpcf7', 'a:2:{s:7:"version";s:5:"4.5.1";s:13:"bulk_validate";a:4:{s:9:"timestamp";i:1471019688;s:7:"version";s:3:"4.5";s:11:"count_valid";i:1;s:13:"count_invalid";i:0;}}', 'yes'),
(179, 'views_options', 'a:11:{s:5:"count";i:1;s:12:"exclude_bots";i:0;s:12:"display_home";i:0;s:14:"display_single";i:0;s:12:"display_page";i:0;s:15:"display_archive";i:0;s:14:"display_search";i:0;s:13:"display_other";i:0;s:8:"use_ajax";i:1;s:8:"template";s:18:"%VIEW_COUNT% views";s:20:"most_viewed_template";s:89:"<li><a href="%POST_URL%"  title="%POST_TITLE%">%POST_TITLE%</a> - %VIEW_COUNT% views</li>";}', 'yes'),
(180, 'widget_ngg-images', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(181, 'widget_ngg-mrssw', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(182, 'widget_slideshow', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(183, 'widget_views', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(184, 'widget_gdrts_stars_rating_list', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(185, 'widget_vortex_top_likes', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(186, 'ngg_transient_groups', 'a:8:{s:9:"__counter";i:8;s:3:"MVC";a:2:{s:2:"id";i:2;s:7:"enabled";b:1;}s:18:"col_in_wqkbf_posts";a:2:{s:2:"id";i:3;s:7:"enabled";b:1;}s:24:"col_in_wqkbf_ngg_gallery";a:2:{s:2:"id";i:4;s:7:"enabled";b:1;}s:22:"col_in_wqkbf_ngg_album";a:2:{s:2:"id";i:5;s:7:"enabled";b:1;}s:25:"col_in_wqkbf_ngg_pictures";a:2:{s:2:"id";i:6;s:7:"enabled";b:1;}s:27:"displayed_gallery_rendering";a:2:{s:2:"id";i:7;s:7:"enabled";b:1;}s:19:"displayed_galleries";a:2:{s:2:"id";i:8;s:7:"enabled";b:1;}}', 'yes'),
(187, 'dev4press_gd-rating-system_core', 'a:1:{s:9:"activated";i:0;}', 'yes'),
(188, 'dev4press_gd-rating-system_load', 'a:6:{s:18:"addon_dynamic-load";b:0;s:11:"addon_posts";b:1;s:14:"addon_comments";b:1;s:19:"addon_rich-snippets";b:1;s:19:"method_stars-rating";b:1;s:11:"addon_feeds";b:1;}', 'yes'),
(189, 'dev4press_gd-rating-system_entities', 'a:15:{s:5:"posts";a:0:{}s:10:"posts.post";a:0:{}s:10:"posts.page";a:0:{}s:16:"posts.attachment";a:0:{}s:5:"terms";a:0:{}s:14:"terms.category";a:0:{}s:14:"terms.post_tag";a:0:{}s:17:"terms.post_format";a:0:{}s:13:"terms.ngg_tag";a:0:{}s:8:"comments";a:0:{}s:16:"comments.comment";a:0:{}s:5:"users";a:0:{}s:10:"users.user";a:0:{}s:6:"custom";a:0:{}s:11:"custom.free";a:0:{}}', 'yes'),
(190, 'dev4press_gd-rating-system_settings', 'a:15:{s:18:"debug_rating_block";b:0;s:19:"cronjob_hour_of_day";s:1:"2";s:19:"cronjob_recheck_max";b:0;s:15:"voting_disabled";b:0;s:23:"voting_disabled_message";s:29:"Voting is currently disabled.";s:11:"maintenance";b:0;s:19:"maintenance_message";s:59:"Voting is currently disabled, data maintenance in progress.";s:9:"use_nonce";b:1;s:18:"annonymous_same_ip";b:0;s:17:"annonymous_verify";s:12:"ip_or_cookie";s:20:"ajax_header_no_cache";b:1;s:13:"decimal_round";i:1;s:16:"admin_log_remove";b:0;s:19:"log_vote_user_agent";b:0;s:14:"fonticons_font";b:1;}', 'yes'),
(191, 'dev4press_gd-rating-system_templates', 'a:2:{s:12:"dynamic-load";a:1:{s:6:"single";a:1:{s:7:"default";s:14:"Dynamic Loader";}}s:12:"stars-rating";a:2:{s:4:"list";a:2:{s:9:"shortcode";s:9:"Shortcode";s:6:"widget";s:6:"Widget";}s:6:"single";a:4:{s:7:"default";s:7:"Default";s:8:"expanded";s:25:"Default with Distribution";s:4:"feed";s:4:"Feed";s:5:"light";s:5:"Light";}}}', 'yes'),
(192, 'dev4press_gd-rating-system_items', 'a:0:{}', 'yes'),
(193, 'dev4press_gd-rating-system_methods', 'a:21:{s:18:"stars-rating_stars";i:5;s:23:"stars-rating_resolution";i:100;s:17:"stars-rating_vote";s:6:"revote";s:23:"stars-rating_vote_limit";i:0;s:30:"stars-rating_allow_super_admin";b:1;s:29:"stars-rating_allow_user_roles";b:1;s:26:"stars-rating_allow_visitor";b:1;s:21:"stars-rating_template";s:7:"default";s:22:"stars-rating_alignment";s:4:"none";s:23:"stars-rating_responsive";b:1;s:25:"stars-rating_distribution";s:10:"normalized";s:19:"stars-rating_rating";s:7:"average";s:18:"stars-rating_class";s:0:"";s:23:"stars-rating_style_type";s:4:"font";s:29:"stars-rating_style_image_name";s:4:"star";s:23:"stars-rating_style_size";i:30;s:29:"stars-rating_font_color_empty";s:7:"#dddddd";s:31:"stars-rating_font_color_current";s:7:"#ffff00";s:30:"stars-rating_font_color_active";s:7:"#dd0000";s:19:"stars-rating_labels";a:5:{i:0;s:4:"Poor";i:1;s:3:"Bad";i:2;s:4:"Good";i:3;s:5:"Great";i:4;s:9:"Excellent";}s:25:"stars-rating_allow_author";b:0;}', 'yes'),
(194, 'dev4press_gd-rating-system_addons', 'a:27:{s:30:"posts_post_auto_embed_location";s:6:"bottom";s:28:"posts_post_auto_embed_method";s:12:"stars-rating";s:30:"posts_page_auto_embed_location";s:6:"bottom";s:28:"posts_page_auto_embed_method";s:12:"stars-rating";s:36:"posts_attachment_auto_embed_location";s:4:"hide";s:34:"posts_attachment_auto_embed_method";s:12:"stars-rating";s:37:"comments_comments_auto_embed_location";s:6:"bottom";s:35:"comments_comments_auto_embed_method";s:12:"stars-rating";s:37:"rich-snippets_single_snippet_per_page";b:1;s:45:"rich-snippets_snippets_on_singular_pages_only";b:1;s:34:"rich-snippets_post_snippet_display";s:9:"microdata";s:33:"rich-snippets_post_snippet_method";s:12:"stars-rating";s:36:"rich-snippets_post_snippet_itemscope";s:12:"CreativeWork";s:34:"rich-snippets_page_snippet_display";s:9:"microdata";s:33:"rich-snippets_page_snippet_method";s:12:"stars-rating";s:36:"rich-snippets_page_snippet_itemscope";s:7:"WebPage";s:40:"rich-snippets_attachment_snippet_display";s:4:"hide";s:39:"rich-snippets_attachment_snippet_method";s:12:"stars-rating";s:42:"rich-snippets_attachment_snippet_itemscope";s:11:"MediaObject";s:9:"feeds_rss";b:1;s:14:"feeds_rss_hide";b:0;s:9:"feeds_amp";b:1;s:14:"feeds_amp_hide";b:0;s:9:"feeds_fia";b:1;s:14:"feeds_fia_hide";b:0;s:9:"feeds_anf";b:1;s:14:"feeds_anf_hide";b:0;}', 'yes'),
(195, 'dev4press_gd-rating-system_info', 'a:14:{s:4:"code";s:16:"gd-rating-system";s:7:"version";s:5:"1.3.1";s:8:"codename";s:6:"Pallas";s:5:"build";i:388;s:7:"edition";s:4:"lite";s:6:"status";s:6:"stable";s:7:"updated";s:10:"2016.09.29";s:3:"url";s:29:"https://rating.dev4press.com/";s:11:"author_name";s:14:"Milan Petrovic";s:10:"author_url";s:26:"https://www.dev4press.com/";s:8:"released";s:10:"2015.12.25";s:7:"install";b:0;s:6:"update";b:1;s:8:"previous";i:290;}', 'yes'),
(196, 'ngg_options', 'a:73:{s:11:"gallerypath";s:19:"wp-content\\gallery\\";s:11:"wpmuCSSfile";s:13:"nggallery.css";s:9:"wpmuStyle";b:0;s:9:"wpmuRoles";b:0;s:16:"wpmuImportFolder";b:0;s:13:"wpmuZipUpload";b:0;s:14:"wpmuQuotaCheck";b:0;s:17:"datamapper_driver";s:22:"custom_post_datamapper";s:21:"gallerystorage_driver";s:25:"ngglegacy_gallery_storage";s:20:"maximum_entity_count";s:3:"500";s:17:"router_param_slug";s:9:"nggallery";s:22:"router_param_separator";s:2:"--";s:19:"router_param_prefix";s:0:"";s:9:"deleteImg";s:1:"1";s:9:"swfUpload";b:1;s:13:"usePermalinks";b:0;s:13:"permalinkSlug";s:9:"nggallery";s:14:"graphicLibrary";s:2:"gd";s:14:"imageMagickDir";s:15:"/usr/local/bin/";s:11:"useMediaRSS";s:1:"0";s:18:"galleries_in_feeds";s:1:"0";s:12:"activateTags";s:1:"0";s:10:"appendType";s:4:"tags";s:9:"maxImages";s:1:"7";s:14:"relatedHeading";s:51:"<h3>Связанные изображения:</h3>";s:10:"thumbwidth";s:3:"220";s:11:"thumbheight";s:3:"220";s:8:"thumbfix";s:1:"1";s:12:"thumbquality";i:100;s:8:"imgWidth";s:3:"800";s:9:"imgHeight";s:3:"600";s:10:"imgQuality";s:3:"100";s:9:"imgBackup";s:1:"1";s:13:"imgAutoResize";s:1:"0";s:9:"galImages";s:2:"20";s:17:"galPagedGalleries";i:0;s:10:"galColumns";i:0;s:12:"galShowSlide";b:1;s:12:"galTextSlide";s:35:"[Показать слайдшоу]";s:14:"galTextGallery";s:31:"[Показать эскизы]";s:12:"galShowOrder";s:7:"gallery";s:7:"galSort";s:9:"sortorder";s:10:"galSortDir";s:3:"ASC";s:10:"galNoPages";b:1;s:13:"galImgBrowser";i:0;s:12:"galHiddenImg";i:0;s:10:"galAjaxNav";i:0;s:11:"thumbEffect";s:4:"none";s:9:"thumbCode";s:41:"class="ngg-fancybox" rel="%GALLERY_NAME%"";s:18:"thumbEffectContext";s:14:"nextgen_images";s:5:"wmPos";s:8:"botRight";s:6:"wmXpos";s:1:"5";s:6:"wmYpos";s:1:"5";s:6:"wmType";s:4:"text";s:6:"wmPath";s:0:"";s:6:"wmFont";s:9:"arial.ttf";s:6:"wmSize";s:2:"10";s:6:"wmText";s:8:"Reasanik";s:7:"wmColor";s:7:"#000000";s:8:"wmOpaque";s:3:"100";s:7:"slideFX";s:4:"fade";s:7:"irWidth";i:600;s:8:"irHeight";i:400;s:12:"irRotatetime";i:10;s:11:"activateCSS";s:1:"1";s:7:"CSSfile";s:13:"nggallery.css";s:28:"always_enable_frontend_logic";b:0;s:22:"dynamic_thumbnail_slug";s:13:"nextgen-image";s:23:"dynamic_stylesheet_slug";s:12:"nextgen-dcss";s:11:"installDate";i:1471009676;s:18:"thumbEffectScripts";a:1:{i:0;s:0:"";}s:17:"thumbEffectStyles";a:1:{i:0;s:0:"";}s:15:"thumbEffectCode";s:0:"";}', 'yes'),
(198, 'photocrati_auto_update_admin_update_list', '', 'yes'),
(199, 'photocrati_auto_update_admin_check_date', '', 'yes'),
(200, 'ngg_db_version', '1.8.1', 'yes'),
(203, 'pope_module_list', 'a:34:{i:0;s:17:"photocrati-fs|0.6";i:1;s:19:"photocrati-i18n|0.2";i:2;s:25:"photocrati-validation|0.2";i:3;s:21:"photocrati-router|0.8";i:4;s:32:"photocrati-wordpress_routing|0.8";i:5;s:23:"photocrati-security|0.3";i:6;s:31:"photocrati-nextgen_settings|0.9";i:7;s:18:"photocrati-mvc|0.8";i:8;s:20:"photocrati-ajax|0.10";i:9;s:26:"photocrati-datamapper|0.10";i:10;s:30:"photocrati-nextgen-legacy|0.17";i:11;s:28:"photocrati-nextgen-data|0.13";i:12;s:33:"photocrati-dynamic_thumbnails|0.7";i:13;s:29:"photocrati-nextgen_admin|0.11";i:14;s:39:"photocrati-nextgen_gallery_display|0.15";i:15;s:34:"photocrati-frame_communication|0.5";i:16;s:30:"photocrati-attach_to_post|0.16";i:17;s:38:"photocrati-nextgen_addgallery_page|0.8";i:18;s:36:"photocrati-nextgen_other_options|0.9";i:19;s:33:"photocrati-nextgen_pagination|0.4";i:20;s:33:"photocrati-dynamic_stylesheet|0.4";i:21;s:34:"photocrati-nextgen_pro_upgrade|0.6";i:22;s:20:"photocrati-cache|0.2";i:23;s:24:"photocrati-lightbox|0.17";i:24;s:38:"photocrati-nextgen_basic_templates|0.7";i:25;s:37:"photocrati-nextgen_basic_gallery|0.16";i:26;s:42:"photocrati-nextgen_basic_imagebrowser|0.13";i:27;s:39:"photocrati-nextgen_basic_singlepic|0.14";i:28;s:38:"photocrati-nextgen_basic_tagcloud|0.13";i:29;s:35:"photocrati-nextgen_basic_album|0.16";i:30;s:21:"photocrati-widget|0.6";i:31;s:33:"photocrati-third_party_compat|0.5";i:32;s:29:"photocrati-nextgen_xmlrpc|0.6";i:33;s:20:"photocrati-wpcli|0.2";}', 'yes'),
(235, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(532, 'widget_travellator_recent_posts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(542, 'theme_mods_travellator', 'a:3:{i:0;b:0;s:18:"nav_menu_locations";a:2:{s:7:"primary";i:0;s:6:"footer";i:0;}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1475423765;s:4:"data";a:5:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:0:{}s:17:"footer-one-widget";a:0:{}s:17:"footer-two-widget";a:0:{}s:19:"footer-three-widget";N;}}}', 'yes'),
(544, 'theme_mods_llorix-one-lite', 'a:3:{i:0;b:0;s:18:"nav_menu_locations";a:2:{s:7:"primary";i:0;s:6:"footer";i:0;}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1475423675;s:4:"data";a:6:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:0:{}s:11:"footer-area";a:0:{}s:13:"footer-area-2";a:0:{}s:13:"footer-area-3";N;s:13:"footer-area-4";N;}}}', 'yes'),
(555, 'theme_mods_fabulous-fluid', 'a:5:{i:0;b:0;s:17:"breadcrumb_option";b:1;s:20:"breadcrumb_seperator";s:1:">";s:18:"nav_menu_locations";a:2:{s:7:"primary";i:0;s:6:"footer";i:0;}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1478306755;s:4:"data";a:5:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";N;s:8:"footer-1";N;s:8:"footer-2";N;s:8:"footer-3";N;}}}', 'yes'),
(556, 'widget_fabulous_fluid_social_icons', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(566, 'theme_mods_the-launcher', 'a:3:{i:0;b:0;s:18:"nav_menu_locations";a:2:{s:7:"primary";i:0;s:6:"footer";i:0;}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1475423704;s:4:"data";a:9:{s:19:"wp_inactive_widgets";a:0:{}s:22:"the-launcher-sidebar-1";a:0:{}s:25:"the-launcher-left-sidebar";a:0:{}s:26:"the-launcher-pricing-table";a:0:{}s:27:"the-launcher-subscribe-form";N;s:21:"the-launcher-footer-1";N;s:21:"the-launcher-footer-2";N;s:21:"the-launcher-footer-3";N;s:20:"the-launcher-contact";N;}}}', 'yes'),
(567, 'widget_the_launcher_pricing', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(568, 'widget_the_launcher_recent_news', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(569, 'widget_the_launcher_info', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(820, 'theme_mods_reasanik-theme', 'a:3:{i:0;b:0;s:18:"nav_menu_locations";a:2:{s:7:"primary";i:2;s:6:"footer";i:0;}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1475955223;s:4:"data";a:1:{s:19:"wp_inactive_widgets";a:0:{}}}}', 'yes'),
(1369, 'auto_core_update_notified', 'a:4:{s:4:"type";s:7:"success";s:5:"email";s:18:"admin@reasanik.com";s:7:"version";s:5:"4.5.4";s:9:"timestamp";i:1473455729;}', 'yes'),
(1500, '_site_transient_timeout_browser_978e317be2956a7902e9a857c05c24aa', '1476026920', 'yes'),
(1501, '_site_transient_browser_978e317be2956a7902e9a857c05c24aa', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"53.0.2785.101";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1607, 'db_upgraded', '', 'yes'),
(1610, 'can_compress_scripts', '1', 'no'),
(1767, '_site_transient_timeout_browser_ce9a28f9675b6cf931ab9868cf28de4a', '1476559846', 'no'),
(1768, '_site_transient_browser_ce9a28f9675b6cf931ab9868cf28de4a', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"53.0.2785.116";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'no');
INSERT INTO `wqkbf_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1805, 'theme_mods_reasanik', 'a:4:{i:0;b:0;s:18:"nav_menu_locations";a:2:{s:7:"primary";i:2;s:6:"footer";i:0;}s:12:"header_image";s:77:"http://localhost/wordpress/wp-content/uploads/2016/10/logo-e1475958729874.png";s:17:"header_image_data";O:8:"stdClass":5:{s:13:"attachment_id";i:70;s:3:"url";s:77:"http://localhost/wordpress/wp-content/uploads/2016/10/logo-e1475958729874.png";s:13:"thumbnail_url";s:77:"http://localhost/wordpress/wp-content/uploads/2016/10/logo-e1475958729874.png";s:6:"height";i:55;s:5:"width";i:185;}}', 'yes'),
(1997, '_site_transient_timeout_browser_a2218ca9fb42917fddb3e30ff32eafb5', '1478532324', 'no'),
(1998, '_site_transient_browser_a2218ca9fb42917fddb3e30ff32eafb5', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"49.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'no'),
(2074, '_site_transient_timeout_browser_8457cb7db021838d612b945fde11bbe3', '1478911171', 'no'),
(2075, '_site_transient_browser_8457cb7db021838d612b945fde11bbe3', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"54.0.2840.59";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'no'),
(2157, '_site_transient_timeout_browser_71edcb872156bb2387d0b16889c5295c', '1479472670', 'no'),
(2158, '_site_transient_browser_71edcb872156bb2387d0b16889c5295c', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"54.0.2840.87";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'no'),
(2205, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:65:"https://downloads.wordpress.org/release/ru_RU/wordpress-4.6.1.zip";s:6:"locale";s:5:"ru_RU";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:65:"https://downloads.wordpress.org/release/ru_RU/wordpress-4.6.1.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.6.1";s:7:"version";s:5:"4.6.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.4";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1478888957;s:15:"version_checked";s:5:"4.6.1";s:12:"translations";a:0:{}}', 'no'),
(2208, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1478888962;s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:10:{s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:3:"3.2";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:54:"https://downloads.wordpress.org/plugin/akismet.3.2.zip";}s:43:"all-in-one-seo-pack/all_in_one_seo_pack.php";O:8:"stdClass":6:{s:2:"id";s:3:"520";s:4:"slug";s:19:"all-in-one-seo-pack";s:6:"plugin";s:43:"all-in-one-seo-pack/all_in_one_seo_pack.php";s:11:"new_version";s:6:"2.3.11";s:3:"url";s:50:"https://wordpress.org/plugins/all-in-one-seo-pack/";s:7:"package";s:69:"https://downloads.wordpress.org/plugin/all-in-one-seo-pack.2.3.11.zip";}s:36:"contact-form-7/wp-contact-form-7.php";O:8:"stdClass":6:{s:2:"id";s:3:"790";s:4:"slug";s:14:"contact-form-7";s:6:"plugin";s:36:"contact-form-7/wp-contact-form-7.php";s:11:"new_version";s:5:"4.5.1";s:3:"url";s:45:"https://wordpress.org/plugins/contact-form-7/";s:7:"package";s:63:"https://downloads.wordpress.org/plugin/contact-form-7.4.5.1.zip";}s:22:"cyr2lat/cyr-to-lat.php";O:8:"stdClass":6:{s:2:"id";s:4:"1527";s:4:"slug";s:7:"cyr2lat";s:6:"plugin";s:22:"cyr2lat/cyr-to-lat.php";s:11:"new_version";s:3:"3.2";s:3:"url";s:38:"https://wordpress.org/plugins/cyr2lat/";s:7:"package";s:54:"https://downloads.wordpress.org/plugin/cyr2lat.3.2.zip";}s:35:"fancybox-for-wordpress/fancybox.php";O:8:"stdClass":6:{s:2:"id";s:4:"6502";s:4:"slug";s:22:"fancybox-for-wordpress";s:6:"plugin";s:35:"fancybox-for-wordpress/fancybox.php";s:11:"new_version";s:6:"3.0.12";s:3:"url";s:53:"https://wordpress.org/plugins/fancybox-for-wordpress/";s:7:"package";s:65:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.zip";}s:9:"hello.php";O:8:"stdClass":6:{s:2:"id";s:4:"3564";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";}s:29:"nextgen-gallery/nggallery.php";O:8:"stdClass":6:{s:2:"id";s:3:"592";s:4:"slug";s:15:"nextgen-gallery";s:6:"plugin";s:29:"nextgen-gallery/nggallery.php";s:11:"new_version";s:6:"2.1.56";s:3:"url";s:46:"https://wordpress.org/plugins/nextgen-gallery/";s:7:"package";s:65:"https://downloads.wordpress.org/plugin/nextgen-gallery.2.1.56.zip";}s:31:"rating-system/rating-system.php";O:8:"stdClass":6:{s:2:"id";s:5:"64133";s:4:"slug";s:13:"rating-system";s:6:"plugin";s:31:"rating-system/rating-system.php";s:11:"new_version";s:7:"2.7.6.1";s:3:"url";s:44:"https://wordpress.org/plugins/rating-system/";s:7:"package";s:64:"https://downloads.wordpress.org/plugin/rating-system.2.7.6.1.zip";}s:27:"wp-pagenavi/wp-pagenavi.php";O:8:"stdClass":6:{s:2:"id";s:3:"363";s:4:"slug";s:11:"wp-pagenavi";s:6:"plugin";s:27:"wp-pagenavi/wp-pagenavi.php";s:11:"new_version";s:4:"2.91";s:3:"url";s:42:"https://wordpress.org/plugins/wp-pagenavi/";s:7:"package";s:59:"https://downloads.wordpress.org/plugin/wp-pagenavi.2.91.zip";}s:29:"wp-postviews/wp-postviews.php";O:8:"stdClass":6:{s:2:"id";s:3:"370";s:4:"slug";s:12:"wp-postviews";s:6:"plugin";s:29:"wp-postviews/wp-postviews.php";s:11:"new_version";s:4:"1.73";s:3:"url";s:43:"https://wordpress.org/plugins/wp-postviews/";s:7:"package";s:60:"https://downloads.wordpress.org/plugin/wp-postviews.1.73.zip";}}}', 'no'),
(2263, '_site_transient_timeout_theme_roots', '1478890759', 'no'),
(2264, '_site_transient_theme_roots', 'a:8:{s:14:"fabulous-fluid";s:7:"/themes";s:15:"llorix-one-lite";s:7:"/themes";s:8:"reasanik";s:7:"/themes";s:12:"the-launcher";s:7:"/themes";s:11:"travellator";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:13:"twentysixteen";s:7:"/themes";}', 'no'),
(2265, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1478888965;s:7:"checked";a:8:{s:14:"fabulous-fluid";s:3:"1.1";s:15:"llorix-one-lite";s:6:"0.1.20";s:8:"reasanik";s:3:"1.0";s:12:"the-launcher";s:5:"1.1.5";s:11:"travellator";s:3:"2.0";s:13:"twentyfifteen";s:3:"1.6";s:14:"twentyfourteen";s:3:"1.8";s:13:"twentysixteen";s:3:"1.3";}s:8:"response";a:3:{s:14:"fabulous-fluid";a:4:{s:5:"theme";s:14:"fabulous-fluid";s:11:"new_version";s:3:"1.2";s:3:"url";s:44:"https://wordpress.org/themes/fabulous-fluid/";s:7:"package";s:60:"https://downloads.wordpress.org/theme/fabulous-fluid.1.2.zip";}s:15:"llorix-one-lite";a:4:{s:5:"theme";s:15:"llorix-one-lite";s:11:"new_version";s:6:"0.1.22";s:3:"url";s:45:"https://wordpress.org/themes/llorix-one-lite/";s:7:"package";s:64:"https://downloads.wordpress.org/theme/llorix-one-lite.0.1.22.zip";}s:12:"the-launcher";a:4:{s:5:"theme";s:12:"the-launcher";s:11:"new_version";s:5:"1.1.6";s:3:"url";s:42:"https://wordpress.org/themes/the-launcher/";s:7:"package";s:60:"https://downloads.wordpress.org/theme/the-launcher.1.1.6.zip";}}s:12:"translations";a:0:{}}', 'no'),
(2551, '_transient_timeout_2__536483053', '1478897059', 'no'),
(2552, '_transient_2__536483053', '{"photocrati-nextgen_basic_gallery#thumbnails\\/nextgen_basic_thumbnails.js|0":"C:\\\\OpenServer\\\\domains\\\\localhost\\\\wordpress\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_basic_gallery\\\\static\\\\thumbnails\\\\nextgen_basic_thumbnails.min.js","photocrati-nextgen_basic_gallery#thumbnails\\/nextgen_basic_thumbnails.css|0":"C:\\\\OpenServer\\\\domains\\\\localhost\\\\wordpress\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_basic_gallery\\\\static\\\\thumbnails\\\\nextgen_basic_thumbnails.min.css"}', 'no'),
(2637, '_transient_timeout_2__974818834', '1478897566', 'no'),
(2638, '_transient_2__974818834', '{"photocrati-ajax#ajax.min.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/ajax\\/static\\/ajax.min.js","photocrati-nextgen_admin#gritter\\/gritter.min.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/gritter\\/gritter.min.js","photocrati-nextgen_admin#gritter\\/css\\/gritter.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/gritter\\/css\\/gritter.min.css","photocrati-nextgen_admin#ngg_progressbar.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/ngg_progressbar.min.js","photocrati-nextgen_admin#ngg_progressbar.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/ngg_progressbar.min.css","photocrati-nextgen_admin#select2\\/select2.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/select2\\/select2.min.css","photocrati-nextgen_admin#select2\\/select2.modded.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/select2\\/select2.modded.min.js","photocrati-nextgen_admin#jquery.nextgen_radio_toggle.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/jquery.nextgen_radio_toggle.min.js","photocrati-nextgen_admin#jquery-ui\\/jquery-ui-1.10.4.custom.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/jquery-ui\\/jquery-ui-1.10.4.custom.min.css","photocrati-frame_communication#frame_event_publisher.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/frame_communication\\/static\\/frame_event_publisher.min.js","photocrati-nextgen_gallery_display#nextgen_gallery_display_settings.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/nextgen_gallery_display_settings.min.js","photocrati-nextgen_gallery_display#nextgen_gallery_display_settings.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/nextgen_gallery_display_settings.min.css","photocrati-nextgen_gallery_display#fontawesome\\/font-awesome.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/fontawesome\\/font-awesome.min.css","photocrati-attach_to_post#ngg_attach_to_post_tinymce_plugin.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/attach_to_post\\/static\\/ngg_attach_to_post_tinymce_plugin.min.css","photocrati-nextgen_addgallery_page#browserplus-2.4.21.min.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/browserplus-2.4.21.min.js","photocrati-nextgen_addgallery_page#plupload-2.1.1\\/moxie.min.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/plupload-2.1.1\\/moxie.min.js","photocrati-nextgen_addgallery_page#plupload-2.1.1\\/plupload.dev.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/plupload-2.1.1\\/plupload.dev.min.js","photocrati-nextgen_addgallery_page#plupload-2.1.1\\/jquery.plupload.queue\\/jquery.plupload.queue.min.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/plupload-2.1.1\\/jquery.plupload.queue\\/jquery.plupload.queue.min.js","photocrati-nextgen_addgallery_page#plupload-2.1.1\\/jquery.plupload.queue\\/css\\/jquery.plupload.queue.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/plupload-2.1.1\\/jquery.plupload.queue\\/css\\/jquery.plupload.queue.min.css","photocrati-nextgen_addgallery_page#styles.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/styles.min.css","photocrati-nextgen_addgallery_page#jquery.filetree\\/jquery.filetree.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/jquery.filetree\\/jquery.filetree.min.js","photocrati-nextgen_addgallery_page#jquery.filetree\\/jquery.filetree.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/jquery.filetree\\/jquery.filetree.min.css","photocrati-nextgen_addgallery_page#media-library-import.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/media-library-import.min.js","photocrati-nextgen_addgallery_page#media-library-import.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/media-library-import.min.css","photocrati-attach_to_post#iframely.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/attach_to_post\\/static\\/iframely.min.js","photocrati-attach_to_post#iframely.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/attach_to_post\\/static\\/iframely.min.css","photocrati-nextgen_admin#jquery.placeholder.min.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/jquery.placeholder.min.js","photocrati-nextgen_admin#nextgen_admin_page.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/nextgen_admin_page.min.js","photocrati-nextgen_admin#nextgen_admin_page.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/nextgen_admin_page.min.css","photocrati-nextgen_basic_gallery#thumbnails\\/nextgen_basic_thumbnails_settings.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_basic_gallery\\/static\\/thumbnails\\/nextgen_basic_thumbnails_settings.min.css","photocrati-nextgen_basic_gallery#thumbnails\\/nextgen_basic_thumbnails_settings.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_basic_gallery\\/static\\/thumbnails\\/nextgen_basic_thumbnails_settings.min.js","photocrati-nextgen_basic_gallery#slideshow\\/nextgen_basic_slideshow_settings.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_basic_gallery\\/static\\/slideshow\\/nextgen_basic_slideshow_settings.min.js","photocrati-nextgen_basic_templates#ngg_template_settings.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_basic_templates\\/static\\/ngg_template_settings.min.css","photocrati-nextgen_basic_templates#ngg_template_settings.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_basic_templates\\/static\\/ngg_template_settings.min.js","photocrati-nextgen_basic_tagcloud#settings.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_basic_tagcloud\\/static\\/settings.min.css","photocrati-nextgen_basic_album#compact_settings.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_basic_album\\/static\\/compact_settings.min.js","photocrati-nextgen_basic_album#extended_settings.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_basic_album\\/static\\/extended_settings.min.js","photocrati-nextgen_gallery_display#nextgen_gallery_related_images.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/nextgen_gallery_related_images.min.css","photocrati-nextgen_gallery_display#common.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/common.min.js","photocrati-nextgen_gallery_display#trigger_buttons.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/trigger_buttons.min.css","photocrati-nextgen_basic_gallery#slideshow\\/jquery.cycle.all.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_basic_gallery\\/static\\/slideshow\\/jquery.cycle.all.min.js","photocrati-nextgen_basic_gallery#slideshow\\/nextgen_basic_slideshow.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_basic_gallery\\/static\\/slideshow\\/nextgen_basic_slideshow.min.css","photocrati-nextgen_basic_gallery#slideshow\\/jquery.waitforimages.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_basic_gallery\\/static\\/slideshow\\/jquery.waitforimages.min.js","photocrati-nextgen_basic_gallery#slideshow\\/nextgen_basic_slideshow.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_basic_gallery\\/static\\/slideshow\\/nextgen_basic_slideshow.min.js","photocrati-lightbox#lightbox_context.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/lightbox\\/static\\/lightbox_context.min.js","|photocrati-lightbox|http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/lightbox\\/static","photocrati-nextgen_basic_gallery#slideshow\\/placeholder.gif||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_basic_gallery\\/static\\/slideshow\\/placeholder.gif","photocrati-nextgen_basic_album#init.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_basic_album\\/static\\/init.min.js","photocrati-nextgen_basic_album#nextgen_basic_album.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_basic_album\\/static\\/nextgen_basic_album.min.css","photocrati-nextgen_pagination#style.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_pagination\\/static\\/style.min.css","photocrati-nextgen_basic_album#jquery.dotdotdot-1.5.7-packed.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_basic_album\\/static\\/jquery.dotdotdot-1.5.7-packed.js","photocrati-nextgen_basic_album#breadcrumbs.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_basic_album\\/static\\/breadcrumbs.min.css","photocrati-nextgen_basic_gallery#thumbnails\\/nextgen_basic_thumbnails.js||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_basic_gallery\\/static\\/thumbnails\\/nextgen_basic_thumbnails.min.js","photocrati-nextgen_basic_gallery#thumbnails\\/nextgen_basic_thumbnails.css||http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik|http:\\/\\/localhost\\/wordpress\\/wp-content\\/themes\\/reasanik":"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_basic_gallery\\/static\\/thumbnails\\/nextgen_basic_thumbnails.min.css"}', 'no'),
(2639, '_transient_timeout_3___1395736393', '1478896967', 'no'),
(2640, '_transient_3___1395736393', '["ID","post_author","post_date","post_date_gmt","post_content","post_title","post_excerpt","post_status","comment_status","ping_status","post_password","post_name","to_ping","pinged","post_modified","post_modified_gmt","post_content_filtered","post_parent","guid","menu_order","post_type","post_mime_type","comment_count"]', 'no'),
(2641, '_transient_timeout_5___1395736393', '1478896967', 'no'),
(2642, '_transient_5___1395736393', '["id","name","slug","previewpic","albumdesc","sortorder","pageid","extras_post_id"]', 'no'),
(2643, '_transient_timeout_4___1395736393', '1478896967', 'no'),
(2644, '_transient_4___1395736393', '["gid","name","slug","path","title","galdesc","pageid","previewpic","author","extras_post_id"]', 'no'),
(2645, '_transient_timeout_6___1395736393', '1478896967', 'no'),
(2646, '_transient_6___1395736393', '["pid","image_slug","post_id","galleryid","filename","description","alttext","imagedate","exclude","sortorder","meta_data","extras_post_id","updated_at"]', 'no'),
(2647, '_transient_timeout_7___1119373809', '1478897030', 'no'),
(2648, '_transient_7___1119373809', '"\\n\\t<!-- Thumbnails Link -->\\n\\t<div class=\\"slideshowlink\\">\\n        <a href=''http:\\/\\/localhost\\/wordpress\\/nggallery\\/thumbnails''>[\\u041f\\u043e\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u044d\\u0441\\u043a\\u0438\\u0437\\u044b]<\\/a>\\n\\t<\\/div>\\n\\n<div class=\\"ngg-slideshow-image-list ngg-slideshow-nojs\\" id=\\"ngg-slideshow-19-281230-image-list\\">\\n\\t<div id=\\"ngg-image-0\\" class=\\"ngg-gallery-slideshow-image\\" >\\n\\t\\t<img data-image-id=''1''\\n\\t\\t     title=\\"\\"\\n\\t\\t     alt=\\"02-4\\"\\n\\t\\t     src=\\"http:\\/\\/localhost\\/wordpress\\/wp-content\\/gallery\\/vodopad\\/02-4.jpg\\"\\n\\t\\t     width=\\"600\\"\\n\\t\\t     height=\\"399\\"\\/>\\n\\t\\t<\\/div> \\n<div id=\\"ngg-image-1\\" class=\\"ngg-gallery-slideshow-image\\" >\\n\\t\\t<img data-image-id=''2''\\n\\t\\t     title=\\"\\"\\n\\t\\t     alt=\\"2_3-6\\"\\n\\t\\t     src=\\"http:\\/\\/localhost\\/wordpress\\/wp-content\\/gallery\\/vodopad\\/2_3-6.jpg\\"\\n\\t\\t     width=\\"600\\"\\n\\t\\t     height=\\"261\\"\\/>\\n\\t\\t<\\/div> \\n<div id=\\"ngg-image-2\\" class=\\"ngg-gallery-slideshow-image\\" >\\n\\t\\t<img data-image-id=''3''\\n\\t\\t     title=\\"\\"\\n\\t\\t     alt=\\"2-5\\"\\n\\t\\t     src=\\"http:\\/\\/localhost\\/wordpress\\/wp-content\\/gallery\\/vodopad\\/2-5.jpg\\"\\n\\t\\t     width=\\"542\\"\\n\\t\\t     height=\\"400\\"\\/>\\n\\t\\t<\\/div> \\n<div id=\\"ngg-image-3\\" class=\\"ngg-gallery-slideshow-image\\" >\\n\\t\\t<img data-image-id=''4''\\n\\t\\t     title=\\"\\"\\n\\t\\t     alt=\\"03-7\\"\\n\\t\\t     src=\\"http:\\/\\/localhost\\/wordpress\\/wp-content\\/gallery\\/vodopad\\/03-7.jpg\\"\\n\\t\\t     width=\\"300\\"\\n\\t\\t     height=\\"200\\"\\/>\\n\\t\\t<\\/div> \\n<div id=\\"ngg-image-4\\" class=\\"ngg-gallery-slideshow-image\\" >\\n\\t\\t<img data-image-id=''5''\\n\\t\\t     title=\\"\\"\\n\\t\\t     alt=\\"3_1-9\\"\\n\\t\\t     src=\\"http:\\/\\/localhost\\/wordpress\\/wp-content\\/gallery\\/vodopad\\/3_1-9.jpg\\"\\n\\t\\t     width=\\"540\\"\\n\\t\\t     height=\\"400\\"\\/>\\n\\t\\t<\\/div> \\n<div id=\\"ngg-image-5\\" class=\\"ngg-gallery-slideshow-image\\" >\\n\\t\\t<img data-image-id=''6''\\n\\t\\t     title=\\"\\"\\n\\t\\t     alt=\\"3-8\\"\\n\\t\\t     src=\\"http:\\/\\/localhost\\/wordpress\\/wp-content\\/gallery\\/vodopad\\/3-8.jpg\\"\\n\\t\\t     width=\\"600\\"\\n\\t\\t     height=\\"383\\"\\/>\\n\\t\\t<\\/div> \\n<div id=\\"ngg-image-6\\" class=\\"ngg-gallery-slideshow-image\\" >\\n\\t\\t<img data-image-id=''7''\\n\\t\\t     title=\\"\\"\\n\\t\\t     alt=\\"04-10\\"\\n\\t\\t     src=\\"http:\\/\\/localhost\\/wordpress\\/wp-content\\/gallery\\/vodopad\\/04-10.jpg\\"\\n\\t\\t     width=\\"300\\"\\n\\t\\t     height=\\"200\\"\\/>\\n\\t\\t<\\/div> \\n<div id=\\"ngg-image-7\\" class=\\"ngg-gallery-slideshow-image\\" >\\n\\t\\t<img data-image-id=''8''\\n\\t\\t     title=\\"\\"\\n\\t\\t     alt=\\"4_1-11\\"\\n\\t\\t     src=\\"http:\\/\\/localhost\\/wordpress\\/wp-content\\/gallery\\/vodopad\\/4_1-11.jpg\\"\\n\\t\\t     width=\\"600\\"\\n\\t\\t     height=\\"399\\"\\/>\\n\\t\\t<\\/div> \\n<div id=\\"ngg-image-8\\" class=\\"ngg-gallery-slideshow-image\\" >\\n\\t\\t<img data-image-id=''9''\\n\\t\\t     title=\\"\\"\\n\\t\\t     alt=\\"5_1-12\\"\\n\\t\\t     src=\\"http:\\/\\/localhost\\/wordpress\\/wp-content\\/gallery\\/vodopad\\/5_1-12.jpg\\"\\n\\t\\t     width=\\"598\\"\\n\\t\\t     height=\\"400\\"\\/>\\n\\t\\t<\\/div> \\n<div id=\\"ngg-image-9\\" class=\\"ngg-gallery-slideshow-image\\" >\\n\\t\\t<img data-image-id=''10''\\n\\t\\t     title=\\"\\"\\n\\t\\t     alt=\\"7_3-13\\"\\n\\t\\t     src=\\"http:\\/\\/localhost\\/wordpress\\/wp-content\\/gallery\\/vodopad\\/7_3-13.jpg\\"\\n\\t\\t     width=\\"533\\"\\n\\t\\t     height=\\"400\\"\\/>\\n\\t\\t<\\/div> \\n<div id=\\"ngg-image-10\\" class=\\"ngg-gallery-slideshow-image\\" >\\n\\t\\t<img data-image-id=''11''\\n\\t\\t     title=\\"\\"\\n\\t\\t     alt=\\"54s_3-1\\"\\n\\t\\t     src=\\"http:\\/\\/localhost\\/wordpress\\/wp-content\\/gallery\\/vodopad\\/54s_3-1.jpg\\"\\n\\t\\t     width=\\"600\\"\\n\\t\\t     height=\\"395\\"\\/>\\n\\t\\t<\\/div> \\n<div id=\\"ngg-image-11\\" class=\\"ngg-gallery-slideshow-image\\" >\\n\\t\\t<img data-image-id=''12''\\n\\t\\t     title=\\"\\"\\n\\t\\t     alt=\\"24_1-14\\"\\n\\t\\t     src=\\"http:\\/\\/localhost\\/wordpress\\/wp-content\\/gallery\\/vodopad\\/24_1-14.jpg\\"\\n\\t\\t     width=\\"598\\"\\n\\t\\t     height=\\"400\\"\\/>\\n\\t\\t<\\/div> \\n<\\/div>\\n<div class=\\"ngg-galleryoverview ngg-slideshow\\"\\n     id=\\"ngg-slideshow-19-281230\\"\\n     data-placeholder=\\"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_basic_gallery\\/static\\/slideshow\\/placeholder.gif\\"\\n     style=\\"max-width: 600px; max-height: 400px;\\">\\n\\t<div class=\\"ngg-slideshow-loader\\"\\n\\t     id=\\"ngg-slideshow-19-281230-loader\\"\\n\\t     style=\\"width: 600px; height: 400px;\\">\\n\\t\\t<img src=\\"http:\\/\\/localhost\\/wordpress\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/ngglegacy\\/images\\/loader.gif\\" alt=\\"\\"\\/>\\n\\t<\\/div>\\n<\\/div>\\n<script type=\\"text\\/javascript\\">\\n\\tjQuery(''#ngg-slideshow-19-281230-image-list'').hide().removeClass(''ngg-slideshow-nojs'');\\n\\tjQuery(function($) {\\n\\t\\tjQuery(''#ngg-slideshow-19-281230'').nggShowSlideshow({\\n\\t\\t\\tid: ''19'',\\n\\t\\t\\tfx: ''fade'',\\n\\t\\t\\twidth: 600,\\n\\t\\t\\theight: 400,\\n\\t\\t\\tdomain: ''http:\\/\\/localhost\\/wordpress\\/'',\\n\\t\\t\\ttimeout: 10000\\t\\t});\\n\\t});\\n<\\/script>\\n"', 'no'),
(2649, '_transient_timeout_8___1341965476', '1478897056', 'no'),
(2650, '_transient_8___1341965476', '{"display_settings":{"use_lightbox_effect":true,"galleries_per_page":"0","enable_breadcrumbs":"1","disable_pagination":0,"enable_descriptions":"0","template":"","gallery_display_type":"photocrati-nextgen_basic_thumbnails","gallery_display_template":"","ngg_triggers_display":"never","override_thumbnail_settings":"0","thumbnail_width":"240","thumbnail_height":"160","thumbnail_crop":"0","open_gallery_in_lightbox":0},"order_by":"sortorder","order_direction":"ASC","exclusions":[],"container_ids":[1],"excluded_container_ids":[],"sortorder":[],"entity_ids":[],"returns":"included","maximum_entity_count":"500","__defaults_set":true,"source":"galleries","images_list_count":12,"is_album_gallery":true}', 'no'),
(2651, '_transient_timeout_7___1727781198', '1478897056', 'no'),
(2652, '_transient_7___1727781198', '"<div class=\\"ngg-albumoverview\\">\\n            <div class=\\"ngg-album-compact\\">\\n            <div class=\\"ngg-album-compactbox\\">\\n                <div class=\\"ngg-album-link\\">\\n                                                                <a class=\\"Link gallery_link\\" href=\\"http:\\/\\/localhost\\/wordpress\\/foto\\/nggallery\\/foto\\/\\u0412\\u043e\\u0434\\u043e\\u043f\\u0430\\u0434\\">\\n                            <img class=\\"Thumb\\"\\n                                 alt=\\"\\u0412\\u043e\\u0434\\u043e\\u043f\\u0430\\u0434\\"\\n                                 src=\\"http:\\/\\/localhost\\/wordpress\\/wp-content\\/gallery\\/vodopad\\/dynamic\\/02-4.jpg-nggid011-ngg0dyn-91x68-00f0w010c011r110f110r010t010.jpg\\"\\/>\\n                        <\\/a>\\n                                                        <\\/div>\\n            <\\/div>\\n                        <h4>\\n                <a class=\\"ngg-album-desc\\"\\n                   title=\\"\\u0412\\u043e\\u0434\\u043e\\u043f\\u0430\\u0434\\"\\n                   href=\\"http:\\/\\/localhost\\/wordpress\\/foto\\/nggallery\\/foto\\/\\u0412\\u043e\\u0434\\u043e\\u043f\\u0430\\u0434\\"\\n                    style=\\"max-width: 111px\\">\\n                    \\u0412\\u043e\\u0434\\u043e\\u043f\\u0430\\u0434                <\\/a>\\n            <\\/h4>\\n            <p class=\\"ngg-album-gallery-image-counter\\">\\n                                    <strong>12<\\/strong>&nbsp;\\u0424\\u043e\\u0442\\u043e                            <\\/p>\\n        <\\/div>\\n        <br class=\\"ngg-clear\\"\\/>\\n    <div class=''ngg-clear''><\\/div><\\/div>\\n"', 'no');

-- --------------------------------------------------------

--
-- Структура таблицы `wqkbf_postmeta`
--

CREATE TABLE IF NOT EXISTS `wqkbf_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2126 ;

--
-- Дамп данных таблицы `wqkbf_postmeta`
--

INSERT INTO `wqkbf_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 4, '_form', '<label> Ваше имя (обязательно)\n    [text* your-name] </label>\n\n<label> Ваш e-mail (обязательно)\n    [email* your-email] </label>\n\n<label> Тема\n    [text your-subject] </label>\n\n<label> Сообщение\n    [textarea your-message] </label>\n\n[submit "Отправить"]'),
(3, 4, '_mail', 'a:8:{s:7:"subject";s:25:"Reasanik "[your-subject]"";s:6:"sender";s:32:"[your-name] <admin@reasanik.com>";s:4:"body";s:196:"От: [your-name] <[your-email]>\nТема: [your-subject]\n\nСообщение:\n[your-message]\n\n--\nЭто сообщение отправлено с сайта Reasanik (http://localhost/wordpress)";s:9:"recipient";s:18:"admin@reasanik.com";s:18:"additional_headers";s:22:"Reply-To: [your-email]";s:11:"attachments";s:0:"";s:8:"use_html";i:0;s:13:"exclude_blank";i:0;}'),
(4, 4, '_mail_2', 'a:9:{s:6:"active";b:0;s:7:"subject";s:25:"Reasanik "[your-subject]"";s:6:"sender";s:29:"Reasanik <admin@reasanik.com>";s:4:"body";s:137:"Сообщение:\n[your-message]\n\n--\nЭто сообщение отправлено с сайта Reasanik (http://localhost/wordpress)";s:9:"recipient";s:12:"[your-email]";s:18:"additional_headers";s:28:"Reply-To: admin@reasanik.com";s:11:"attachments";s:0:"";s:8:"use_html";i:0;s:13:"exclude_blank";i:0;}'),
(5, 4, '_messages', 'a:8:{s:12:"mail_sent_ok";s:86:"Спасибо за Ваше сообщение. Оно было отправлено.";s:12:"mail_sent_ng";s:169:"Произошла ошибка при попытке отправить Ваше сообщение. Пожалуйста попробуйте ещё раз позже.";s:16:"validation_error";s:179:"Одно или несколько полей содержат ошибочные данные. Пожалуйста проверьте их и попробуйте ещё раз.";s:4:"spam";s:169:"Произошла ошибка при попытке отправить Ваше сообщение. Пожалуйста попробуйте ещё раз позже.";s:12:"accept_terms";s:145:"Вы должны принять условия и положения перед тем, как отправлять Ваше сообщение.";s:16:"invalid_required";s:32:"Поле обязательно.";s:16:"invalid_too_long";s:39:"Поле слишком длинное.";s:17:"invalid_too_short";s:41:"Поле слишком короткое.";}'),
(6, 4, '_additional_settings', NULL),
(7, 4, '_locale', 'ru_RU'),
(8, 1, '_wp_old_slug', '%d0%bf%d1%80%d0%b8%d0%b2%d0%b5%d1%82-%d0%bc%d0%b8%d1%80'),
(9, 4, '_wp_old_slug', '%d0%ba%d0%be%d0%bd%d1%82%d0%b0%d0%ba%d1%82%d0%bd%d0%b0%d1%8f-%d1%84%d0%be%d1%80%d0%bc%d0%b0-1'),
(94, 2, '_edit_lock', '1475423077:1'),
(95, 2, '_edit_last', '1'),
(96, 2, 'views', '63'),
(97, 14, '_edit_last', '1'),
(98, 14, '_edit_lock', '1475423112:1'),
(114, 14, '_wp_page_template', 'default'),
(115, 14, 'views', '25'),
(116, 17, '_edit_last', '1'),
(117, 17, '_wp_page_template', 'default'),
(118, 17, 'views', '12'),
(119, 17, '_edit_lock', '1475423096:1'),
(120, 19, 'order_by', 'sortorder'),
(121, 19, 'order_direction', 'ASC'),
(122, 19, 'returns', 'included'),
(123, 19, 'maximum_entity_count', '500'),
(124, 19, 'source', 'galleries'),
(125, 19, 'display_type', 'photocrati-nextgen_basic_slideshow'),
(126, 19, 'slug', ''),
(127, 19, '__defaults_set', '1'),
(128, 19, 'display_settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJ5X3dpZHRoIjoiNjAwIiwiZ2FsbGVyeV9oZWlnaHQiOiI0MDAiLCJ0aHVtYm5haWxfd2lkdGgiOjI0MCwidGh1bWJuYWlsX2hlaWdodCI6MTYwLCJjeWNsZV9pbnRlcnZhbCI6IjEwIiwiY3ljbGVfZWZmZWN0IjoiZmFkZSIsImVmZmVjdF9jb2RlIjoiY2xhc3M9XCJuZ2ctZmFuY3lib3hcIiByZWw9XCIlR0FMTEVSWV9OQU1FJVwiIiwic2hvd190aHVtYm5haWxfbGluayI6IjEiLCJ0aHVtYm5haWxfbGlua190ZXh0IjoiW1x1MDQxZlx1MDQzZVx1MDQzYVx1MDQzMFx1MDQzN1x1MDQzMFx1MDQ0Mlx1MDQ0YyBcdTA0NGRcdTA0NDFcdTA0M2FcdTA0MzhcdTA0MzdcdTA0NGJdIiwidGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0='),
(129, 19, 'exclusions', 'W10='),
(130, 19, 'container_ids', 'W10='),
(131, 19, 'excluded_container_ids', 'W10='),
(132, 19, 'sortorder', 'W10='),
(133, 19, 'entity_ids', 'W10='),
(134, 19, 'id_field', 'ID'),
(135, 21, '__defaults_set', '1'),
(136, 21, 'filter', 'raw'),
(137, 21, 'id_field', 'ID'),
(138, 22, '__defaults_set', '1'),
(139, 22, 'filter', 'raw'),
(140, 22, 'id_field', 'ID'),
(147, 24, '__defaults_set', '1'),
(148, 24, 'filter', 'raw'),
(149, 24, 'id_field', 'ID'),
(150, 25, '__defaults_set', '1'),
(151, 25, 'filter', 'raw'),
(152, 25, 'id_field', 'ID'),
(159, 27, '__defaults_set', '1'),
(160, 27, 'filter', 'raw'),
(161, 27, 'id_field', 'ID'),
(168, 29, '__defaults_set', '1'),
(169, 29, 'filter', 'raw'),
(170, 29, 'id_field', 'ID'),
(177, 31, '__defaults_set', '1'),
(178, 31, 'filter', 'raw'),
(179, 31, 'id_field', 'ID'),
(222, 33, '__defaults_set', '1'),
(223, 33, 'filter', 'raw'),
(224, 33, 'id_field', 'ID'),
(225, 34, '__defaults_set', '1'),
(226, 34, 'filter', 'raw'),
(227, 34, 'id_field', 'ID'),
(234, 36, '__defaults_set', '1'),
(235, 36, 'filter', 'raw'),
(236, 36, 'id_field', 'ID'),
(243, 38, '__defaults_set', '1'),
(244, 38, 'filter', 'raw'),
(245, 38, 'id_field', 'ID'),
(252, 40, '__defaults_set', '1'),
(253, 40, 'filter', 'raw'),
(254, 40, 'id_field', 'ID'),
(261, 42, '__defaults_set', '1'),
(262, 42, 'filter', 'raw'),
(263, 42, 'id_field', 'ID'),
(270, 44, '__defaults_set', '1'),
(271, 44, 'filter', 'raw'),
(272, 44, 'id_field', 'ID'),
(279, 46, '__defaults_set', '1'),
(280, 46, 'filter', 'raw'),
(281, 46, 'id_field', 'ID'),
(288, 48, '__defaults_set', '1'),
(289, 48, 'filter', 'raw'),
(290, 48, 'id_field', 'ID'),
(291, 49, '__defaults_set', '1'),
(292, 49, 'filter', 'raw'),
(293, 49, 'id_field', 'ID'),
(300, 51, '__defaults_set', '1'),
(301, 51, 'filter', 'raw'),
(302, 51, 'id_field', 'ID'),
(303, 52, '__defaults_set', '1'),
(304, 52, 'filter', 'raw'),
(305, 52, 'id_field', 'ID'),
(309, 53, '__defaults_set', '1'),
(310, 53, 'filter', 'raw'),
(311, 53, 'id_field', 'ID'),
(312, 54, '__defaults_set', '1'),
(313, 54, 'filter', 'raw'),
(314, 54, 'id_field', 'ID'),
(318, 55, '__defaults_set', '1'),
(319, 55, 'filter', 'raw'),
(320, 55, 'id_field', 'ID'),
(321, 56, '__defaults_set', '1'),
(322, 56, 'filter', 'raw'),
(323, 56, 'id_field', 'ID'),
(327, 57, '__defaults_set', '1'),
(328, 57, 'filter', 'raw'),
(329, 57, 'id_field', 'ID'),
(330, 58, '__defaults_set', '1'),
(331, 58, 'filter', 'raw'),
(332, 58, 'id_field', 'ID'),
(336, 59, '__defaults_set', '1'),
(337, 59, 'filter', 'raw'),
(338, 59, 'id_field', 'ID'),
(339, 60, '__defaults_set', '1'),
(340, 60, 'filter', 'raw'),
(341, 60, 'id_field', 'ID'),
(345, 61, '__defaults_set', '1'),
(346, 61, 'filter', 'raw'),
(347, 61, 'id_field', 'ID'),
(348, 62, '__defaults_set', '1'),
(349, 62, 'filter', 'raw'),
(350, 62, 'id_field', 'ID'),
(354, 63, '__defaults_set', '1'),
(355, 63, 'filter', 'raw'),
(356, 63, 'id_field', 'ID'),
(357, 64, '__defaults_set', '1'),
(358, 64, 'filter', 'raw'),
(359, 64, 'id_field', 'ID'),
(363, 15, 'order_by', 'sortorder'),
(364, 15, 'order_direction', 'ASC'),
(365, 15, 'returns', 'included'),
(366, 15, 'maximum_entity_count', '500'),
(367, 15, 'source', 'albums'),
(368, 15, 'display_type', 'photocrati-nextgen_basic_compact_album'),
(369, 15, 'slug', ''),
(370, 15, '__defaults_set', '1'),
(371, 15, 'display_settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJpZXNfcGVyX3BhZ2UiOiIwIiwiZW5hYmxlX2JyZWFkY3J1bWJzIjoiMSIsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwiZW5hYmxlX2Rlc2NyaXB0aW9ucyI6IjAiLCJ0ZW1wbGF0ZSI6IiIsImdhbGxlcnlfZGlzcGxheV90eXBlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RodW1ibmFpbHMiLCJnYWxsZXJ5X2Rpc3BsYXlfdGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIiwib3ZlcnJpZGVfdGh1bWJuYWlsX3NldHRpbmdzIjoiMCIsInRodW1ibmFpbF93aWR0aCI6IjI0MCIsInRodW1ibmFpbF9oZWlnaHQiOiIxNjAiLCJ0aHVtYm5haWxfY3JvcCI6IjAifQ=='),
(372, 15, 'exclusions', 'W10='),
(373, 15, 'container_ids', 'WzFd'),
(374, 15, 'excluded_container_ids', 'W10='),
(375, 15, 'sortorder', 'W10='),
(376, 15, 'entity_ids', 'W10='),
(377, 15, 'id_field', 'ID'),
(381, 50, '__defaults_set', '1'),
(382, 50, 'filter', 'raw'),
(383, 50, 'id_field', 'ID'),
(390, 2, 'fabulous-fluid-layout-option', 'default'),
(391, 2, 'fabulous-fluid-header-image', 'default'),
(392, 2, 'fabulous-fluid-featured-image', 'default'),
(466, 67, '_menu_item_type', 'post_type'),
(467, 67, '_menu_item_menu_item_parent', '0'),
(468, 67, '_menu_item_object_id', '17'),
(469, 67, '_menu_item_object', 'page'),
(470, 67, '_menu_item_target', ''),
(471, 67, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(472, 67, '_menu_item_xfn', ''),
(473, 67, '_menu_item_url', ''),
(474, 68, '_menu_item_type', 'post_type'),
(475, 68, '_menu_item_menu_item_parent', '0'),
(476, 68, '_menu_item_object_id', '14'),
(477, 68, '_menu_item_object', 'page'),
(478, 68, '_menu_item_target', ''),
(479, 68, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(480, 68, '_menu_item_xfn', ''),
(481, 68, '_menu_item_url', ''),
(482, 69, '_menu_item_type', 'post_type'),
(483, 69, '_menu_item_menu_item_parent', '0'),
(484, 69, '_menu_item_object_id', '2'),
(485, 69, '_menu_item_object', 'page'),
(486, 69, '_menu_item_target', ''),
(487, 69, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(488, 69, '_menu_item_xfn', ''),
(489, 69, '_menu_item_url', ''),
(490, 70, '_wp_attached_file', '2016/10/logo-e1475958729874.png'),
(491, 70, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:185;s:6:"height";i:55;s:4:"file";s:31:"2016/10/logo-e1475958729874.png";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:15:"logo-150x55.png";s:5:"width";i:150;s:6:"height";i:55;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(492, 70, '_edit_lock', '1475958615:1'),
(493, 70, '_wp_attachment_backup_sizes', 'a:1:{s:9:"full-orig";a:3:{s:5:"width";i:185;s:6:"height";i:55;s:4:"file";s:8:"logo.png";}}'),
(494, 70, '_edit_last', '1'),
(495, 70, '_wp_attachment_custom_header_last_used_reasanik', '1475958805'),
(496, 70, '_wp_attachment_is_custom_header', 'reasanik'),
(1838, 26, '__defaults_set', '1'),
(1839, 26, 'filter', 'raw'),
(1840, 26, 'id_field', 'ID'),
(1841, 28, '__defaults_set', '1'),
(1842, 28, 'filter', 'raw'),
(1843, 28, 'id_field', 'ID'),
(1844, 30, '__defaults_set', '1'),
(1845, 30, 'filter', 'raw'),
(1846, 30, 'id_field', 'ID'),
(1847, 32, '__defaults_set', '1'),
(1848, 32, 'filter', 'raw'),
(1849, 32, 'id_field', 'ID'),
(1850, 35, '__defaults_set', '1'),
(1851, 35, 'filter', 'raw'),
(1852, 35, 'id_field', 'ID'),
(1853, 37, '__defaults_set', '1'),
(1854, 37, 'filter', 'raw'),
(1855, 37, 'id_field', 'ID'),
(1856, 39, '__defaults_set', '1'),
(1857, 39, 'filter', 'raw'),
(1858, 39, 'id_field', 'ID'),
(1859, 41, '__defaults_set', '1'),
(1860, 41, 'filter', 'raw'),
(1861, 41, 'id_field', 'ID'),
(1862, 43, '__defaults_set', '1'),
(1863, 43, 'filter', 'raw'),
(1864, 43, 'id_field', 'ID'),
(1865, 45, '__defaults_set', '1'),
(1866, 45, 'filter', 'raw'),
(1867, 45, 'id_field', 'ID'),
(1868, 47, '__defaults_set', '1'),
(1869, 47, 'filter', 'raw'),
(1870, 47, 'id_field', 'ID'),
(1871, 23, '__defaults_set', '1'),
(1872, 23, 'filter', 'raw'),
(1873, 23, 'id_field', 'ID'),
(2000, 5, 'filter', 'raw'),
(2001, 5, 'meta_id', '14'),
(2002, 5, 'post_id', '5'),
(2003, 5, 'meta_key', 'name'),
(2004, 5, 'meta_value', 'photocrati-nextgen_basic_thumbnails'),
(2005, 5, 'title', 'NextGEN Basic Thumbnails'),
(2006, 5, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_gallery\\static\\thumb_preview.jpg'),
(2007, 5, 'default_source', 'galleries'),
(2008, 5, 'view_order', '10000'),
(2009, 5, 'name', 'photocrati-nextgen_basic_thumbnails'),
(2010, 5, 'installed_at_version', '2.1.56'),
(2011, 5, 'hidden_from_ui', ''),
(2012, 5, 'hidden_from_igw', ''),
(2013, 5, '__defaults_set', '1'),
(2014, 5, 'entity_types', 'WyJpbWFnZSJd'),
(2015, 5, 'id_field', 'ID'),
(2016, 5, 'settings', 'eyJvdmVycmlkZV90aHVtYm5haWxfc2V0dGluZ3MiOiIxIiwidGh1bWJuYWlsX3dpZHRoIjoiMjIwIiwidGh1bWJuYWlsX2hlaWdodCI6IjIyMCIsInRodW1ibmFpbF9jcm9wIjoiMSIsImltYWdlc19wZXJfcGFnZSI6IjIwIiwibnVtYmVyX29mX2NvbHVtbnMiOiIwIiwiYWpheF9wYWdpbmF0aW9uIjoiMCIsInNob3dfYWxsX2luX2xpZ2h0Ym94IjoiMCIsInVzZV9pbWFnZWJyb3dzZXJfZWZmZWN0IjoiMSIsInNob3dfc2xpZGVzaG93X2xpbmsiOiIxIiwic2xpZGVzaG93X2xpbmtfdGV4dCI6IltcdTA0MWZcdTA0M2VcdTA0M2FcdTA0MzBcdTA0MzdcdTA0MzBcdTA0NDJcdTA0NGMgXHUwNDQxXHUwNDNiXHUwNDMwXHUwNDM5XHUwNDM0XHUwNDQ4XHUwNDNlXHUwNDQzXSIsInRlbXBsYXRlIjoiIiwidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwiZGlzcGxheV9ub19pbWFnZXNfZXJyb3IiOjEsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwidGh1bWJuYWlsX3F1YWxpdHkiOiIxMDAiLCJ0aHVtYm5haWxfd2F0ZXJtYXJrIjowLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0='),
(2017, 5, 'aliases', 'WyJiYXNpY190aHVtYm5haWwiLCJiYXNpY190aHVtYm5haWxzIiwibmV4dGdlbl9iYXNpY190aHVtYm5haWxzIl0='),
(2018, 6, 'filter', 'raw'),
(2019, 6, 'meta_id', '26'),
(2020, 6, 'post_id', '6'),
(2021, 6, 'meta_key', 'name'),
(2022, 6, 'meta_value', 'photocrati-nextgen_basic_slideshow'),
(2023, 6, 'title', 'NextGEN Basic Slideshow'),
(2024, 6, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_gallery\\static\\slideshow_preview.jpg'),
(2025, 6, 'default_source', 'galleries'),
(2026, 6, 'view_order', '10010'),
(2027, 6, 'name', 'photocrati-nextgen_basic_slideshow'),
(2028, 6, 'installed_at_version', '2.1.56'),
(2029, 6, 'hidden_from_ui', ''),
(2030, 6, 'hidden_from_igw', ''),
(2031, 6, '__defaults_set', '1'),
(2032, 6, 'entity_types', 'WyJpbWFnZSJd'),
(2033, 6, 'id_field', 'ID'),
(2034, 6, 'settings', 'eyJnYWxsZXJ5X3dpZHRoIjoiODA0IiwiZ2FsbGVyeV9oZWlnaHQiOiI1OTIiLCJjeWNsZV9lZmZlY3QiOiJmYWRlIiwiY3ljbGVfaW50ZXJ2YWwiOiIxMCIsInNob3dfdGh1bWJuYWlsX2xpbmsiOiIwIiwidGh1bWJuYWlsX2xpbmtfdGV4dCI6IltcdTA0MWZcdTA0M2VcdTA0M2FcdTA0MzBcdTA0MzdcdTA0MzBcdTA0NDJcdTA0NGMgXHUwNDRkXHUwNDQxXHUwNDNhXHUwNDM4XHUwNDM3XHUwNDRiXSIsInVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsInRodW1ibmFpbF93aWR0aCI6IjIyMCIsInRodW1ibmFpbF9oZWlnaHQiOiIyMjAiLCJlZmZlY3RfY29kZSI6ImNsYXNzPVwibmdnLWZhbmN5Ym94XCIgcmVsPVwiJUdBTExFUllfTkFNRSVcIiIsInRlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9'),
(2035, 6, 'aliases', 'WyJiYXNpY19zbGlkZXNob3ciLCJuZXh0Z2VuX2Jhc2ljX3NsaWRlc2hvdyJd'),
(2036, 7, 'filter', 'raw'),
(2037, 7, 'meta_id', '38'),
(2038, 7, 'post_id', '7'),
(2039, 7, 'meta_key', 'name'),
(2040, 7, 'meta_value', 'photocrati-nextgen_basic_imagebrowser'),
(2041, 7, 'title', 'NextGEN Basic ImageBrowser'),
(2042, 7, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_imagebrowser\\static\\preview.jpg'),
(2043, 7, 'default_source', 'galleries'),
(2044, 7, 'view_order', '10020'),
(2045, 7, 'name', 'photocrati-nextgen_basic_imagebrowser'),
(2046, 7, 'installed_at_version', '2.1.56'),
(2047, 7, 'hidden_from_ui', ''),
(2048, 7, 'hidden_from_igw', ''),
(2049, 7, '__defaults_set', '1'),
(2050, 7, 'entity_types', 'WyJpbWFnZSJd'),
(2051, 7, 'id_field', 'ID'),
(2052, 7, 'settings', 'eyJhamF4X3BhZ2luYXRpb24iOiIwIiwidGVtcGxhdGUiOiIiLCJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0='),
(2053, 7, 'aliases', 'WyJiYXNpY19pbWFnZWJyb3dzZXIiLCJpbWFnZWJyb3dzZXIiLCJuZXh0Z2VuX2Jhc2ljX2ltYWdlYnJvd3NlciJd'),
(2054, 8, 'filter', 'raw'),
(2055, 8, 'meta_id', '51'),
(2056, 8, 'post_id', '8'),
(2057, 8, 'meta_key', 'name'),
(2058, 8, 'meta_value', 'photocrati-nextgen_basic_singlepic'),
(2059, 8, 'title', 'NextGEN Basic SinglePic'),
(2060, 8, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_singlepic\\static\\preview.gif'),
(2061, 8, 'default_source', 'galleries'),
(2062, 8, 'view_order', '10060'),
(2063, 8, 'hidden_from_ui', '1'),
(2064, 8, 'name', 'photocrati-nextgen_basic_singlepic'),
(2065, 8, 'installed_at_version', '2.1.56'),
(2066, 8, 'hidden_from_igw', '1'),
(2067, 8, '__defaults_set', '1'),
(2068, 8, 'entity_types', 'WyJpbWFnZSJd'),
(2069, 8, 'id_field', 'ID'),
(2070, 8, 'settings', 'eyJ3aWR0aCI6IjQ1NCIsImhlaWdodCI6IiIsImxpbmsiOiIiLCJsaW5rX3RhcmdldCI6Il9ibGFuayIsImZsb2F0IjoiIiwicXVhbGl0eSI6IjEwMCIsImNyb3AiOiIwIiwiZGlzcGxheV93YXRlcm1hcmsiOiIxIiwiZGlzcGxheV9yZWZsZWN0aW9uIjoiMCIsInRlbXBsYXRlIjoiIiwidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwibW9kZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifQ=='),
(2071, 8, 'aliases', 'WyJiYXNpY19zaW5nbGVwaWMiLCJzaW5nbGVwaWMiLCJuZXh0Z2VuX2Jhc2ljX3NpbmdsZXBpYyJd'),
(2072, 9, 'filter', 'raw'),
(2073, 9, 'meta_id', '62'),
(2074, 9, 'post_id', '9'),
(2075, 9, 'meta_key', 'name'),
(2076, 9, 'meta_value', 'photocrati-nextgen_basic_tagcloud'),
(2077, 9, 'title', 'NextGEN Basic TagCloud'),
(2078, 9, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_tagcloud\\static\\preview.gif'),
(2079, 9, 'default_source', 'tags'),
(2080, 9, 'view_order', '10100'),
(2081, 9, 'name', 'photocrati-nextgen_basic_tagcloud'),
(2082, 9, 'installed_at_version', '2.1.56'),
(2083, 9, 'hidden_from_ui', ''),
(2084, 9, 'hidden_from_igw', ''),
(2085, 9, '__defaults_set', '1'),
(2086, 9, 'entity_types', 'WyJpbWFnZSJd'),
(2087, 9, 'id_field', 'ID'),
(2088, 9, 'settings', 'eyJudW1iZXIiOiI0NSIsImRpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9'),
(2089, 9, 'aliases', 'WyJiYXNpY190YWdjbG91ZCIsInRhZ2Nsb3VkIiwibmV4dGdlbl9iYXNpY190YWdjbG91ZCJd'),
(2090, 10, 'filter', 'raw'),
(2091, 10, 'meta_id', '74'),
(2092, 10, 'post_id', '10'),
(2093, 10, 'meta_key', 'name'),
(2094, 10, 'meta_value', 'photocrati-nextgen_basic_compact_album'),
(2095, 10, 'title', 'NextGEN Basic Compact Album'),
(2096, 10, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_album\\static\\compact_preview.jpg'),
(2097, 10, 'default_source', 'albums'),
(2098, 10, 'view_order', '10200'),
(2099, 10, 'name', 'photocrati-nextgen_basic_compact_album'),
(2100, 10, 'installed_at_version', '2.1.56'),
(2101, 10, 'hidden_from_ui', ''),
(2102, 10, 'hidden_from_igw', ''),
(2103, 10, '__defaults_set', '1'),
(2104, 10, 'entity_types', 'WyJhbGJ1bSIsImdhbGxlcnkiXQ=='),
(2105, 10, 'id_field', 'ID'),
(2106, 10, 'settings', 'eyJnYWxsZXJ5X2Rpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwiZ2FsbGVyaWVzX3Blcl9wYWdlIjoiMCIsImVuYWJsZV9icmVhZGNydW1icyI6IjEiLCJ0ZW1wbGF0ZSI6IiIsImVuYWJsZV9kZXNjcmlwdGlvbnMiOiIwIiwib3ZlcnJpZGVfdGh1bWJuYWlsX3NldHRpbmdzIjoiMCIsInRodW1ibmFpbF93aWR0aCI6IjIyMCIsInRodW1ibmFpbF9oZWlnaHQiOiIyMjAiLCJ0aHVtYm5haWxfY3JvcCI6IjAiLCJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJkaXNhYmxlX3BhZ2luYXRpb24iOjAsIm9wZW5fZ2FsbGVyeV9pbl9saWdodGJveCI6MCwiZ2FsbGVyeV9kaXNwbGF5X3RlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9'),
(2107, 10, 'aliases', 'WyJiYXNpY19jb21wYWN0X2FsYnVtIiwibmV4dGdlbl9iYXNpY19hbGJ1bSIsImJhc2ljX2FsYnVtX2NvbXBhY3QiLCJjb21wYWN0X2FsYnVtIl0='),
(2108, 11, 'filter', 'raw'),
(2109, 11, 'meta_id', '86'),
(2110, 11, 'post_id', '11'),
(2111, 11, 'meta_key', 'name'),
(2112, 11, 'meta_value', 'photocrati-nextgen_basic_extended_album'),
(2113, 11, 'title', 'NextGEN Basic Extended Album'),
(2114, 11, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_album\\static\\extended_preview.jpg'),
(2115, 11, 'default_source', 'albums'),
(2116, 11, 'view_order', '10210'),
(2117, 11, 'name', 'photocrati-nextgen_basic_extended_album'),
(2118, 11, 'installed_at_version', '2.1.56'),
(2119, 11, 'hidden_from_ui', ''),
(2120, 11, 'hidden_from_igw', ''),
(2121, 11, '__defaults_set', '1'),
(2122, 11, 'entity_types', 'WyJhbGJ1bSIsImdhbGxlcnkiXQ=='),
(2123, 11, 'id_field', 'ID'),
(2124, 11, 'settings', 'eyJnYWxsZXJ5X2Rpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwiZ2FsbGVyaWVzX3Blcl9wYWdlIjoiMCIsImVuYWJsZV9icmVhZGNydW1icyI6IjEiLCJ0ZW1wbGF0ZSI6IiIsImVuYWJsZV9kZXNjcmlwdGlvbnMiOiIwIiwib3ZlcnJpZGVfdGh1bWJuYWlsX3NldHRpbmdzIjoiMCIsInRodW1ibmFpbF93aWR0aCI6IjI0MCIsInRodW1ibmFpbF9oZWlnaHQiOiIxNjAiLCJ0aHVtYm5haWxfY3JvcCI6IjEiLCJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJkaXNhYmxlX3BhZ2luYXRpb24iOjAsIm9wZW5fZ2FsbGVyeV9pbl9saWdodGJveCI6MCwidGh1bWJuYWlsX3F1YWxpdHkiOjEwMCwidGh1bWJuYWlsX3dhdGVybWFyayI6MCwiZ2FsbGVyeV9kaXNwbGF5X3RlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9'),
(2125, 11, 'aliases', 'WyJiYXNpY19leHRlbmRlZF9hbGJ1bSIsIm5leHRnZW5fYmFzaWNfZXh0ZW5kZWRfYWxidW0iLCJleHRlbmRlZF9hbGJ1bSJd');

-- --------------------------------------------------------

--
-- Структура таблицы `wqkbf_posts`
--

CREATE TABLE IF NOT EXISTS `wqkbf_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=72 ;

--
-- Дамп данных таблицы `wqkbf_posts`
--

INSERT INTO `wqkbf_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2016-08-12 16:11:15', '2016-08-12 13:11:15', 'Добро пожаловать в WordPress. Это ваша первая запись. Отредактируйте или удалите её, затем пишите!', 'Привет, мир!', '', 'publish', 'open', 'open', '', 'privet-mir', '', '', '2016-08-12 16:11:15', '2016-08-12 13:11:15', '', 0, 'http://localhost/wordpress/?p=1', 0, 'post', '', 1),
(2, 1, '2016-08-12 16:11:15', '2016-08-12 13:11:15', '<img class="ngg_displayed_gallery mceItem" src="http://localhost/wordpress/nextgen-attach_to_post/preview/id--19" data-mce-placeholder="1" />', 'Главная', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2016-08-12 17:45:55', '2016-08-12 14:45:55', '', 0, 'http://localhost/wordpress/?page_id=2', 0, 'page', '', 0),
(4, 1, '2016-08-12 16:34:47', '2016-08-12 13:34:47', '<label> Ваше имя (обязательно)\n    [text* your-name] </label>\n\n<label> Ваш e-mail (обязательно)\n    [email* your-email] </label>\n\n<label> Тема\n    [text your-subject] </label>\n\n<label> Сообщение\n    [textarea your-message] </label>\n\n[submit "Отправить"]\nReasanik "[your-subject]"\n[your-name] <admin@reasanik.com>\nОт: [your-name] <[your-email]>\nТема: [your-subject]\n\nСообщение:\n[your-message]\n\n--\nЭто сообщение отправлено с сайта Reasanik (http://localhost/wordpress)\nadmin@reasanik.com\nReply-To: [your-email]\n\n0\n0\n\nReasanik "[your-subject]"\nReasanik <admin@reasanik.com>\nСообщение:\n[your-message]\n\n--\nЭто сообщение отправлено с сайта Reasanik (http://localhost/wordpress)\n[your-email]\nReply-To: admin@reasanik.com\n\n0\n0\nСпасибо за Ваше сообщение. Оно было отправлено.\nПроизошла ошибка при попытке отправить Ваше сообщение. Пожалуйста попробуйте ещё раз позже.\nОдно или несколько полей содержат ошибочные данные. Пожалуйста проверьте их и попробуйте ещё раз.\nПроизошла ошибка при попытке отправить Ваше сообщение. Пожалуйста попробуйте ещё раз позже.\nВы должны принять условия и положения перед тем, как отправлять Ваше сообщение.\nПоле обязательно.\nПоле слишком длинное.\nПоле слишком короткое.', 'Контактная форма 1', '', 'publish', 'closed', 'closed', '', 'kontaktnaya-forma-1', '', '', '2016-08-12 16:34:47', '2016-08-12 13:34:47', '', 0, 'http://localhost/wordpress/?post_type=wpcf7_contact_form&p=4', 0, 'wpcf7_contact_form', '', 0),
(5, 1, '2016-08-12 16:34:53', '0000-00-00 00:00:00', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiMTQiLCJwb3N0X2lkIjoiNSIsIm1ldGFfa2V5IjoibmFtZSIsIm1ldGFfdmFsdWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGh1bWJuYWlscyIsInRpdGxlIjoiTmV4dEdFTiBCYXNpYyBUaHVtYm5haWxzIiwiZW50aXR5X3R5cGVzIjpbImltYWdlIl0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlxcbmV4dGdlbi1nYWxsZXJ5XFxwcm9kdWN0c1xccGhvdG9jcmF0aV9uZXh0Z2VuXFxtb2R1bGVzXFxuZXh0Z2VuX2Jhc2ljX2dhbGxlcnlcXHN0YXRpY1xcdGh1bWJfcHJldmlldy5qcGciLCJkZWZhdWx0X3NvdXJjZSI6ImdhbGxlcmllcyIsInZpZXdfb3JkZXIiOjEwMDAwLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RodW1ibmFpbHMiLCJpbnN0YWxsZWRfYXRfdmVyc2lvbiI6IjIuMS41NiIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJvdmVycmlkZV90aHVtYm5haWxfc2V0dGluZ3MiOiIxIiwidGh1bWJuYWlsX3dpZHRoIjoiMjIwIiwidGh1bWJuYWlsX2hlaWdodCI6IjIyMCIsInRodW1ibmFpbF9jcm9wIjoiMSIsImltYWdlc19wZXJfcGFnZSI6IjIwIiwibnVtYmVyX29mX2NvbHVtbnMiOiIwIiwiYWpheF9wYWdpbmF0aW9uIjoiMCIsInNob3dfYWxsX2luX2xpZ2h0Ym94IjoiMCIsInVzZV9pbWFnZWJyb3dzZXJfZWZmZWN0IjoiMSIsInNob3dfc2xpZGVzaG93X2xpbmsiOiIxIiwic2xpZGVzaG93X2xpbmtfdGV4dCI6IltcdTA0MWZcdTA0M2VcdTA0M2FcdTA0MzBcdTA0MzdcdTA0MzBcdTA0NDJcdTA0NGMgXHUwNDQxXHUwNDNiXHUwNDMwXHUwNDM5XHUwNDM0XHUwNDQ4XHUwNDNlXHUwNDQzXSIsInRlbXBsYXRlIjoiIiwidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwiZGlzcGxheV9ub19pbWFnZXNfZXJyb3IiOjEsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwidGh1bWJuYWlsX3F1YWxpdHkiOiIxMDAiLCJ0aHVtYm5haWxfd2F0ZXJtYXJrIjowLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0sImhpZGRlbl9mcm9tX3VpIjpmYWxzZSwiYWxpYXNlcyI6WyJiYXNpY190aHVtYm5haWwiLCJiYXNpY190aHVtYm5haWxzIiwibmV4dGdlbl9iYXNpY190aHVtYm5haWxzIl0sImhpZGRlbl9mcm9tX2lndyI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 'NextGEN Basic Thumbnails', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-11-11 23:13:40', '2016-11-11 20:13:40', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiMTQiLCJwb3N0X2lkIjoiNSIsIm1ldGFfa2V5IjoibmFtZSIsIm1ldGFfdmFsdWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGh1bWJuYWlscyIsInRpdGxlIjoiTmV4dEdFTiBCYXNpYyBUaHVtYm5haWxzIiwiZW50aXR5X3R5cGVzIjpbImltYWdlIl0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlxcbmV4dGdlbi1nYWxsZXJ5XFxwcm9kdWN0c1xccGhvdG9jcmF0aV9uZXh0Z2VuXFxtb2R1bGVzXFxuZXh0Z2VuX2Jhc2ljX2dhbGxlcnlcXHN0YXRpY1xcdGh1bWJfcHJldmlldy5qcGciLCJkZWZhdWx0X3NvdXJjZSI6ImdhbGxlcmllcyIsInZpZXdfb3JkZXIiOjEwMDAwLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RodW1ibmFpbHMiLCJpbnN0YWxsZWRfYXRfdmVyc2lvbiI6IjIuMS41NiIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJvdmVycmlkZV90aHVtYm5haWxfc2V0dGluZ3MiOiIxIiwidGh1bWJuYWlsX3dpZHRoIjoiMjIwIiwidGh1bWJuYWlsX2hlaWdodCI6IjIyMCIsInRodW1ibmFpbF9jcm9wIjoiMSIsImltYWdlc19wZXJfcGFnZSI6IjIwIiwibnVtYmVyX29mX2NvbHVtbnMiOiIwIiwiYWpheF9wYWdpbmF0aW9uIjoiMCIsInNob3dfYWxsX2luX2xpZ2h0Ym94IjoiMCIsInVzZV9pbWFnZWJyb3dzZXJfZWZmZWN0IjoiMSIsInNob3dfc2xpZGVzaG93X2xpbmsiOiIxIiwic2xpZGVzaG93X2xpbmtfdGV4dCI6IltcdTA0MWZcdTA0M2VcdTA0M2FcdTA0MzBcdTA0MzdcdTA0MzBcdTA0NDJcdTA0NGMgXHUwNDQxXHUwNDNiXHUwNDMwXHUwNDM5XHUwNDM0XHUwNDQ4XHUwNDNlXHUwNDQzXSIsInRlbXBsYXRlIjoiIiwidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwiZGlzcGxheV9ub19pbWFnZXNfZXJyb3IiOjEsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwidGh1bWJuYWlsX3F1YWxpdHkiOiIxMDAiLCJ0aHVtYm5haWxfd2F0ZXJtYXJrIjowLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0sImhpZGRlbl9mcm9tX3VpIjpmYWxzZSwiYWxpYXNlcyI6WyJiYXNpY190aHVtYm5haWwiLCJiYXNpY190aHVtYm5haWxzIiwibmV4dGdlbl9iYXNpY190aHVtYm5haWxzIl0sImhpZGRlbl9mcm9tX2lndyI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 0, 'http://localhost/wordpress/?post_type=display_type&#038;p=5', 0, 'display_type', '', 0),
(6, 1, '2016-08-12 16:34:53', '0000-00-00 00:00:00', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiMjYiLCJwb3N0X2lkIjoiNiIsIm1ldGFfa2V5IjoibmFtZSIsIm1ldGFfdmFsdWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfc2xpZGVzaG93IiwidGl0bGUiOiJOZXh0R0VOIEJhc2ljIFNsaWRlc2hvdyIsImVudGl0eV90eXBlcyI6WyJpbWFnZSJdLCJwcmV2aWV3X2ltYWdlX3JlbHBhdGgiOiJcXG5leHRnZW4tZ2FsbGVyeVxccHJvZHVjdHNcXHBob3RvY3JhdGlfbmV4dGdlblxcbW9kdWxlc1xcbmV4dGdlbl9iYXNpY19nYWxsZXJ5XFxzdGF0aWNcXHNsaWRlc2hvd19wcmV2aWV3LmpwZyIsImRlZmF1bHRfc291cmNlIjoiZ2FsbGVyaWVzIiwidmlld19vcmRlciI6MTAwMTAsIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfc2xpZGVzaG93IiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIyLjEuNTYiLCJpZF9maWVsZCI6IklEIiwic2V0dGluZ3MiOnsiZ2FsbGVyeV93aWR0aCI6IjgwNCIsImdhbGxlcnlfaGVpZ2h0IjoiNTkyIiwiY3ljbGVfZWZmZWN0IjoiZmFkZSIsImN5Y2xlX2ludGVydmFsIjoiMTAiLCJzaG93X3RodW1ibmFpbF9saW5rIjoiMCIsInRodW1ibmFpbF9saW5rX3RleHQiOiJbXHUwNDFmXHUwNDNlXHUwNDNhXHUwNDMwXHUwNDM3XHUwNDMwXHUwNDQyXHUwNDRjIFx1MDQ0ZFx1MDQ0MVx1MDQzYVx1MDQzOFx1MDQzN1x1MDQ0Yl0iLCJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJ0aHVtYm5haWxfd2lkdGgiOiIyMjAiLCJ0aHVtYm5haWxfaGVpZ2h0IjoiMjIwIiwiZWZmZWN0X2NvZGUiOiJjbGFzcz1cIm5nZy1mYW5jeWJveFwiIHJlbD1cIiVHQUxMRVJZX05BTUUlXCIiLCJ0ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifSwiaGlkZGVuX2Zyb21fdWkiOmZhbHNlLCJhbGlhc2VzIjpbImJhc2ljX3NsaWRlc2hvdyIsIm5leHRnZW5fYmFzaWNfc2xpZGVzaG93Il0sImhpZGRlbl9mcm9tX2lndyI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 'NextGEN Basic Slideshow', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-11-11 23:13:40', '2016-11-11 20:13:40', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiMjYiLCJwb3N0X2lkIjoiNiIsIm1ldGFfa2V5IjoibmFtZSIsIm1ldGFfdmFsdWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfc2xpZGVzaG93IiwidGl0bGUiOiJOZXh0R0VOIEJhc2ljIFNsaWRlc2hvdyIsImVudGl0eV90eXBlcyI6WyJpbWFnZSJdLCJwcmV2aWV3X2ltYWdlX3JlbHBhdGgiOiJcXG5leHRnZW4tZ2FsbGVyeVxccHJvZHVjdHNcXHBob3RvY3JhdGlfbmV4dGdlblxcbW9kdWxlc1xcbmV4dGdlbl9iYXNpY19nYWxsZXJ5XFxzdGF0aWNcXHNsaWRlc2hvd19wcmV2aWV3LmpwZyIsImRlZmF1bHRfc291cmNlIjoiZ2FsbGVyaWVzIiwidmlld19vcmRlciI6MTAwMTAsIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfc2xpZGVzaG93IiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIyLjEuNTYiLCJpZF9maWVsZCI6IklEIiwic2V0dGluZ3MiOnsiZ2FsbGVyeV93aWR0aCI6IjgwNCIsImdhbGxlcnlfaGVpZ2h0IjoiNTkyIiwiY3ljbGVfZWZmZWN0IjoiZmFkZSIsImN5Y2xlX2ludGVydmFsIjoiMTAiLCJzaG93X3RodW1ibmFpbF9saW5rIjoiMCIsInRodW1ibmFpbF9saW5rX3RleHQiOiJbXHUwNDFmXHUwNDNlXHUwNDNhXHUwNDMwXHUwNDM3XHUwNDMwXHUwNDQyXHUwNDRjIFx1MDQ0ZFx1MDQ0MVx1MDQzYVx1MDQzOFx1MDQzN1x1MDQ0Yl0iLCJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJ0aHVtYm5haWxfd2lkdGgiOiIyMjAiLCJ0aHVtYm5haWxfaGVpZ2h0IjoiMjIwIiwiZWZmZWN0X2NvZGUiOiJjbGFzcz1cIm5nZy1mYW5jeWJveFwiIHJlbD1cIiVHQUxMRVJZX05BTUUlXCIiLCJ0ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifSwiaGlkZGVuX2Zyb21fdWkiOmZhbHNlLCJhbGlhc2VzIjpbImJhc2ljX3NsaWRlc2hvdyIsIm5leHRnZW5fYmFzaWNfc2xpZGVzaG93Il0sImhpZGRlbl9mcm9tX2lndyI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 0, 'http://localhost/wordpress/?post_type=display_type&#038;p=6', 0, 'display_type', '', 0),
(7, 1, '2016-08-12 16:34:54', '0000-00-00 00:00:00', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiMzgiLCJwb3N0X2lkIjoiNyIsIm1ldGFfa2V5IjoibmFtZSIsIm1ldGFfdmFsdWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfaW1hZ2Vicm93c2VyIiwidGl0bGUiOiJOZXh0R0VOIEJhc2ljIEltYWdlQnJvd3NlciIsImVudGl0eV90eXBlcyI6WyJpbWFnZSJdLCJwcmV2aWV3X2ltYWdlX3JlbHBhdGgiOiJcXG5leHRnZW4tZ2FsbGVyeVxccHJvZHVjdHNcXHBob3RvY3JhdGlfbmV4dGdlblxcbW9kdWxlc1xcbmV4dGdlbl9iYXNpY19pbWFnZWJyb3dzZXJcXHN0YXRpY1xccHJldmlldy5qcGciLCJkZWZhdWx0X3NvdXJjZSI6ImdhbGxlcmllcyIsInZpZXdfb3JkZXIiOjEwMDIwLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2ltYWdlYnJvd3NlciIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjU2IiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7ImFqYXhfcGFnaW5hdGlvbiI6IjAiLCJ0ZW1wbGF0ZSI6IiIsInVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifSwiaGlkZGVuX2Zyb21fdWkiOmZhbHNlLCJhbGlhc2VzIjpbImJhc2ljX2ltYWdlYnJvd3NlciIsImltYWdlYnJvd3NlciIsIm5leHRnZW5fYmFzaWNfaW1hZ2Vicm93c2VyIl0sImhpZGRlbl9mcm9tX2lndyI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 'NextGEN Basic ImageBrowser', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-11-11 23:13:40', '2016-11-11 20:13:40', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiMzgiLCJwb3N0X2lkIjoiNyIsIm1ldGFfa2V5IjoibmFtZSIsIm1ldGFfdmFsdWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfaW1hZ2Vicm93c2VyIiwidGl0bGUiOiJOZXh0R0VOIEJhc2ljIEltYWdlQnJvd3NlciIsImVudGl0eV90eXBlcyI6WyJpbWFnZSJdLCJwcmV2aWV3X2ltYWdlX3JlbHBhdGgiOiJcXG5leHRnZW4tZ2FsbGVyeVxccHJvZHVjdHNcXHBob3RvY3JhdGlfbmV4dGdlblxcbW9kdWxlc1xcbmV4dGdlbl9iYXNpY19pbWFnZWJyb3dzZXJcXHN0YXRpY1xccHJldmlldy5qcGciLCJkZWZhdWx0X3NvdXJjZSI6ImdhbGxlcmllcyIsInZpZXdfb3JkZXIiOjEwMDIwLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2ltYWdlYnJvd3NlciIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjU2IiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7ImFqYXhfcGFnaW5hdGlvbiI6IjAiLCJ0ZW1wbGF0ZSI6IiIsInVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifSwiaGlkZGVuX2Zyb21fdWkiOmZhbHNlLCJhbGlhc2VzIjpbImJhc2ljX2ltYWdlYnJvd3NlciIsImltYWdlYnJvd3NlciIsIm5leHRnZW5fYmFzaWNfaW1hZ2Vicm93c2VyIl0sImhpZGRlbl9mcm9tX2lndyI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 0, 'http://localhost/wordpress/?post_type=display_type&#038;p=7', 0, 'display_type', '', 0),
(8, 1, '2016-08-12 16:34:54', '0000-00-00 00:00:00', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiNTEiLCJwb3N0X2lkIjoiOCIsIm1ldGFfa2V5IjoibmFtZSIsIm1ldGFfdmFsdWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfc2luZ2xlcGljIiwidGl0bGUiOiJOZXh0R0VOIEJhc2ljIFNpbmdsZVBpYyIsImVudGl0eV90eXBlcyI6WyJpbWFnZSJdLCJwcmV2aWV3X2ltYWdlX3JlbHBhdGgiOiJcXG5leHRnZW4tZ2FsbGVyeVxccHJvZHVjdHNcXHBob3RvY3JhdGlfbmV4dGdlblxcbW9kdWxlc1xcbmV4dGdlbl9iYXNpY19zaW5nbGVwaWNcXHN0YXRpY1xccHJldmlldy5naWYiLCJkZWZhdWx0X3NvdXJjZSI6ImdhbGxlcmllcyIsInZpZXdfb3JkZXIiOjEwMDYwLCJoaWRkZW5fZnJvbV91aSI6dHJ1ZSwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19zaW5nbGVwaWMiLCJpbnN0YWxsZWRfYXRfdmVyc2lvbiI6IjIuMS41NiIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJ3aWR0aCI6IjQ1NCIsImhlaWdodCI6IiIsImxpbmsiOiIiLCJsaW5rX3RhcmdldCI6Il9ibGFuayIsImZsb2F0IjoiIiwicXVhbGl0eSI6IjEwMCIsImNyb3AiOiIwIiwiZGlzcGxheV93YXRlcm1hcmsiOiIxIiwiZGlzcGxheV9yZWZsZWN0aW9uIjoiMCIsInRlbXBsYXRlIjoiIiwidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwibW9kZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifSwiaGlkZGVuX2Zyb21faWd3Ijp0cnVlLCJhbGlhc2VzIjpbImJhc2ljX3NpbmdsZXBpYyIsInNpbmdsZXBpYyIsIm5leHRnZW5fYmFzaWNfc2luZ2xlcGljIl0sIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 'NextGEN Basic SinglePic', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-11-11 23:13:40', '2016-11-11 20:13:40', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiNTEiLCJwb3N0X2lkIjoiOCIsIm1ldGFfa2V5IjoibmFtZSIsIm1ldGFfdmFsdWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfc2luZ2xlcGljIiwidGl0bGUiOiJOZXh0R0VOIEJhc2ljIFNpbmdsZVBpYyIsImVudGl0eV90eXBlcyI6WyJpbWFnZSJdLCJwcmV2aWV3X2ltYWdlX3JlbHBhdGgiOiJcXG5leHRnZW4tZ2FsbGVyeVxccHJvZHVjdHNcXHBob3RvY3JhdGlfbmV4dGdlblxcbW9kdWxlc1xcbmV4dGdlbl9iYXNpY19zaW5nbGVwaWNcXHN0YXRpY1xccHJldmlldy5naWYiLCJkZWZhdWx0X3NvdXJjZSI6ImdhbGxlcmllcyIsInZpZXdfb3JkZXIiOjEwMDYwLCJoaWRkZW5fZnJvbV91aSI6dHJ1ZSwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19zaW5nbGVwaWMiLCJpbnN0YWxsZWRfYXRfdmVyc2lvbiI6IjIuMS41NiIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJ3aWR0aCI6IjQ1NCIsImhlaWdodCI6IiIsImxpbmsiOiIiLCJsaW5rX3RhcmdldCI6Il9ibGFuayIsImZsb2F0IjoiIiwicXVhbGl0eSI6IjEwMCIsImNyb3AiOiIwIiwiZGlzcGxheV93YXRlcm1hcmsiOiIxIiwiZGlzcGxheV9yZWZsZWN0aW9uIjoiMCIsInRlbXBsYXRlIjoiIiwidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwibW9kZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifSwiaGlkZGVuX2Zyb21faWd3Ijp0cnVlLCJhbGlhc2VzIjpbImJhc2ljX3NpbmdsZXBpYyIsInNpbmdsZXBpYyIsIm5leHRnZW5fYmFzaWNfc2luZ2xlcGljIl0sIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 0, 'http://localhost/wordpress/?post_type=display_type&#038;p=8', 0, 'display_type', '', 0),
(9, 1, '2016-08-12 16:34:54', '0000-00-00 00:00:00', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiNjIiLCJwb3N0X2lkIjoiOSIsIm1ldGFfa2V5IjoibmFtZSIsIm1ldGFfdmFsdWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGFnY2xvdWQiLCJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgVGFnQ2xvdWQiLCJlbnRpdHlfdHlwZXMiOlsiaW1hZ2UiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXFxuZXh0Z2VuLWdhbGxlcnlcXHByb2R1Y3RzXFxwaG90b2NyYXRpX25leHRnZW5cXG1vZHVsZXNcXG5leHRnZW5fYmFzaWNfdGFnY2xvdWRcXHN0YXRpY1xccHJldmlldy5naWYiLCJkZWZhdWx0X3NvdXJjZSI6InRhZ3MiLCJ2aWV3X29yZGVyIjoxMDEwMCwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190YWdjbG91ZCIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjU2IiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7Im51bWJlciI6IjQ1IiwiZGlzcGxheV90eXBlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RodW1ibmFpbHMiLCJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0sImhpZGRlbl9mcm9tX3VpIjpmYWxzZSwiYWxpYXNlcyI6WyJiYXNpY190YWdjbG91ZCIsInRhZ2Nsb3VkIiwibmV4dGdlbl9iYXNpY190YWdjbG91ZCJdLCJoaWRkZW5fZnJvbV9pZ3ciOmZhbHNlLCJfX2RlZmF1bHRzX3NldCI6dHJ1ZX0=', 'NextGEN Basic TagCloud', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-11-11 23:13:40', '2016-11-11 20:13:40', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiNjIiLCJwb3N0X2lkIjoiOSIsIm1ldGFfa2V5IjoibmFtZSIsIm1ldGFfdmFsdWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGFnY2xvdWQiLCJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgVGFnQ2xvdWQiLCJlbnRpdHlfdHlwZXMiOlsiaW1hZ2UiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXFxuZXh0Z2VuLWdhbGxlcnlcXHByb2R1Y3RzXFxwaG90b2NyYXRpX25leHRnZW5cXG1vZHVsZXNcXG5leHRnZW5fYmFzaWNfdGFnY2xvdWRcXHN0YXRpY1xccHJldmlldy5naWYiLCJkZWZhdWx0X3NvdXJjZSI6InRhZ3MiLCJ2aWV3X29yZGVyIjoxMDEwMCwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190YWdjbG91ZCIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjU2IiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7Im51bWJlciI6IjQ1IiwiZGlzcGxheV90eXBlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RodW1ibmFpbHMiLCJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0sImhpZGRlbl9mcm9tX3VpIjpmYWxzZSwiYWxpYXNlcyI6WyJiYXNpY190YWdjbG91ZCIsInRhZ2Nsb3VkIiwibmV4dGdlbl9iYXNpY190YWdjbG91ZCJdLCJoaWRkZW5fZnJvbV9pZ3ciOmZhbHNlLCJfX2RlZmF1bHRzX3NldCI6dHJ1ZX0=', 0, 'http://localhost/wordpress/?post_type=display_type&#038;p=9', 0, 'display_type', '', 0),
(10, 1, '2016-08-12 16:34:54', '0000-00-00 00:00:00', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiNzQiLCJwb3N0X2lkIjoiMTAiLCJtZXRhX2tleSI6Im5hbWUiLCJtZXRhX3ZhbHVlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2NvbXBhY3RfYWxidW0iLCJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgQ29tcGFjdCBBbGJ1bSIsImVudGl0eV90eXBlcyI6WyJhbGJ1bSIsImdhbGxlcnkiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXFxuZXh0Z2VuLWdhbGxlcnlcXHByb2R1Y3RzXFxwaG90b2NyYXRpX25leHRnZW5cXG1vZHVsZXNcXG5leHRnZW5fYmFzaWNfYWxidW1cXHN0YXRpY1xcY29tcGFjdF9wcmV2aWV3LmpwZyIsImRlZmF1bHRfc291cmNlIjoiYWxidW1zIiwidmlld19vcmRlciI6MTAyMDAsIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfY29tcGFjdF9hbGJ1bSIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjU2IiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7ImdhbGxlcnlfZGlzcGxheV90eXBlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RodW1ibmFpbHMiLCJnYWxsZXJpZXNfcGVyX3BhZ2UiOiIwIiwiZW5hYmxlX2JyZWFkY3J1bWJzIjoiMSIsInRlbXBsYXRlIjoiIiwiZW5hYmxlX2Rlc2NyaXB0aW9ucyI6IjAiLCJvdmVycmlkZV90aHVtYm5haWxfc2V0dGluZ3MiOiIwIiwidGh1bWJuYWlsX3dpZHRoIjoiMjIwIiwidGh1bWJuYWlsX2hlaWdodCI6IjIyMCIsInRodW1ibmFpbF9jcm9wIjoiMCIsInVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwib3Blbl9nYWxsZXJ5X2luX2xpZ2h0Ym94IjowLCJnYWxsZXJ5X2Rpc3BsYXlfdGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0sImhpZGRlbl9mcm9tX3VpIjpmYWxzZSwiYWxpYXNlcyI6WyJiYXNpY19jb21wYWN0X2FsYnVtIiwibmV4dGdlbl9iYXNpY19hbGJ1bSIsImJhc2ljX2FsYnVtX2NvbXBhY3QiLCJjb21wYWN0X2FsYnVtIl0sImhpZGRlbl9mcm9tX2lndyI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 'NextGEN Basic Compact Album', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-11-11 23:13:40', '2016-11-11 20:13:40', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiNzQiLCJwb3N0X2lkIjoiMTAiLCJtZXRhX2tleSI6Im5hbWUiLCJtZXRhX3ZhbHVlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2NvbXBhY3RfYWxidW0iLCJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgQ29tcGFjdCBBbGJ1bSIsImVudGl0eV90eXBlcyI6WyJhbGJ1bSIsImdhbGxlcnkiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXFxuZXh0Z2VuLWdhbGxlcnlcXHByb2R1Y3RzXFxwaG90b2NyYXRpX25leHRnZW5cXG1vZHVsZXNcXG5leHRnZW5fYmFzaWNfYWxidW1cXHN0YXRpY1xcY29tcGFjdF9wcmV2aWV3LmpwZyIsImRlZmF1bHRfc291cmNlIjoiYWxidW1zIiwidmlld19vcmRlciI6MTAyMDAsIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfY29tcGFjdF9hbGJ1bSIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjU2IiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7ImdhbGxlcnlfZGlzcGxheV90eXBlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RodW1ibmFpbHMiLCJnYWxsZXJpZXNfcGVyX3BhZ2UiOiIwIiwiZW5hYmxlX2JyZWFkY3J1bWJzIjoiMSIsInRlbXBsYXRlIjoiIiwiZW5hYmxlX2Rlc2NyaXB0aW9ucyI6IjAiLCJvdmVycmlkZV90aHVtYm5haWxfc2V0dGluZ3MiOiIwIiwidGh1bWJuYWlsX3dpZHRoIjoiMjIwIiwidGh1bWJuYWlsX2hlaWdodCI6IjIyMCIsInRodW1ibmFpbF9jcm9wIjoiMCIsInVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwib3Blbl9nYWxsZXJ5X2luX2xpZ2h0Ym94IjowLCJnYWxsZXJ5X2Rpc3BsYXlfdGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0sImhpZGRlbl9mcm9tX3VpIjpmYWxzZSwiYWxpYXNlcyI6WyJiYXNpY19jb21wYWN0X2FsYnVtIiwibmV4dGdlbl9iYXNpY19hbGJ1bSIsImJhc2ljX2FsYnVtX2NvbXBhY3QiLCJjb21wYWN0X2FsYnVtIl0sImhpZGRlbl9mcm9tX2lndyI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 0, 'http://localhost/wordpress/?post_type=display_type&#038;p=10', 0, 'display_type', '', 0),
(11, 1, '2016-08-12 16:34:54', '0000-00-00 00:00:00', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiODYiLCJwb3N0X2lkIjoiMTEiLCJtZXRhX2tleSI6Im5hbWUiLCJtZXRhX3ZhbHVlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2V4dGVuZGVkX2FsYnVtIiwidGl0bGUiOiJOZXh0R0VOIEJhc2ljIEV4dGVuZGVkIEFsYnVtIiwiZW50aXR5X3R5cGVzIjpbImFsYnVtIiwiZ2FsbGVyeSJdLCJwcmV2aWV3X2ltYWdlX3JlbHBhdGgiOiJcXG5leHRnZW4tZ2FsbGVyeVxccHJvZHVjdHNcXHBob3RvY3JhdGlfbmV4dGdlblxcbW9kdWxlc1xcbmV4dGdlbl9iYXNpY19hbGJ1bVxcc3RhdGljXFxleHRlbmRlZF9wcmV2aWV3LmpwZyIsImRlZmF1bHRfc291cmNlIjoiYWxidW1zIiwidmlld19vcmRlciI6MTAyMTAsIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfZXh0ZW5kZWRfYWxidW0iLCJpbnN0YWxsZWRfYXRfdmVyc2lvbiI6IjIuMS41NiIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJnYWxsZXJ5X2Rpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwiZ2FsbGVyaWVzX3Blcl9wYWdlIjoiMCIsImVuYWJsZV9icmVhZGNydW1icyI6IjEiLCJ0ZW1wbGF0ZSI6IiIsImVuYWJsZV9kZXNjcmlwdGlvbnMiOiIwIiwib3ZlcnJpZGVfdGh1bWJuYWlsX3NldHRpbmdzIjoiMCIsInRodW1ibmFpbF93aWR0aCI6IjI0MCIsInRodW1ibmFpbF9oZWlnaHQiOiIxNjAiLCJ0aHVtYm5haWxfY3JvcCI6IjEiLCJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJkaXNhYmxlX3BhZ2luYXRpb24iOjAsIm9wZW5fZ2FsbGVyeV9pbl9saWdodGJveCI6MCwidGh1bWJuYWlsX3F1YWxpdHkiOjEwMCwidGh1bWJuYWlsX3dhdGVybWFyayI6MCwiZ2FsbGVyeV9kaXNwbGF5X3RlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsImFsaWFzZXMiOlsiYmFzaWNfZXh0ZW5kZWRfYWxidW0iLCJuZXh0Z2VuX2Jhc2ljX2V4dGVuZGVkX2FsYnVtIiwiZXh0ZW5kZWRfYWxidW0iXSwiaGlkZGVuX2Zyb21faWd3IjpmYWxzZSwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'NextGEN Basic Extended Album', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-11-11 23:13:40', '2016-11-11 20:13:40', 'eyJmaWx0ZXIiOiJyYXciLCJtZXRhX2lkIjoiODYiLCJwb3N0X2lkIjoiMTEiLCJtZXRhX2tleSI6Im5hbWUiLCJtZXRhX3ZhbHVlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2V4dGVuZGVkX2FsYnVtIiwidGl0bGUiOiJOZXh0R0VOIEJhc2ljIEV4dGVuZGVkIEFsYnVtIiwiZW50aXR5X3R5cGVzIjpbImFsYnVtIiwiZ2FsbGVyeSJdLCJwcmV2aWV3X2ltYWdlX3JlbHBhdGgiOiJcXG5leHRnZW4tZ2FsbGVyeVxccHJvZHVjdHNcXHBob3RvY3JhdGlfbmV4dGdlblxcbW9kdWxlc1xcbmV4dGdlbl9iYXNpY19hbGJ1bVxcc3RhdGljXFxleHRlbmRlZF9wcmV2aWV3LmpwZyIsImRlZmF1bHRfc291cmNlIjoiYWxidW1zIiwidmlld19vcmRlciI6MTAyMTAsIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfZXh0ZW5kZWRfYWxidW0iLCJpbnN0YWxsZWRfYXRfdmVyc2lvbiI6IjIuMS41NiIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJnYWxsZXJ5X2Rpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwiZ2FsbGVyaWVzX3Blcl9wYWdlIjoiMCIsImVuYWJsZV9icmVhZGNydW1icyI6IjEiLCJ0ZW1wbGF0ZSI6IiIsImVuYWJsZV9kZXNjcmlwdGlvbnMiOiIwIiwib3ZlcnJpZGVfdGh1bWJuYWlsX3NldHRpbmdzIjoiMCIsInRodW1ibmFpbF93aWR0aCI6IjI0MCIsInRodW1ibmFpbF9oZWlnaHQiOiIxNjAiLCJ0aHVtYm5haWxfY3JvcCI6IjEiLCJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJkaXNhYmxlX3BhZ2luYXRpb24iOjAsIm9wZW5fZ2FsbGVyeV9pbl9saWdodGJveCI6MCwidGh1bWJuYWlsX3F1YWxpdHkiOjEwMCwidGh1bWJuYWlsX3dhdGVybWFyayI6MCwiZ2FsbGVyeV9kaXNwbGF5X3RlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsImFsaWFzZXMiOlsiYmFzaWNfZXh0ZW5kZWRfYWxidW0iLCJuZXh0Z2VuX2Jhc2ljX2V4dGVuZGVkX2FsYnVtIiwiZXh0ZW5kZWRfYWxidW0iXSwiaGlkZGVuX2Zyb21faWd3IjpmYWxzZSwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?post_type=display_type&#038;p=11', 0, 'display_type', '', 0),
(13, 1, '2016-08-12 16:46:32', '2016-08-12 13:46:32', 'Это пример страницы. От записей в блоге она отличается тем, что остаётся на одном месте и отображается в меню сайта (в большинстве тем). На странице «Детали» владельцы сайтов обычно рассказывают о себе потенциальным посетителям. Например, так:\r\n<blockquote>Привет! Днём я курьер, а вечером — подающий надежды актёр. Это мой блог. Я живу в Ростове-на-Дону, люблю своего пса Джека и пинаколаду. (И ещё попадать под дождь.)</blockquote>\r\n...или так:\r\n<blockquote>Компания «Штучки XYZ» была основана в 1971 году и с тех пор производит качественные штучки. Компания находится в Готэм-сити, имеет штат из более чем 2000 сотрудников и приносит много пользы жителям Готэма.</blockquote>\r\nПерейдите <a href="http://localhost/wordpress/wp-admin/">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!', 'Главная', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2016-08-12 16:46:32', '2016-08-12 13:46:32', '', 2, 'http://localhost/wordpress/2016/08/12/2-revision-v1/', 0, 'revision', '', 0),
(14, 1, '2016-08-12 16:48:32', '2016-08-12 13:48:32', '<img class="ngg_displayed_gallery mceItem" src="http://localhost/wordpress/nextgen-attach_to_post/preview/id--15" data-mce-placeholder="1" />', 'Фото', '', 'publish', 'closed', 'closed', '', 'foto', '', '', '2016-08-12 17:26:15', '2016-08-12 14:26:15', '', 0, 'http://localhost/wordpress/?page_id=14', 0, 'page', '', 0),
(15, 1, '2016-08-12 17:26:08', '0000-00-00 00:00:00', 'eyJkaXNwbGF5X3NldHRpbmdzIjp7InVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImdhbGxlcmllc19wZXJfcGFnZSI6IjAiLCJlbmFibGVfYnJlYWRjcnVtYnMiOiIxIiwiZGlzYWJsZV9wYWdpbmF0aW9uIjowLCJlbmFibGVfZGVzY3JpcHRpb25zIjoiMCIsInRlbXBsYXRlIjoiIiwiZ2FsbGVyeV9kaXNwbGF5X3R5cGUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGh1bWJuYWlscyIsImdhbGxlcnlfZGlzcGxheV90ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIiLCJvdmVycmlkZV90aHVtYm5haWxfc2V0dGluZ3MiOiIwIiwidGh1bWJuYWlsX3dpZHRoIjoiMjQwIiwidGh1bWJuYWlsX2hlaWdodCI6IjE2MCIsInRodW1ibmFpbF9jcm9wIjoiMCJ9LCJvcmRlcl9ieSI6InNvcnRvcmRlciIsIm9yZGVyX2RpcmVjdGlvbiI6IkFTQyIsImV4Y2x1c2lvbnMiOltdLCJjb250YWluZXJfaWRzIjpbMV0sImV4Y2x1ZGVkX2NvbnRhaW5lcl9pZHMiOltdLCJzb3J0b3JkZXIiOltdLCJlbnRpdHlfaWRzIjpbXSwicmV0dXJucyI6ImluY2x1ZGVkIiwibWF4aW11bV9lbnRpdHlfY291bnQiOjUwMCwic291cmNlIjoiYWxidW1zIiwiZGlzcGxheV90eXBlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2NvbXBhY3RfYWxidW0iLCJzbHVnIjpudWxsLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled displayed_gallery', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-08-12 17:26:08', '2016-08-12 14:26:08', 'eyJkaXNwbGF5X3NldHRpbmdzIjp7InVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImdhbGxlcmllc19wZXJfcGFnZSI6IjAiLCJlbmFibGVfYnJlYWRjcnVtYnMiOiIxIiwiZGlzYWJsZV9wYWdpbmF0aW9uIjowLCJlbmFibGVfZGVzY3JpcHRpb25zIjoiMCIsInRlbXBsYXRlIjoiIiwiZ2FsbGVyeV9kaXNwbGF5X3R5cGUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGh1bWJuYWlscyIsImdhbGxlcnlfZGlzcGxheV90ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIiLCJvdmVycmlkZV90aHVtYm5haWxfc2V0dGluZ3MiOiIwIiwidGh1bWJuYWlsX3dpZHRoIjoiMjQwIiwidGh1bWJuYWlsX2hlaWdodCI6IjE2MCIsInRodW1ibmFpbF9jcm9wIjoiMCJ9LCJvcmRlcl9ieSI6InNvcnRvcmRlciIsIm9yZGVyX2RpcmVjdGlvbiI6IkFTQyIsImV4Y2x1c2lvbnMiOltdLCJjb250YWluZXJfaWRzIjpbMV0sImV4Y2x1ZGVkX2NvbnRhaW5lcl9pZHMiOltdLCJzb3J0b3JkZXIiOltdLCJlbnRpdHlfaWRzIjpbXSwicmV0dXJucyI6ImluY2x1ZGVkIiwibWF4aW11bV9lbnRpdHlfY291bnQiOjUwMCwic291cmNlIjoiYWxidW1zIiwiZGlzcGxheV90eXBlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2NvbXBhY3RfYWxidW0iLCJzbHVnIjpudWxsLCJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=15', 0, 'displayed_gallery', '', 0),
(16, 1, '2016-08-12 16:48:32', '2016-08-12 13:48:32', '<img class="ngg_displayed_gallery mceItem" src="http://localhost/wordpress/nextgen-attach_to_post/preview/id--15" data-mce-placeholder="1" />', 'Фото', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2016-08-12 16:48:32', '2016-08-12 13:48:32', '', 14, 'http://localhost/wordpress/2016/08/12/14-revision-v1/', 0, 'revision', '', 0),
(17, 1, '2016-08-12 16:49:17', '2016-08-12 13:49:17', '', 'Контакты', '', 'publish', 'closed', 'closed', '', 'kontaktyi', '', '', '2016-08-12 16:49:17', '2016-08-12 13:49:17', '', 0, 'http://localhost/wordpress/?page_id=17', 0, 'page', '', 0),
(18, 1, '2016-08-12 16:49:17', '2016-08-12 13:49:17', '', 'Контакты', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2016-08-12 16:49:17', '2016-08-12 13:49:17', '', 17, 'http://localhost/wordpress/2016/08/12/17-revision-v1/', 0, 'revision', '', 0),
(19, 1, '2016-08-12 16:53:11', '0000-00-00 00:00:00', 'eyJkaXNwbGF5X3NldHRpbmdzIjp7InVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImdhbGxlcnlfd2lkdGgiOiI2MDAiLCJnYWxsZXJ5X2hlaWdodCI6IjQwMCIsInRodW1ibmFpbF93aWR0aCI6MjQwLCJ0aHVtYm5haWxfaGVpZ2h0IjoxNjAsImN5Y2xlX2ludGVydmFsIjoiMTAiLCJjeWNsZV9lZmZlY3QiOiJmYWRlIiwiZWZmZWN0X2NvZGUiOiJjbGFzcz1cIm5nZy1mYW5jeWJveFwiIHJlbD1cIiVHQUxMRVJZX05BTUUlXCIiLCJzaG93X3RodW1ibmFpbF9saW5rIjoiMSIsInRodW1ibmFpbF9saW5rX3RleHQiOiJbXHUwNDFmXHUwNDNlXHUwNDNhXHUwNDMwXHUwNDM3XHUwNDMwXHUwNDQyXHUwNDRjIFx1MDQ0ZFx1MDQ0MVx1MDQzYVx1MDQzOFx1MDQzN1x1MDQ0Yl0iLCJ0ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifSwib3JkZXJfYnkiOiJzb3J0b3JkZXIiLCJvcmRlcl9kaXJlY3Rpb24iOiJBU0MiLCJleGNsdXNpb25zIjpbXSwiY29udGFpbmVyX2lkcyI6W10sImV4Y2x1ZGVkX2NvbnRhaW5lcl9pZHMiOltdLCJzb3J0b3JkZXIiOltdLCJlbnRpdHlfaWRzIjpbXSwicmV0dXJucyI6ImluY2x1ZGVkIiwibWF4aW11bV9lbnRpdHlfY291bnQiOjUwMCwic291cmNlIjoiZ2FsbGVyaWVzIiwiZGlzcGxheV90eXBlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3NsaWRlc2hvdyIsInNsdWciOm51bGwsImlkX2ZpZWxkIjoiSUQiLCJfX2RlZmF1bHRzX3NldCI6dHJ1ZX0=', 'Untitled displayed_gallery', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-08-12 16:53:11', '0000-00-00 00:00:00', 'eyJkaXNwbGF5X3NldHRpbmdzIjp7InVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImdhbGxlcnlfd2lkdGgiOiI2MDAiLCJnYWxsZXJ5X2hlaWdodCI6IjQwMCIsInRodW1ibmFpbF93aWR0aCI6MjQwLCJ0aHVtYm5haWxfaGVpZ2h0IjoxNjAsImN5Y2xlX2ludGVydmFsIjoiMTAiLCJjeWNsZV9lZmZlY3QiOiJmYWRlIiwiZWZmZWN0X2NvZGUiOiJjbGFzcz1cIm5nZy1mYW5jeWJveFwiIHJlbD1cIiVHQUxMRVJZX05BTUUlXCIiLCJzaG93X3RodW1ibmFpbF9saW5rIjoiMSIsInRodW1ibmFpbF9saW5rX3RleHQiOiJbXHUwNDFmXHUwNDNlXHUwNDNhXHUwNDMwXHUwNDM3XHUwNDMwXHUwNDQyXHUwNDRjIFx1MDQ0ZFx1MDQ0MVx1MDQzYVx1MDQzOFx1MDQzN1x1MDQ0Yl0iLCJ0ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifSwib3JkZXJfYnkiOiJzb3J0b3JkZXIiLCJvcmRlcl9kaXJlY3Rpb24iOiJBU0MiLCJleGNsdXNpb25zIjpbXSwiY29udGFpbmVyX2lkcyI6W10sImV4Y2x1ZGVkX2NvbnRhaW5lcl9pZHMiOltdLCJzb3J0b3JkZXIiOltdLCJlbnRpdHlfaWRzIjpbXSwicmV0dXJucyI6ImluY2x1ZGVkIiwibWF4aW11bV9lbnRpdHlfY291bnQiOjUwMCwic291cmNlIjoiZ2FsbGVyaWVzIiwiZGlzcGxheV90eXBlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3NsaWRlc2hvdyIsInNsdWciOm51bGwsImlkX2ZpZWxkIjoiSUQiLCJfX2RlZmF1bHRzX3NldCI6dHJ1ZX0=', 0, 'http://localhost/wordpress/?p=19', 0, 'displayed_gallery', '', 0),
(20, 1, '2016-08-12 16:53:25', '2016-08-12 13:53:25', '<img class="ngg_displayed_gallery mceItem" src="http://localhost/wordpress/nextgen-attach_to_post/preview/id--19" data-mce-placeholder="1" />Это пример страницы. От записей в блоге она отличается тем, что остаётся на одном месте и отображается в меню сайта (в большинстве тем). На странице «Детали» владельцы сайтов обычно рассказывают о себе потенциальным посетителям. Например, так:\r\n<blockquote>Привет! Днём я курьер, а вечером — подающий надежды актёр. Это мой блог. Я живу в Ростове-на-Дону, люблю своего пса Джека и пинаколаду. (И ещё попадать под дождь.)</blockquote>\r\n...или так:\r\n<blockquote>Компания «Штучки XYZ» была основана в 1971 году и с тех пор производит качественные штучки. Компания находится в Готэм-сити, имеет штат из более чем 2000 сотрудников и приносит много пользы жителям Готэма.</blockquote>\r\nПерейдите <a href="http://localhost/wordpress/wp-admin/">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!', 'Главная', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2016-08-12 16:53:25', '2016-08-12 13:53:25', '', 2, 'http://localhost/wordpress/2016/08/12/2-revision-v1/', 0, 'revision', '', 0),
(21, 1, '2016-08-12 17:03:49', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:03:49', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=21', 0, 'ngg_gallery', '', 0),
(22, 1, '2016-08-12 17:03:50', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:03:50', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=22', 0, 'ngg_pictures', '', 0),
(23, 1, '2016-11-11 23:11:31', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-11-11 23:11:31', '2016-11-11 20:11:31', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=23', 0, 'ngg_pictures', '', 0),
(24, 1, '2016-08-12 17:03:51', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:03:51', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=24', 0, 'ngg_gallery', '', 0),
(25, 1, '2016-08-12 17:03:53', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:03:53', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=25', 0, 'ngg_pictures', '', 0),
(26, 1, '2016-11-11 23:10:47', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-11-11 23:10:47', '2016-11-11 20:10:47', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=26', 0, 'ngg_pictures', '', 0),
(27, 1, '2016-08-12 17:03:56', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:03:56', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=27', 0, 'ngg_pictures', '', 0),
(28, 1, '2016-11-11 23:10:48', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-11-11 23:10:48', '2016-11-11 20:10:48', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=28', 0, 'ngg_pictures', '', 0),
(29, 1, '2016-08-12 17:04:00', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:04:00', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=29', 0, 'ngg_pictures', '', 0),
(30, 1, '2016-11-11 23:10:48', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-11-11 23:10:48', '2016-11-11 20:10:48', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=30', 0, 'ngg_pictures', '', 0),
(31, 1, '2016-08-12 17:04:04', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:04:04', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=31', 0, 'ngg_pictures', '', 0),
(32, 1, '2016-11-11 23:10:49', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-11-11 23:10:49', '2016-11-11 20:10:49', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=32', 0, 'ngg_pictures', '', 0),
(33, 1, '2016-08-12 17:13:28', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_album', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:13:28', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?post_type=ngg_album&p=33', 0, 'ngg_album', '', 0),
(34, 1, '2016-08-12 17:16:52', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:16:52', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=34', 0, 'ngg_pictures', '', 0),
(35, 1, '2016-11-11 23:10:50', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-11-11 23:10:50', '2016-11-11 20:10:50', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=35', 0, 'ngg_pictures', '', 0),
(36, 1, '2016-08-12 17:16:56', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:16:56', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=36', 0, 'ngg_pictures', '', 0),
(37, 1, '2016-11-11 23:10:50', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-11-11 23:10:50', '2016-11-11 20:10:50', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=37', 0, 'ngg_pictures', '', 0),
(38, 1, '2016-08-12 17:17:00', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:17:00', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=38', 0, 'ngg_pictures', '', 0),
(39, 1, '2016-11-11 23:10:51', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-11-11 23:10:51', '2016-11-11 20:10:51', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=39', 0, 'ngg_pictures', '', 0),
(40, 1, '2016-08-12 17:17:03', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:17:03', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=40', 0, 'ngg_pictures', '', 0),
(41, 1, '2016-11-11 23:10:52', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-11-11 23:10:52', '2016-11-11 20:10:52', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=41', 0, 'ngg_pictures', '', 0),
(42, 1, '2016-08-12 17:17:07', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:17:07', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=42', 0, 'ngg_pictures', '', 0),
(43, 1, '2016-11-11 23:10:53', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-11-11 23:10:53', '2016-11-11 20:10:53', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=43', 0, 'ngg_pictures', '', 0),
(44, 1, '2016-08-12 17:19:43', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:19:43', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=44', 0, 'ngg_pictures', '', 0),
(45, 1, '2016-11-11 23:10:53', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-11-11 23:10:53', '2016-11-11 20:10:53', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=45', 0, 'ngg_pictures', '', 0),
(46, 1, '2016-08-12 17:19:53', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:19:53', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=46', 0, 'ngg_pictures', '', 0),
(47, 1, '2016-11-11 23:10:54', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-11-11 23:10:54', '2016-11-11 20:10:54', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=47', 0, 'ngg_pictures', '', 0),
(48, 1, '2016-08-12 17:22:56', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:22:56', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=48', 0, 'ngg_gallery', '', 0),
(49, 1, '2016-08-12 17:22:56', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:22:56', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=49', 0, 'ngg_pictures', '', 0),
(50, 1, '2016-08-12 17:26:28', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:26:28', '2016-08-12 14:26:28', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=50', 0, 'ngg_pictures', '', 0),
(51, 1, '2016-08-12 17:22:57', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:22:57', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=51', 0, 'ngg_gallery', '', 0),
(52, 1, '2016-08-12 17:23:00', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:23:00', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=52', 0, 'ngg_pictures', '', 0),
(53, 1, '2016-08-12 17:23:01', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:23:01', '2016-08-12 14:23:01', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=53', 0, 'ngg_pictures', '', 0),
(54, 1, '2016-08-12 17:23:03', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:23:03', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=54', 0, 'ngg_pictures', '', 0),
(55, 1, '2016-08-12 17:23:04', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:23:04', '2016-08-12 14:23:04', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=55', 0, 'ngg_pictures', '', 0),
(56, 1, '2016-08-12 17:23:08', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:23:08', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=56', 0, 'ngg_pictures', '', 0),
(57, 1, '2016-08-12 17:23:09', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:23:09', '2016-08-12 14:23:09', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=57', 0, 'ngg_pictures', '', 0),
(58, 1, '2016-08-12 17:23:12', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:23:12', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=58', 0, 'ngg_pictures', '', 0),
(59, 1, '2016-08-12 17:23:13', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:23:13', '2016-08-12 14:23:13', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=59', 0, 'ngg_pictures', '', 0),
(60, 1, '2016-08-12 17:23:15', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:23:15', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=60', 0, 'ngg_pictures', '', 0),
(61, 1, '2016-08-12 17:23:17', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:23:17', '2016-08-12 14:23:17', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=61', 0, 'ngg_pictures', '', 0),
(62, 1, '2016-08-12 17:23:20', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:23:20', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=62', 0, 'ngg_pictures', '', 0),
(63, 1, '2016-08-12 17:23:21', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:23:21', '2016-08-12 14:23:21', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=63', 0, 'ngg_pictures', '', 0),
(64, 1, '2016-08-12 17:24:31', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_album', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2016-08-12 17:24:31', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?post_type=ngg_album&p=64', 0, 'ngg_album', '', 0),
(65, 1, '2016-08-12 17:45:55', '2016-08-12 14:45:55', '<img class="ngg_displayed_gallery mceItem" src="http://localhost/wordpress/nextgen-attach_to_post/preview/id--19" data-mce-placeholder="1" />', 'Главная', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2016-08-12 17:45:55', '2016-08-12 14:45:55', '', 2, 'http://localhost/wordpress/2016/08/12/2-revision-v1/', 0, 'revision', '', 0),
(67, 1, '2016-10-03 21:03:32', '2016-10-03 18:03:32', ' ', '', '', 'publish', 'closed', 'closed', '', '67', '', '', '2016-10-03 21:03:32', '2016-10-03 18:03:32', '', 0, 'http://localhost/wordpress/2016/10/03/67/', 3, 'nav_menu_item', '', 0),
(68, 1, '2016-10-03 21:03:32', '2016-10-03 18:03:32', ' ', '', '', 'publish', 'closed', 'closed', '', '68', '', '', '2016-10-03 21:03:32', '2016-10-03 18:03:32', '', 0, 'http://localhost/wordpress/2016/10/03/68/', 2, 'nav_menu_item', '', 0),
(69, 1, '2016-10-03 21:03:32', '2016-10-03 18:03:32', ' ', '', '', 'publish', 'closed', 'closed', '', '69', '', '', '2016-10-03 21:03:32', '2016-10-03 18:03:32', '', 0, 'http://localhost/wordpress/2016/10/03/69/', 1, 'nav_menu_item', '', 0),
(70, 1, '2016-10-08 23:31:24', '2016-10-08 20:31:24', '', 'logo', '', 'inherit', 'open', 'closed', '', 'logo', '', '', '2016-10-08 23:32:23', '2016-10-08 20:32:23', '', 0, 'http://localhost/wordpress/wp-content/uploads/2016/10/logo.png', 0, 'attachment', 'image/png', 0),
(71, 1, '2016-11-11 15:37:50', '0000-00-00 00:00:00', '', 'Черновик', '', 'auto-draft', 'open', 'open', '', '', '', '', '2016-11-11 15:37:50', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=71', 0, 'post', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wqkbf_termmeta`
--

CREATE TABLE IF NOT EXISTS `wqkbf_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `wqkbf_terms`
--

CREATE TABLE IF NOT EXISTS `wqkbf_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `wqkbf_terms`
--

INSERT INTO `wqkbf_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Без рубрики', 'bez-rubriki', 0),
(2, 'Главное меню', 'glavnoe-menyu', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wqkbf_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wqkbf_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wqkbf_term_relationships`
--

INSERT INTO `wqkbf_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(67, 2, 0),
(68, 2, 0),
(69, 2, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wqkbf_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wqkbf_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `wqkbf_term_taxonomy`
--

INSERT INTO `wqkbf_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `wqkbf_usermeta`
--

CREATE TABLE IF NOT EXISTS `wqkbf_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Дамп данных таблицы `wqkbf_usermeta`
--

INSERT INTO `wqkbf_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'false'),
(10, 1, 'wqkbf_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wqkbf_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', ''),
(13, 1, 'show_welcome_panel', '1'),
(15, 1, 'wqkbf_dashboard_quick_press_last_post_id', '71'),
(16, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";i:4;s:15:"title-attribute";}'),
(17, 1, 'metaboxhidden_nav-menus', 'a:3:{i:0;s:12:"add-post_tag";i:1;s:15:"add-post_format";i:2;s:11:"add-ngg_tag";}'),
(18, 1, 'nav_menu_recently_edited', '2'),
(19, 1, 'wqkbf_media_library_mode', 'grid'),
(20, 1, 'wqkbf_user-settings', 'mfold=o&libraryContent=browse'),
(21, 1, 'wqkbf_user-settings-time', '1475958701'),
(22, 1, 'session_tokens', 'a:1:{s:64:"953fac92f441db2262d1b96728f6805df67d0da9cc0a8dc89e4b0308f46c47b3";a:4:{s:10:"expiration";i:1479061764;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:118:"Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36 OPR/41.0.2353.56";s:5:"login";i:1478888964;}}');

-- --------------------------------------------------------

--
-- Структура таблицы `wqkbf_users`
--

CREATE TABLE IF NOT EXISTS `wqkbf_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `wqkbf_users`
--

INSERT INTO `wqkbf_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BikO9wz3d9kbx9PsGzOEcL803apRN10', 'admin', 'admin@reasanik.com', '', '2016-08-12 13:11:15', '', 0, 'admin');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
