-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 23, 2022 at 07:08 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tpl-loaded`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `avgGoals`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `avgGoals` ()  MODIFIES SQL DATA
BEGIN
	UPDATE league.goals_per_game set goals_per_game.avg_goals = (SELECT COUNT(goal.gtime) FROM goal) / (SELECT COUNT(game.id) FROM game);
END$$

DROP PROCEDURE IF EXISTS `createPlayer`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `createPlayer` (IN `fname` VARCHAR(255), IN `lname` VARCHAR(255), IN `position` INT)  MODIFIES SQL DATA
proc_label:BEGIN
	IF position > 4 AND position < 1 THEN
		LEAVE proc_label;
    ELSE
		INSERT INTO player (fname, lname, position_id) VALUES (fname, lname, position);
	END IF;
END$$

DROP PROCEDURE IF EXISTS `deletePlayer`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deletePlayer` (IN `in_lname` VARCHAR(255))  MODIFIES SQL DATA
BEGIN
	DELETE FROM player WHERE lname LIKE (in_lname);
END$$

DROP PROCEDURE IF EXISTS `playerStats`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `playerStats` (IN `playerName` VARCHAR(255), OUT `o_fname` VARCHAR(255), OUT `o_lname` VARCHAR(255), OUT `o_goals` INT, OUT `o_team` VARCHAR(255))  READS SQL DATA
BEGIN
	SELECT fname as 'first name', lname as 'last name', COUNT(gtime) as goals, team.name as team
	INTO o_fname, o_lname, o_goals, o_team
	FROM player
 JOIN goal ON player.id=goal.player_id 
 JOIN transfer ON player.id=transfer.player_id
 JOIN team ON team.id=transfer.team_id
 WHERE fname LIKE CONCAT('%',playerName,'%') OR lname LIKE CONCAT('%',playerName,'%')
 GROUP BY fname, lname, team.name;
END$$

DROP PROCEDURE IF EXISTS `showPlayers`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `showPlayers` (OUT `o_fname` VARCHAR(255), OUT `o_lname` VARCHAR(255))  READS SQL DATA
BEGIN
	SELECT fname as 'first name', lname as 'last name'
	INTO o_fname, o_lname
	FROM player ORDER BY lname asc;
END$$

DROP PROCEDURE IF EXISTS `showPlayersInPosition`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `showPlayersInPosition` (IN `position` VARCHAR(255))  READS SQL DATA
BEGIN
	SELECT fname as 'first name', lname as 'last name', position.type as position FROM player
 JOIN position ON player.position_id=position.id
 WHERE position.type LIKE (position)
 ORDER BY lname asc;
END$$

DROP PROCEDURE IF EXISTS `showPositionCategories`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `showPositionCategories` ()  READS SQL DATA
BEGIN
	SELECT type as positions FROM position ORDER BY id asc;
END$$

DROP PROCEDURE IF EXISTS `updatePlayer`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePlayer` (IN `in_lname` VARCHAR(255), IN `position` INT)  MODIFIES SQL DATA
proc_label:BEGIN
	IF position > 4 AND position < 1 THEN
		LEAVE proc_label;
    ELSE
		UPDATE player SET position_id = position WHERE lname LIKE (in_lname);
	END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
CREATE TABLE IF NOT EXISTS `coach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`fname`,`lname`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
CREATE TABLE IF NOT EXISTS `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `stadium_id` int(11) NOT NULL,
  `team1_id` int(11) NOT NULL,
  `team2_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `date` (`date`,`stadium_id`,`team1_id`,`team2_id`),
  KEY `stadium_id` (`stadium_id`),
  KEY `team1_id` (`team1_id`),
  KEY `team2_id` (`team2_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Triggers `game`
--
DROP TRIGGER IF EXISTS `game_delete`;
DELIMITER $$
CREATE TRIGGER `game_delete` AFTER DELETE ON `game` FOR EACH ROW BEGIN 
UPDATE league.goals_per_game set goals_per_game.avg_goals = (SELECT COUNT(goal.gtime) FROM goal) / (SELECT COUNT(game.id) FROM game);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `game_insert`;
DELIMITER $$
CREATE TRIGGER `game_insert` AFTER INSERT ON `game` FOR EACH ROW BEGIN 
UPDATE league.goals_per_game set goals_per_game.avg_goals = (SELECT COUNT(goal.gtime) FROM goal) / (SELECT COUNT(game.id) FROM game);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `game_update`;
DELIMITER $$
CREATE TRIGGER `game_update` AFTER UPDATE ON `game` FOR EACH ROW BEGIN 
UPDATE league.goals_per_game set goals_per_game.avg_goals = (SELECT COUNT(goal.gtime) FROM goal) / (SELECT COUNT(game.id) FROM game);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `goal`
--

DROP TABLE IF EXISTS `goal`;
CREATE TABLE IF NOT EXISTS `goal` (
  `gtime` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`gtime`,`game_id`),
  KEY `game_id` (`game_id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `goal`
--
DROP TRIGGER IF EXISTS `goal_delete`;
DELIMITER $$
CREATE TRIGGER `goal_delete` AFTER DELETE ON `goal` FOR EACH ROW BEGIN 
UPDATE league.goals_per_game set goals_per_game.avg_goals = (SELECT COUNT(goal.gtime) FROM goal) / (SELECT COUNT(game.id) FROM game);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `goal_insert`;
DELIMITER $$
CREATE TRIGGER `goal_insert` AFTER INSERT ON `goal` FOR EACH ROW BEGIN 
UPDATE league.goals_per_game set goals_per_game.avg_goals = (SELECT COUNT(goal.gtime) FROM goal) / (SELECT COUNT(game.id) FROM game);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `goal_update`;
DELIMITER $$
CREATE TRIGGER `goal_update` AFTER UPDATE ON `goal` FOR EACH ROW BEGIN 
UPDATE league.goals_per_game set goals_per_game.avg_goals = (SELECT COUNT(goal.gtime) FROM goal) / (SELECT COUNT(game.id) FROM game);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `goals_per_game`
--

DROP TABLE IF EXISTS `goals_per_game`;
CREATE TABLE IF NOT EXISTS `goals_per_game` (
  `avg_goals` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
CREATE TABLE IF NOT EXISTS `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `position_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`fname`,`lname`),
  KEY `position_id` (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
CREATE TABLE IF NOT EXISTS `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stadium`
--

DROP TABLE IF EXISTS `stadium`;
CREATE TABLE IF NOT EXISTS `stadium` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
CREATE TABLE IF NOT EXISTS `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `coach_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `coach_id` (`coach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
CREATE TABLE IF NOT EXISTS `transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `player_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `team_id` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_ibfk_6` FOREIGN KEY (`team2_id`) REFERENCES `team` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `goal`
--
ALTER TABLE `goal`
  ADD CONSTRAINT `goal_ibfk_3` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `goal_ibfk_4` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team_ibfk_2` FOREIGN KEY (`coach_id`) REFERENCES `coach` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `transfer`
--
ALTER TABLE `transfer`
  ADD CONSTRAINT `transfer_ibfk_3` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `transfer_ibfk_4` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
