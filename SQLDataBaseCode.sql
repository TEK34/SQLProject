
create table REGIUNI(
id_regiune number(3) Primary Key,
nume varchar2(40),
continent varchar2(40));
create table TARI(
id_tara number(3) Primary Key,
nume varchar2(40),
id_regiune number(3),
foreign key (id_regiune) references REGIUNI(id_regiune));
create table ORASE(
id_oras number(3) Primary Key,
nume varchar2(40),
stat varchar2(40),
id_tara number(20),
foreign key (id_tara) references TARI(id_tara));
create table DEPOZITE(
id_depozit number(3) Primary Key,
adresa varchar2(80),
cod_postal number(20),
id_oras number(3),
tel number(20),
fax number(20),
email varchar2(80),
in_ang_responsabil number(3),
foreign key (id_oras) references ORASE(id_oras));
create table DEPARTAMENTE(
id_depart number(3) Primary Key,
nume varchar2(20),
descriere varchar2(160));
create table FUNCTII(
id_functie number(3) Primary Key,
denumire varchar2(20),
descriere varchar2(160));
create table ANGAJATI(
id_ang number(3) Primary Key,
nume varchar2(20),
pren varchar2(20),
cnp number(20),
adr varchar2(80),
tel number(20),
email varchar2(80),
id_depozit number(3),
data_ang Date,
id_depart number(3),
id_functie number(3),
salariu number(20),
foreign key (id_depozit) references DEPOZITE(id_depozit),
foreign key (id_depart) references DEPARTAMENTE(id_depart),
foreign key (id_functie) references FUNCTII(id_functie));
create table PRODUSE(
id_prod number(3) Primary Key,
nume varchar2(20),
descriere varchar2(160));
create table DEPOZITE_PRODUSE(
id_dep_prod number(3) Primary Key,
id_dep number(3),
id_prod number(3),
foreign key(id_dep) references DEPOZITE(id_depozit),
foreign key(id_prod) references PRODUSE(id_prod));
create table FURNIZORI (
id_furn number(3) Primary Key,
nume varchar2(20),
tel number(20),
email varchar2(80),
site varchar2(80),
fax number(20),
nume_resp varchar2(20));
create table EVIDENTA_APROVIZIONARE(
id_ev_apr number(3) Primary Key,
data Date,
id_prod number(3),
cantitate number(10),
pret_cumparare number(20),
id_depozit number(3),
id_furnizor number(3),
id_ang number(3),
foreign key (id_prod) references PRODUSE(id_prod),
foreign key (id_depozit) references DEPOZITE(id_depozit),
foreign key (id_furnizor) references FURNIZORI(id_furn),
foreign key (id_ang) references ANGAJATI(id_ang));
create table MAGAZINE(
id_mag number(3) Primary Key,
nume varchar2(20),
an_devenire_client number(10),
adresa varchar2(80),
cod_postal number(20),
id_oras number(3),
tel number(20),
fax number(20),
email varchar2(80),
site varchar2(80),
cont varchar2(80),
importanta varchar2(160),
comentarii_despre_client) varchar(160),
foreign key (id_oras) references ORASE(id_oras));
create table EVIDENTA_VANZARILOR(
id_ev_vanz number(3) Primary Key,
data_comenzii date,
nr_comanda number(3),
mod_trimitere_comanda varchar2(20),
id_mag number(3),
id_prod number(3),
cantitate number(10),
pret_vanzare number(10),
id_depozit number(3),
data_exped date,
metoda_plata varchar2(80),
id_ang number(3),
comision_angajat number(3),
foreign key (id_mag) references MAGAZINE(id_mag),
foreign key (id_prod) references PRODUSE(id_prod),
foreign key (id_depozit) references DEPOZITE(id_depozit),
foreign key (id_ang) references ANGAJATI(id_ang));
create table INFORMATII_TRIMISE_CLIENTILOR(
id_inf number(3) Primary Key,
data date, 
nr_comanda number(3),
id_mag number(3),
informatia varchar2(160),
mod_transmitere varchar2(20),
foreign key (id_mag) references MAGAZINE(id_mag));
insert into REGIUNI values(1,'Bayern','Europa');
insert into REGIUNI values(2,'Occitanie','Europa');
insert into REGIUNI values(3,'Plateau','Africa');
insert into REGIUNI  values(4,'Adrar','Africa');
insert into REGIUNI  values(5,'Qinghai','Asia');
insert into REGIUNI  values(6,'Komi','Europa');
insert into REGIUNI  values(7,'Luis','S-America');
insert into REGIUNI  values(8,'Bahia','N-America');
select *from REGIUNI;
insert into TARI values(1,'Germania',1);
insert into TARI values(2,'Franta',2);
insert into TARI values(3,'Nigeria',3);
insert into TARI values(4,'Algeria',4);
insert into TARI values(5,'China',5);
insert into TARI values(6,'Russia',6);
insert into TARI values(7,'Argentina',7);
insert into TARI values(8	,'Brazilia',8);
select *from TARI;
insert into ORASE values(1,'Augsburg','Schwaben',1);
insert into ORASE values(2,'Toulouse','Haute-Garrone',2);
insert into ORASE values(3,'Wase','Kano',3);
insert into ORASE values(4,'Adrar','Mauritania',4);
insert into ORASE values(5,'Xining','Qinghai',5);
insert into ORASE values(6,'Siktivkar','Komi',6);
insert into ORASE values(7,'San Luis','Luis',7);
insert into ORASE values(8,'Salvador','El Salvador',8);
select *from ORASE;
insert into DEPOZITE values(1,'3798 Harter street',86150,1,037413456,0,'depozitaugsburg@gmail.com',1);	
insert into DEPOZITE values(2,'80 Elk City road',31000,2,33532669790,0,'depozittoulouse@gmail.com',5);
insert into DEPOZITE values(3,'906 Bates Brothers Road',942105,3,0,0,'depozitwase@gmail.com',10);
insert into DEPOZITE values(4,'2401 Emily Renzelli Boulevard',1006,4,213-49-52354,0,'depozitadrar@gmail.com',15);
insert into DEPOZITE values(5,'4110 Freedom Lane',810000,5,0971-95598,0,'depozitxining@gmail.com',20);
insert into DEPOZITE values(6,'568 Villa Drive',167000,6,78212255287,0,'depozitsiktivkar@gmail.com',25);
insert into DEPOZITE values(7,'3203 Memory Lane',5700,7,390473279570,0,'depozitSanLuis@gmail.com',30);
insert into DEPOZITE values(8,'3512 Vesta Drive',40000000,8,50334245934,0,'depozitSalvador@gmail.com',35);
select *from DEPOZITE;
insert into DEPARTAMENTE values(1,'Receptie Bunuri','Primirea bunurilor de la furnizori');
insert into DEPARTAMENTE values(2,'Depozit Bunuri','Depozitarea si stocarea bunurilor');
insert into DEPARTAMENTE values(3,'Livrare Bunuri','Livrarea produselorcatre clienti');
insert into DEPARTAMENTE values(4,'Contabilitate','Stocarea tuturor intrarilor si iesirilor din companie');
insert into DEPARTAMENTE values(5,'Administrare','Indrumarea lucratorilorsi mentinerea depozitelor in stare optima');
select *from DEPARTAMENTE;
insert into FUNCTII values(1,'Lucrator','Se va ocupa cu depozitare bunurilor in depozit in ordine');
insert into FUNCTII values(2,'Operator forklift','Va opera utilajul de tip forklift pentru a putea livra in siguranta pachetele in depozit');
insert into FUNCTII values(3,'Curier','Se va ocupa cu livrarea produselor catre clienti');
insert into FUNCTII values(4,'Lucrator Sef','Se va ocupa cu conducerea si indrumarea lucratorilor');
insert into FUNCTII values(5,'Administrator Depozit','Se va ocupa cu administrareasi buna conditie a depozitelor');
select *from FUNCTII;
insert into ANGAJATI values(1,'Corinna','Carola',1900728444635,'4486 Robinson Lane',9042474552,'berez20@refsk.site',1,date'2013-12-02',5,5,2714);
insert into ANGAJATI values(2,'Mareike','Alida',1901104394212,'473 Devils Hill Road',3047932151,'nsicjky@bigmoist.me',1,date'2013-04-16',1,1,2729);
insert into ANGAJATI values(3,'Gerd','Micha',1940813295332,'1055 Joyce Street',2104317083,'dms1123@lsadinl.com',1,date'2013-12-20',2,2,1424);
insert into ANGAJATI values(4,'Liane','Hermina',1870602455423,'1515 Dovetail Estates',434528211,'abdullow@usayoman.com',1,date'2014-02-27',3,3,2144);
insert into ANGAJATI values(5,'Dorothea','Camilla',1940518041455,'3899 Briarwood Road',9122380866,'markelov888@redaksikabar.com',1,date'2014-04-22',5,5,1008);
insert into ANGAJATI values(6,'Cyprien','Jose',5040108466414,'995 Harvest Lane',2524755737,'thesaxman@visieonl.com',2,date'2014-09-30',4,1,2177);
insert into ANGAJATI values(7,'Philibert','Odilon',2881123223986,'3557 Tree Frog Lane',8285868598,'rayes@riniiya.com',2,date'2014-12-15',1,1,2625);
insert into ANGAJATI values(8,'Sylvestre','Daphnee',1980403241331,'4096 Birch Street',5733909319,'3913391@typery.com',2,date'2015-03-03',2,2,2388);
insert into ANGAJATI values(9,'Berthe','Pascaline',1940724335696,'3303 Chipmunk Lane',5862543943,'x0xsyndromex0x@redaksikabar.com',2,date'2015-05-19',3,3,2438);
insert into ANGAJATI values(10,'Charlotte','Jacky',1960224527243,'3670 Carolina Avenue',8703094953,'mashakymertay@yandex.cfd',2,date'2015-07-06',5,5,1055);
insert into ANGAJATI values(11,'Kumbukani','Funanya',1950729131595,'3393 Oak Avenue',2762398851,'bxatpack@radiantliving.org',3,date'2015-09-11',1,1,1663);
insert into ANGAJATI values(12,'Ngozi','Xaawo',1980813432281,'2367 Fairfield Road',7574381779,'bizdynamics@tslhgta.com',3,date'2015-09-18',2,2,1046);
insert into ANGAJATI values(13,'Mavuto','Chuks',6020530303757,'2759 Hog Camp Road',2029560393,'feyde@axie.ml',3,date'2015-11-09',3,3,2994);
insert into ANGAJATI values(14,'Lishan','Puleng',1900528021322,'1899 Wines Lane',9258844782,'scoobee1@eluvit.com',3,date'2015-12-14',4,4,1150);
insert into ANGAJATI values(15,'Adjoa','Retha',1971204202228,'4150 Tenmile Road',7402376404,'bfaae101@eluvit.com',3,date'2016-03-01',5,5,2261);
insert into ANGAJATI values(16,'Ekwueme','Gadise',2960606143059,'1318 Johnson Street',7128674836,'ejjlat@gmailya.com',4,date'2016-06-21',1,1,2807);
insert into ANGAJATI values(17,'Adannaya','Chausiku',1960329077586,'1524 Pin Oak Drive',8457565136,'tas18th@virginiaintel.com',4,date'2016-06-27',2,2,2921);
insert into ANGAJATI values(18,'Efua','Sekani',6010710033913,'2357 Elk City Road',2057072923,'douglasppc@hcfmgsrp.com',4,date'2018-04-23',1,1,2227);
insert into ANGAJATI values(19,'Kehide','Zikomo',1900324421701,'229 Edgewood Avenue',9104806389,'nnick@yandex.cfd',4,date'2019-02-28',3,3,1135);
insert into ANGAJATI values(20,'Bitrus','Babirye',1940908348899,'732 Murphy Court',8578889618,'lsjlsw@tednbe.com',4,date'2019-06-17',5,5,1286);
insert into ANGAJATI values(21,'Jiahao','Ping',1920215522505,'1447 Gorby Lane',936-337-5102,'eselfilme@rmune.com',5,date'2019-09-27',4,4,1830);
insert into ANGAJATI values(22,'Qing','Ru',1921225190121,'3083 Cedarstone Drive',4356761539,'shanejosh@gmx.fit',5,date'2020-04-24',1,1,2775);
insert into ANGAJATI values(23,'Guanyu','Bao',1990728190441,'4252 Elk Street',8179300230,'tellmeimabadass@vaytien.asia',5,date'2020-05-14',2,2,2115);
insert into ANGAJATI values(24,'Xinyi','Lan',2940322341196,'996 Tuna Street',3376543702,'crunchyfrog@fheiesit.com',5,date'2020-10-30',3,3,1518);
insert into ANGAJATI values(25,'Mei','Yong',1970422149534,'2726 Jody Road',3343890796,'stephnsixx@antawii.com',5,date'2021-07-16',5,5,2678);
insert into ANGAJATI values(26,'Fima','Timur',1970211191401,'920 McVaney Road',3018747905,'janishjustin2004@virginiaintel.com',6,date'2013-03-14',1,1,2678);
insert into ANGAJATI values(27,'Vitold','Praskovya',1921109249579,'4439 Mount Tabor',7187997260,'banchee321@virginiaintel.com',6,date'2014-06-06',2,2,2359);
insert into ANGAJATI values(28,'Ermolai','Liubov',5040207057657,'4029 Todds Lane',4049779241,'arthur47@visieonl.com',6,date'2014-06-11',3,3,2086);
insert into ANGAJATI values(29,'Yefim','Ilja',1921018036728,'4342 Jessie Street',2813349788,'siawkaren@gmailco.ml',6,date'2014-12-19',4,4,2329);
insert into ANGAJATI values(30,'Emil','Juliya',5020130393764,'1160 Post Farm Road',2538524029,'annohein@outlook.sbs',6,date'2015-10-08',5,5,2975);
insert into ANGAJATI values(31,'Lilja','Tatjana',1920613187277,'1678 Boone Street',8142595224,'wiaserc9xxq@stanford-university.education',7,date'2016-01-16',3,3,2458);
insert into ANGAJATI values(32,'Larisa','Gustavs',6020930047615,'2463 Duck Creek Road',9253897259,'k0lya23v@hieu.in',7,date'2016-04-27',1,1,2150);
insert into ANGAJATI values(33,'Fridrihs','Ina',1870218088286,'4847 Tator Patch Road',7542142912,'hornyt@thiensita.net',7,date'2016-06-01',4,4,1961);
insert into ANGAJATI values(34,'Liva','Laura',2891006335705,'1865 Caldwell Road',7878862288,'nadezhdakolpina58@nproxi.com',7,date'2016-08-30',2,2,2261);
insert into ANGAJATI values(35,'Regina','Laima',6020309169032,'3267 Olen Thomas Drive',8655676351,'zalex97@stanford-university.education',7,date'2018-11-06',5,5,2124);
insert into ANGAJATI values(36,'Ina','Margarita',2970109390698,'853 Bridge Avenue',7409935269,'procopio@cggup.com',8,date'2019-01-04',4,1,2522);
insert into ANGAJATI values(37,'Vilis','Romualds',1950119336916,'2433 Hardman Road',5082986400,'wmpnsilwyd@taatfrih.com',8,date'2019-11-19',2,2,2045);
insert into ANGAJATI values(38,'Renata','Elita',2890227047526,'1634 Bailey Drive',2312493768,'jj68337@riniiya.com',8,date'2020-10-05',3,3,1668);
insert into ANGAJATI values(39,'Karisa','Inara',1950721368749,'3560 Tator Patch Road',2392651490,'sherov85@azwv.site',8,date'2021-07-21',1,1,1209);
insert into ANGAJATI values(40,'Mareks','Ksenija',1951023049006,'139 Harter Street',3013198484,'kiro092005@gmailwe.com',8,date'2021-08-06',5,5,2236);
select *from ANGAJATI;
 insert into PRODUSE values(1,'Trening Adidas','Echipament sportiv 90 % bumbac 10% poliester');
 insert into PRODUSE values(2,'Trening Puma','Echipament sportiv 80 % bumbac 20% poliester');
 insert into PRODUSE values(3,'Trening Nike','Echipament sportiv 50 % bumbac 50% poliester');
 insert into PRODUSE values(4,'Trening GymBeam','Echipament sportiv 90 % poliester10% bumac');
 insert into PRODUSE values(5,'Racheta Tenis','Echipament sport');
 insert into PRODUSE values(6,'Minge football','Echipament sport');
 insert into PRODUSE values(7,'Minge basketball','Echipament sport');
 insert into PRODUSE values(8,'Echipament Ski','Echipament sport');
 insert into PRODUSE values(9,'Gantere','Gantere dinmetal 5 kg');
 insert into PRODUSE values(10,'Gantere','Gantere din metal 10 kg');
 insert into PRODUSE values(11,'Banca sala','Banca formata din 90% metal si 10% pieleintoarsa pentru acoperire.');
 insert into PRODUSE values(12,'Scripete spate','Scripete facutpentru antrena spatelegreutate totala 120 kg');
 insert into PRODUSE values(13,'Presa verticala picioare','Presa verticala antrenare picioare greutate totala 300 kg');
 insert into PRODUSE values(14,'Bara piept','Bara pentru exercitii pectoraligreutate 16.5 kg');
 insert into PRODUSE values(15,'Adidasi Nike','Echipament sport');
 insert into PRODUSE values(16,'Adidasi Puma','Echipament sport');
 insert into PRODUSE values(17,'Adidasi Adidas','Echipament sport');
 insert into PRODUSE values(18,'Manusi de sala','Echipament sport');
 insert into PRODUSE values(19,'Tricou jogging','Echipament sport 100% poliester');
 insert into PRODUSE values(20,'Pantaloni jogging','Echipament sport 100% bumbac');
 insert into PRODUSE values(21,'Adidas jogging','Echipament sport');
 insert into PRODUSE values(22,'Presa orizontala piept','Presa formata dintr-o  banca dreapta si suport pentru bara piept');
 insert into PRODUSE values(23,'Presa inclinata piept','Presa formata dintr-o bara inclinata 30 de grade cu suport pentru bara piept');
 insert into PRODUSE values(24,'Presa declinata piept','Presa formata dintr-o blana declinata 30 de grade cu suport pentru bara piept');
 select *from PRODUSE;
