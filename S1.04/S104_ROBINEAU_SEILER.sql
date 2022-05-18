--Groupe Thomas Robineau / Mathis Seiler S1C


CREATE TABLE joueur (
    idjoueur          NUMBER(2),
    nom               VARCHAR(40),
    age               NUMBER(2),
    nationalite       VARCHAR(20),
    nbmatchsuspension NUMBER(3),
    PRIMARY KEY ( idjoueur )
);

CREATE TABLE club (
    nomclub  VARCHAR(15),
    ville    VARCHAR(15),
    stade    VARCHAR(30),
    capacite NUMBER(6),
    PRIMARY KEY ( nomclub )
);

CREATE TABLE match (
    idmatch       NUMBER(2),
    clubdomicile  VARCHAR(15),
    clubvisiteur  VARCHAR(15),
    datematch     DATE,
    nbbutsdom     NUMBER(2),
    nbbutsvis     NUMBER(2),
    nbspectateurs NUMBER(6),
    PRIMARY KEY ( idmatch ),
    Foreign key (clubdomicile) references club(nomclub),
    foreign key (clubvisiteur) references club(nomclub)
);

CREATE TABLE saison (
    idsaison    NUMBER(2),
    debutsaison DATE,
    finsaison   DATE,
    PRIMARY KEY ( idsaison )
);

CREATE TABLE contrat (
    nomclub      VARCHAR(15),
    idjoueur     NUMBER(2),
    debutcontrat DATE,
    transfert    NUMBER(9),
    salaire      NUMBER(6),
    fincontrat   DATE,
    PRIMARY KEY ( debutcontrat,
                  nomclub,
                  idjoueur ),
    FOREIGN KEY ( nomclub )
        REFERENCES club ( nomclub ),
    FOREIGN KEY ( idjoueur )
        REFERENCES joueur ( idjoueur )
);

CREATE TABLE joue (
    idmatch  NUMBER(2),
    idjoueur NUMBER(2),
    poste    VARCHAR(15),
    nbminjeu NUMBER(3),
    carton   VARCHAR(15),
    PRIMARY KEY ( idmatch,
                  idjoueur ),
    FOREIGN KEY ( idmatch )
        REFERENCES match ( idmatch ),
    FOREIGN KEY ( idjoueur )
        REFERENCES joueur ( idjoueur )
);

CREATE TABLE abonnement (
    idsaison     NUMBER(2),
    nomclub      VARCHAR(15),
    nbabonnement NUMBER(6),
    montant      NUMBER(4),
    PRIMARY KEY ( idsaison,
                  nomclub ),
    FOREIGN KEY ( idsaison )
        REFERENCES saison ( idsaison ),
    FOREIGN KEY ( nomclub )
        REFERENCES club ( nomclub )
);

CREATE TABLE championnat (
idsaison number(2),
nomclub varchar(15),
points number(3),
primary key(idsaison, nomclub),
foreign key (idsaison) references saison(idsaison), foreign key ( nomclub ) references club ( nomclub )
);

--Insertion valeurs

