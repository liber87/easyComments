SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `{PREFIX}comments`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `{PREFIX}comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT 'page id',
  `uidc` varchar(64) NOT NULL COMMENT 'unique id comment',
  `aid` int(11) NOT NULL COMMENT 'answer id',
  `uid` int(11) NOT NULL COMMENT 'user id',
  `date` int(11) NOT NULL,
  `content` text NOT NULL,
  `visible` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