insert into DEPOZITE_PRODUSE values(1,1,20);
insert into DEPOZITE_PRODUSE values(2,1,21);
insert into DEPOZITE_PRODUSE values(3,1,22);
insert into DEPOZITE_PRODUSE values(4,2,23);
insert into DEPOZITE_PRODUSE values(5,2,24);
insert into DEPOZITE_PRODUSE values(6,2,19);
insert into DEPOZITE_PRODUSE values(7,3,18);
insert into DEPOZITE_PRODUSE values(8,3,16);
insert into DEPOZITE_PRODUSE values(9,3,17);
insert into DEPOZITE_PRODUSE values(10,4,15);
insert into DEPOZITE_PRODUSE values(11,4,14);
insert into DEPOZITE_PRODUSE values(12,4,12);
insert into DEPOZITE_PRODUSE values(13,5,13);
insert into DEPOZITE_PRODUSE values(14,5,11);
insert into DEPOZITE_PRODUSE values(15,5,10);
insert into DEPOZITE_PRODUSE values(16,6,9);
insert into DEPOZITE_PRODUSE values(17,6,8);
insert into DEPOZITE_PRODUSE values(18,6,6);
insert into DEPOZITE_PRODUSE values(19,7,7);
insert into DEPOZITE_PRODUSE values(20,7,5);
insert into DEPOZITE_PRODUSE values(21,7,4);
insert into DEPOZITE_PRODUSE values(22,8,3);
insert into DEPOZITE_PRODUSE values(23,8,1);
insert into DEPOZITE_PRODUSE values(24,8,2);select *from DEPOZITE_PRODUSE;
insert into FURNIZORI values(1,'Nike',18003446453,'Investor.Relations@nike.com','https://www.nike.com/',0,'Charlotte');
insert into FURNIZORI values(2,'Adidas',499132840,'investor.relations@adidas.com','https://www.adidas.com/us',0,'Adjoa');
insert into FURNIZORI values(3,'Puma',499132810,'info@puma.com','https://about.puma.com/',499132812246,'Bitrus');
insert into FURNIZORI values(4,'GymBeam',0040316302838,'info@gymbeam.ro','https://gymbeam.ro/',0,'Corinna');
select *from FURNIZORI;
insert into EVIDENTA_APROVIZIONARE values(1,date'2021-06-25',1,500,25000,1,2,1);
insert into EVIDENTA_APROVIZIONARE values(2,date'2021-06-25',2,500,30000,1,3,1);
insert into EVIDENTA_APROVIZIONARE values(3,date'2021-06-25',3,500,40000,1,1,1);
insert into EVIDENTA_APROVIZIONARE values(4,date'2021-06-25',4,500,15000,2,4,5);
insert into EVIDENTA_APROVIZIONARE values(5,date'2021-06-25',5,100,3000,2,4,5);
insert into EVIDENTA_APROVIZIONARE values(6,date'2021-06-25',6,100,5000,2,4,5);
insert into EVIDENTA_APROVIZIONARE values(7,date'2021-06-25',7,100,5000,3,4,10);
insert into EVIDENTA_APROVIZIONARE values(8,date'2021-06-25',8,20,4000,3,4,10);
insert into EVIDENTA_APROVIZIONARE values(9,date'2021-06-25',9,100,2500,3,4,10);
insert into EVIDENTA_APROVIZIONARE values(10,date'2021-06-25',10,100,5000,4,4,15);
insert into EVIDENTA_APROVIZIONARE values(11,date'2021-06-25',11,25,10000,4,4,15);
insert into EVIDENTA_APROVIZIONARE values(12,date'2021-06-25',12,25,15000,4,4,15);
insert into EVIDENTA_APROVIZIONARE values(13,date'2021-06-25',13,20,16000,5,4,20);
insert into EVIDENTA_APROVIZIONARE values(14,date'2021-06-25',14,30,6000,5,4,20);
insert into EVIDENTA_APROVIZIONARE values(15,date'2021-06-25',15,250,25000,5,1,20);
insert into EVIDENTA_APROVIZIONARE values(16,date'2021-06-25',16,250,25000,6,3,25);
insert into EVIDENTA_APROVIZIONARE values(17,date'2021-06-25',17,250,25000,6,2,25);
insert into EVIDENTA_APROVIZIONARE values(18,date'2021-06-25',18,250,7500,6,4,25);
insert into EVIDENTA_APROVIZIONARE values(19,date'2021-06-25',19,250,5000,7,4,30);
insert into EVIDENTA_APROVIZIONARE values(20,date'2021-06-25',20,250,5000,7,4,30);
insert into EVIDENTA_APROVIZIONARE values(21,date'2021-06-25',21,250,25000,7,4,30);
insert into EVIDENTA_APROVIZIONARE values(22,date'2021-06-25',22,30,15000,8,4,35);
insert into EVIDENTA_APROVIZIONARE values(23,date'2021-06-25',23,30,15000,8,4,35);
insert into EVIDENTA_APROVIZIONARE values(24,date'2021-06-25',24,30,15000,8,4,35);
select *from EVIDENTA_APROVIZIONARE;
alter table MAGAZINE
add comentarii_despre_client varchar2(160);
insert into MAGAZINE values(1,'Sports Goods',2021,'1329 Glenview Drive',86150,1,0268516145, 40264598979,'jwpdrguu@gmailni.com','https://www.sportsjam.in/',32316228,'Mare','Nu exista comentarii.');
insert into MAGAZINE values(2,'Hervis Sports',2021,'2773 Medical Center Drive',31000,2,40266243486,40250733480,'dodgehellfire@tslhgta.com','https://www.hervis.ro/shop/',56840263,'Mare','Nu exista comentarii.');
insert into MAGAZINE values(3,'Decathlon',2021,'2555 Southern Avenue',942105,3,0237215561,40213239090, 'csspat@niatlsu.com','https://www.decathlon.com/',46745023,'Mare','Nu exista comentarii.');
insert into MAGAZINE values(4,'Sporting Equipment',2021,'3976 Massachusetts Avenue',1006,4,40269217781,0232293525,'kr8iwp@mexcool.com','https://www.playitagainsports.com/',19853705,'Mare','Nu exista comentarii');
insert into MAGAZINE values(5,'Sports inc',2021,'1444 Shinn Avenue',810000,5,0237275887,40722223867, 'puzikoman@singmails.com',0,19832408,'Medie','Interprindere medie plata in rate');
insert into MAGAZINE values(6,'Football Eqpuiment srl',2021,'3665 Lynn Avenue',167000,6,40268217400,0744555353, 'nobee28@filevino.com',0,10453256,'Medie','Interprindere medie plata in rate');
insert into MAGAZINE values(7,'Baskteball Equipment srl',2021,'1428 Mulberry Lane',5700,7,40264439415,40236460437,'boykogatuso@mymailcr.com',0,34335423,'Mica','Interprindere mica plata in rate');
insert into MAGAZINE values(8,'Extreme sports srl',2021,'1404 Late Avenue',40000000,8,0726727681,0237616490,'misscarol019@tubidu.com',0,40039074,'Mica','Interprindere mica plata in rate');
select *from MAGAZINE;
insert into EVIDENTA_VANZARILOR values(1,date'2021-01-08',1,'Curier',1,1,500,30000,8,date'2021-01-15','cash',35,10);
insert into EVIDENTA_VANZARILOR values(2,date'2021-01-25',1,'Curier',1,2,500,40000,8,date'2021-01-28','cash',35,10);
insert into EVIDENTA_VANZARILOR values(3,date'2021-02-02',1,'Curier',1,3,500,50000,8,date'2021-02-10','cash',35,10);
insert into EVIDENTA_VANZARILOR values(4,date'2021-02-26',2,'Curier',2,4,500,25000,7,date'2021-02-28','cash',30,10);
insert into EVIDENTA_VANZARILOR values(5,date'2021-03-23',2,'Curier',2,15,250,35000,4,date'2021-03-27','cash',15,10);
insert into EVIDENTA_VANZARILOR values(6,date'2021-03-25',2,'Curier',2,16,250,35000,3,date'2021-03-28','cash',10,10);
insert into EVIDENTA_VANZARILOR values(7,date'2021-05-21',3,'Curier',3,17,250,35000,3,date'2021-05-24','cash',10,10);
insert into EVIDENTA_VANZARILOR values(8,date'2021-05-25',3,'Curier',3,18,250,10000,3,date'2021-05-27','cash',10,10);
insert into EVIDENTA_VANZARILOR values(9,date'2021-05-27',3,'Curier',3,19,250,7500,2,date'2021-05-29','cash',5,10);
insert into EVIDENTA_VANZARILOR values(10,date'2021-06-03',4,'Curier',4,22,30,25000,1,date'2021-06-05','cash',1,10);
insert into EVIDENTA_VANZARILOR values(11,date'2021-06-18',4,'Curier',4,23,30,25000,1,date'2021-06-22','cash',1,10);
insert into EVIDENTA_VANZARILOR values(12,date'2021-06-28',4,'Curier',4,24,30,25000,1,date'2021-07-03','cash',1,10);
insert into EVIDENTA_VANZARILOR values(13,date'2021-07-06',5,'Curier',5,9,25,5000,6,date'2021-07-05','rate',25,10);
insert into EVIDENTA_VANZARILOR values(14,date'2021-07-21',5,'Curier',5,10,25,9000,5,date'2021-07-25','rate',20,10);
insert into EVIDENTA_VANZARILOR values(15,date'2021-08-06',5,'Curier',5,11,25,12500,5,date'2021-08-10','rate',20,10);
insert into EVIDENTA_VANZARILOR values(16,date'2021-08-19',6,'Curier',6,6,100,7500,7,date'2021-08-23','rate',30,10);
insert into EVIDENTA_VANZARILOR values(17,date'2021-09-06',6,'Curier',6,21,30,8000,1,date'2021-09-11','rate',1,10);
insert into EVIDENTA_VANZARILOR values(18,date'2021-09-08',6,'Curier',6,20,30,30000,1,date'2021-09-12','rate',1,10);
insert into EVIDENTA_VANZARILOR values(19,date'2021-10-19',7,'Curier',7,7,100,6500,6,date'2021-10-24','rate',25,10);
insert into EVIDENTA_VANZARILOR values(20,date'2021-10-26',7,'Curier',7,12,30,17500,4,date'2021-10-30','rate',15,10);
insert into EVIDENTA_VANZARILOR values(21,date'2021-11-01',7,'Curier',7,13,250,20000,5,date'2021-11-05','rate',20,10);
insert into EVIDENTA_VANZARILOR values(22,date'2021-11-22',8,'Curier',8,5,100,5000,7,date'2021-11-25','rate',30,10);
insert into EVIDENTA_VANZARILOR values(23,date'2021-11-24',8,'Curier',8,8,100,6000,6,date'2021-11-29','rate',25,10);
insert into EVIDENTA_VANZARILOR values(24,date'2021-12-09',8,'Curier',8,14,250,8000,4,date'2021-12-11','rate',15,10);
select *from EVIDENTA_APROVIZIONARE;
select *from EVIDENTA_VANZARILOR;
insert into INFORMATII_TRIMISE_CLIENTILOR values(1,date'2021-01-15',1,1,'Comanda dumneavoastra in valoare de 30000 a fost livrata cu succes.','email');
insert into INFORMATII_TRIMISE_CLIENTILOR values(2,date'2021-01-28',2,1,'Comanda dumneavoastra in valoare de 40000 a fost livrata cu succes.','email');
insert into INFORMATII_TRIMISE_CLIENTILOR values(3,date'2021-02-10',3,1,'Comanda dumneavoastra in valoare de 50000 a fost livrata cu succes.','telefon');
insert into INFORMATII_TRIMISE_CLIENTILOR values(4,date'2021-02-28',4,2,'Comanda dumneavoastra in valoare de 25000 a fost livrata cu succes.','fax');
insert into INFORMATII_TRIMISE_CLIENTILOR values(5,date'2021-03-27',5,2,'Comanda dumneavoastra in valoare de 35000 a fost livrata cu succes.','telefon');
insert into INFORMATII_TRIMISE_CLIENTILOR values(6,date'2021-03-28',6,2,'Comanda dumneavoastra in valoare de 35000 a fost livrata cu succes.','fax');
insert into INFORMATII_TRIMISE_CLIENTILOR values(7,date'2021-05-24',7,3,'Comanda dumneavoastra in valoare de 35000 a fost livrata cu succes.','email');
insert into INFORMATII_TRIMISE_CLIENTILOR values(8,date'2021-05-27',8,3,'Comanda dumneavoastra in valoare de 10000 a fost livrata cu succes.','email');
insert into INFORMATII_TRIMISE_CLIENTILOR values(9,date'2021-05-29',9,3,'Comanda dumneavoastra in valoare de 7500 a fost livrata cu succes.','email');
insert into INFORMATII_TRIMISE_CLIENTILOR values(10,date'2021-06-05',10,4,'Comanda dumneavoastra in valoare de 25000 a fost livrata cu succes.','telefon');
insert into INFORMATII_TRIMISE_CLIENTILOR values(11,date'2021-06-22',11,4,'Comanda dumneavoastra in valoare de 25000 a fost livrata cu succes.','telefon');
insert into INFORMATII_TRIMISE_CLIENTILOR values(12,date'2021-07-03',12,4,'Comanda dumneavoastra in valoare de 25000 a fost livrata cu succes.','telefon');
insert into INFORMATII_TRIMISE_CLIENTILOR values(13,date'2021-07-05',13,5,'Comanda dumneavoastra in valoare de 5000 a fost livrata cu succes.','fax');
insert into INFORMATII_TRIMISE_CLIENTILOR values(14,date'2021-07-25',14,5,'Comanda dumneavoastra in valoare de 9000 a fost livrata cu succes.','email');
insert into INFORMATII_TRIMISE_CLIENTILOR values(15,date'2021-08-10',15,5,'Comanda dumneavoastra in valoare de 12500 a fost livrata cu succes.','telefon');
insert into INFORMATII_TRIMISE_CLIENTILOR values(16,date'2021-08-23',16,6,'Comanda dumneavoastra in valoare de 7500 a fost livrata cu succes.','email');
insert into INFORMATII_TRIMISE_CLIENTILOR values(17,date'2021-09-11',17,6,'Comanda dumneavoastra in valoare de 8000 a fost livrata cu succes.','fax');
insert into INFORMATII_TRIMISE_CLIENTILOR values(18,date'2021-09-12',18,6,'Comanda dumneavoastra in valoare de 30000 a fost livrata cu succes.','email');
insert into INFORMATII_TRIMISE_CLIENTILOR values(19,date'2021-10-24',19,7,'Comanda dumneavoastra in valoare de 6500 a fost livrata cu succes.','telefon');
insert into INFORMATII_TRIMISE_CLIENTILOR values(20,date'2021-10-30',20,7,'Comanda dumneavoastra in valoare de 17500 a fost livrata cu succes.','email');
insert into INFORMATII_TRIMISE_CLIENTILOR values(21,date'2021-11-05',21,7,'Comanda dumneavoastra in valoare de 20000 a fost livrata cu succes.','telefon');
insert into INFORMATII_TRIMISE_CLIENTILOR values(22,date'2021-11-25',22,8,'Comanda dumneavoastra in valoare de 5000 a fost livrata cu succes.','email');
insert into INFORMATII_TRIMISE_CLIENTILOR values(23,date'2021-11-29',23,8,'Comanda dumneavoastra in valoare de 6000 a fost livrata cu succes.','telefon');
insert into INFORMATII_TRIMISE_CLIENTILOR values(24,date'2021-12-11',24,8,'Comanda dumneavoastra in valoare de 8000 a fost livrata cu succes','fax' );
select *from INFORMATII_TRIMISE_CLIENTILOR;