insert into JOUEUR values (1,'Abdou Traoré',27,'Mali',0);
insert into JOUEUR values (2,'Adam Ounas',19,'France',0);
insert into JOUEUR values (3,'Aldo Kalulu',19,'France',0);
insert into JOUEUR values (4,'Alexandre Lacazette',24,'France',0);
insert into JOUEUR values (5,'André Poko',22,'Gabon',0);
insert into JOUEUR values (6,'Anthony Lopes',25,'Portugal',0);
insert into JOUEUR values (7,'Arnold Mvuemba',30,'France',0);
insert into JOUEUR values (8,'Bakary Koné',27,'BurkinaFaso',0);
insert into JOUEUR values (9,'Cédric Carrasso',33,'France',3);
insert into JOUEUR values (10,'Cédric Yambéré',25,'France',1);
insert into JOUEUR values (11,'Cheick Diabaté',27,'Mali',2);
insert into JOUEUR values (12,'Christophe Jallet',32,'France',4);
insert into JOUEUR values (13,'Claudio Beauvue',27,'France',0);
insert into JOUEUR values (14,'Clément Chantôme',28,'France',0);
insert into JOUEUR values (15,'Clément Grenier',24,'France',0);
insert into JOUEUR values (16,'Corentin Tolisso',21,'France',0);
insert into JOUEUR values (17,'David Sambissa',19,'France',0);
insert into JOUEUR values (18,'Diego Contento',25,'Allemagne',0);
insert into JOUEUR values (19,'Diego Rolan',22,'Uruguay',0);
insert into JOUEUR values (20,'Enzo Crivelli',20,'France',0);
insert into JOUEUR values (21,'Frederic Guilbert',20,'France',0);
insert into JOUEUR values (22,'Gaëtan Laborde',21,'France',0);
insert into JOUEUR values (23,'Grégory Sertic',26,'France',0);
insert into JOUEUR values (24,'Gueïda Fofana',24,'France',0);
insert into JOUEUR values (25,'Henri Bedimo',31,'Cameroun',0);
insert into JOUEUR values (26,'Henri Saivet',25,'Sénégal',3);
insert into JOUEUR values (27,'Ilias Hassani',20,'France',1);
insert into JOUEUR values (28,'Isaac Kiese Thelin',23,'Suède',2);
insert into JOUEUR values (29,'Jaroslav Plasil',33,'Rép.Tchèque',4);
insert into JOUEUR values (30,'Jeremy Morel',31,'France',0);
insert into JOUEUR values (31,'Jérôme Prior',20,'France',0);
insert into JOUEUR values (32,'Jordan Ferri',23,'France',0);
insert into JOUEUR values (33,'Jussiê',32,'Brésil',0);
insert into JOUEUR values (34,'Kevin Soni',18,'Cameroun',0);
insert into JOUEUR values (35,'Lamine Sané',28,'Sénégal',0);
insert into JOUEUR values (36,'Lindsay Rose',23,'France',0);
insert into JOUEUR values (37,'Lucas Mocio',21,'France',0);
insert into JOUEUR values (38,'Lucas Tousart',18,'France',0);
insert into JOUEUR values (39,'Mapou Yanga-Mbiwa',26,'France',0);
insert into JOUEUR values (40,'Mathieu Gorgelin',25,'France',0);
insert into JOUEUR values (41,'Mathieu Valbuena',31,'France',0);
insert into JOUEUR values (42,'Maxime Gonalons',26,'France',0);
insert into JOUEUR values (43,'Maxime Poundjé',23,'France',3);
insert into JOUEUR values (44,'Maxwel Cornet',19,'France',1);
insert into JOUEUR values (45,'Milan Bisevac',32,'Serbie',2);
insert into JOUEUR values (46,'Milan Gajic',19,'Serbie',4);
insert into JOUEUR values (47,'Nabil Fekir',22,'France',0);
insert into JOUEUR values (48,'Nicolas Maurice-Belay',30,'France',0);
insert into JOUEUR values (49,'Nicolas Pallois',28,'France',0);
insert into JOUEUR values (50,'Olivier Kemen',19,'France',0);
insert into JOUEUR values (51,'Pablo',24,'Brésil',0);
insert into JOUEUR values (52,'Rachid Ghezzal',23,'Algérie',0);
insert into JOUEUR values (53,'Rafael',25,'Brésil',0);
insert into JOUEUR values (54,'Robin Maulun',19,'France',1);
insert into JOUEUR values (55,'Romain Del Castillo',19,'France',0);
insert into JOUEUR values (56,'Samuel Umtiti',22,'France',0);
insert into JOUEUR values (57,'Sergi Darder',21,'Espagne',0);
insert into JOUEUR values (58,'Simon Lefebvre',18,'France',0);
insert into JOUEUR values (59,'Steed Malbranque',35,'France',0);
insert into JOUEUR values (60,'Thomas Touré',21,'France',0);
insert into JOUEUR values (61,'Valentin Vada',19,'Argentine',0);
insert into JOUEUR values (62,'Wahbi Khazri',24,'Tunisie',0);
insert into JOUEUR values (63,'Zakarie Labidi',20,'France',5);
insert into JOUEUR values (64,'Nicolas Douchez',35,'France',0);
insert into JOUEUR values (65,'Salvatore Sirigu',28,'Italie',0);
insert into JOUEUR values (66,'Kevin Trapp',25,'Allemagne',0);
insert into JOUEUR values (67,'Serge Aurier',22,'Côte Ivoire',0);
insert into JOUEUR values (68,'David Luiz',28,'Brésil',0);
insert into JOUEUR values (69,'Presnel Kimpembe',20,'France',3);
insert into JOUEUR values (70,'Layvin Kurzawa',23,'France',1);
insert into JOUEUR values (71,'Marquinhos',21,'Brésil',2);
insert into JOUEUR values (72,'Maxwell',34,'Brésil',4);
insert into JOUEUR values (73,'Thiago Silva',31,'Brésil',0);
insert into JOUEUR values (74,'Gregory Van der Wiel',27,'Pays-Bas',0);
insert into JOUEUR values (75,'Lucas',23,'Brésil',0);
insert into JOUEUR values (76,'Blaise Matuidi',28,'France',2);
insert into JOUEUR values (77,'Thiago Motta',33,'Italie',0);
insert into JOUEUR values (78,'Javier Pastore',26,'Argentine',0);
insert into JOUEUR values (79,'Adrien Rabiot',20,'France',0);
insert into JOUEUR values (80,'Benjamin Stambouli',25,'France',0);
insert into JOUEUR values (81,'Marco Verratti',23,'Italie',0);
insert into JOUEUR values (82,'Jean-Kévi Augustin',18,'France',0);
insert into JOUEUR values (83,'Edinson Cavani',28,'Uruguay',3);
insert into JOUEUR values (84,'Angel Di Maria',27,'Argentine',1);
insert into JOUEUR values (85,'Zlatan Ibrahimovic',34,'Suède',2);
insert into JOUEUR values (86,'Ezequiel Lavezzi',30,'Argentine',4);
insert into JOUEUR values (87,'Hervin Ongenda',20,'France',0);

