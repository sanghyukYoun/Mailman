
create table user(
	id mediumint(8) unsigned NOT NULL auto_increment,
	userid varchar(13) NOT NULL,
    username varchar(255),
    birth date,
    gender varchar(1),
    address varchar(255),
    homephnum varchar(100),
    cellphnum varchar(100),
    email varchar(255),

	primary key (id)
    
) auto_increment=1 charset=utf8;

INSERT INTO `user` (`userid`,`username`,`birth`,`address`,`homephnum`,`cellphnum`,`email`,`gender`) VALUES ("701373235","Davis","1995-06-18","서울 강남구","078-494-0107","010-8097-7262","tkdgur12347@naver.com",1);
INSERT INTO `user` (`userid`,`username`,`birth`,`address`,`homephnum`,`cellphnum`,`email`,`gender`) VALUES ("493351506","Hall","2009-07-01","서울 강남구","090-970-0323","010-0672-5693","tkdgur12347@gmail.com",2);
INSERT INTO `user` (`userid`,`username`,`birth`,`address`,`homephnum`,`cellphnum`,`email`,`gender`) VALUES ("110763463","Angelica","2004-05-15","서울 관악구","059-828-7244","010-9982-2487","asdfasewrwe@gasdf.com",1);
INSERT INTO `user` (`userid`,`username`,`birth`,`address`,`homephnum`,`cellphnum`,`email`,`gender`) VALUES ("995459971","Ursula","2007-03-06","대구 남구","089-258-0305","010-6458-0406","Sed.dictum.Proin@enimcommodo.edu",1);
INSERT INTO `user` (`userid`,`username`,`birth`,`address`,`homephnum`,`cellphnum`,`email`,`gender`) VALUES ("293284436","Deanna","2004-12-07","대구 북구","006-443-9923","010-9826-9975","kimseongtaek1@gmail.com",2);
INSERT INTO `user` (`userid`,`username`,`birth`,`address`,`homephnum`,`cellphnum`,`email`,`gender`) VALUES ("765891478","Christian","2007-01-27","광주 남산구","049-131-5290","010-4981-6706","sagittis@dictumplacerataugue.org",1);
INSERT INTO `user` (`userid`,`username`,`birth`,`address`,`homephnum`,`cellphnum`,`email`,`gender`) VALUES ("722280039","Lars","2007-04-19","광주 서구","081-302-7233","010-2947-8944","eros.nec.tellus@Suspendisse.org",2);
INSERT INTO `user` (`userid`,`username`,`birth`,`address`,`homephnum`,`cellphnum`,`email`,`gender`) VALUES ("566963856","Devin","2009-11-20","울산 남구","000-147-5908","010-7392-9419","eu@Cum.net",2);
INSERT INTO `user` (`userid`,`username`,`birth`,`address`,`homephnum`,`cellphnum`,`email`,`gender`) VALUES ("759999535","Keaton","2009-11-20","울산 중구","066-908-0813","010-5080-4539","vulputate.mauris.sagittis@nislsem.net",1);
INSERT INTO `user` (`userid`,`username`,`birth`,`address`,`homephnum`,`cellphnum`,`email`,`gender`) VALUES ("043730910","Brandon","2011-10-26","경기도 과천시","047-158-5034","010-3721-6736","taciti@nunc.org",2);
INSERT INTO `user` (`userid`,`username`,`birth`,`address`,`homephnum`,`cellphnum`,`email`,`gender`) VALUES ("560829558","Christine","2009-09-06","경기도 김포시","009-491-0659","010-8061-2397","asdww23@sooe.com",2),("869277293","Keaton","2009-09-24","인천 동구","034-672-1411","010-7805-0803","dsfsdfsddfsdasd@gmail.com",1),("019764729","Ann","2011-10-02","인천 연수구","015-287-5357","010-0199-8757","condimentum.Donec@euodio.net",2),("105321210","Sasha","2008-05-20","인천 계양구","044-449-2849","010-3262-5750","tincidunt.orci@Nullaeget.org",2),("347879702","Grady","2004-06-23","인천 남동구","076-829-0203","010-5359-3711","ornare.egestas.ligula@inlobortis.ca",1),("809730138","Robin","2008-10-25","인천 연수구","024-849-7276","010-3339-2214","Maecenas@arcuetpede.org",1),("087788006","Amela","2008-01-23","서울 강남구","031-935-1702","010-5912-1542","porttitor.vulputate.posuere@nulla.edu",1),("011441540","Octavius","2005-03-18","서울 강북구","040-131-3017","010-6583-7885","elit.a.feugiat@porttitortellus.co.uk",1),("520942897","Jameson","2004-11-15","인천 미추홀구","037-122-8616","010-2584-4175","congue.elit@tinciduntnunc.net",1);



select * from user;

