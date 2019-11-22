CREATE TABLE `item` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `itemid` INT default NULL,
  `itemname` varchar(255) default NULL,
  `price` varchar(100) default NULL,
  `nation` varchar(100) default NULL,
  `makedate` varchar(255),
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;


INSERT INTO `item` (`itemid`,`itemname`,`price`,`nation`,`makedate`) VALUES (1,"삼성전자 갤럭시 M20",183200,"Chile","2019-03-25"),(1,"삼성전자 갤럭시 A60",231500,"Greece","2019-07-19"),(1,"삼성전자 갤럭시 노트10",1250000,"United States","2020-04-27"),(1,"샤오미 홍미 노트8",226500,"China","2019-02-10"),(1,"삼성전자 갤럭시 S7",95000,"Croatia","2019-11-08"),(1,"삼성전자 갤럭시A50",265000,"Falkland Islands","2019-03-29"),(1,"삼성전자 갤럭시 M30s",328000,"Saint Martin","2019-01-12"),(1,"LG전자 Q70",330000,"South Georgia and The South Sandwich Islands","2019-02-26"),(1,"삼성전자 갤럭시 폴드 5G",2200000,"Grenada","2020-04-15"),(1,"삼성전자 갤럭시 A30 2019",150000,"Wallis and Futuna","2019-12-29");
INSERT INTO `item` (`itemid`,`itemname`,`price`,`nation`,`makedate`) VALUES (1,"삼성전자 갤럭시 노트9",340000,"Namibia","2020-10-13"),(1,"샤오미 미 CC9 프로",450000,"Bahrain","2020-06-13"),(1,"LG전자 X4 2019",150000,"Uruguay","2020-01-06"),(1,"삼성전자 갤럭시 A70 2019",350000,"Nicaragua","2019-05-02"),(1,"삼성전자 갤럭시노트8",250000,"Bulgaria","2020-03-29"),(1,"삼성전자 갤럭시S8+",180000,"Lithuania","2019-03-04"),(1,"삼성전자 갤럭시 S9플러스",250000,"Gambia","2019-03-01"),(1,"삼성전자 갤럭시 S9",240000,"Congo (Brazzaville)","2019-06-04"),(2,"이엠텍 지포스 GTX 1660 OC 6gb",286000,"Korea, South","2019-12-08"),(2,"ZOTAC 지포스 GTX 1660 SUPER D6 6gb",288000,"Heard Island","2019-05-26");
INSERT INTO `item` (`itemid`,`itemname`,`price`,`nation`,`makedate`) VALUES (2,"사파이어 라데온 RX570",175000,"Switzerland","2020-01-09"),(2,"갤럭시 지포스 RTX 2060 8gb",475000,"Mayotte","2019-11-11"),(2,"MSI 라데온 RX570 4gb",156800,"Korea, South","2019-12-13"),(2,"이엠텍 지포스 GTX1050 4gb",156000,"Benin","2019-05-01"),(3,"AMD 라이젠 5 3600",225000,"Reunion","2019-02-20"),(3,"AMD 라이젠 5 2600",132800,"Panama","2020-05-23"),(3,"AMD 라이젠7 3700X",380000,"Mauritania","2019-04-26"),(3,"AMD 라이젠5 3500X",179000,"Nepal","2020-03-05"),(3,"인텔 코어i5-9500F",182000,"Russian Federation","2019-10-19"),(3,"인텔 코어i5-9400F",155000,"Cambodia","2020-10-17");
INSERT INTO `item` (`itemid`,`itemname`,`price`,`nation`,`makedate`) VALUES (3,"인텔 코어i5-9600KF",205000,"Nicaragua","2018-12-13"),(3,"AMD 라이젠3 2200G",91000,"Antarctica","2020-08-08"),(3,"AMD 라이젠5 3400G",174000,"Antigua and Barbuda","2020-01-26"),(3,"AMD 라이젠3 3200G 피카소",113500,"Marshall Islands","2019-09-05"),(3,"AMD 라이젠5 2400G 레이븐릿지	",164800,"Portugal","2018-11-24"),(3,"인텔 코어i3-8100",164000,"Thailand","2020-05-26"),(4,"britz br-1600BT",99000,"El Salvador","2020-04-30"),(4,"하만카돈 Citation One",270000,"Thailand","2019-03-01"),(4,"A2+ Wireless",330000,"Montserrat","2019-05-06"),(4,"하만카돈 Citation 100",362000,"Macao","2018-11-14");
INSERT INTO `item` (`itemid`,`itemname`,`price`,`nation`,`makedate`) VALUES (4,"Britz Vtube150m + LS25",449000,"Rwanda","2020-05-31"),(4,"하만카돈 Aura Studio 2",225000,"Cape Verde","2019-09-20"),(4,"마샬 Acton II",340000,"Kazakhstan","2019-11-02"),(4,"Britz BZ-JB5606",133500,"Mayotte","2019-08-17"),(4,"Britz BR-1900DB",277800,"Brazil","2020-05-27"),(4,"SONY SRS-ZR7",245000,"Latvia","2019-03-12"),(4,"마샬 Acton",320000,"American Samoa","2020-09-05"),(4,"야마하 NS-SW050",125000,"Papua New Guinea","2019-04-03"),(4,"Britz Phono 2",129000,"Anguilla","2020-05-02"),(4,"JBL Control 1Xtreme",105000,"Austria","2020-07-09");
INSERT INTO `item` (`itemid`,`itemname`,`price`,`nation`,`makedate`) VALUES 
(10,"삼성전자 갤럭시 워치 액티브2 40mm 알루미늄 케이스 ",330000,"Dominica","2020-01-03"),
(10,"삼성전자 갤럭시 워치 액티브2 40mm 스테인리스 스틸 케이스 ",300000,"Jersey","2019-11-15"),
(10,"삼성전자 갤럭시 워치 액티브2 44mm 스테인리스 스틸 케이스 ",430000,"Madagascar","2020-02-26"),
(10,"삼성전자 갤럭시 워치 액티브 ",400000,"French Guiana","2020-01-08"),
(10,"삼성전자 갤럭시 워치 액티브2 44mm 알루미늄 케이스 ",320000,"Guadeloupe","2019-07-03"),
(10,"APPLE 워치 시리즈5 44mm 스페이스 그레이 알루미늄 케이스 ",330000,"Hong Kong","2019-11-20"),
(10,"APPLE 워치 시리즈5 나이키+ 44mm 스페이스 그레이 알루미늄 케이스 ",410000,"Virgin Islands, British","2020-10-23"),
(10,"APPLE 워치 시리즈5 40mm 스페이스 그레이 알루미늄 케이스 ",500000,"Cook Islands","2020-01-14"),
(10,"APPLE 워치 시리즈5 44mm Cellular 스페이스 그레이 알루미늄 케이스 ",420000,"Botswana","2020-07-28"),
(10,"APPLE 워치 시리즈5 40mm 실버 알루미늄 케이스 ",450000,"Czech Republic","2019-09-03");