insert into  club values ('PSG','Paris','Parc des Princes',47929);
insert into  club values ('Lille','Lille','Pierre Mauroy',50186);
insert into  club values ('Rennes','Rennes','Roazhon Park',29778);
insert into  club values ('Bordeaux','Bordeaux','Matmut ATLANTIQUE',42115);

insert into  match values (1,'PSG','Lille',to_date('01/09/2019'),4,1,47929);
insert into  match values (2,'Lille','PSG',to_date('02/09/2019'),3,1,50186);
insert into  match values (3,'Rennes','Bordeaux',to_date('03/09/2019'),5,0,29778);
insert into  match values (4,'Bordeaux','Rennes',to_date('04/09/2019'),1,1,42115);
insert into  match values (5,'PSG','Rennes',to_date('05/09/2019'),0,1,47929);
insert into  match values (6,'Rennes','PSG',to_date('06/09/2019'),3,2,29778);
insert into  match values (7,'Bordeaux','Lille',to_date('07/09/2019'),1,4,42115);
insert into  match values (8,'Lille','Bordeaux',to_date('08/09/2019'),2,3,50186);
insert into  match values (9,'PSG','Bordeaux',to_date('09/09/2019'),2,4,47929);
insert into  match values (10,'Bordeaux','PSG',to_date('10/09/2019'),3,5,42115);
insert into  match values (11,'Rennes','Lille',to_date('11/09/2019'),5,1,29778);
insert into  match values (12,'Lille','Rennes',to_date('12/09/2019'),4,3,50186);
insert into  match values (13,'PSG','Lille',to_date('01/09/2020'),3,2,47929);
insert into  match values (14,'Lille','PSG',to_date('02/09/2020'),2,2,50186);
insert into  match values (15,'Rennes','Bordeaux',to_date('03/09/2020'),2,0,29778);
insert into  match values (16,'Bordeaux','Rennes',to_date('04/09/2020'),5,5,42115);
insert into  match values (17,'PSG','Rennes',to_date('05/09/2020'),4,4,47929);
insert into  match values (18,'Rennes','PSG',to_date('06/09/2020'),4,5,29778);
insert into  match values (19,'Bordeaux','Lille',to_date('07/09/2020'),2,5,42115);
insert into  match values (20,'Lille','Bordeaux',to_date('08/09/2020'),4,4,50186);
insert into  match values (21,'PSG','Bordeaux',to_date('09/09/2020'),5,5,47929);
insert into  match values (22,'Bordeaux','PSG',to_date('10/09/2020'),4,3,42115);
insert into  match values (23,'Rennes','Lille',to_date('11/09/2020'),1,5,29778);
insert into  match values (24,'Lille','Rennes',to_date('12/09/2020'),0,2,50186);
insert into  match values (25,'PSG','Lille',to_date('01/09/2021'),5,1,47929);
insert into  match values (26,'Lille','PSG',to_date('02/09/2021'),4,2,50186);
insert into  match values (27,'Rennes','Bordeaux',to_date('03/09/2021'),4,1,29778);
insert into  match values (28,'Bordeaux','Rennes',to_date('04/09/2021'),3,1,42115);
insert into  match values (29,'PSG','Rennes',to_date('05/09/2021'),3,5,47929);
insert into  match values (30,'Rennes','PSG',to_date('06/09/2021'),5,5,29778);
insert into  match values (31,'Bordeaux','Lille',to_date('07/09/2021'),3,0,42115);
insert into  match values (32,'Lille','Bordeaux',to_date('08/09/2021'),4,5,50186);
insert into  match values (33,'PSG','Bordeaux',to_date('09/09/2021'),0,1,47929);
insert into  match values (34,'Bordeaux','PSG',to_date('10/09/2021'),4,3,42115);
insert into  match values (35,'Rennes','Lille',to_date('11/09/2021'),3,0,29778);
insert into  match values (36,'Lille','Rennes',to_date('12/09/2021'),5,3,50186);

