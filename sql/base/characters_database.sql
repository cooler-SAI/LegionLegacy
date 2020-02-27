
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_achievement
-- ----------------------------
DROP TABLE IF EXISTS `account_achievement`;
CREATE TABLE `account_achievement`  (
  `account` int(11) UNSIGNED NOT NULL,
  `first_guid` int(11) UNSIGNED NOT NULL,
  `achievement` int(11) UNSIGNED NOT NULL,
  `date` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`account`, `achievement`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_achievement_progress
-- ----------------------------
DROP TABLE IF EXISTS `account_achievement_progress`;
CREATE TABLE `account_achievement_progress`  (
  `account` int(11) UNSIGNED NOT NULL,
  `criteria` int(11) UNSIGNED NOT NULL,
  `counter` int(11) UNSIGNED NOT NULL,
  `date` bigint(11) UNSIGNED NOT NULL DEFAULT 0,
  `achievID` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `completed` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`account`, `criteria`) USING BTREE,
  INDEX `account`(`account`) USING BTREE,
  INDEX `criteria`(`criteria`) USING BTREE,
  INDEX `achievID`(`achievID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_ban_attempts
-- ----------------------------
DROP TABLE IF EXISTS `account_ban_attempts`;
CREATE TABLE `account_ban_attempts`  (
  `accountId` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `banAttempts` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`accountId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_battlepet
-- ----------------------------
DROP TABLE IF EXISTS `account_battlepet`;
CREATE TABLE `account_battlepet`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `slot` int(11) NOT NULL DEFAULT -1,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nameTimeStamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `species` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `quality` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `breed` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `level` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `xp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `display` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `health` int(11) NOT NULL DEFAULT 0,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `infoPower` int(11) NOT NULL DEFAULT 0,
  `infoMaxHealth` int(11) NOT NULL DEFAULT 0,
  `infoSpeed` int(11) NOT NULL DEFAULT 0,
  `infoGender` int(11) NOT NULL DEFAULT 0,
  `declinedGenitive` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `declinedNative` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `declinedAccusative` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `declinedInstrumental` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `declinedPrepositional` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account`(`account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_bot_detected
-- ----------------------------
DROP TABLE IF EXISTS `account_bot_detected`;
CREATE TABLE `account_bot_detected`  (
  `accountId` int(11) UNSIGNED NOT NULL,
  `playerName` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `botName` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`accountId`, `playerName`, `botName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_data
-- ----------------------------
DROP TABLE IF EXISTS `account_data`;
CREATE TABLE `account_data`  (
  `accountId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Account Identifier',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  PRIMARY KEY (`accountId`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
-- Table structure for account_heirlooms
-- ----------------------------
DROP TABLE IF EXISTS `account_heirlooms`;
CREATE TABLE `account_heirlooms`  (
  `accountId` int(10) UNSIGNED NOT NULL,
  `itemId` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`accountId`, `itemId`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for account_instance_times
-- ----------------------------
DROP TABLE IF EXISTS `account_instance_times`;
CREATE TABLE `account_instance_times`  (
  `accountId` int(10) UNSIGNED NOT NULL,
  `instanceId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `releaseTime` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`accountId`, `instanceId`) USING BTREE,
  INDEX `accountId`(`accountId`) USING BTREE,
  INDEX `instanceId`(`instanceId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_item_favorite_appearances
-- ----------------------------
DROP TABLE IF EXISTS `account_item_favorite_appearances`;
CREATE TABLE `account_item_favorite_appearances`  (
  `battlenetAccountId` int(10) UNSIGNED NOT NULL,
  `itemModifiedAppearanceId` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`battlenetAccountId`, `itemModifiedAppearanceId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_mounts
-- ----------------------------
DROP TABLE IF EXISTS `account_mounts`;
CREATE TABLE `account_mounts`  (
  `account` int(11) UNSIGNED NOT NULL,
  `spell` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`account`, `spell`) USING BTREE,
  INDEX `account`(`account`) USING BTREE,
  INDEX `spell`(`spell`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_progress
-- ----------------------------
DROP TABLE IF EXISTS `account_progress`;
CREATE TABLE `account_progress`  (
  `account` int(10) UNSIGNED NOT NULL,
  `totaltime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `leveltime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`account`) USING BTREE,
  INDEX `account`(`account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_reward
-- ----------------------------
DROP TABLE IF EXISTS `account_reward`;
CREATE TABLE `account_reward`  (
  `guid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `count` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE,
  INDEX `account`(`account`) USING BTREE,
  INDEX `account_2`(`account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_share
-- ----------------------------
DROP TABLE IF EXISTS `account_share`;
CREATE TABLE `account_share`  (
  `account` bigint(20) UNSIGNED NOT NULL,
  `bonus1` tinyint(1) NOT NULL DEFAULT 0,
  `bonus2` tinyint(1) NOT NULL DEFAULT 0,
  `bonus3` tinyint(1) NOT NULL DEFAULT 0,
  `bonus4` tinyint(1) NOT NULL DEFAULT 0,
  `bonus5` tinyint(1) NOT NULL DEFAULT 0,
  `bonus6` tinyint(1) NOT NULL DEFAULT 0,
  `bonus7` tinyint(1) NOT NULL DEFAULT 0,
  `bonus8` tinyint(1) NOT NULL DEFAULT 0,
  `bonus9` tinyint(1) NOT NULL DEFAULT 0,
  `bonus10` tinyint(1) NOT NULL DEFAULT 0,
  `bonus11` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_toys
-- ----------------------------
DROP TABLE IF EXISTS `account_toys`;
CREATE TABLE `account_toys`  (
  `accountId` int(10) UNSIGNED NOT NULL,
  `itemId` int(11) NOT NULL DEFAULT 0,
  `isFavourite` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`accountId`, `itemId`) USING BTREE,
  INDEX `accountId`(`accountId`) USING BTREE,
  INDEX `itemId`(`itemId`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for account_transmogs
-- ----------------------------
DROP TABLE IF EXISTS `account_transmogs`;
CREATE TABLE `account_transmogs`  (
  `account` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `guid` int(10) UNSIGNED NULL DEFAULT 0,
  `ModelID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Condition` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`account`, `ModelID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for account_tutorial
-- ----------------------------
DROP TABLE IF EXISTS `account_tutorial`;
CREATE TABLE `account_tutorial`  (
  `accountId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Account Identifier',
  `tut0` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tut1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tut2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tut3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tut4` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tut5` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tut6` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tut7` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`accountId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for addons
-- ----------------------------
DROP TABLE IF EXISTS `addons`;
CREATE TABLE `addons`  (
  `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `crc` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Addons' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for armory_character_stats
-- ----------------------------
DROP TABLE IF EXISTS `armory_character_stats`;
CREATE TABLE `armory_character_stats`  (
  `guid` int(11) NOT NULL,
  `data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `save_date` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'World of Warcraft Armory table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for armory_game_chart
-- ----------------------------
DROP TABLE IF EXISTS `armory_game_chart`;
CREATE TABLE `armory_game_chart`  (
  `gameid` int(11) NOT NULL AUTO_INCREMENT,
  `teamid` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `changeType` int(11) NOT NULL,
  `ratingChange` int(11) NOT NULL,
  `teamRating` int(11) NOT NULL,
  `damageDone` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `healingDone` int(11) NOT NULL,
  `damageTaken` int(11) NOT NULL,
  `healingTaken` int(11) NOT NULL,
  `killingBlows` int(11) NOT NULL,
  `mapId` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  PRIMARY KEY (`gameid`, `teamid`, `guid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'WoWArmory Game Chart' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for auctionhouse
-- ----------------------------
DROP TABLE IF EXISTS `auctionhouse`;
CREATE TABLE `auctionhouse`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `auctioneerguid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `itemguid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `itemowner` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `buyoutprice` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `buyguid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lastbid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `startbid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `deposit` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `item_guid`(`itemguid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for autobroadcast
-- ----------------------------
DROP TABLE IF EXISTS `autobroadcast`;
CREATE TABLE `autobroadcast`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bad_sentences
-- ----------------------------
DROP TABLE IF EXISTS `bad_sentences`;
CREATE TABLE `bad_sentences`  (
  `id` int(20) UNSIGNED NOT NULL,
  `sentence` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hash` bigint(20) UNSIGNED NOT NULL,
  `penalty` int(20) NOT NULL DEFAULT 10,
  `sourceMask` int(20) UNSIGNED NOT NULL DEFAULT 1,
  `output` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`hash`) USING BTREE,
  INDEX `hash`(`hash`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for banned_addons
-- ----------------------------
DROP TABLE IF EXISTS `banned_addons`;
CREATE TABLE `banned_addons`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `idx_name_ver`(`Name`, `Version`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for blackmarket_auctions
-- ----------------------------
DROP TABLE IF EXISTS `blackmarket_auctions`;
CREATE TABLE `blackmarket_auctions`  (
  `marketId` int(10) NOT NULL DEFAULT 0,
  `currentBid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `time` int(10) NOT NULL DEFAULT 0,
  `numBids` int(10) NOT NULL DEFAULT 0,
  `bidder` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`marketId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bugreport
-- ----------------------------
DROP TABLE IF EXISTS `bugreport`;
CREATE TABLE `bugreport`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `type` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Debug System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for calendar_events
-- ----------------------------
DROP TABLE IF EXISTS `calendar_events`;
CREATE TABLE `calendar_events`  (
  `EventID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `Owner` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `Title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `EventType` tinyint(1) UNSIGNED NOT NULL DEFAULT 4,
  `TextureID` int(10) NOT NULL DEFAULT -1,
  `Date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `LockDate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`EventID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for calendar_invites
-- ----------------------------
DROP TABLE IF EXISTS `calendar_invites`;
CREATE TABLE `calendar_invites`  (
  `InviteID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `EventID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `Invitee` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `Sender` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `Status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `ResponseTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ModerationRank` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`InviteID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for challenge
-- ----------------------------
DROP TABLE IF EXISTS `challenge`;
CREATE TABLE `challenge`  (
  `ID` int(11) NOT NULL,
  `GuildID` bigint(20) NOT NULL DEFAULT 0,
  `MapID` mediumint(9) NOT NULL DEFAULT 0,
  `ChallengeID` mediumint(6) NOT NULL DEFAULT 0,
  `RecordTime` int(11) NOT NULL DEFAULT 0,
  `Date` int(11) NOT NULL DEFAULT 0,
  `ChallengeLevel` smallint(6) NOT NULL DEFAULT 0,
  `TimerLevel` smallint(6) NOT NULL DEFAULT 0,
  `Affixes` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ChestID` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `mapID`(`MapID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for challenge_key
-- ----------------------------
DROP TABLE IF EXISTS `challenge_key`;
CREATE TABLE `challenge_key`  (
  `guid` int(10) NOT NULL DEFAULT 0,
  `ID` mediumint(6) UNSIGNED NOT NULL DEFAULT 0,
  `Level` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Affix` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Affix1` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Affix2` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `KeyIsCharded` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `timeReset` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `InstanceID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `timeReset`(`timeReset`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for challenge_member
-- ----------------------------
DROP TABLE IF EXISTS `challenge_member`;
CREATE TABLE `challenge_member`  (
  `id` int(11) NOT NULL,
  `member` bigint(20) NOT NULL DEFAULT 0,
  `specID` mediumint(6) NOT NULL DEFAULT 0,
  `ChallengeLevel` smallint(6) NOT NULL DEFAULT 0,
  `Date` int(10) NOT NULL DEFAULT 0,
  `ChestID` int(10) NOT NULL DEFAULT 0,
  INDEX `id`(`id`, `member`) USING BTREE,
  INDEX `member`(`member`) USING BTREE,
  INDEX `Date`(`Date`) USING BTREE,
  INDEX `ChallengeLevel`(`ChallengeLevel`) USING BTREE,
  INDEX `ChestID`(`ChestID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for challenge_oplote_loot
-- ----------------------------
DROP TABLE IF EXISTS `challenge_oplote_loot`;
CREATE TABLE `challenge_oplote_loot`  (
  `guid` int(10) NOT NULL DEFAULT 0,
  `chestListID` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `date` int(10) NOT NULL DEFAULT 0,
  `ChallengeLevel` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for channels
-- ----------------------------
DROP TABLE IF EXISTS `channels`;
CREATE TABLE `channels`  (
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `team` int(10) UNSIGNED NOT NULL,
  `announce` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `ownership` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bannedList` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `lastUsed` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`name`, `team`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `team`(`team`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Channel System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_account_data
-- ----------------------------
DROP TABLE IF EXISTS `character_account_data`;
CREATE TABLE `character_account_data`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  PRIMARY KEY (`guid`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_achievement
-- ----------------------------
DROP TABLE IF EXISTS `character_achievement`;
CREATE TABLE `character_achievement`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `achievement` int(11) UNSIGNED NOT NULL,
  `date` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`guid`, `achievement`) USING BTREE,
  INDEX `achievement`(`achievement`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_achievement_progress
-- ----------------------------
DROP TABLE IF EXISTS `character_achievement_progress`;
CREATE TABLE `character_achievement_progress`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `criteria` int(11) UNSIGNED NOT NULL,
  `counter` int(11) UNSIGNED NOT NULL,
  `date` bigint(11) UNSIGNED NOT NULL DEFAULT 0,
  `achievID` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `completed` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `criteria`) USING BTREE,
  INDEX `criteria`(`criteria`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `achievID`(`achievID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_action
-- ----------------------------
DROP TABLE IF EXISTS `character_action`;
CREATE TABLE `character_action`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `spec` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `button` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `action` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `spec`, `button`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_adventure_quest
-- ----------------------------
DROP TABLE IF EXISTS `character_adventure_quest`;
CREATE TABLE `character_adventure_quest`  (
  `guid` bigint(20) UNSIGNED NOT NULL,
  `questID` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`guid`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `questID`(`questID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_archaeology
-- ----------------------------
DROP TABLE IF EXISTS `character_archaeology`;
CREATE TABLE `character_archaeology`  (
  `guid` bigint(20) NOT NULL,
  `sites` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `counts` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `projects` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Archaeology System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_archaeology_finds
-- ----------------------------
DROP TABLE IF EXISTS `character_archaeology_finds`;
CREATE TABLE `character_archaeology_finds`  (
  `guid` bigint(20) NOT NULL,
  `id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`guid`, `id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_army_training_info
-- ----------------------------
DROP TABLE IF EXISTS `character_army_training_info`;
CREATE TABLE `character_army_training_info`  (
  `guid` bigint(20) NOT NULL,
  `opened_berserk` int(11) NOT NULL DEFAULT 0,
  `opened_mana_wanted` int(11) NOT NULL DEFAULT 0,
  `opened_mage` int(11) NOT NULL DEFAULT 0,
  `opened_hp` tinyint(1) NOT NULL DEFAULT 0,
  `opened_dmg` tinyint(1) NOT NULL DEFAULT 0,
  `opened_fixate` tinyint(1) NOT NULL DEFAULT 0,
  `opened_brave` tinyint(1) NOT NULL DEFAULT 0,
  `opened_chests` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_artifact
-- ----------------------------
DROP TABLE IF EXISTS `character_artifact`;
CREATE TABLE `character_artifact`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `owner` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Power` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `AppearanceID` mediumint(6) UNSIGNED NOT NULL DEFAULT 0,
  `Powers` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`guid`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `owner`(`owner`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_aura
-- ----------------------------
DROP TABLE IF EXISTS `character_aura`;
CREATE TABLE `character_aura`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `slot` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `caster_guid` binary(16) NOT NULL COMMENT 'Full Global Unique Identifier',
  `item_guid` binary(16) NOT NULL,
  `spell` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `effect_mask` mediumint(3) UNSIGNED NOT NULL DEFAULT 0,
  `recalculate_mask` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `stackcount` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `maxduration` int(11) NOT NULL DEFAULT 0,
  `remaintime` int(11) NOT NULL DEFAULT 0,
  `remaincharges` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `caster_guid`, `item_guid`, `spell`, `effect_mask`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `caster_guid`(`caster_guid`) USING BTREE,
  INDEX `item_guid`(`item_guid`) USING BTREE,
  INDEX `spell`(`spell`) USING BTREE,
  INDEX `effect_mask`(`effect_mask`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_aura_effect
-- ----------------------------
DROP TABLE IF EXISTS `character_aura_effect`;
CREATE TABLE `character_aura_effect`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `slot` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `effect` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `baseamount` int(11) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`guid`, `slot`, `effect`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `slot`(`slot`) USING BTREE,
  INDEX `effect`(`effect`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_banned
-- ----------------------------
DROP TABLE IF EXISTS `character_banned`;
CREATE TABLE `character_banned`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `bandate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `unbandate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `bannedby` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `banreason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`guid`, `bandate`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `bandate`(`bandate`) USING BTREE,
  INDEX `unbandate`(`unbandate`) USING BTREE,
  INDEX `active`(`active`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Ban List' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_battle_pet
-- ----------------------------
DROP TABLE IF EXISTS `character_battle_pet`;
CREATE TABLE `character_battle_pet`  (
  `ownerAccID` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `slot_0` bigint(40) UNSIGNED NOT NULL DEFAULT 0,
  `slot_1` bigint(40) UNSIGNED NOT NULL DEFAULT 0,
  `slot_2` bigint(40) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`ownerAccID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_battle_pet_journal
-- ----------------------------
DROP TABLE IF EXISTS `character_battle_pet_journal`;
CREATE TABLE `character_battle_pet_journal`  (
  `guid` bigint(20) UNSIGNED NOT NULL,
  `ownerAccID` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `customName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '\"\"',
  `creatureEntry` int(11) UNSIGNED NULL DEFAULT 0,
  `speciesID` int(11) UNSIGNED NULL DEFAULT 0,
  `spell` int(11) UNSIGNED NULL DEFAULT 0,
  `level` tinyint(4) UNSIGNED NULL DEFAULT 0,
  `displayID` int(11) UNSIGNED NULL DEFAULT 0,
  `power` smallint(6) UNSIGNED NULL DEFAULT 0,
  `speed` smallint(6) UNSIGNED NULL DEFAULT 0,
  `health` int(11) UNSIGNED NULL DEFAULT 0,
  `maxHealth` int(11) UNSIGNED NULL DEFAULT 0,
  `quality` tinyint(4) UNSIGNED NULL DEFAULT 0,
  `xp` smallint(6) UNSIGNED NULL DEFAULT 0,
  `flags` smallint(6) UNSIGNED NULL DEFAULT 0,
  `breedID` smallint(6) NULL DEFAULT -1,
  PRIMARY KEY (`guid`, `ownerAccID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_battleground_data
-- ----------------------------
DROP TABLE IF EXISTS `character_battleground_data`;
CREATE TABLE `character_battleground_data`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `instanceId` int(10) UNSIGNED NOT NULL COMMENT 'Instance Identifier',
  `team` smallint(5) UNSIGNED NOT NULL,
  `joinX` float NOT NULL DEFAULT 0,
  `joinY` float NOT NULL DEFAULT 0,
  `joinZ` float NOT NULL DEFAULT 0,
  `joinO` float NOT NULL DEFAULT 0,
  `joinMapId` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Map Identifier',
  `taxiStart` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `taxiEnd` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mountSpell` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `lastActiveSpec` smallint(6) NULL DEFAULT NULL,
  PRIMARY KEY (`guid`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_battleground_random
-- ----------------------------
DROP TABLE IF EXISTS `character_battleground_random`;
CREATE TABLE `character_battleground_random`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `bg` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `rbg` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `skirmish` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `arena` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `arena2v2` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `arena3v3` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `brawl` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `brawlArena` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_brackets_info
-- ----------------------------
DROP TABLE IF EXISTS `character_brackets_info`;
CREATE TABLE `character_brackets_info`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `bracket` smallint(6) NOT NULL,
  `rating` mediumint(9) NOT NULL DEFAULT 0,
  `oldRating` mediumint(9) NOT NULL DEFAULT 0,
  `best` mediumint(9) NOT NULL DEFAULT 0,
  `oldBest` mediumint(9) NOT NULL DEFAULT 0,
  `bestWeek` smallint(9) NOT NULL DEFAULT 0,
  `mmr` mediumint(9) NOT NULL DEFAULT 0,
  `oldMmr` mediumint(9) NOT NULL DEFAULT 0,
  `games` int(11) NOT NULL DEFAULT 0,
  `oldGames` int(11) NOT NULL DEFAULT 0,
  `wins` int(11) NOT NULL DEFAULT 0,
  `oldWins` int(11) NOT NULL DEFAULT 0,
  `weekGames` mediumint(9) NOT NULL DEFAULT 0,
  `weekWins` mediumint(9) NOT NULL DEFAULT 0,
  `bestWeekLast` mediumint(9) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `bracket`) USING BTREE,
  INDEX `BracketID`(`bracket`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_chat_logos
-- ----------------------------
DROP TABLE IF EXISTS `character_chat_logos`;
CREATE TABLE `character_chat_logos`  (
  `guid` bigint(20) NOT NULL DEFAULT 0,
  `buyed_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `buyed_logo`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_cheat_common
-- ----------------------------
DROP TABLE IF EXISTS `character_cheat_common`;
CREATE TABLE `character_cheat_common`  (
  `guid` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `transmCheatUseCount` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `transmCooldownEnd` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `cheatLootCount` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_cuf_profiles
-- ----------------------------
DROP TABLE IF EXISTS `character_cuf_profiles`;
CREATE TABLE `character_cuf_profiles`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `profileId` tinyint(3) UNSIGNED NOT NULL,
  `profileName` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `frameHeight` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `frameWidth` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `sortBy` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `healthText` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `someOptions` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `unk146` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `unk147` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `unk148` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `unk150` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `unk152` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `unk154` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `profileId`) USING BTREE,
  INDEX `profileId`(`profileId`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_currency
-- ----------------------------
DROP TABLE IF EXISTS `character_currency`;
CREATE TABLE `character_currency`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `currency` smallint(5) UNSIGNED NOT NULL,
  `total_count` int(11) UNSIGNED NOT NULL,
  `week_count` int(11) UNSIGNED NOT NULL,
  `season_total` int(11) NULL DEFAULT 0,
  `flags` int(11) NULL DEFAULT 0,
  `curentcap` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `currency`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_custom_event_reapeter
-- ----------------------------
DROP TABLE IF EXISTS `character_custom_event_reapeter`;
CREATE TABLE `character_custom_event_reapeter`  (
  `guid` bigint(20) NOT NULL,
  `event` int(10) UNSIGNED NOT NULL,
  `repeat_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`guid`, `event`, `repeat_id`) USING BTREE,
  INDEX `select`(`guid`, `event`, `repeat_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_custom_reward
-- ----------------------------
DROP TABLE IF EXISTS `character_custom_reward`;
CREATE TABLE `character_custom_reward`  (
  `guid` int(11) NOT NULL,
  `reward_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_deathmatch
-- ----------------------------
DROP TABLE IF EXISTS `character_deathmatch`;
CREATE TABLE `character_deathmatch`  (
  `guid` bigint(20) NOT NULL DEFAULT 0,
  `kills` int(11) NOT NULL DEFAULT 0,
  `deaths` int(11) NOT NULL DEFAULT 0,
  `damage` bigint(20) NOT NULL DEFAULT 0,
  `rating` int(11) NOT NULL DEFAULT 0,
  `matches` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_deathmatch_products
-- ----------------------------
DROP TABLE IF EXISTS `character_deathmatch_products`;
CREATE TABLE `character_deathmatch_products`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `product` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cost` int(11) NOT NULL,
  PRIMARY KEY (`product`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_deathmatch_store
-- ----------------------------
DROP TABLE IF EXISTS `character_deathmatch_store`;
CREATE TABLE `character_deathmatch_store`  (
  `guid` bigint(20) NOT NULL DEFAULT 0,
  `total_kills` int(11) NOT NULL DEFAULT 0,
  `selected_morph` int(11) NOT NULL DEFAULT 0,
  `buyed_morphs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`guid`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_declinedname
-- ----------------------------
DROP TABLE IF EXISTS `character_declinedname`;
CREATE TABLE `character_declinedname`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `genitive` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `dative` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `accusative` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `instrumental` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `prepositional` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_donate
-- ----------------------------
DROP TABLE IF EXISTS `character_donate`;
CREATE TABLE `character_donate`  (
  `owner_guid` int(10) UNSIGNED NOT NULL,
  `itemguid` int(10) UNSIGNED NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `itemEntry` int(10) UNSIGNED NOT NULL,
  `efircount` int(10) UNSIGNED NOT NULL,
  `count` int(10) UNSIGNED NOT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `deletedate` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `account` int(11) NOT NULL DEFAULT 0,
  UNIQUE INDEX `index`(`owner_guid`, `itemguid`, `type`) USING BTREE,
  INDEX `owner_guid`(`owner_guid`) USING BTREE,
  INDEX `itemguid`(`itemguid`) USING BTREE,
  INDEX `itemEntry`(`itemEntry`) USING BTREE,
  INDEX `state`(`state`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_donate_service
-- ----------------------------
DROP TABLE IF EXISTS `character_donate_service`;
CREATE TABLE `character_donate_service`  (
  `account` int(11) NOT NULL DEFAULT 0,
  `guid` bigint(20) NOT NULL DEFAULT 0,
  `service` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `cost` int(10) NOT NULL DEFAULT 0,
  `targetguid` int(11) NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_dungeon_affixes
-- ----------------------------
DROP TABLE IF EXISTS `character_dungeon_affixes`;
CREATE TABLE `character_dungeon_affixes`  (
  `Affix` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Affix1` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Affix2` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`Affix`, `Affix1`, `Affix2`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'mythic+ affixes' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_equipmentsets
-- ----------------------------
DROP TABLE IF EXISTS `character_equipmentsets`;
CREATE TABLE `character_equipmentsets`  (
  `guid` bigint(20) NOT NULL DEFAULT 0,
  `setguid` bigint(20) NOT NULL AUTO_INCREMENT,
  `setindex` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `iconname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ignore_mask` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `AssignedSpecIndex` int(11) NOT NULL DEFAULT -1,
  `item0` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `item1` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `item2` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `item3` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `item4` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `item5` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `item6` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `item7` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `item8` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `item9` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `item10` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `item11` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `item12` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `item13` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `item14` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `item15` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `item16` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `item17` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `item18` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`setguid`) USING BTREE,
  UNIQUE INDEX `idx_set`(`guid`, `setguid`, `setindex`) USING BTREE,
  INDEX `Idx_setindex`(`setindex`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_feed_log
-- ----------------------------
DROP TABLE IF EXISTS `character_feed_log`;
CREATE TABLE `character_feed_log`  (
  `guid` int(11) NOT NULL,
  `type` smallint(1) NOT NULL,
  `data` int(11) NOT NULL,
  `date` int(11) NULL DEFAULT NULL,
  `counter` int(11) NOT NULL,
  `difficulty` smallint(6) NULL DEFAULT -1,
  `item_guid` int(11) NULL DEFAULT -1,
  `item_quality` smallint(6) NOT NULL DEFAULT -1,
  PRIMARY KEY (`guid`, `type`, `data`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for character_garrison
-- ----------------------------
DROP TABLE IF EXISTS `character_garrison`;
CREATE TABLE `character_garrison`  (
  `CharacterGuid` bigint(20) UNSIGNED NOT NULL,
  `SiteLevelId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `GarrTypeId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `FollowerActivationsRemainingToday` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `NumFollowerActivationRegenTimestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `CacheLastUsage` int(11) NOT NULL DEFAULT 0,
  `_MissionGen` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`CharacterGuid`, `SiteLevelId`, `GarrTypeId`) USING BTREE,
  INDEX `guid`(`CharacterGuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_garrison_blueprints
-- ----------------------------
DROP TABLE IF EXISTS `character_garrison_blueprints`;
CREATE TABLE `character_garrison_blueprints`  (
  `guid` bigint(20) UNSIGNED NOT NULL,
  `GarrTypeId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `buildingId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `buildingId`, `GarrTypeId`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `buildingId`(`buildingId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_garrison_buildings
-- ----------------------------
DROP TABLE IF EXISTS `character_garrison_buildings`;
CREATE TABLE `character_garrison_buildings`  (
  `guid` bigint(20) UNSIGNED NOT NULL,
  `GarrTypeId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `plotInstanceId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `buildingId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `timeBuilt` bigint(20) UNSIGNED NOT NULL,
  `data` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `GarrTypeId`, `plotInstanceId`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `plotInstanceId`(`plotInstanceId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_garrison_follower_abilities
-- ----------------------------
DROP TABLE IF EXISTS `character_garrison_follower_abilities`;
CREATE TABLE `character_garrison_follower_abilities`  (
  `dbId` bigint(20) UNSIGNED NOT NULL,
  `abilityId` int(10) UNSIGNED NOT NULL,
  `GarrTypeId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `slot` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `isItemTrait` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`dbId`, `slot`, `GarrTypeId`) USING BTREE,
  INDEX `dbId`(`dbId`) USING BTREE,
  INDEX `abilityId`(`abilityId`) USING BTREE,
  INDEX `slot`(`slot`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_garrison_followers
-- ----------------------------
DROP TABLE IF EXISTS `character_garrison_followers`;
CREATE TABLE `character_garrison_followers`  (
  `dbId` bigint(20) UNSIGNED NOT NULL,
  `guid` bigint(20) UNSIGNED NOT NULL,
  `followerId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `GarrTypeId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Durability` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  `quality` int(10) UNSIGNED NOT NULL DEFAULT 2,
  `level` int(10) UNSIGNED NOT NULL DEFAULT 90,
  `itemLevelWeapon` int(10) UNSIGNED NOT NULL DEFAULT 600,
  `itemLevelArmor` int(10) UNSIGNED NOT NULL DEFAULT 600,
  `xp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `currentBuilding` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `currentMission` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`dbId`) USING BTREE,
  INDEX `idx_guid_id`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_garrison_missions
-- ----------------------------
DROP TABLE IF EXISTS `character_garrison_missions`;
CREATE TABLE `character_garrison_missions`  (
  `dbId` bigint(20) UNSIGNED NOT NULL,
  `guid` bigint(20) UNSIGNED NOT NULL,
  `missionRecID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `GarrTypeId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `offerTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `offerDuration` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `startTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `travelDuration` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `missionDuration` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `missionState` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `chance` smallint(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`dbId`) USING BTREE,
  UNIQUE INDEX `idx_guid_id`(`guid`, `missionRecID`) USING BTREE,
  INDEX `dbId`(`dbId`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `missionRecID`(`missionRecID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_garrison_shipment
-- ----------------------------
DROP TABLE IF EXISTS `character_garrison_shipment`;
CREATE TABLE `character_garrison_shipment`  (
  `dbId` bigint(20) NOT NULL,
  `guid` bigint(10) NOT NULL,
  `shipmentID` smallint(5) NOT NULL,
  `GarrTypeId` smallint(5) NOT NULL DEFAULT 0,
  `start` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `end` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`dbId`) USING BTREE,
  INDEX `dbId`(`dbId`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_garrison_talents
-- ----------------------------
DROP TABLE IF EXISTS `character_garrison_talents`;
CREATE TABLE `character_garrison_talents`  (
  `guid` bigint(20) NOT NULL,
  `GarrTypeId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `talentID` int(11) NOT NULL,
  `orderTime` int(11) NOT NULL,
  `flags` int(11) NOT NULL,
  PRIMARY KEY (`guid`, `GarrTypeId`, `talentID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_gifts
-- ----------------------------
DROP TABLE IF EXISTS `character_gifts`;
CREATE TABLE `character_gifts`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `item_guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `entry` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`item_guid`) USING BTREE,
  INDEX `idx_guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_glyphs
-- ----------------------------
DROP TABLE IF EXISTS `character_glyphs`;
CREATE TABLE `character_glyphs`  (
  `guid` bigint(20) NOT NULL,
  `talentGroup` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `glyphId` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `talentGroup`, `glyphId`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `talentGroup`(`talentGroup`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_homebind
-- ----------------------------
DROP TABLE IF EXISTS `character_homebind`;
CREATE TABLE `character_homebind`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `mapId` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Map Identifier',
  `zoneId` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Zone Identifier',
  `posX` float NOT NULL DEFAULT 0,
  `posY` float NOT NULL DEFAULT 0,
  `posZ` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_honor
-- ----------------------------
DROP TABLE IF EXISTS `character_honor`;
CREATE TABLE `character_honor`  (
  `Guid` bigint(20) NOT NULL DEFAULT 0,
  `CurrentHonorAtLevel` mediumint(10) NOT NULL DEFAULT 0,
  `HonorLevel` smallint(5) NOT NULL DEFAULT 0,
  `PrestigeLevel` smallint(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Honor info system' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_instance
-- ----------------------------
DROP TABLE IF EXISTS `character_instance`;
CREATE TABLE `character_instance`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `instance` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `permanent` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `map` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `difficulty` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `completedEncounters` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Extended` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `resetTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `instance`) USING BTREE,
  INDEX `instance`(`instance`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_inventory
-- ----------------------------
DROP TABLE IF EXISTS `character_inventory`;
CREATE TABLE `character_inventory`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `bag` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `slot` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `item` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`item`) USING BTREE,
  UNIQUE INDEX `guid`(`guid`, `bag`, `slot`) USING BTREE,
  INDEX `idx_guid`(`guid`) USING BTREE,
  INDEX `bag`(`bag`) USING BTREE,
  INDEX `slot`(`slot`) USING BTREE,
  INDEX `item`(`item`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_kill
-- ----------------------------
DROP TABLE IF EXISTS `character_kill`;
CREATE TABLE `character_kill`  (
  `guid` bigint(20) NOT NULL DEFAULT 0,
  `victim_guid` bigint(20) NOT NULL DEFAULT 0,
  `count` tinyint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `victim_guid`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `victim_guid`(`victim_guid`) USING BTREE,
  INDEX `count`(`count`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Kills Yesterday' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_lfg_cooldown
-- ----------------------------
DROP TABLE IF EXISTS `character_lfg_cooldown`;
CREATE TABLE `character_lfg_cooldown`  (
  `guid` int(10) NOT NULL DEFAULT 0,
  `dungeonId` int(10) NOT NULL DEFAULT 0,
  `respawnTime` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `dungeonId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_loot_cooldown
-- ----------------------------
DROP TABLE IF EXISTS `character_loot_cooldown`;
CREATE TABLE `character_loot_cooldown`  (
  `guid` int(11) UNSIGNED NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT 0,
  `entry` int(11) NOT NULL DEFAULT 0,
  `difficultyID` tinyint(3) NOT NULL DEFAULT 0,
  `respawnTime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `type`, `entry`, `difficultyID`) USING BTREE,
  INDEX `entry`(`entry`) USING BTREE,
  INDEX `respawnTime`(`respawnTime`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_pet
-- ----------------------------
DROP TABLE IF EXISTS `character_pet`;
CREATE TABLE `character_pet`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entry` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `owner` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `modelid` int(10) UNSIGNED NULL DEFAULT 0,
  `CreatedBySpell` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `PetType` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `level` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `exp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Reactstate` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(21) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Pet',
  `renamed` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `curhealth` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `curmana` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `savetime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `abdata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `specialization` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `owner`(`owner`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `entry`(`entry`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Pet System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_pet_declinedname
-- ----------------------------
DROP TABLE IF EXISTS `character_pet_declinedname`;
CREATE TABLE `character_pet_declinedname`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `owner` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `genitive` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `dative` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `accusative` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `instrumental` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `prepositional` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `owner_key`(`owner`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_pool_guid
-- ----------------------------
DROP TABLE IF EXISTS `character_pool_guid`;
CREATE TABLE `character_pool_guid`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `count` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `start` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `end` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `type`) USING BTREE,
  INDEX `start`(`start`) USING BTREE,
  INDEX `end`(`end`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_pvp_talent
-- ----------------------------
DROP TABLE IF EXISTS `character_pvp_talent`;
CREATE TABLE `character_pvp_talent`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `talent` mediumint(8) UNSIGNED NOT NULL,
  `spec` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `talent`, `spec`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `talent`(`talent`) USING BTREE,
  INDEX `spec`(`spec`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_quests_ignored
-- ----------------------------
DROP TABLE IF EXISTS `character_quests_ignored`;
CREATE TABLE `character_quests_ignored`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `questID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `questID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_queststatus
-- ----------------------------
DROP TABLE IF EXISTS `character_queststatus`;
CREATE TABLE `character_queststatus`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `account` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `quest` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `timer` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `quest`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_queststatus_daily
-- ----------------------------
DROP TABLE IF EXISTS `character_queststatus_daily`;
CREATE TABLE `character_queststatus_daily`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `account` int(11) NOT NULL DEFAULT 0,
  `quest` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quest Identifier',
  `time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `quest`) USING BTREE,
  INDEX `idx_guid`(`guid`) USING BTREE,
  INDEX `account`(`account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_queststatus_objectives
-- ----------------------------
DROP TABLE IF EXISTS `character_queststatus_objectives`;
CREATE TABLE `character_queststatus_objectives`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `account` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `quest` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `objective` tinyint(3) NOT NULL DEFAULT 0,
  `data` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `quest`, `objective`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `account`(`account`) USING BTREE,
  INDEX `quest`(`quest`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_queststatus_rewarded
-- ----------------------------
DROP TABLE IF EXISTS `character_queststatus_rewarded`;
CREATE TABLE `character_queststatus_rewarded`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `account` int(11) NOT NULL DEFAULT 0,
  `quest` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`, `quest`) USING BTREE,
  INDEX `account`(`account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_queststatus_seasonal
-- ----------------------------
DROP TABLE IF EXISTS `character_queststatus_seasonal`;
CREATE TABLE `character_queststatus_seasonal`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `account` int(11) NOT NULL DEFAULT 0,
  `quest` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quest Identifier',
  `event` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Event Identifier',
  PRIMARY KEY (`guid`, `quest`) USING BTREE,
  INDEX `idx_guid`(`guid`) USING BTREE,
  INDEX `account`(`account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_queststatus_weekly
-- ----------------------------
DROP TABLE IF EXISTS `character_queststatus_weekly`;
CREATE TABLE `character_queststatus_weekly`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `account` int(11) NOT NULL DEFAULT 0,
  `quest` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`, `quest`) USING BTREE,
  INDEX `idx_guid`(`guid`) USING BTREE,
  INDEX `account`(`account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_queststatus_world
-- ----------------------------
DROP TABLE IF EXISTS `character_queststatus_world`;
CREATE TABLE `character_queststatus_world`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `account` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `quest` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `resetTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `quest`) USING BTREE,
  INDEX `resetTime`(`resetTime`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_rates
-- ----------------------------
DROP TABLE IF EXISTS `character_rates`;
CREATE TABLE `character_rates`  (
  `guid` bigint(20) NOT NULL DEFAULT 0,
  `rate` tinyint(2) NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_rename
-- ----------------------------
DROP TABLE IF EXISTS `character_rename`;
CREATE TABLE `character_rename`  (
  `guid` int(11) UNSIGNED NOT NULL,
  `account` int(11) UNSIGNED NOT NULL,
  `newname` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `oldname` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `account`(`account`) USING BTREE,
  INDEX `newname`(`newname`) USING BTREE,
  INDEX `oldname`(`oldname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_reputation
-- ----------------------------
DROP TABLE IF EXISTS `character_reputation`;
CREATE TABLE `character_reputation`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `faction` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `standing` int(11) NOT NULL DEFAULT 0,
  `flags` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `faction`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `faction`(`faction`) USING BTREE,
  INDEX `standing`(`standing`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_reward
-- ----------------------------
DROP TABLE IF EXISTS `character_reward`;
CREATE TABLE `character_reward`  (
  `guid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner_guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(5) UNSIGNED NOT NULL DEFAULT 0,
  `id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `count` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE,
  INDEX `owner_guid`(`owner_guid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6258 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_share
-- ----------------------------
DROP TABLE IF EXISTS `character_share`;
CREATE TABLE `character_share`  (
  `guid` bigint(20) UNSIGNED NOT NULL,
  `bonus1` tinyint(1) NOT NULL DEFAULT 0,
  `bonus2` tinyint(1) NOT NULL DEFAULT 0,
  `bonus3` tinyint(1) NOT NULL DEFAULT 0,
  `bonus4` tinyint(1) NOT NULL DEFAULT 0,
  `bonus5` tinyint(1) NOT NULL DEFAULT 0,
  `bonus6` tinyint(1) NOT NULL DEFAULT 0,
  `bonus7` tinyint(1) NOT NULL DEFAULT 0,
  `bonus8` tinyint(1) NOT NULL DEFAULT 0,
  `bonus9` tinyint(1) NOT NULL DEFAULT 0,
  `bonus10` tinyint(1) NOT NULL DEFAULT 0,
  `bonus11` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_skills
-- ----------------------------
DROP TABLE IF EXISTS `character_skills`;
CREATE TABLE `character_skills`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill` smallint(5) UNSIGNED NOT NULL,
  `value` smallint(5) UNSIGNED NOT NULL,
  `max` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`guid`, `skill`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `skill`(`skill`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_social
-- ----------------------------
DROP TABLE IF EXISTS `character_social`;
CREATE TABLE `character_social`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `friend` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `flags` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Friend Flags',
  `note` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Friend Note',
  PRIMARY KEY (`guid`, `friend`, `flags`) USING BTREE,
  INDEX `friend`(`friend`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_spell
-- ----------------------------
DROP TABLE IF EXISTS `character_spell`;
CREATE TABLE `character_spell`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `spell` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Spell Identifier',
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `disabled` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `spell`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `spell`(`spell`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_spell_cooldown
-- ----------------------------
DROP TABLE IF EXISTS `character_spell_cooldown`;
CREATE TABLE `character_spell_cooldown`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `spell` mediumint(8) NOT NULL DEFAULT 0 COMMENT 'Spell Identifier',
  `item` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Item Identifier',
  `time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `spell`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_stat_kill_creature
-- ----------------------------
DROP TABLE IF EXISTS `character_stat_kill_creature`;
CREATE TABLE `character_stat_kill_creature`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `entry` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `count` int(10) UNSIGNED NULL DEFAULT 0,
  `point` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `entry`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `entry`(`entry`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_stats
-- ----------------------------
DROP TABLE IF EXISTS `character_stats`;
CREATE TABLE `character_stats`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `maxhealth` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxpower1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxpower2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxpower3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxpower4` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxpower5` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxpower6` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `strength` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `agility` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `stamina` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `intellect` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `spirit` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `armor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `resHoly` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `resFire` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `resNature` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `resFrost` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `resShadow` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `resArcane` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `blockPct` float UNSIGNED NOT NULL DEFAULT 0,
  `dodgePct` float UNSIGNED NOT NULL DEFAULT 0,
  `parryPct` float UNSIGNED NOT NULL DEFAULT 0,
  `critPct` float UNSIGNED NOT NULL DEFAULT 0,
  `rangedCritPct` float UNSIGNED NOT NULL DEFAULT 0,
  `spellCritPct` float UNSIGNED NOT NULL DEFAULT 0,
  `attackPower` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rangedAttackPower` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `spellPower` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `resilience` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_talent
-- ----------------------------
DROP TABLE IF EXISTS `character_talent`;
CREATE TABLE `character_talent`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `talent` mediumint(8) UNSIGNED NOT NULL,
  `spec` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `talent`, `spec`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `spec`(`spec`) USING BTREE,
  INDEX `talent`(`talent`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_transmog_outfits
-- ----------------------------
DROP TABLE IF EXISTS `character_transmog_outfits`;
CREATE TABLE `character_transmog_outfits`  (
  `guid` bigint(20) NOT NULL DEFAULT 0,
  `setguid` bigint(20) NOT NULL AUTO_INCREMENT,
  `setindex` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `iconname` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ignore_mask` int(11) NOT NULL DEFAULT 0,
  `appearance0` int(10) NOT NULL DEFAULT 0,
  `appearance1` int(10) NOT NULL DEFAULT 0,
  `appearance2` int(10) NOT NULL DEFAULT 0,
  `appearance3` int(10) NOT NULL DEFAULT 0,
  `appearance4` int(10) NOT NULL DEFAULT 0,
  `appearance5` int(10) NOT NULL DEFAULT 0,
  `appearance6` int(10) NOT NULL DEFAULT 0,
  `appearance7` int(10) NOT NULL DEFAULT 0,
  `appearance8` int(10) NOT NULL DEFAULT 0,
  `appearance9` int(10) NOT NULL DEFAULT 0,
  `appearance10` int(10) NOT NULL DEFAULT 0,
  `appearance11` int(10) NOT NULL DEFAULT 0,
  `appearance12` int(10) NOT NULL DEFAULT 0,
  `appearance13` int(10) NOT NULL DEFAULT 0,
  `appearance14` int(10) NOT NULL DEFAULT 0,
  `appearance15` int(10) NOT NULL DEFAULT 0,
  `appearance16` int(10) NOT NULL DEFAULT 0,
  `appearance17` int(10) NOT NULL DEFAULT 0,
  `appearance18` int(10) NOT NULL DEFAULT 0,
  `mainHandEnchant` int(10) NOT NULL DEFAULT 0,
  `offHandEnchant` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`setguid`) USING BTREE,
  UNIQUE INDEX `idx_set`(`guid`, `setguid`, `setindex`) USING BTREE,
  INDEX `Idx_setindex`(`setindex`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_transmogs
-- ----------------------------
DROP TABLE IF EXISTS `character_transmogs`;
CREATE TABLE `character_transmogs`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ModelID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Condition` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `ModelID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_visual_enchant
-- ----------------------------
DROP TABLE IF EXISTS `character_visual_enchant`;
CREATE TABLE `character_visual_enchant`  (
  `guid` int(11) UNSIGNED NOT NULL COMMENT 'guid player',
  `item_guid` int(11) UNSIGNED NOT NULL COMMENT 'guid of item on DB',
  `enchantId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'id diplay',
  `slot` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `item_guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'custom table for visual_enchant' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_visuals
-- ----------------------------
DROP TABLE IF EXISTS `character_visuals`;
CREATE TABLE `character_visuals`  (
  `guid` bigint(20) NOT NULL DEFAULT 0,
  `head` int(11) NOT NULL DEFAULT 0,
  `shoulders` int(11) NOT NULL DEFAULT 0,
  `chest` int(11) NOT NULL DEFAULT 0,
  `waist` int(11) NOT NULL DEFAULT 0,
  `legs` int(11) NOT NULL DEFAULT 0,
  `feet` int(11) NOT NULL DEFAULT 0,
  `wrists` int(11) NOT NULL DEFAULT 0,
  `hands` int(11) NOT NULL DEFAULT 0,
  `back` int(11) NOT NULL DEFAULT 0,
  `main` int(11) NOT NULL DEFAULT 0,
  `off` int(11) NOT NULL DEFAULT 0,
  `ranged` int(11) NOT NULL DEFAULT 0,
  `tabard` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `shirt` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for character_void_storage
-- ----------------------------
DROP TABLE IF EXISTS `character_void_storage`;
CREATE TABLE `character_void_storage`  (
  `itemId` bigint(20) UNSIGNED NOT NULL,
  `playerGuid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `itemEntry` mediumint(8) UNSIGNED NOT NULL,
  `slot` int(10) UNSIGNED NOT NULL,
  `creatorGuid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `randomPropertyType` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `randomProperty` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `suffixFactor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemGuid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`itemId`) USING BTREE,
  UNIQUE INDEX `idx_player_slot`(`playerGuid`, `slot`) USING BTREE,
  INDEX `idx_player`(`playerGuid`) USING BTREE,
  INDEX `randomProperty`(`randomProperty`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for characters
-- ----------------------------
DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `account` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Account Identifier',
  `name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slot` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `race` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `class` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `gender` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `xp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `money` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skin` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `face` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `hairStyle` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `hairColor` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `tattoo` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `horn` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `inventorySlots` tinyint(3) UNSIGNED NOT NULL DEFAULT 16,
  `blindfold` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `facialStyle` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `bankSlots` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `drunk` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `playerFlags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `playerFlagsEx` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `position_x` float NOT NULL DEFAULT 0,
  `position_y` float NOT NULL DEFAULT 0,
  `position_z` float NOT NULL DEFAULT 0,
  `map` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Map Identifier',
  `instance_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `dungeonDifficulty` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `raidDifficulty` tinyint(3) UNSIGNED NOT NULL DEFAULT 14,
  `legacyRaidDifficulty` tinyint(3) UNSIGNED NOT NULL DEFAULT 3,
  `orientation` float NOT NULL DEFAULT 0,
  `taximask` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `online` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `cinematic` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `totaltime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `leveltime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_time` int(10) NOT NULL DEFAULT 0,
  `logout_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_logout_resting` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `rest_bonus` float NOT NULL DEFAULT 0,
  `trans_x` float NOT NULL DEFAULT 0,
  `trans_y` float NOT NULL DEFAULT 0,
  `trans_z` float NOT NULL DEFAULT 0,
  `trans_o` float NOT NULL DEFAULT 0,
  `transguid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `extra_flags` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `at_login` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `zone` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `death_expire_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `taxi_path` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `totalKills` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `todayKills` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `yesterdayKills` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `killPoints` float NOT NULL DEFAULT 0,
  `chosenTitle` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `watchedFaction` int(10) NOT NULL DEFAULT -1,
  `lfgBonusFaction` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `health` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mana` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `latency` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `activespec` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `specialization` int(11) NOT NULL,
  `lootspecialization` int(11) NOT NULL DEFAULT 0,
  `exploredZones` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `equipmentCache` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `knownTitles` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `actionBars` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `currentpetnumber` int(11) NOT NULL,
  `petslot` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grantableLevels` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `deleteInfos_Account` int(10) UNSIGNED NULL DEFAULT NULL,
  `deleteInfos_Name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deleteDate` int(10) UNSIGNED NULL DEFAULT NULL,
  `LastCharacterUndelete` int(10) UNSIGNED NULL DEFAULT NULL,
  `transfer` tinyint(3) NOT NULL DEFAULT 0,
  `transfer_request` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `transfer_history` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE,
  INDEX `account`(`account`) USING BTREE,
  INDEX `online`(`online`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for corpse
-- ----------------------------
DROP TABLE IF EXISTS `corpse`;
CREATE TABLE `corpse`  (
  `corpseGuid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `posX` float NOT NULL DEFAULT 0,
  `posY` float NOT NULL DEFAULT 0,
  `posZ` float NOT NULL DEFAULT 0,
  `orientation` float NOT NULL DEFAULT 0,
  `mapId` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Map Identifier',
  `phaseMask` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `displayId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemCache` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bytes1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `bytes2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `flags` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `dynFlags` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `corpseType` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `instanceId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Instance Identifier',
  PRIMARY KEY (`corpseGuid`) USING BTREE,
  INDEX `idx_type`(`corpseType`) USING BTREE,
  INDEX `idx_instance`(`instanceId`) USING BTREE,
  INDEX `idx_player`(`guid`) USING BTREE,
  INDEX `idx_time`(`time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Death System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for creature_respawn
-- ----------------------------
DROP TABLE IF EXISTS `creature_respawn`;
CREATE TABLE `creature_respawn`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `respawnTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mapId` smallint(10) UNSIGNED NOT NULL DEFAULT 0,
  `instanceId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Instance Identifier',
  PRIMARY KEY (`guid`, `instanceId`) USING BTREE,
  INDEX `instanceId`(`instanceId`) USING BTREE,
  INDEX `respawnTime`(`respawnTime`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `mapId`(`mapId`) USING BTREE,
  INDEX `all`(`guid`, `respawnTime`, `mapId`, `instanceId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Grid Loading System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for game_event_condition_save
-- ----------------------------
DROP TABLE IF EXISTS `game_event_condition_save`;
CREATE TABLE `game_event_condition_save`  (
  `eventEntry` mediumint(6) UNSIGNED NOT NULL,
  `condition_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `done` float NULL DEFAULT 0,
  PRIMARY KEY (`eventEntry`, `condition_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for game_event_save
-- ----------------------------
DROP TABLE IF EXISTS `game_event_save`;
CREATE TABLE `game_event_save`  (
  `eventEntry` mediumint(6) UNSIGNED NOT NULL,
  `state` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `next_start` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`eventEntry`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for gameobject_respawn
-- ----------------------------
DROP TABLE IF EXISTS `gameobject_respawn`;
CREATE TABLE `gameobject_respawn`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `respawnTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mapId` smallint(10) UNSIGNED NOT NULL DEFAULT 0,
  `instanceId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Instance Identifier',
  PRIMARY KEY (`guid`, `instanceId`) USING BTREE,
  INDEX `instanceId`(`instanceId`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `mapId`(`mapId`) USING BTREE,
  INDEX `respawnTime`(`respawnTime`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Grid Loading System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for gm_subsurveys
-- ----------------------------
DROP TABLE IF EXISTS `gm_subsurveys`;
CREATE TABLE `gm_subsurveys`  (
  `surveyId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subsurveyId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rank` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`surveyId`, `subsurveyId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for gm_surveys
-- ----------------------------
DROP TABLE IF EXISTS `gm_surveys`;
CREATE TABLE `gm_surveys`  (
  `surveyId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `mainSurvey` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `overallComment` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`surveyId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for gm_tickets
-- ----------------------------
DROP TABLE IF EXISTS `gm_tickets`;
CREATE TABLE `gm_tickets`  (
  `ticketId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Name of ticket creator',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mapId` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `posX` float NOT NULL DEFAULT 0,
  `posY` float NOT NULL DEFAULT 0,
  `posZ` float NOT NULL DEFAULT 0,
  `lastModifiedTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `closedBy` bigint(20) NOT NULL DEFAULT 0,
  `assignedTo` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `completed` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `escalated` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `viewed` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`ticketId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for group_instance
-- ----------------------------
DROP TABLE IF EXISTS `group_instance`;
CREATE TABLE `group_instance`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `instance` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `permanent` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `map` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `difficulty` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `completedEncounters` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `resetTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`guid`, `instance`) USING BTREE,
  INDEX `instance`(`instance`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for group_member
-- ----------------------------
DROP TABLE IF EXISTS `group_member`;
CREATE TABLE `group_member`  (
  `guid` int(10) UNSIGNED NOT NULL,
  `memberGuid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `memberFlags` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `subgroup` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `roles` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`memberGuid`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `memberGuid`(`memberGuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Groups' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `guid` int(10) UNSIGNED NOT NULL,
  `leaderGuid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lootMethod` tinyint(3) UNSIGNED NOT NULL,
  `looterGuid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lootThreshold` tinyint(3) UNSIGNED NOT NULL,
  `icon1` binary(16) NOT NULL,
  `icon2` binary(16) NOT NULL,
  `icon3` binary(16) NOT NULL,
  `icon4` binary(16) NOT NULL,
  `icon5` binary(16) NOT NULL,
  `icon6` binary(16) NOT NULL,
  `icon7` binary(16) NOT NULL,
  `icon8` binary(16) NOT NULL,
  `groupType` tinyint(3) UNSIGNED NOT NULL,
  `difficulty` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `raidDifficulty` tinyint(3) UNSIGNED NOT NULL DEFAULT 14,
  `legacyRaidDifficulty` tinyint(3) UNSIGNED NOT NULL DEFAULT 3,
  PRIMARY KEY (`guid`) USING BTREE,
  INDEX `leaderGuid`(`leaderGuid`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Groups' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for guild
-- ----------------------------
DROP TABLE IF EXISTS `guild`;
CREATE TABLE `guild`  (
  `guildid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `leaderguid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `flags` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `EmblemStyle` int(10) NOT NULL DEFAULT -1,
  `EmblemColor` int(10) NOT NULL DEFAULT -1,
  `BorderStyle` int(10) NOT NULL DEFAULT -1,
  `BorderColor` int(10) NOT NULL DEFAULT -1,
  `BackgroundColor` int(10) NOT NULL DEFAULT -1,
  `info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `motd` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `createdate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `BankMoney` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `level` int(10) UNSIGNED NULL DEFAULT 1,
  PRIMARY KEY (`guildid`) USING BTREE,
  INDEX `guildid`(`guildid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Guild System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for guild_achievement
-- ----------------------------
DROP TABLE IF EXISTS `guild_achievement`;
CREATE TABLE `guild_achievement`  (
  `guildId` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `achievement` int(11) UNSIGNED NOT NULL,
  `date` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `guids` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`guildId`, `achievement`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for guild_achievement_progress
-- ----------------------------
DROP TABLE IF EXISTS `guild_achievement_progress`;
CREATE TABLE `guild_achievement_progress`  (
  `guildId` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `criteria` int(11) UNSIGNED NOT NULL,
  `counter` int(11) UNSIGNED NOT NULL,
  `date` bigint(11) UNSIGNED NOT NULL DEFAULT 0,
  `completedGuid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `achievID` int(10) UNSIGNED NOT NULL,
  `completed` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guildId`, `criteria`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for guild_bank_eventlog
-- ----------------------------
DROP TABLE IF EXISTS `guild_bank_eventlog`;
CREATE TABLE `guild_bank_eventlog`  (
  `guildId` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `LogGuid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Log record identificator - auxiliary column',
  `TabId` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Guild bank TabId',
  `EventType` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Event type',
  `PlayerGuid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `ItemOrMoney` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `ItemStackCount` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `DestTabId` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Destination Tab Id',
  `TimeStamp` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildId`, `LogGuid`, `TabId`) USING BTREE,
  INDEX `guildid_key`(`guildId`) USING BTREE,
  INDEX `Idx_PlayerGuid`(`PlayerGuid`) USING BTREE,
  INDEX `Idx_LogGuid`(`LogGuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for guild_bank_item
-- ----------------------------
DROP TABLE IF EXISTS `guild_bank_item`;
CREATE TABLE `guild_bank_item`  (
  `guildId` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `TabId` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `SlotId` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `item_guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guildId`, `TabId`, `SlotId`) USING BTREE,
  INDEX `guildid_key`(`guildId`) USING BTREE,
  INDEX `Idx_item_guid`(`item_guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for guild_bank_right
-- ----------------------------
DROP TABLE IF EXISTS `guild_bank_right`;
CREATE TABLE `guild_bank_right`  (
  `guildId` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `TabId` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `rid` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `gbright` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `SlotPerDay` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guildId`, `TabId`, `rid`) USING BTREE,
  INDEX `guildid_key`(`guildId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for guild_bank_tab
-- ----------------------------
DROP TABLE IF EXISTS `guild_bank_tab`;
CREATE TABLE `guild_bank_tab`  (
  `guildId` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `TabId` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `TabName` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `TabIcon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `TabText` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`guildId`, `TabId`) USING BTREE,
  INDEX `guildid_key`(`guildId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for guild_challenges
-- ----------------------------
DROP TABLE IF EXISTS `guild_challenges`;
CREATE TABLE `guild_challenges`  (
  `GuildId` int(10) UNSIGNED NOT NULL,
  `ChallengeType` int(1) NOT NULL DEFAULT 0,
  `ChallengeCount` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`GuildId`, `ChallengeType`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for guild_eventlog
-- ----------------------------
DROP TABLE IF EXISTS `guild_eventlog`;
CREATE TABLE `guild_eventlog`  (
  `guildId` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `LogGuid` int(10) UNSIGNED NOT NULL COMMENT 'Log record identificator - auxiliary column',
  `EventType` tinyint(3) UNSIGNED NOT NULL COMMENT 'Event type',
  `PlayerGuid1` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `PlayerGuid2` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `NewRank` tinyint(3) UNSIGNED NOT NULL COMMENT 'New rank(in case promotion/demotion)',
  `TimeStamp` int(10) UNSIGNED NOT NULL COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildId`, `LogGuid`) USING BTREE,
  INDEX `Idx_PlayerGuid1`(`PlayerGuid1`) USING BTREE,
  INDEX `Idx_PlayerGuid2`(`PlayerGuid2`) USING BTREE,
  INDEX `Idx_LogGuid`(`LogGuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Guild Eventlog' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for guild_finder_applicant
-- ----------------------------
DROP TABLE IF EXISTS `guild_finder_applicant`;
CREATE TABLE `guild_finder_applicant`  (
  `guildId` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `playerGuid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `availability` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `classRole` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `interests` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `comment` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `submitTime` int(10) UNSIGNED NULL DEFAULT NULL,
  UNIQUE INDEX `guildId`(`guildId`, `playerGuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for guild_finder_guild_settings
-- ----------------------------
DROP TABLE IF EXISTS `guild_finder_guild_settings`;
CREATE TABLE `guild_finder_guild_settings`  (
  `guildId` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `availability` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `classRoles` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `interests` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `listed` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `comment` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`guildId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for guild_member
-- ----------------------------
DROP TABLE IF EXISTS `guild_member`;
CREATE TABLE `guild_member`  (
  `guildId` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `rank` tinyint(3) UNSIGNED NOT NULL,
  `pnote` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `offnote` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `BankResetTimeMoney` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `BankRemMoney` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `BankResetTimeTab0` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `BankRemSlotsTab0` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `BankResetTimeTab1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `BankRemSlotsTab1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `BankResetTimeTab2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `BankRemSlotsTab2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `BankResetTimeTab3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `BankRemSlotsTab3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `BankResetTimeTab4` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `BankRemSlotsTab4` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `BankResetTimeTab5` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `BankRemSlotsTab5` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `BankResetTimeTab6` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `BankRemSlotsTab6` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `BankResetTimeTab7` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `BankRemSlotsTab7` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `XpContrib` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Total guild XP contributed.',
  `XpContribWeek` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Guild XP contributed this week.',
  `AchPoint` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Achievement Points',
  `profId1` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `profValue1` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `profRank1` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `recipesMask1` varchar(1300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `profId2` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `profValue2` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `profRank2` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `recipesMask2` varchar(1300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `RepWeek` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Guild rep earned this week.',
  PRIMARY KEY (`guid`) USING BTREE,
  INDEX `guildid_rank_key`(`guildId`, `rank`) USING BTREE,
  INDEX `guildId`(`guildId`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Guild System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for guild_newslog
-- ----------------------------
DROP TABLE IF EXISTS `guild_newslog`;
CREATE TABLE `guild_newslog`  (
  `guildid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `LogGuid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `EventType` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `PlayerGuid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `Flags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Value` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `TimeStamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guildid`, `LogGuid`) USING BTREE,
  INDEX `guildid_key`(`guildid`) USING BTREE,
  INDEX `Idx_PlayerGuid`(`PlayerGuid`) USING BTREE,
  INDEX `Idx_LogGuid`(`LogGuid`) USING BTREE,
  INDEX `TimeStamp`(`TimeStamp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for guild_rank
-- ----------------------------
DROP TABLE IF EXISTS `guild_rank`;
CREATE TABLE `guild_rank`  (
  `guildId` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `rid` tinyint(3) UNSIGNED NOT NULL,
  `rname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `rights` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `BankMoneyPerDay` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guildId`, `rid`) USING BTREE,
  INDEX `Idx_rid`(`rid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Guild System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for item_instance
-- ----------------------------
DROP TABLE IF EXISTS `item_instance`;
CREATE TABLE `item_instance`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `itemEntry` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `owner_guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `creatorGuid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `giftCreatorGuid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `duration` int(10) NOT NULL DEFAULT 0,
  `charges` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `flags` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `enchantments` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `randomPropertyType` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `randomPropertyId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `durability` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `playedTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `upgradeId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `battlePetSpeciesId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `battlePetBreedData` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `battlePetLevel` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `battlePetDisplayId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `bonusListIDs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `itemLevel` mediumint(6) NOT NULL DEFAULT 0,
  `dungeonEncounterID` mediumint(6) NOT NULL DEFAULT 0,
  `contextID` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `createdTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `challengeMapID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `challengeLevel` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `challengeAffix` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `challengeAffix1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `challengeAffix2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `challengeKeyIsCharded` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `isdonateitem` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE,
  INDEX `owner_guid`(`owner_guid`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `itemEntry`(`itemEntry`) USING BTREE,
  INDEX `randomPropertyId`(`randomPropertyId`) USING BTREE,
  INDEX `contextID`(`contextID`) USING BTREE,
  INDEX `dungeonEncounterID`(`dungeonEncounterID`) USING BTREE,
  INDEX `createdTime`(`createdTime`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Item System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for item_instance_artifact
-- ----------------------------
DROP TABLE IF EXISTS `item_instance_artifact`;
CREATE TABLE `item_instance_artifact`  (
  `itemGuid` bigint(20) UNSIGNED NOT NULL,
  `xp` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `artifactAppearanceId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemEntry` int(10) NOT NULL,
  `tier` int(10) NOT NULL DEFAULT 0,
  `char_guid` bigint(20) NOT NULL,
  `totalrank` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`itemEntry`, `char_guid`) USING BTREE,
  INDEX `itemGuid`(`itemGuid`) USING BTREE,
  INDEX `itemEntry`(`itemEntry`) USING BTREE,
  INDEX `tier`(`tier`) USING BTREE,
  INDEX `char_guid`(`char_guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for item_instance_artifact_powers
-- ----------------------------
DROP TABLE IF EXISTS `item_instance_artifact_powers`;
CREATE TABLE `item_instance_artifact_powers`  (
  `itemGuid` bigint(20) UNSIGNED NOT NULL,
  `artifactPowerId` int(10) UNSIGNED NOT NULL,
  `purchasedRank` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `itemEntry` int(10) NOT NULL,
  `char_guid` bigint(20) NOT NULL,
  `totalrank` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`itemEntry`, `char_guid`, `artifactPowerId`) USING BTREE,
  INDEX `itemGuid`(`itemGuid`) USING BTREE,
  INDEX `itemEntry`(`itemEntry`) USING BTREE,
  INDEX `char_guid`(`char_guid`) USING BTREE,
  INDEX `artifactPowerId`(`artifactPowerId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for item_instance_gems
-- ----------------------------
DROP TABLE IF EXISTS `item_instance_gems`;
CREATE TABLE `item_instance_gems`  (
  `itemGuid` bigint(20) UNSIGNED NOT NULL,
  `gemItemId1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gemBonuses1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `gemContext1` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `gemScalingLevel1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gemItemId2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gemBonuses2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `gemScalingLevel2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gemContext2` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `gemItemId3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gemBonuses3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `gemContext3` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `gemScalingLevel3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`itemGuid`) USING BTREE,
  INDEX `itemGuid`(`itemGuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for item_instance_modifiers
-- ----------------------------
DROP TABLE IF EXISTS `item_instance_modifiers`;
CREATE TABLE `item_instance_modifiers`  (
  `itemGuid` bigint(20) UNSIGNED NOT NULL,
  `fixedScalingLevel` int(10) UNSIGNED NULL DEFAULT 0,
  `artifactKnowledgeLevel` int(10) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`itemGuid`) USING BTREE,
  INDEX `itemGuid`(`itemGuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for item_instance_relics
-- ----------------------------
DROP TABLE IF EXISTS `item_instance_relics`;
CREATE TABLE `item_instance_relics`  (
  `itemGuid` bigint(20) UNSIGNED NOT NULL,
  `char_guid` bigint(20) NOT NULL,
  `first_relic` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `second_relic` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `third_relic` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`itemGuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for item_instance_transmog
-- ----------------------------
DROP TABLE IF EXISTS `item_instance_transmog`;
CREATE TABLE `item_instance_transmog`  (
  `itemGuid` bigint(20) UNSIGNED NOT NULL,
  `itemModifiedAppearanceAllSpecs` int(11) NOT NULL DEFAULT 0,
  `itemModifiedAppearanceSpec1` int(11) NOT NULL DEFAULT 0,
  `itemModifiedAppearanceSpec2` int(11) NOT NULL DEFAULT 0,
  `itemModifiedAppearanceSpec3` int(11) NOT NULL DEFAULT 0,
  `itemModifiedAppearanceSpec4` int(11) NOT NULL DEFAULT 0,
  `spellItemEnchantmentAllSpecs` int(11) NOT NULL DEFAULT 0,
  `spellItemEnchantmentSpec1` int(11) NOT NULL DEFAULT 0,
  `spellItemEnchantmentSpec2` int(11) NOT NULL DEFAULT 0,
  `spellItemEnchantmentSpec3` int(11) NOT NULL DEFAULT 0,
  `spellItemEnchantmentSpec4` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`itemGuid`) USING BTREE,
  INDEX `itemGuid`(`itemGuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for item_refund_instance
-- ----------------------------
DROP TABLE IF EXISTS `item_refund_instance`;
CREATE TABLE `item_refund_instance`  (
  `item_guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `player_guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `paidMoney` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `paidExtendedCost` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`item_guid`, `player_guid`) USING BTREE,
  INDEX `item_guid`(`item_guid`) USING BTREE,
  INDEX `player_guid`(`player_guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Item Refund System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for item_soulbound_trade_data
-- ----------------------------
DROP TABLE IF EXISTS `item_soulbound_trade_data`;
CREATE TABLE `item_soulbound_trade_data`  (
  `itemGuid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `allowedPlayers` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Space separated GUID list of players who can receive this item in trade',
  PRIMARY KEY (`itemGuid`) USING BTREE,
  INDEX `itemGuid`(`itemGuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Item Refund System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lag_reports
-- ----------------------------
DROP TABLE IF EXISTS `lag_reports`;
CREATE TABLE `lag_reports`  (
  `reportId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lagType` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `mapId` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `posX` float NOT NULL DEFAULT 0,
  `posY` float NOT NULL DEFAULT 0,
  `posZ` float NOT NULL DEFAULT 0,
  `latency` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `createTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`reportId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lfg_data
-- ----------------------------
DROP TABLE IF EXISTS `lfg_data`;
CREATE TABLE `lfg_data`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `dungeon` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `state` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'LFG Data' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lock
-- ----------------------------
DROP TABLE IF EXISTS `lock`;
CREATE TABLE `lock`  (
  `ID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Index1` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Index2` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Index3` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Index4` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Index5` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Index6` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Index7` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Index8` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Skill1` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `Skill2` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `Skill3` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `Skill4` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `Skill5` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `Skill6` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `Skill7` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `Skill8` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `Type1` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Type2` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Type3` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Type4` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Type5` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Type6` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Type7` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Type8` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Action1` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Action2` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Action3` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Action4` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Action5` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Action6` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Action7` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Action8` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for log_faction_change
-- ----------------------------
DROP TABLE IF EXISTS `log_faction_change`;
CREATE TABLE `log_faction_change`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` bigint(20) NOT NULL,
  `account` int(11) NOT NULL,
  `OldRace` int(11) NOT NULL,
  `NewRace` int(11) NOT NULL,
  `date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3901 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for log_rename
-- ----------------------------
DROP TABLE IF EXISTS `log_rename`;
CREATE TABLE `log_rename`  (
  `guid` bigint(20) UNSIGNED NOT NULL,
  `date` datetime(0) NOT NULL,
  `oldName` tinytext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `newName` tinytext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `oldName`(`oldName`(50)) USING BTREE,
  INDEX `newName`(`newName`(50)) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_store_gold
-- ----------------------------
DROP TABLE IF EXISTS `log_store_gold`;
CREATE TABLE `log_store_gold`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction` int(11) NOT NULL DEFAULT 0,
  `guid` bigint(20) NOT NULL DEFAULT 0,
  `gold` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_store_item
-- ----------------------------
DROP TABLE IF EXISTS `log_store_item`;
CREATE TABLE `log_store_item`  (
  `id` int(11) NOT NULL DEFAULT 0,
  `transaction` int(11) NULL DEFAULT 0,
  `guid` bigint(20) NULL DEFAULT 0,
  `itemid` int(11) NULL DEFAULT 0,
  `count` int(5) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for magazine
-- ----------------------------
DROP TABLE IF EXISTS `magazine`;
CREATE TABLE `magazine`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `guid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Identifier',
  `itemid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `subject` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `itemText` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `money` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `count` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `title` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `gift` tinyint(1) UNSIGNED NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_receiver`(`guid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Mail System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mail
-- ----------------------------
DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Identifier',
  `messageType` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `stationery` tinyint(3) NOT NULL DEFAULT 41,
  `mailTemplateId` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `sender` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `receiver` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `subject` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `body` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `has_items` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `expire_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `deliver_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `money` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `cod` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `checked` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `receiver`(`receiver`) USING BTREE,
  INDEX `checked`(`checked`) USING BTREE,
  INDEX `deliver_time`(`deliver_time`) USING BTREE,
  INDEX `expire_time`(`expire_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Mail System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mail_items
-- ----------------------------
DROP TABLE IF EXISTS `mail_items`;
CREATE TABLE `mail_items`  (
  `mail_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `item_guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `receiver` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`item_guid`) USING BTREE,
  INDEX `idx_receiver`(`receiver`) USING BTREE,
  INDEX `idx_mail_id`(`mail_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mailbox_queue
-- ----------------------------
DROP TABLE IF EXISTS `mailbox_queue`;
CREATE TABLE `mailbox_queue`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `messageType` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `stationery` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sender_guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `receiver_guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `subject` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Support Message',
  `message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Support Message',
  `money` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `item` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `item_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `store_history` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pet_aura
-- ----------------------------
DROP TABLE IF EXISTS `pet_aura`;
CREATE TABLE `pet_aura`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `slot` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `caster_guid` binary(16) NOT NULL COMMENT 'Full Global Unique Identifier',
  `spell` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `effect_mask` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `recalculate_mask` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `stackcount` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `maxduration` int(11) NOT NULL DEFAULT 0,
  `remaintime` int(11) NOT NULL DEFAULT 0,
  `remaincharges` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `spell`, `effect_mask`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Pet System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pet_aura_effect
-- ----------------------------
DROP TABLE IF EXISTS `pet_aura_effect`;
CREATE TABLE `pet_aura_effect`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `slot` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `effect` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  `baseamount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `slot`, `effect`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pet_spell
-- ----------------------------
DROP TABLE IF EXISTS `pet_spell`;
CREATE TABLE `pet_spell`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `spell` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Spell Identifier',
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `spell`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE,
  INDEX `spell`(`spell`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Pet System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pet_spell_cooldown
-- ----------------------------
DROP TABLE IF EXISTS `pet_spell_cooldown`;
CREATE TABLE `pet_spell_cooldown`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier, Low part',
  `spell` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Spell Identifier',
  `time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `spell`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for petition
-- ----------------------------
DROP TABLE IF EXISTS `petition`;
CREATE TABLE `petition`  (
  `ownerguid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `petitionguid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`ownerguid`, `type`) USING BTREE,
  UNIQUE INDEX `index_ownerguid_petitionguid`(`ownerguid`, `petitionguid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Guild System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for petition_sign
-- ----------------------------
DROP TABLE IF EXISTS `petition_sign`;
CREATE TABLE `petition_sign`  (
  `ownerguid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `petitionguid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `playerguid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `player_account` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`petitionguid`, `playerguid`) USING BTREE,
  INDEX `Idx_playerguid`(`playerguid`) USING BTREE,
  INDEX `Idx_ownerguid`(`ownerguid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Guild System' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pool_quest_save
-- ----------------------------
DROP TABLE IF EXISTS `pool_quest_save`;
CREATE TABLE `pool_quest_save`  (
  `pool_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `quest_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`pool_id`, `quest_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for report_bugreport
-- ----------------------------
DROP TABLE IF EXISTS `report_bugreport`;
CREATE TABLE `report_bugreport`  (
  `ID` bigint(20) UNSIGNED NOT NULL COMMENT 'Identifier',
  `PlayerGuid` bigint(20) UNSIGNED NOT NULL,
  `Note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MapID` smallint(5) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Bug report system' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for report_complaints
-- ----------------------------
DROP TABLE IF EXISTS `report_complaints`;
CREATE TABLE `report_complaints`  (
  `ID` bigint(20) UNSIGNED NOT NULL COMMENT 'Identifier',
  `ReportPlayer` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `ReportAccount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ReportTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `SpammerGuid` bigint(20) UNSIGNED NOT NULL,
  `ComplaintType` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  `MailID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `TimeSinceOffence` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `MessageLog` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JustBanned` int(1) NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Spam report system' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for reserved_name
-- ----------------------------
DROP TABLE IF EXISTS `reserved_name`;
CREATE TABLE `reserved_name`  (
  `name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Player Reserved Names' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for skillline
-- ----------------------------
DROP TABLE IF EXISTS `skillline`;
CREATE TABLE `skillline`  (
  `id` bigint(20) NOT NULL,
  `ref_category` bigint(20) NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ref_icon` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ref_category`(`ref_category`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for store_gold
-- ----------------------------
DROP TABLE IF EXISTS `store_gold`;
CREATE TABLE `store_gold`  (
  `guid` bigint(20) UNSIGNED NOT NULL,
  `gold` int(11) UNSIGNED NULL DEFAULT NULL,
  `transaction` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`transaction`) USING BTREE,
  UNIQUE INDEX `transaction`(`transaction`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
  `item_guid` int(11) UNSIGNED NULL DEFAULT NULL,
  `item` int(11) NOT NULL DEFAULT 0,
  `bonus` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product` int(11) NOT NULL DEFAULT 0,
  `count` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `token` int(11) UNSIGNED NOT NULL,
  `karma` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `type` enum('cp','game') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'game',
  `dt_buy` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `dt_return` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for store_item
-- ----------------------------
DROP TABLE IF EXISTS `store_item`;
CREATE TABLE `store_item`  (
  `itemid` int(11) NOT NULL DEFAULT 0,
  `guid` bigint(20) UNSIGNED NOT NULL,
  `count` int(11) UNSIGNED NOT NULL,
  `transaction` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`transaction`) USING BTREE,
  UNIQUE INDEX `transaction`(`transaction`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for store_level
-- ----------------------------
DROP TABLE IF EXISTS `store_level`;
CREATE TABLE `store_level`  (
  `guid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `level` int(11) UNSIGNED NOT NULL DEFAULT 80,
  `transaction` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`transaction`) USING BTREE,
  UNIQUE INDEX `transaction`(`transaction`) USING BTREE,
  INDEX `guid`(`guid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for store_metier
-- ----------------------------
DROP TABLE IF EXISTS `store_metier`;
CREATE TABLE `store_metier`  (
  `guid` bigint(20) UNSIGNED NOT NULL,
  `skill` int(11) UNSIGNED NOT NULL,
  `value` int(11) UNSIGNED NOT NULL,
  `transaction` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`transaction`) USING BTREE,
  UNIQUE INDEX `NewIndex1`(`skill`, `guid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for talent
-- ----------------------------
DROP TABLE IF EXISTS `talent`;
CREATE TABLE `talent`  (
  `id` int(11) NOT NULL,
  `ref_tab` int(11) NOT NULL,
  `Row` int(11) NULL DEFAULT NULL,
  `Col` int(11) NULL DEFAULT NULL,
  `rank1` int(11) NULL DEFAULT NULL,
  `rank2` int(11) NULL DEFAULT NULL,
  `rank3` int(11) NULL DEFAULT NULL,
  `rank4` int(11) NULL DEFAULT NULL,
  `rank5` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_id`(`id`) USING BTREE,
  INDEX `idx_tab`(`ref_tab`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for talenttab
-- ----------------------------
DROP TABLE IF EXISTS `talenttab`;
CREATE TABLE `talenttab`  (
  `id` bigint(20) NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `refmask_chrclasses` bigint(20) NOT NULL,
  `tab_number` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `refmask_chrclasses`(`refmask_chrclasses`, `tab_number`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for warden_action
-- ----------------------------
DROP TABLE IF EXISTS `warden_action`;
CREATE TABLE `warden_action`  (
  `wardenId` smallint(5) UNSIGNED NOT NULL,
  `action` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`wardenId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for world_quest
-- ----------------------------
DROP TABLE IF EXISTS `world_quest`;
CREATE TABLE `world_quest`  (
  `QuestID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `QuestInfoID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `QuestSortID` int(10) NOT NULL DEFAULT 0,
  `VariableID` int(10) NOT NULL DEFAULT 0,
  `Value` int(10) NOT NULL DEFAULT 0,
  `Timer` int(10) NOT NULL DEFAULT 0,
  `StartTime` int(10) NOT NULL DEFAULT 0,
  `ResetTime` int(10) NOT NULL DEFAULT 0,
  `CurrencyID` int(10) NOT NULL DEFAULT 0,
  `CurrencyCount` int(10) NOT NULL DEFAULT 0,
  `Gold` int(10) NOT NULL DEFAULT 0,
  `RewardType` int(10) NOT NULL DEFAULT 0,
  `ItemList` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`QuestID`) USING BTREE,
  INDEX `ResetTime`(`ResetTime`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for worldstate_data
-- ----------------------------
DROP TABLE IF EXISTS `worldstate_data`;
CREATE TABLE `worldstate_data`  (
  `VariableID` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'WorldState ID (can be 0)',
  `InstanceID` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'WorldState instance',
  `Type` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'WorldStatesData::Types',
  `ConditionID` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Condition (dependent from type)',
  `Flags` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Current flags see WorldStatesData::Falgs',
  `Value` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `RenewTime` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Time of last renew of WorldState',
  PRIMARY KEY (`VariableID`, `InstanceID`, `Type`, `ConditionID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'WorldState data storage' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for worldstates
-- ----------------------------
DROP TABLE IF EXISTS `worldstates`;
CREATE TABLE `worldstates`  (
  `entry` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `value` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`entry`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Variable Saves' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
