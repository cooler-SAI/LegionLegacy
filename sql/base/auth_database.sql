
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sessionkey` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `v` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `s` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `joindate` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `last_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `locked` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lock_country` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '00',
  `last_login` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `online` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `expansion` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `mutetime` bigint(20) NOT NULL DEFAULT 0,
  `locale` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `os` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `recruiter` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `battlenet_account` int(10) UNSIGNED NULL DEFAULT NULL,
  `battlenet_index` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `mutereason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `muteby` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `AtAuthFlag` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  `coins` int(11) NOT NULL DEFAULT 0,
  `hwid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `bnet_acc`(`battlenet_account`, `battlenet_index`) USING BTREE,
  INDEX `recruiter`(`recruiter`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `battlenet_account`(`battlenet_account`) USING BTREE,
  INDEX `battlenet_index`(`battlenet_index`) USING BTREE,
  INDEX `username_idx`(`username`) USING BTREE,
  INDEX `hwid`(`hwid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 277081 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Account System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_access
-- ----------------------------
DROP TABLE IF EXISTS `account_access`;
CREATE TABLE `account_access`  (
  `id` int(10) UNSIGNED NOT NULL,
  `gmlevel` tinyint(3) UNSIGNED NOT NULL,
  `RealmID` int(11) NOT NULL DEFAULT -1,
  `comments` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`, `RealmID`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `RealmID`(`RealmID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_banned
-- ----------------------------
DROP TABLE IF EXISTS `account_banned`;
CREATE TABLE `account_banned`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Account id',
  `bandate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `unbandate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `bannedby` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `banreason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`, `bandate`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `bandate`(`bandate`) USING BTREE,
  INDEX `unbandate`(`unbandate`) USING BTREE,
  INDEX `active`(`active`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Ban List' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_character_template
-- ----------------------------
DROP TABLE IF EXISTS `account_character_template`;
CREATE TABLE `account_character_template`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account` int(10) NOT NULL DEFAULT 0,
  `bnet_account` int(10) NOT NULL DEFAULT 0,
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT 100,
  `iLevel` mediumint(6) NOT NULL DEFAULT 810,
  `money` int(10) UNSIGNED NOT NULL DEFAULT 100,
  `artifact` tinyint(1) NOT NULL DEFAULT 0,
  `transferId` int(10) NOT NULL DEFAULT 0,
  `charGuid` int(10) NOT NULL DEFAULT 0,
  `realm` int(10) NOT NULL DEFAULT 0,
  `templateId` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `account`(`account`) USING BTREE,
  INDEX `bnet_account`(`bnet_account`) USING BTREE,
  INDEX `transferId`(`transferId`) USING BTREE,
  INDEX `charGuid`(`charGuid`) USING BTREE,
  INDEX `realm`(`realm`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8707 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_flagged
-- ----------------------------
DROP TABLE IF EXISTS `account_flagged`;
CREATE TABLE `account_flagged`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Account Id',
  `banduration` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `bannedby` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `banreason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_ip_access
-- ----------------------------
DROP TABLE IF EXISTS `account_ip_access`;
CREATE TABLE `account_ip_access`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) UNSIGNED NULL DEFAULT NULL,
  `ip` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `min` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `max` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `enable` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pid_ip`(`pid`, `ip`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_last_played_character
-- ----------------------------
DROP TABLE IF EXISTS `account_last_played_character`;
CREATE TABLE `account_last_played_character`  (
  `accountId` int(10) UNSIGNED NOT NULL,
  `region` tinyint(3) UNSIGNED NOT NULL,
  `battlegroup` tinyint(3) UNSIGNED NOT NULL,
  `realmId` int(10) UNSIGNED NULL DEFAULT NULL,
  `characterName` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `characterGUID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `lastPlayedTime` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`accountId`, `region`, `battlegroup`) USING BTREE,
  INDEX `accountId`(`accountId`) USING BTREE,
  INDEX `region`(`region`) USING BTREE,
  INDEX `battlegroup`(`battlegroup`) USING BTREE,
  INDEX `realmId`(`realmId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_log_ip
-- ----------------------------
DROP TABLE IF EXISTS `account_log_ip`;
CREATE TABLE `account_log_ip`  (
  `accountid` int(11) UNSIGNED NOT NULL,
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0.0.0.0',
  `date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`accountid`, `ip`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_mute
-- ----------------------------
DROP TABLE IF EXISTS `account_mute`;
CREATE TABLE `account_mute`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `mutedate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mutetime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mutedby` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mutereason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`guid`, `mutedate`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'mute List' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_muted
-- ----------------------------
DROP TABLE IF EXISTS `account_muted`;
CREATE TABLE `account_muted`  (
  `id` int(11) NOT NULL DEFAULT 0 COMMENT 'Account id',
  `bandate` bigint(40) NOT NULL DEFAULT 0,
  `unbandate` bigint(40) NOT NULL DEFAULT 0,
  `bannedby` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `banreason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`, `bandate`) USING BTREE,
  INDEX `bandate`(`bandate`) USING BTREE,
  INDEX `unbandate`(`unbandate`) USING BTREE,
  INDEX `active`(`active`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Ban List' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_rates
-- ----------------------------
DROP TABLE IF EXISTS `account_rates`;
CREATE TABLE `account_rates`  (
  `account` int(11) NOT NULL DEFAULT 0,
  `bnet_account` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `realm` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `rate` int(11) UNSIGNED NOT NULL DEFAULT 0,
  UNIQUE INDEX `unique`(`account`, `bnet_account`, `realm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_reputation
-- ----------------------------
DROP TABLE IF EXISTS `account_reputation`;
CREATE TABLE `account_reputation`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `reputation` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_spec
-- ----------------------------
DROP TABLE IF EXISTS `account_spec`;
CREATE TABLE `account_spec`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `oldid` int(11) UNSIGNED NOT NULL COMMENT 'Identifier',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sha_pass_hash` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `gmlevel` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `sessionkey` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `v` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `s` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `email` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `email_new` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `joindate` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `last_ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0.0.0.0',
  `failed_logins` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `locked` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `last_login` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_module` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `module_day` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `active_realm_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `expansion` tinyint(3) UNSIGNED NOT NULL DEFAULT 3,
  `mutetime` bigint(40) UNSIGNED NOT NULL DEFAULT 0,
  `locale` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `os` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `recruiter` int(11) NOT NULL DEFAULT 0,
  `premium` int(255) NOT NULL DEFAULT 0,
  `premium_time` int(255) NOT NULL DEFAULT 0,
  `access_mask` tinyint(1) NOT NULL DEFAULT 0,
  `realmgm` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `online` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `sha_new_pass` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `newpassword` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `protectedkey` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `found` tinyint(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1152679 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_spell
-- ----------------------------
DROP TABLE IF EXISTS `account_spell`;
CREATE TABLE `account_spell`  (
  `accountId` int(11) NOT NULL,
  `spell` int(10) NOT NULL,
  `active` tinyint(1) NULL DEFAULT NULL,
  `disabled` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`accountId`, `spell`) USING BTREE,
  INDEX `account`(`accountId`) USING BTREE,
  INDEX `account_spell`(`accountId`, `spell`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for autobroadcast
-- ----------------------------
DROP TABLE IF EXISTS `autobroadcast`;
CREATE TABLE `autobroadcast`  (
  `realmid` int(11) NOT NULL DEFAULT -1,
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `weight` tinyint(3) UNSIGNED NULL DEFAULT 1,
  `text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`, `realmid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for battlenet_account_bans
-- ----------------------------
DROP TABLE IF EXISTS `battlenet_account_bans`;
CREATE TABLE `battlenet_account_bans`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Account id',
  `bandate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `unbandate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `bannedby` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `banreason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`, `bandate`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `bandate`(`bandate`) USING BTREE,
  INDEX `unbandate`(`unbandate`) USING BTREE,
  INDEX `active`(`active`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Ban List' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for battlenet_account_toys
-- ----------------------------
DROP TABLE IF EXISTS `battlenet_account_toys`;
CREATE TABLE `battlenet_account_toys`  (
  `accountId` int(10) UNSIGNED NOT NULL,
  `itemId` int(11) NOT NULL DEFAULT 0,
  `isFavourite` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`accountId`, `itemId`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for battlenet_accounts
-- ----------------------------
DROP TABLE IF EXISTS `battlenet_accounts`;
CREATE TABLE `battlenet_accounts`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email_blocked` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `sha_pass_hash` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `balans` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `karma` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `activate` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `verify` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `tested` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `donate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `phone_hash` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `telegram_lock` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `telegram_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `v` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `s` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sessionKey` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `joindate` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `last_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '127.0.0.1',
  `access_ip` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `failed_logins` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `locked` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lock_country` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '00',
  `last_login` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_email` timestamp(0) NULL DEFAULT NULL,
  `online` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `locale` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `os` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `recruiter` int(11) NOT NULL DEFAULT 0,
  `invite` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `lang` enum('tw','cn','en','ua','ru') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ru',
  `referer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `unsubscribe` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `dt_vote` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `recruiter`(`recruiter`) USING BTREE,
  INDEX `email_idx`(`email`) USING BTREE,
  INDEX `sha_pass_hash`(`sha_pass_hash`(255)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 302030 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Account System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for battlenet_components
-- ----------------------------
DROP TABLE IF EXISTS `battlenet_components`;
CREATE TABLE `battlenet_components`  (
  `Program` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Platform` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Build` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`Program`, `Platform`, `Build`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for battlenet_modules
-- ----------------------------
DROP TABLE IF EXISTS `battlenet_modules`;
CREATE TABLE `battlenet_modules`  (
  `Hash` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `System` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`Name`, `System`) USING BTREE,
  UNIQUE INDEX `uk_name_type_system`(`Name`, `Type`, `System`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hwid_penalties
-- ----------------------------
DROP TABLE IF EXISTS `hwid_penalties`;
CREATE TABLE `hwid_penalties`  (
  `hwid` bigint(20) UNSIGNED NOT NULL,
  `penalties` int(10) NOT NULL DEFAULT 0,
  `last_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`hwid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ip2nation
-- ----------------------------
DROP TABLE IF EXISTS `ip2nation`;
CREATE TABLE `ip2nation`  (
  `ip` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `country` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  INDEX `ip`(`ip`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ip2nationcountries
-- ----------------------------
DROP TABLE IF EXISTS `ip2nationcountries`;
CREATE TABLE `ip2nationcountries`  (
  `code` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `iso_code_2` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `iso_code_3` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `iso_country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `lat` float NOT NULL DEFAULT 0,
  `lon` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`code`) USING BTREE,
  INDEX `code`(`code`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ip_banned
-- ----------------------------
DROP TABLE IF EXISTS `ip_banned`;
CREATE TABLE `ip_banned`  (
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '127.0.0.1',
  `bandate` bigint(40) NOT NULL,
  `unbandate` bigint(40) NOT NULL,
  `bannedby` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`, `bandate`) USING BTREE,
  INDEX `ip`(`ip`) USING BTREE,
  INDEX `bandate`(`bandate`) USING BTREE,
  INDEX `unbandate`(`unbandate`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Banned IPs' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ip_ddos
-- ----------------------------
DROP TABLE IF EXISTS `ip_ddos`;
CREATE TABLE `ip_ddos`  (
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ip`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`  (
  `time` int(14) NOT NULL,
  `realm` int(4) NOT NULL,
  `type` int(4) NOT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `string` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  INDEX `time`(`time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for online
-- ----------------------------
DROP TABLE IF EXISTS `online`;
CREATE TABLE `online`  (
  `realmID` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `online` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `diff` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `uptime` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`realmID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for realm_transfer
-- ----------------------------
DROP TABLE IF EXISTS `realm_transfer`;
CREATE TABLE `realm_transfer`  (
  `from_realm` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `to_realm` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`from_realm`, `to_realm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for realmcharacters
-- ----------------------------
DROP TABLE IF EXISTS `realmcharacters`;
CREATE TABLE `realmcharacters`  (
  `realmid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `acctid` int(10) UNSIGNED NOT NULL,
  `numchars` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`realmid`, `acctid`) USING BTREE,
  INDEX `acctid`(`acctid`) USING BTREE,
  INDEX `realmid`(`realmid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Realm Character Tracker' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for realmlist
-- ----------------------------
DROP TABLE IF EXISTS `realmlist`;
CREATE TABLE `realmlist`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '127.0.0.1',
  `port` smallint(5) UNSIGNED NOT NULL DEFAULT 8085,
  `gamePort` int(11) NOT NULL DEFAULT 8086,
  `portCount` mediumint(4) UNSIGNED NOT NULL DEFAULT 1,
  `icon` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `flag` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `timezone` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `allowedSecurityLevel` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `population` float UNSIGNED NOT NULL DEFAULT 0,
  `gamebuild` int(10) UNSIGNED NOT NULL DEFAULT 12340,
  `Region` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `Battlegroup` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `localAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '127.0.0.1',
  `localSubnetMask` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '255.255.255.0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_name`(`name`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Realm System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for store_categories
-- ----------------------------
DROP TABLE IF EXISTS `store_categories`;
CREATE TABLE `store_categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) UNSIGNED NOT NULL,
  `type` smallint(10) NOT NULL DEFAULT 0,
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `faction` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `expansion` tinyint(1) UNSIGNED NOT NULL DEFAULT 6,
  `enable` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `enable`(`enable`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 230501 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for store_category_locales
-- ----------------------------
DROP TABLE IF EXISTS `store_category_locales`;
CREATE TABLE `store_category_locales`  (
  `category` int(11) NOT NULL DEFAULT 0,
  `name_us` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name_gb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name_kr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name_fr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name_de` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name_cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name_tw` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name_es` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name_mx` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name_ru` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name_pt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name_br` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name_it` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name_ua` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description_us` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description_gb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description_kr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description_fr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description_de` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description_cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description_tw` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description_es` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description_mx` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description_ru` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description_pt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description_br` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description_it` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description_ua` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`category`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for store_category_realms
-- ----------------------------
DROP TABLE IF EXISTS `store_category_realms`;
CREATE TABLE `store_category_realms`  (
  `category` int(11) NOT NULL DEFAULT 0,
  `realm` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `return` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `enable` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  UNIQUE INDEX `unique`(`category`, `realm`) USING BTREE,
  INDEX `category`(`category`) USING BTREE,
  INDEX `realm`(`realm`) USING BTREE,
  INDEX `enable`(`enable`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for store_discounts
-- ----------------------------
DROP TABLE IF EXISTS `store_discounts`;
CREATE TABLE `store_discounts`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `realm` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 0,
  `product` int(11) NOT NULL DEFAULT 0,
  `start` timestamp(0) NULL DEFAULT NULL,
  `end` timestamp(0) NULL DEFAULT NULL,
  `rate` float(5, 2) UNSIGNED NOT NULL DEFAULT 0.00,
  `enable` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for store_favorites
-- ----------------------------
DROP TABLE IF EXISTS `store_favorites`;
CREATE TABLE `store_favorites`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `realm` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `product` int(11) NOT NULL DEFAULT 0,
  `acid` int(11) UNSIGNED NOT NULL,
  `bacid` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`realm`, `product`, `acid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 981 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for store_history
-- ----------------------------
DROP TABLE IF EXISTS `store_history`;
CREATE TABLE `store_history`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `realm` int(11) UNSIGNED NOT NULL,
  `account` int(11) UNSIGNED NOT NULL,
  `bnet_account` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `char_guid` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `char_level` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `art_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `guild_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `item_guid` int(11) UNSIGNED NULL DEFAULT NULL,
  `item` int(11) NOT NULL DEFAULT 0,
  `bonus` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product` int(11) NOT NULL DEFAULT 0,
  `count` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `token` int(11) UNSIGNED NOT NULL,
  `karma` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `type` enum('cp','game') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'game',
  `trans_project` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `trans_realm` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `dt_buy` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `dt_return` timestamp(0) NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_guid`(`item_guid`) USING BTREE,
  INDEX `realm`(`realm`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `account`(`account`) USING BTREE,
  INDEX `bnet_account`(`bnet_account`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `char_guid`(`char_guid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40425 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for store_level_prices
-- ----------------------------
DROP TABLE IF EXISTS `store_level_prices`;
CREATE TABLE `store_level_prices`  (
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `realm` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `level` smallint(4) UNSIGNED NOT NULL DEFAULT 0,
  `token` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `karma` int(11) UNSIGNED NOT NULL DEFAULT 0,
  UNIQUE INDEX `unique`(`type`, `realm`, `level`, `token`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `realm`(`realm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for store_product_locales
-- ----------------------------
DROP TABLE IF EXISTS `store_product_locales`;
CREATE TABLE `store_product_locales`  (
  `product` int(11) NOT NULL DEFAULT 0,
  `type` smallint(10) NOT NULL DEFAULT 0,
  `us` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `gb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `kr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `fr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `de` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `tw` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `es` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mx` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ru` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `pt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `br` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `it` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ua` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`product`, `type`) USING BTREE,
  UNIQUE INDEX `unique`(`product`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for store_product_realms
-- ----------------------------
DROP TABLE IF EXISTS `store_product_realms`;
CREATE TABLE `store_product_realms`  (
  `product` int(11) NOT NULL DEFAULT 0,
  `realm` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `token` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `karma` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `return` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `enable` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `dt` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  UNIQUE INDEX `unique`(`realm`, `product`) USING BTREE,
  INDEX `product`(`product`) USING BTREE,
  INDEX `realm`(`realm`) USING BTREE,
  INDEX `enable`(`enable`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for store_products
-- ----------------------------
DROP TABLE IF EXISTS `store_products`;
CREATE TABLE `store_products`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL DEFAULT 0,
  `item` int(11) NOT NULL DEFAULT 0,
  `bonus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `quality` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `display` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `slot` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `token` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `karma` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `enable` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `dt` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `faction` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`category`, `item`, `bonus`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `category`(`category`) USING BTREE,
  INDEX `enable`(`enable`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25020 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for store_rating
-- ----------------------------
DROP TABLE IF EXISTS `store_rating`;
CREATE TABLE `store_rating`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `realm` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `product` int(11) NOT NULL DEFAULT 0,
  `rating` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `acid` int(11) UNSIGNED NOT NULL,
  `bacid` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`realm`, `product`, `acid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for store_statistics
-- ----------------------------
DROP TABLE IF EXISTS `store_statistics`;
CREATE TABLE `store_statistics`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL DEFAULT 0,
  `realm` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `rating_count` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `rating_value` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `buy` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`realm`, `product`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3650 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for transfer_requests
-- ----------------------------
DROP TABLE IF EXISTS `transfer_requests`;
CREATE TABLE `transfer_requests`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `acid` int(11) UNSIGNED NOT NULL,
  `bacid` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `guid` int(11) UNSIGNED NULL DEFAULT NULL,
  `char_faction` tinyint(1) UNSIGNED NULL DEFAULT NULL,
  `char_class` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `char_set` int(11) UNSIGNED NULL DEFAULT NULL,
  `realm` tinyint(3) UNSIGNED NOT NULL,
  `dump` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `promo_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `client_expansion` tinyint(1) UNSIGNED NULL DEFAULT NULL,
  `client_build` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `client_locale` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `site` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `realmlist` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transfer_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transfer_realm` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `char_name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `dump_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `dt_create` timestamp(0) NULL DEFAULT NULL,
  `dt_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `moderator` int(11) UNSIGNED NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cost` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `type` enum('fee','free') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'free',
  `test` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('check','test','paid','cancel','4','2','0','reject','payment','verify','new') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'new',
  `parser` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 756 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for transferts
-- ----------------------------
DROP TABLE IF EXISTS `transferts`;
CREATE TABLE `transferts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` int(11) NOT NULL DEFAULT 0,
  `perso_guid` int(11) NOT NULL DEFAULT 0,
  `from` int(11) NOT NULL DEFAULT 0,
  `to` int(11) NOT NULL DEFAULT 0,
  `toacc` int(11) NOT NULL DEFAULT 0,
  `dump` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nb_attempt` int(11) NOT NULL DEFAULT 0,
  `state` int(10) NULL DEFAULT 0,
  `error` int(10) NULL DEFAULT 0,
  `revision` int(10) NULL DEFAULT 0,
  `transferId` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account`(`account`) USING BTREE,
  INDEX `perso_guid`(`perso_guid`) USING BTREE,
  INDEX `from`(`from`) USING BTREE,
  INDEX `to`(`to`) USING BTREE,
  INDEX `state`(`state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for transferts_logs
-- ----------------------------
DROP TABLE IF EXISTS `transferts_logs`;
CREATE TABLE `transferts_logs`  (
  `id` int(11) NULL DEFAULT NULL,
  `account` int(11) NULL DEFAULT 0,
  `perso_guid` int(11) NULL DEFAULT 0,
  `from` int(2) NULL DEFAULT 0,
  `to` int(2) NULL DEFAULT 0,
  `dump` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `toacc` int(11) NOT NULL DEFAULT 0,
  `newguid` int(11) NOT NULL DEFAULT 0,
  `transferId` int(11) NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uptime
-- ----------------------------
DROP TABLE IF EXISTS `uptime`;
CREATE TABLE `uptime`  (
  `realmid` int(11) UNSIGNED NOT NULL,
  `starttime` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `startstring` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uptime` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `maxplayers` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `revision` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Trinitycore',
  PRIMARY KEY (`realmid`, `starttime`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Uptime system' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