insert into saison values (1,to_date('01/08/19'),to_date('31/07/20'));
insert into saison values (2,to_date('01/08/20'),to_date('31/07/21'));
insert into saison values (3,to_date('01/08/21'),to_date('31/07/22'));

insert into  contrat values ('PSG',1,to_date('09/08/2021'),580137,23413,to_date('09/08/2022'));
insert into  contrat values ('PSG',2,to_date('24/11/2019'),73359605,12259,to_date('13/07/2022'));
insert into  contrat values ('PSG',3,to_date('07/08/2020'),19019580,86811,to_date('26/07/2022'));
insert into  contrat values ('PSG',4,to_date('05/01/2021'),75374177,75232,to_date('26/07/2022'));
insert into  contrat values ('PSG',5,to_date('24/03/2021'),45407676,9024,to_date('22/11/2022'));
insert into  contrat values ('PSG',6,to_date('13/05/2020'),64141176,76341,to_date('06/12/2021'));
insert into  contrat values ('PSG',7,to_date('20/07/2022'),19875575,68520,to_date('17/07/2023'));
insert into  contrat values ('PSG',8,to_date('07/05/2022'),89451011,64399,to_date('28/06/2023'));
insert into  contrat values ('Rennes',9,to_date('21/04/2021'),51475647,6310,to_date('17/10/2022'));
insert into  contrat values ('Rennes',10,to_date('30/09/2020'),31457529,33796,to_date('26/06/2022'));
insert into  contrat values ('Rennes',11,to_date('02/09/2020'),32321821,34075,to_date('06/08/2021'));
insert into  contrat values ('Rennes',12,to_date('12/06/2020'),71867800,74723,to_date('24/05/2021'));
insert into  contrat values ('Rennes',13,to_date('04/10/2020'),35355668,71483,to_date('18/11/2021'));
insert into  contrat values ('Rennes',14,to_date('24/01/2020'),86969147,42961,to_date('21/10/2021'));
insert into  contrat values ('Rennes',15,to_date('03/04/2020'),19850345,35946,to_date('14/05/2022'));
insert into  contrat values ('Lille',16,to_date('04/10/2021'),47101279,37610,to_date('21/05/2022'));
insert into  contrat values ('Lille',17,to_date('12/02/2022'),86375947,28507,to_date('12/10/2023'));
insert into  contrat values ('Lille',18,to_date('30/11/2021'),25504159,28360,to_date('16/01/2022'));
insert into  contrat values ('Lille',19,to_date('28/07/2021'),41077392,39383,to_date('25/07/2022'));
insert into  contrat values ('Lille',20,to_date('26/06/2021'),90185597,14265,to_date('19/09/2022'));
insert into  contrat values ('Lille',21,to_date('14/03/2021'),49304680,56180,to_date('29/09/2022'));
insert into  contrat values ('Lille',22,to_date('26/11/2021'),18330029,88941,to_date('27/09/2022'));
insert into  contrat values ('Bordeaux',23,to_date('03/04/2021'),64123301,83111,to_date('25/01/2022'));
insert into  contrat values ('Bordeaux',24,to_date('19/08/2020'),38421896,55528,to_date('27/12/2021'));
insert into  contrat values ('Bordeaux',25,to_date('30/05/2021'),18378496,23612,to_date('21/05/2022'));
insert into  contrat values ('Bordeaux',26,to_date('15/01/2020'),15535772,66036,to_date('12/08/2021'));
insert into  contrat values ('Bordeaux',27,to_date('12/08/2019'),83181341,62367,to_date('09/07/2020'));
insert into  contrat values ('Bordeaux',28,to_date('21/12/2021'),52739349,8906,to_date('07/12/2022'));
insert into  contrat values ('Bordeaux',29,to_date('16/08/2020'),51490227,30245,to_date('01/07/2022'));
insert into  contrat values ('Bordeaux',30,to_date('22/11/2020'),42516845,89559,to_date('06/04/2021'));

