
create table buyitem(
	id mediumint(8) unsigned NOT NULL auto_increment,
    userid INT,
    itemid INT,
    amount varchar(10),
    price varchar(10),
    buydate varchar(255),
	PRIMARY KEY (id)
) AUTO_INCREMENT=1;

INSERT INTO `buyitem` (`userid`,`itemid`,`amount`,`price`,`buydate`) VALUES ("701373235","17","5","894979","2019-10-27");
INSERT INTO `buyitem` (`userid`,`itemid`,`amount`,`price`,`buydate`) VALUES ("493351506","17","5","894979","2019-10-27");
INSERT INTO `buyitem` (`userid`,`itemid`,`amount`,`price`,`buydate`) VALUES ("293284436","17","5","894979","2019-10-27");
INSERT INTO `buyitem` (`userid`,`itemid`,`amount`,`price`,`buydate`) VALUES ("765891478","17","8","894979","2019-10-27");
INSERT INTO `buyitem` (`userid`,`itemid`,`amount`,`price`,`buydate`) VALUES ("759999535","17","2","894979","2019-10-27");
INSERT INTO `buyitem` (`userid`,`itemid`,`amount`,`price`,`buydate`) VALUES ("560829558","17","5","894979","2019-10-27");
INSERT INTO `buyitem` (`userid`,`itemid`,`amount`,`price`,`buydate`) VALUES ("869277293","17","2","894979","2019-10-27");
INSERT INTO `buyitem` (`userid`,`itemid`,`amount`,`price`,`buydate`) VALUES ("019764729","17","5","894979","2019-10-27");
INSERT INTO `buyitem` (`userid`,`itemid`,`amount`,`price`,`buydate`) VALUES ("347879702","17","5","894979","2019-10-27");

select * from buyitem;