INSERT INTO `item` (`itemid`,`itemname`,`price`,`nation`,`makedate`) VALUES 
(9,"APPLE 에어팟 프로 MWP22KH/A ",380000,"Cambodia","2019-03-24"),
(9,"APPLE 에어팟 2세대 유선충전 MV7N2KH/A ",330000,"Heard Island and Mcdonald Islands","2020-02-17"),
(9," APPLE 에어팟 프로 MWP22AM/A ",450000,"Barbados","2020-02-11"),
(9,"APPLE 에어팟 2세대 무선충전 MRXJ2KH/A ",300000,"Liechtenstein","2018-10-23"),
(9,"APPLE 이어팟 MD827 ",400000,"Mongolia","2020-07-08"),
(9,"QCY T5 ",350000,"Zambia","2020-01-29"),
(9,"QCY T1C ",320000,"Estonia","2019-06-21"),
(9," QCY T2C ",340000,"Madagascar","2020-03-22"),
(9,"QCY T2S 무선충전 ",360000,"Egypt","2019-03-29"),
(9,"QCY T1 Pro ",500000,"Malawi","2020-05-22");

INSERT INTO `item` (`itemid`,`itemname`,`price`,`nation`,`makedate`) VALUES 
(8,"이노스 S6501KU 스마트 WiFi ",560000,"China","2019-04-27"),
(8,"이노스 S4300 HDR DIRECT ",360000,"Heard Island and Mcdonald Islands","2020-02-23"),
(8,"이노스 S7500 HDR DIRECT ",500000,"Bulgaria","2019-12-28"),
(8,"이노스 S5500 HDR DIRECT ",370000,"Solomon Islands","2020-10-14"),
(8,"이노스 S5501KU 스마트 WiFi ",430000,"Mali","2020-09-17"),
(8," 더함 코스모 C651UHD IPS HDR ",500000,"Qatar","2019-07-25"),
(8,"더함 노바 N751UHD IPS 스마트 HDR ",550000,"Romania","2019-10-06"),
(8,"더함 코스모 C492UHD IPS HDR ",450000,"Poland","2019-07-27"),
(8,"더함 노바 N553UHD 스마트 ADD ON SOUNDBAR HDR ",340000,"Bulgaria","2020-03-03"),
(8,"더함 코스모 C551UHD IPS HDR ",500000,"Kuwait","2020-03-20");