insert into  joue values (1,37,'goal',82,null);
insert into  joue values (2,57,'défenseur',22,'jaune');
insert into  joue values (3,6,'attaquant',3,null);
insert into  joue values (4,86,'goal',48,'rouge');
insert into  joue values (5,6,'attaquant',43,null);
insert into  joue values (6,71,'attaquant',null,null);
insert into  joue values (7,71,'défenseur',21,'jaune');
insert into  joue values (8,47,'goal',5,'rouge');
insert into  joue values (9,20,'attaquant',25,'rouge');
insert into  joue values (10,84,'attaquant',null,null);
insert into  joue values (11,12,'attaquant',33,'jaune');
insert into  joue values (12,22,'goal',12,'rouge');
insert into  joue values (13,82,'attaquant',null,null);
insert into  joue values (14,71,'milieu',null,null);
insert into  joue values (15,37,'défenseur',null,'jaune');
insert into  joue values (16,31,'milieu',null,null);
insert into  joue values (17,74,'défenseur',null,null);
insert into  joue values (18,17,'goal',null,'rouge');
insert into  joue values (19,67,'milieu',null,'jaune');
insert into  joue values (20,59,'milieu',null,null);
insert into  joue values (21,42,'défenseur',null,'rouge');
insert into  joue values (22,29,'milieu',null,'jaune');
insert into  joue values (23,18,'milieu',null,null);
insert into  joue values (24,59,'attaquant',73,'rouge');
insert into  joue values (25,16,'milieu',76,null);
insert into  joue values (26,19,'défenseur',3,null);
insert into  joue values (27,38,'milieu',7,'rouge');
insert into  joue values (28,44,'milieu',null,'jaune');
insert into  joue values (29,24,'milieu',37,null);
insert into  joue values (30,34,'attaquant',32,null);
insert into  joue values (31,9,'milieu',null,'rouge');
insert into  joue values (32,42,'défenseur',49,null);
insert into  joue values (33,66,'milieu',18,'rouge');
insert into  joue values (34,74,'milieu',null,null);
insert into  joue values (35,59,'attaquant',null,'jaune');
insert into  joue values (36,38,'défenseur',null,null);
insert into  joue values (37,34,'milieu',null,null);
insert into  joue values (38,80,'attaquant',null,null);
insert into  joue values (39,23,'milieu',null,'jaune');
insert into  joue values (40,1,'défenseur',null,null);
insert into  joue values (41,67,'milieu',null,'jaune');
insert into  joue values (42,16,'milieu',null,'rouge');
insert into  joue values (43,20,'défenseur',null,'jaune');
insert into  joue values (44,82,'milieu',null,null);
insert into  joue values (45,23,'milieu',null,'rouge');
insert into  joue values (46,69,'défenseur',null,'jaune');
insert into  joue values (47,57,'milieu',null,null);
insert into  joue values (48,18,'attaquant',null,'jaune');
insert into  joue values (49,63,'défenseur',null,null);
insert into  joue values (50,49,'attaquant',null,null);

