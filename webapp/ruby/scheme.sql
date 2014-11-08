DROP TABLE IF EXISTS `ads`;

CREATE TABLE ads (
`advertiser` varchar(255) NOT NULL,
`ad_id` varchar(255),
`user` varchar(255),
`agent` varchar(255),
`gender` varchar(255),
`age` varchar(255),
PRIMARY KEY(`advertiser`)
) ENGNE=InnoDB;