INSERT INTO `item` (`itemid`,`itemname`,`price`,`nation`,`makedate`) VALUES 
(7," BenQ GW2780 아이케어 무결점 ",500000,"Burundi","2020-09-14"),
(7," BenQ EW3270U 아이케어 무결점 ",600000,"Cayman Islands","2019-02-02"),
(7,"BenQ ZOWIE XL2411P 아이케어 무결점 ",430000,"Liechtenstein","2020-01-31"),
(7,"BenQ ZOWIE XL2720 아이케어 무결점 ",550000,"Belarus","2019-03-25"),
(7,"한성컴퓨터 ULTRON 2758 프리싱크 리얼 75 ",400000,"Saint Lucia","2020-08-28"),
(7,"한성컴퓨터 ULTRON 2760G 리얼 144 게이밍 무결점 ",370000,"Moldova","2019-12-27"),
(7,"한성컴퓨터 ULTRON 3257 커브드 144 ",330000,"Turks and Caicos Islands","2019-10-20"),
(7,"한성컴퓨터 ULTRON 2758C 커브드 게이밍 165 ",480000,"Åland Islands","2019-08-12"),
(7,"한성컴퓨터 TFG34Q10W 1500R 커브드 게이밍 리얼 100 무결점 ",450000,"Greenland","2018-10-29"),
(7,"한성컴퓨터 ULTRON 3278 QHD New 무결점 ",420000,"Bulgaria","2020-05-30");

INSERT INTO `item` (`itemid`,`itemname`,`price`,`nation`,`makedate`) VALUES 
(6," LG전자 2019 그램 15ZD990-VX50K",370000,"Anguilla","2019-03-03"),
(6," LG전자 2019 울트라PC 15UD590-GX50K ",440000,"Libya","2019-10-08"),
(6,"LG전자 2019 그램 15ZD990-VX50K WIN10 ",650000,"Cook Islands","2019-02-11"),
(6,"LG전자 2019 울트라PC 15U590-GA56K ",360000,"Uruguay","2019-01-31"),
(6,"LG전자 2019 그램 14ZD990-GX30K ",470000,"Côte D'Ivoire (Ivory Coast)","2020-06-08"),
(6,"삼성전자 2019 노트북9 Always NT950XBE-X716A ",540000,"South Africa","2019-10-05"),
(6,"삼성전자 2019 노트북9 Always NT950XBV-A58A WIN10 ",580000,"Congo (Brazzaville)","2019-08-06"),
(6,"삼성전자 노트북5 NT500R5Z-K58A ",5500000,"Jamaica","2019-08-16"),
(6,"ASUS ROG Strix G G731GU-EV005 ",460000,"Angola","2019-03-02"),
(6,"삼성전자 2019 노트북9 Always NT950XBV-G58A WIN10 ",390000,"Sierra Leone","2019-03-25");

SELECT * FROM ITEM;