insert into Abonnement values (1,'PSG',15891,350);
insert into Abonnement values (1,'Lille',10526,250);
insert into Abonnement values (1,'Rennes',4896,200);
insert into Abonnement values (1,'Bordeaux',7854,180);
insert into Abonnement values (2,'PSG',25896,350);
insert into Abonnement values (2,'Lille',25100,250);
insert into Abonnement values (2,'Rennes',15455,200);
insert into Abonnement values (2,'Bordeaux',12546,180);
insert into Abonnement values (3,'PSG',24856,350);
insert into Abonnement values (3,'Lille',8956,250);
insert into Abonnement values (3,'Rennes',10896,200);
insert into Abonnement values (3,'Bordeaux',17896,180);

--- Requetes SQL

--1
select nom from joueur order by nom;

--2
SELECT debutContrat,finContrat from contrat WHERE idjoueur=1 ORDER BY debutContrat asc;

--3
select idmatch from match where nbbutsdom = nbbutsvis;

--4
SELECT DISTINCT idMatch , club.capacite-match.nbSpectateurs from club inner join match on club.nomClub=match.clubDomicile;

--5
select idmatch, datematch from match where nbbutsdom - nbbutsvis > 2 
union
select idmatch, datematch from match where nbbutsdom - nbbutsvis < -2;

--6
SELECT c1.ville || '-' || c2.ville from match, club c1, club c2 WHERE match.clubdomicile=c1.nomclub AND match.clubvisiteur=c2.nomclub;

--7
select nom from joueur where age = 32;

--8
SELECT nomclub from club WHERE ville in nomclub;

--9
select count(*), nationalite from joueur group by nationalite;

--10
select datematch, clubdomicile, clubvisiteur from match where to_char(datematch,'D') = 7;

--11
select nom from joueur natural join joue where poste = 'attaquant'
intersect
select nom from joueur natural join joue where poste = 'défenseur';

--12
SELECT COUNT(*) from match WHERE clubdomicile='PSG' AND NBBUTSDOM<NBBUTSVIS;

--13
select count(idjoueur), nom from joue natural join joueur group by nom;

--14
SELECT nom,nationalite from joue natural join joueur
MINUS
SELECT nom,nationalite from joue natural join joueur where carton = 'rouge' ;

--15
select datematch, nbbutsdom from match where clubdomicile = 'PSG' and nbbutsdom > nbbutsvis;

--16
SELECT DISTINCT nomClub,idJoueur,debutContrat from contrat natural join saison WHERE to_char(debutcontrat,'MM')='08';

--17
select distinct clubdomicile from match where nbbutsdom > 0;

--18
SELECT COUNT(idmatch),nom FROM joue INNER JOIN joueur ON joue.idjoueur=joueur.idjoueur WHERE nbminjeu IS null GROUP BY nom;

--19
select nomclub, sum(montant*nbabonnement)as somme from abonnement group by nomclub;

--20
SELECT idmatch,datematch,
CASE
WHEN nbbutsdom > nbbutsvis THEN 'victoire à domicile'
WHEN nbbutsdom = nbbutsvis THEN 'match nul'
ELSE 'victoire à l`extérieur'
END
AS resultat
FROM match;

--21
select idsaison ,clubdomicile, clubvisiteur, datematch from match  where datematch between to_date('01/08/2019') and to_date('31/07/2020');

--22
SELECT SUM(transfert),nomclub,idsaison from contrat natural join abonnement natural join saison GROUP BY idsaison,nomclub ORDER BY nomclub;

--23
select sum(nbbutsdom) from match where clubdomicile = 'Rennes' and datematch between to_date('01/08/2020') and to_date('31/07/2021');

--24
SELECT SUM(nbbutsvis),clubdomicile from match GROUP BY clubdomicile;

--25
select contrat.nomclub, nom from joueur inner join joue on joueur.idjoueur=joue.idjoueur inner join match on joue.idmatch=match.idmatch inner join contrat on contrat.idjoueur=joueur.idjoueur where datematch = to_date('11/09/2020');

--26
--Précision : la requête fonctionne mais il n'y a pas de contrat débuté en 2015 dans notre base de données
SELECT AVG(SALAIRE),nomclub from contrat WHERE to_char(debutcontrat,'YYYY')='2015' group by nomclub;

--27
select distinct idmatch, nbspectateurs from match natural join abonnement where nbspectateurs * 2 > nbabonnement and datematch between to_date('01/08/2020') and to_date('31/07/2021') order by idmatch;

--28
SELECT AVG(age),nomclub,idsaison FROM saison natural join abonnement natural join contrat natural join joueur WHERE idsaison=2 GROUP BY nomclub,idsaison;

--29
select clubdomicile, sum(nbbutsdom), sum(nbbutsvis),
CASE
when sum(nbbutsdom) = sum(nbbutsvis) then clubdomicile
when sum(nbbutsdom) != sum(nbbutsvis) then ''
end
as res
from match group by clubdomicile;

--30
-- QUESTION PAS SUR
SELECT COUNT(carton),nomclub FROM joue natural join contrat WHERE carton='jaune' OR carton='rouge' GROUP BY nomclub;

--31
select nomclub, sum(salaire*12) as salaire, sum(transfert) as transfert from contrat group by nomclub;

--32
SELECT SUM(nbbutsvis),idjoueur FROM match natural join joue WHERE poste='goal' GROUP BY idjoueur;

--33 Problème avec les joueurs ayant un surnom
select nom from joueur where substr(nom,0,1) = substr(nom,  instr(nom, ' ')+1 , 1);

--34
select j1.idjoueur from joue j1 inner join match m1 on j1.idmatch = m1.idmatch 
                                inner join saison on datematch between debutSaison and finSaison
                                where poste= 'attaquant'

                                intersect 
select j2.idjoueur from joue j2 inner join match m2 on j2.idmatch = m2.idmatch 
                                inner join saison on datematch between debutSaison and finSaison
                                where poste= 'défenseur';
                                
--35
update contrat
set salaire = salaire*0.90
where nomclub = 'Rennes' and to_char(fincontrat,'YYYY') = 2023;

--36
UPDATE joueur j
SET nbmatchsuspension = (
SELECT 3COUNT() FROM joue where j.idjoueur = joue.idjoueur and carton='rouge');

--37
ALTER TABLE joueur add idjoueurnew VARCHAR(5);
UpDATE joueur set idjoueurnew = idjoueur;
update joueur set idjoueurnew = LPAD(idjoueurnew,5,'J0000');
ALTER TABLE contrat add idjoueurnew VARCHAR(5);
update contrat set idjoueurnew = idjoueur;
update contrat set idjoueurnew = LPAD(idjoueurnew,5,'J0000');

ALTER TABLE joue add idjoueurnew VARCHAR(5);
update joue set idjoueurnew = idjoueur;
update joue set idjoueurnew = LPAD(idjoueurnew,5,'J0000');

ALTER TABLE joueur drop primary key cascade;
alter table joueur add constraint PK_Joueur primary key(idjoueurnew);

ALTER TABLE Contrat add constraint FKidJoueur foreign key (idJoueurnew) references Joueur (idJoueurnew);
ALTER TABLE Joue add constraint FKidJoueur2 foreign key (idJoueurnew) references Joueur (idJoueurnew);

alter table contrat drop primary key cascade;
ALTER TABLE joue drop primary key cascade;

ALTER TABLE contrat add constraint PK1 primary key (nomclub,idjoueurnew,debutcontrat);
ALTER TABLE joue add constraint PK2 primary key (idmatch,idjoueurnew);
ALTER TABLE joueur drop column idjoueur;
ALTER TABLE contrat drop column idjoueur;
ALTER TABLE joue drop column idjoueur;

--38
alter table contrat disable constraint FKIDJOUEUR;
alter table joue disable constraint FKIDJOUEUR2;
delete from joueur where idjoueurnew not in (select idjoueurnew from joue);
delete from contrat where idjoueurnew not in (select idjoueurnew from joue);
alter table contrat enable constraint FKIDJOUEUR;
alter table joue enable constraint FKIDJOUEUR2;

--39
CREATE TABLE Resultat (
    idSaison NUMBER(2),
    nomClub VARCHAR(15),
    nbGagnes NUMBER(2),
    nbNuls NUMBER(2),
    PRIMARY KEY (idSaison,nomclub),
    FOREIGN KEY (idSaison) REFERENCES saison(idSaison),
    FOREIGN KEY (nomClub) REFERENCES club(nomClub)
);

--40
INSERT INTO RESULTAT (SELECT idsaison, clubdomicile,COUNT(), 0 from match natural join saison where nbbutsdom > nbbutsvis and datematch between debutsaison and finsaison GROUP BY idsaison,clubdomicile);


--41
UPDATE resultat  set nbGagnes = nbGagnes + (SELECT COUNT() from match natural join saison  where  match.nbbutsdom < match.nbbutsvis and match.datematch between saison.debutsaison and saison.finsaison AND idsaison=1) WHERE idsaison = 1;
UPDATE resultat  set nbGagnes = nbGagnes + (SELECT COUNT() from match natural join saison  where  match.nbbutsdom < match.nbbutsvis and match.datematch between saison.debutsaison and saison.finsaison AND idsaison=2) WHERE idsaison = 2;
UPDATE resultat  set nbGagnes = nbGagnes + (SELECT COUNT() from match natural join saison  where  match.nbbutsdom < match.nbbutsvis and match.datematch between saison.debutsaison and saison.finsaison AND idsaison=3) WHERE idsaison = 3;


--42
UPDATE resultat set nbNuls = nbNuls + (SELECT COUNT() from match natural join saison where  nbbutsdom = nbbutsvis and datematch between debutsaison and finsaison and idsaison = 1) where idsaison = 1;
UPDATE resultat set nbNuls = nbNuls + (SELECT COUNT() from match natural join saison where  nbbutsdom = nbbutsvis and datematch between debutsaison and finsaison and idsaison =2) where idsaison = 2;

UPDATE resultat set nbNuls = nbNuls + (SELECT COUNT() from match natural join saison where  nbbutsdom = nbbutsvis and datematch between debutsaison and finsaison and idsaison = 3 ) where idsaison=3;


--43
INSERT INTO championnat (SELECT idsaison, nomclub,3nbgagnes+nbnuls from resultat natural join saison );