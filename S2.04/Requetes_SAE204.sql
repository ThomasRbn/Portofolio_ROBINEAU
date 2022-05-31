create table categorie
(
    codeCat    VARCHAR(5) primary key,
    libelleCat VARCHAR(25)
);

create table client
(
    codeCli    VARCHAR(10) primary key,
    titre      VARCHAR(5),
    prenom     VARCHAR(20),
    nom        VARCHAR(20),
    adresserue VARCHAR(45),
    codepostal VARCHAR(6),
    ville      VARCHAR(25),
    tel        VARCHAR(10),
    datenaiss  DATE,
    enfant     NUMBER(1)
);

create table commande
(
    numCom     NUMBER(4) primary key,
    codeCli    VARCHAR(10),
    dateCom    DATE,
    modeP      VARCHAR(2),
    numVendeur NUMBER(2)
);

create table contient
(
    numCom    NUMBER(4),
    numLivre  NUMBER(3),
    prixVente NUMBER(4, 2),
    qte       NUMBER(2),
    primary key (numCom, numLivre)
);

create table livre
(
    numLivre      NUMBER(3) primary key,
    titre         VARCHAR(55),
    auteur        VARCHAR(20),
    codeCat       VARCHAR(2),
    descriptif    VARCHAR(100),
    prixCatalogue NUMBER(4, 2),
    nbPages       NUMBER(4)
);

create table paiement
(
    modeP    VARCHAR(2) primary key,
    libelleP VARCHAR(15)
);

create table vendeur
(
    numVendeur NUMBER(2) primary key,
    nomVendeur VARCHAR(15)
);

-- Ajout clé étrangères
ALTER TABLE livre
    ADD CONSTRAINT FK_LivreCategorie FOREIGN KEY (codeCat) REFERENCES CATEGORIE (codeCat);
ALTER TABLE commande
    ADD CONSTRAINT FK_CommandeClient FOREIGN KEY (codeCli) REFERENCES client (codeCli);
ALTER TABLE commande
    ADD CONSTRAINT FK_CommandeVendeur FOREIGN KEY (numVendeur) REFERENCES vendeur (numVendeur);
ALTER TABLE commande
    ADD CONSTRAINT FK_CommandePaiement FOREIGN KEY (modeP) REFERENCES paiement (modeP);
ALTER TABLE contient
    ADD CONSTRAINT FK_ContientLivre FOREIGN KEY (numLivre) REFERENCES livre (numLivre);

--Insertion des données

INSERT INTO client VALUES ('ABO001','Mlle','Elisabeth','Aboville','5, place de la Mairie','66700','Argeles Sur Mer','0465223311',TO_DATE('1/Sep/1997'),0);
INSERT INTO client VALUES ('AIM001','Mme','Anne','Aime','3, place de la  République','44200','Nantes','0240683721',TO_DATE('12/Feb/1978'),1);
INSERT INTO client VALUES ('ARO001','Mlle','Olive','Aron','12, place des Fromagers','79000','Niort','0549002233',TO_DATE('12/Apr/1987'),0);
INSERT INTO client VALUES ('BON001','M.','Philippe','Bonneau','31, rue de Brest','35100','Rennes','0299652481',TO_DATE('11/Apr/1994'),0);
INSERT INTO client VALUES ('BOS001','M.','Edmond','Bosseau','21, avenue des Peupliers','44200','Nantes','0240663300',TO_DATE('14/Feb/1991'),0);
INSERT INTO client VALUES ('COG001','Mlle','Delphine','Cognets','5, impasse des Vignerons','49000','Angers','0241023145',TO_DATE('1/Feb/1995'),0);
INSERT INTO client VALUES ('COM001','M.','Stéphane','Combret','39, rue des Boulangers','33120','Arcachon','0556368490',TO_DATE('17/Jan/1993'),0);
INSERT INTO client VALUES ('DAB001','M.','Daniel','Dabilot','1, rue Claude François','66000','Perpignan','0468773322',TO_DATE('14/Sep/1992'),0);
INSERT INTO client VALUES ('DAS001','M.','Richard','Dasci','12, rue de la Grande Armée','72000','Le Mans','0243227799',TO_DATE('13/Jul/1988'),0);
INSERT INTO client VALUES ('DEC001','M.','Benoît','Decemme','96, rue des Oliviers','17300','Rochefort','0546568431',TO_DATE('12/May/1991'),0);
INSERT INTO client VALUES ('DEJ001','Mme','Odette','Dejoux','45, rue du Casino','79000','Niort','0549007890',TO_DATE('25/Apr/1988'),1);
INSERT INTO client VALUES ('DEM001','Mlle','Hélène','De Massol','5, rue des Champs','44470','Thouare-Sur-Loire','0240558000',TO_DATE('20/Apr/1999'),0);
INSERT INTO client VALUES ('DEP001','M.','Denis','Depernet','46, rue des Hérons cendrés','33120','Arcachon','0556669124',TO_DATE('24/Nov/1997'),0);
INSERT INTO client VALUES ('DER001','M.','Stéphane','Derlon','72, rue des Maraîchers','66700','Argeles Sur Mer','0468526497',TO_DATE('29/Jul/1997'),0);
INSERT INTO client VALUES ('DES001','Mlle','Ella','Deschamp','53, avenue Kléber','75016','Paris','0143557610',TO_DATE('25/Dec/1992'),0);
INSERT INTO client VALUES ('DEV001','M.','Honoré','Devanne','5, rue de l Amitié','69003','Lyon','0478687799',TO_DATE('1/May/1987'),0);
INSERT INTO client VALUES ('DIN001','M.','Ferdinand','Dinelli','25, rue Poulidor','17000','La Rochelle','0546667700',TO_DATE('14/May/1993'),0);
INSERT INTO client VALUES ('ENE001','Mme','Eugénie','Enet','15, avenue des Facultés','17000','La Rochelle','0546551133',TO_DATE('10/Sep/1999'),0);
INSERT INTO client VALUES ('EPR001','Mlle','Estelle','Eprinchard','25, rue des Alouettes','17000','La Rochelle','0546334400',TO_DATE('11/Nov/1995'),0);
INSERT INTO client VALUES ('FON001','Mme','Claire','Fontaine','12, boulevard de la Source','16000','Angouleme','0545789965',TO_DATE('12/Apr/1995'),1);
INSERT INTO client VALUES ('GON001','M.','Igor','Gonthier','5, rue Boissière','75016','Paris','0143001679',TO_DATE('13/Feb/1999'),0);
INSERT INTO client VALUES ('GRA001','M.','Hugues','Gravaud','66, impasse des Mohicans','66700','Argeles Sur Mer','0468228800',TO_DATE('1/Apr/1993'),0);
INSERT INTO client VALUES ('HAI001','M.','Thierry','Haies','64, rue des Tailleurs','72000','Le Mans','0243550000',TO_DATE('2/Jul/1993'),0);
INSERT INTO client VALUES ('HIS001','M.','William','Hisson','32, avenue du Cirque','34080','Montpellier','0467029750',TO_DATE('3/Jul/1992'),0);
INSERT INTO client VALUES ('HOC001','M.','Eric','Hochard','11, rue de Paris','35100','Rennes','0299235590',TO_DATE('4/Sep/1990'),0);
INSERT INTO client VALUES ('IAC001','M.','Hermann','Iacono','12, place de la Gendarmerie','16000','Angouleme','0545679453',TO_DATE('14/Feb/1991'),0);
INSERT INTO client VALUES ('ICI001','Mme','Angèle','Icibo','5, avenue Emile Victor','79000','Niort','0549558821',TO_DATE('15/Jun/1996'),1);
INSERT INTO client VALUES ('IKA001','Mme','Patricia','Ikassion','1, avenue de la Maine','49000','Angers','0241664312',TO_DATE('12/Mar/1997'),0);
INSERT INTO client VALUES ('JAV001','Mme','Aude','Javaudin','6, quai Duguay Trouin','35100','Rennes','0299586735',TO_DATE('14/Jun/1993'),0);
INSERT INTO client VALUES ('LAC001','Mlle','Laure','Lacoste','3, rue de bertrand','35100','Rennes','0299564589',TO_DATE('25/May/1997'),0);
INSERT INTO client VALUES ('LEC001','M.','Dimitri','Lecouble','5, rue Saint-Louis','35100','Rennes','0299658833',TO_DATE('1/Jan/1989'),0);
INSERT INTO client VALUES ('LUC001','M.','Pierre','Lucas','25, rue du Château','44200','Nantes','0240252568',TO_DATE('25/Aug/1990'),1);
INSERT INTO client VALUES ('MAL001','Mme','Mélanie','Malard','14, rue du Chenil','64100','Bayonne','0559115544',TO_DATE('15/Jun/1989'),1);
INSERT INTO client VALUES ('MAT001','Mlle','Elodie','Mathelier','1, avenue Gustave Eiffel','34080','Montpellier','0467003121',TO_DATE('27/Jul/1988'),0);
INSERT INTO client VALUES ('MNA001','Mme','Anne','Mnach','52, rue du Stade','72000','Le Mans','0243557030',TO_DATE('24/Sep/1990'),0);
INSERT INTO client VALUES ('MOI001','Mlle','Edith','Moisan','4, rue des Aveux','17000','La Rochelle','0546221000',TO_DATE('27/Nov/1986'),1);
INSERT INTO client VALUES ('MOI002','Mlle','Judith','Moiroux','12, rue des Aveux','64100','Bayonne','0559223300',TO_DATE('10/Feb/1989'),0);
INSERT INTO client VALUES ('MON001','M.','Thibault','Mondat','15, avenue d Algérie','34190','Ganges','0467559900',TO_DATE('14/Oct/1992'),1);
INSERT INTO client VALUES ('mor001','M.','Bruno','Moreau','3, rue beaumanoir','35100','Rennes','0299253366',TO_DATE('8/Jan/1993'),1);
INSERT INTO client VALUES ('NEN001','M.','Edouard','Nenon','42, rue de Penhoet','35100','Rennes','0299602341',TO_DATE('25/Aug/1994'),0);
INSERT INTO client VALUES ('NIO001','Mlle','Chantal','Niola','11, place de la République','34190','Ganges','0467660077',TO_DATE('30/Jul/1989'),1);
INSERT INTO client VALUES ('OFA001','Mlle','Annick','Ofarin','27, avenue Hippocrate','44200','Nantes','0240886630',TO_DATE('24/Jun/1995'),1);
INSERT INTO client VALUES ('ONI001','Mlle','Anne','Onillon','53, rue des Pélicans','66000','Perpignan','0468503468',TO_DATE('3/Jul/1987'),0);
INSERT INTO client VALUES ('OPI001','Mme','Marthe','Opillard','70, place des Pavés','44200','Nantes','0240103040',TO_DATE('24/Jul/1986'),0);
INSERT INTO client VALUES ('OPO001','M.','Henri','Opocci','12, avenue de la Caserne','34190','Ganges','0467628271',TO_DATE('3/Apr/1994'),1);
INSERT INTO client VALUES ('PAO001','M.','Frédéric','Paon','25, rue du Parc','17100','Rochefort','0546596235',TO_DATE('17/May/1993'),0);
INSERT INTO client VALUES ('PAS001','Mlle','Sophie','Pascot','45, rue des Maraîchers','72000','Le Mans','0243226617',TO_DATE('3/Apr/1987'),1);
INSERT INTO client VALUES ('PEU001','M.','Firmin','Peulon','5, rue des Alizées','44200','Nantes','0240513692',TO_DATE('18/Feb/2001'),0);
INSERT INTO client VALUES ('rap001','Mme','Joëlle','Rapon','5, Bd des Anglais','44200','Nantes','0240258577',TO_DATE('2/Feb/1988'),1);
INSERT INTO client VALUES ('REN001','Mlle','Fançoise','Renaud','3, avenue de Smyrne','33120','Arcachon','0556402389',TO_DATE('2/Jan/1996'),1);
INSERT INTO client VALUES ('SAB001','M.','Emile','Sabadel','2, rue Hergé','16000','Angouleme','0545703564',TO_DATE('24/Feb/1999'),0);
INSERT INTO client VALUES ('SAH001','M.','Christophe','Sahan','1, boulevard François 1er','44200','Nantes','0240356262',TO_DATE('2/Mar/1995'),0);
INSERT INTO client VALUES ('SAN001','M.','Théodore','Sandron','51, rue du Sommeil','72000','Le Mans','0243667039',TO_DATE('1/Jun/1991'),0);
INSERT INTO client VALUES ('STI001','Mlle','Sophie','Stindel','83, rue Lauriston','75016','Paris','0143706031',TO_DATE('2/Apr/1994'),0);
INSERT INTO client VALUES ('SUJ001','Mme','Laure','Sujeux','12, rue au duc','35100','Rennes','0299576123',TO_DATE('3/Mar/2001'),0);
INSERT INTO client VALUES ('SWI001','M.','Guillaume','Swiderski','8, avenue d Angleterre','66000','Perpignan','0468603210',TO_DATE('4/Dec/1993'),0);
INSERT INTO client VALUES ('TAC001','M.','Béranger','Tachet','10, avenue du Château','33120','Arcachon','0556220045',TO_DATE('3/Jul/1992'),1);
INSERT INTO client VALUES ('TER001','M.','Alain','Terrone','21, rue Hoche','35100','Rennes','0299597634',TO_DATE('2/Aug/1990'),1);
INSERT INTO client VALUES ('TER002','M.','Alex','Tertre','27, impasse du Pont','44200','Nantes','0240593654',TO_DATE('21/Apr/1993'),0);
INSERT INTO client VALUES ('TIN001','M.','Alexandre','Tinguy','45, rue des Antilles','79000','Niort','0549568213',TO_DATE('29/Jul/1987'),1);
INSERT INTO client VALUES ('TIN002','M.','Clément','Tinlot','33, rue des Jardins','72000','Le Mans','0243228877',TO_DATE('24/Sep/1989'),0);
INSERT INTO client VALUES ('TIN003','M.','Victor','Tinel','25, avenue Louis XVI','69003','Lyon','0478554867',TO_DATE('30/Oct/1992'),0);
INSERT INTO client VALUES ('TOU001','M.','Marc','Tourtelier','12, rue des Alizées','44200','Nantes','0240801030',TO_DATE('8/May/1988'),0);
INSERT INTO client VALUES ('TOU002','Mme','Emma','Touroux','47, rue des Artistes','79000','Niort','0549623300',TO_DATE('21/Apr/1989'),0);
INSERT INTO client VALUES ('TOU003','M.','Isidore','Tournier','72, route de la Plage','34190','Ganges','0467763345',TO_DATE('29/Jun/1986'),0);
INSERT INTO client VALUES ('ZEB001','Mlle','Agathe','Zebiri','4, boulevard de Casablanca','34080','Montpellier','0467235498',TO_DATE('24/Jul/1989'),1);
INSERT INTO client VALUES ('ZET001','Mlle','Annie','Zettal','3, impasse des Tourterelles','44200','Nantes','0240349125',TO_DATE('9/Sep/1990'),1);



INSERT INTO categorie
VALUES ('AD', 'Arts divinatoires');
INSERT INTO categorie
VALUES ('AR', 'Art');
INSERT INTO categorie
VALUES ('BD', 'Bande dessinée');
INSERT INTO categorie
VALUES ('CU', 'Cuisine Forme Santé');
INSERT INTO categorie
VALUES ('DI', 'Encyclopédies');
INSERT INTO categorie
VALUES ('EV', 'Evasion Tourisme');
INSERT INTO categorie
VALUES ('HI', 'Histoire');
INSERT INTO categorie
VALUES ('HU', 'Humour');
INSERT INTO categorie
VALUES ('LI', 'Littérature');
INSERT INTO categorie
VALUES ('LO', 'Loisirs Plein air');
INSERT INTO categorie
VALUES ('PS', 'Psychologie');
INSERT INTO categorie
VALUES ('SA', 'Santé');
INSERT INTO categorie
VALUES ('SU', 'Suspense');
INSERT INTO categorie
VALUES ('TE', 'Témoignages');
INSERT INTO categorie
VALUES ('VP', 'Vie pratique');

INSERT INTO paiement
VALUES ('CA', 'Carte bancaire');
INSERT INTO paiement
VALUES ('CB', 'Chèque bancaire');
INSERT INTO paiement
VALUES ('CP', 'Chèque postal');
INSERT INTO paiement
VALUES ('ES', 'Espèce');
INSERT INTO paiement
VALUES ('ML', 'Mandat-lettre');

INSERT INTO livre
VALUES (1, 'Thérèse Desqueyroux', 'MAURIAC', 'LI', 'Irréductible jusqu au désir de tuer…', 10.98, 144);
INSERT INTO livre
VALUES (2, 'Le noeud de vipères', 'MAURIAC', 'LI', 'La haineuse confession d un mal aimé.', 12.5, 208);
INSERT INTO livre
VALUES (3, 'Le sagouin', 'MAURIAC', 'LI', 'Fièvres et meurtrissures de l amour.', 13.11, 336);
INSERT INTO livre
VALUES (4, 'La folle allure', 'BOBIN', 'LI', 'Une fugueuse qui court après la vie, l amour et le rêve.', 10.37, 192);
INSERT INTO livre
VALUES (5, 'Le monde de Sophie', 'GAARDER', 'LI', 'Au pays des philosophes.', 16.92, 584);
INSERT INTO livre
VALUES (6, 'Smilla et l amour de la neige', 'HOEG', 'LI', 'Une révélation du Nord.', 16.46, 464);
INSERT INTO livre
VALUES (7, 'Une autre femme', 'TYLER', 'LI', 'Réinventer sa vie, devenir une autre.', 14.33, 396);
INSERT INTO livre
VALUES (8, 'De si bonnes amies', 'TROLLOPE', 'LI', 'Vies conjugales en crise.', 14.03, 304);
INSERT INTO livre
VALUES (9, 'Hymnes à l amour', 'WIAZEMSKY', 'LI', 'La légataire d un amour rompu.', 10.98, 176);
INSERT INTO livre
VALUES (10, 'Contre coeur', 'QUINDLEN', 'LI', 'Scandale autour d une mort suspecte.', 10.98, 432);
INSERT INTO livre
VALUES (11, 'Rose', 'SMITH', 'LI', 'Passion torride en pays minier.', 14.03, 528);
INSERT INTO livre
VALUES (12, 'Malena c est un nom de tango', 'GRANDES', 'LI', 'Une flamboyante et intrépide Espagnole.', 16.16, 518);
INSERT INTO livre
VALUES (13, 'Lumière noire', 'WALTERS', 'SU', 'Suicide raté pour un crime déguisé ?', 14.94, 448);
INSERT INTO livre
VALUES (14, 'Nathan', 'GILSTRAP', 'SU', 'La traque d un criminel de 12 ans.', 14.64, 384);
INSERT INTO livre
VALUES (15, 'Lucky Luke : Billy the kid 1', 'MORRIS ET GOSCINNY', 'BD', NULL, 5.95, 48);
INSERT INTO livre
VALUES (16, 'La maison du guet', 'HIGGINS CLARK', 'SU', 'Le passé aux trousses...', 10.82, 224);
INSERT INTO livre
VALUES (17, 'Le monde à peu près 2', 'ROUAUD', 'LI', 'Une éducation sentimentale dans un monde flou.', 11.89, 252);
INSERT INTO livre
VALUES (18, 'La Dame d Abou Simbel', 'JACQ', 'HI', 'Quand l homme de Dieu Défie Pharaon.', 15.24, 400);
INSERT INTO livre
VALUES (19, 'Le fils de la lumière', 'JACQ', 'HI', 'Initiation d un future pharaon.', 15.24, 432);
INSERT INTO livre
VALUES (21, 'Douceur de France 2', 'CHUPIN', 'EV', 'Le bonheur de vivre des régions de France.', 20.12, 192);
INSERT INTO livre
VALUES (22, 'Les champignons 2', 'GARNWEIDNER', 'LO', 'Un guide photos très utile', 12.5, 160);
INSERT INTO livre
VALUES (24, 'Le passe-muraille et autres nouvelles', 'AYMÉ', 'LI', 'Un merveilleux génie inventif.', 13.72, 420);
INSERT INTO livre
VALUES (25, 'La neige tombait sur les cèdres', 'GUTERSON', 'LI', 'Un amour pas comme les autres.', 14.33, 528);
INSERT INTO livre
VALUES (26, 'Une ombre sarrasine', 'CLANCIER', 'LI', 'L envoûtement d un village, otage de son passé.', 8.38, 320);
INSERT INTO livre
VALUES (27, 'L enfer blanc', 'HARRIS', 'LI', 'Une vie réinventée dans le Grand Nord.', 14.03, 320);
INSERT INTO livre
VALUES (28, 'L alchimiste', 'COELHO', 'LI', 'La quête initiative d un trésor.', 11.59, 252);
INSERT INTO livre
VALUES (29, 'Lîle du jour d avant', 'ECO', 'LI', 'Un époustouflant roman d aventures philosophique.', 17.53, 464);
INSERT INTO livre
VALUES (30, 'Va où ton coeur te portes', 'TAMARO', 'LI', 'Un poignant chant d amour', 11.89, 192);
INSERT INTO livre
VALUES (31, 'Le monde à peu près 1', 'ROUAUD', 'LI', 'Une éducation sentimentale dans un monde fou.', 11.89, 252);
INSERT INTO livre
VALUES (32, 'Les échelles du levant', 'MAALOUR', 'LI', 'La terrible confession d un otage de l histoire.', 15.24, 272);
INSERT INTO livre
VALUES (34, 'La part de Dieu', 'GALLO', 'LI', NULL, 14.33, 320);
INSERT INTO livre
VALUES (35, 'Le testament français', 'MAKINE', 'LI', 'Le vertige amoureux d un petit Russe.', 14.64, 368);
INSERT INTO livre
VALUES (36, 'Pereira prétend', 'TABUCCHI', 'LI', NULL, 8.38, 216);
INSERT INTO livre
VALUES (38, 'Le temple de millions d année', 'JACQ', 'LI', 'Menaces mortelles sur un jeune pharaon.', 15.24, 384);
INSERT INTO livre
VALUES (39, 'La bataille de Kadesh', 'JACQ', 'LI', 'Défis cruciaux pour Ramsès.', 15.24, 400);
INSERT INTO livre
VALUES (42, 'L étoile bleue', 'BENZONI', 'HI', 'Une folle poursuite d amour et d aventure.', 15.09, 368);
INSERT INTO livre
VALUES (43, 'La rose d York', 'BENZONI', 'HI', 'Pour l amour d une pierre précieuse et d une femme.', 15.55, 480);
INSERT INTO livre
VALUES (44, 'L opale de Sissi', 'BENZONI', 'HI', 'Un fabuleux bijou conduit-il à l amour?', 15.09, 432);
INSERT INTO livre
VALUES (45, 'Romandie', 'DENUZIÈRE', 'HI', 'Une prospère dynastie de vignerons et négociants en vins.', 18.14, 704);
INSERT INTO livre
VALUES (46, 'Les dîners de Calpurnia', 'DIWO', 'HI', 'Une maîtresse femme dans la Rome des Césars.', 17.68, 464);
INSERT INTO livre
VALUES (47, 'Un loup est un loup', 'FOLCO', 'HI', 'La cocasse épopée d un  meneur-garou".', 15.85, 576);
INSERT INTO livre
VALUES (48, 'L enfant des lumières', 'CHANDERNAGOR', 'HI', 'L amour vengeur d une aristocrate bafouée.', 16.46, 512);
INSERT INTO livre
VALUES (49, 'Les Rois maudits', 'DRUON', 'HI', 'La célèbre fresque historique en un seul volume.', 18.29, 1620);
INSERT INTO livre
VALUES (50, 'Le dieu fleuve', 'SMITH', 'HI', 'Une formidable épopée d amour et de pouvoir dans l Egypte ancienne.',
        17.07, 720);
INSERT INTO livre
VALUES (51, 'La dernière colline', 'DEFORGES', 'HI', 'Une ardente amoureuse dans l imbroglio indochinoise.', 14.64,
        480);
INSERT INTO livre
VALUES (52, 'La papesse Jeanne', 'CROSS', 'HI', 'Une femme sur le trône de saint Pierre.', 13.72, 608);
INSERT INTO livre
VALUES (53, 'Au paradis des amours enfantines', 'CAULEY', 'LI', 'Les fantasques aventures d une amitié insolite.',
        13.42, 384);
INSERT INTO livre
VALUES (54, 'Théo et Marie', 'DUQUESNE', 'LI', 'La folle cavale de deux gamins de la Libération.', 14.94, 414);
INSERT INTO livre
VALUES (55, 'Le second violon', 'BEAUCHEMIN', 'LI', 'La quarantaine, l âge de toutes les folies.', 16.46, 480);
INSERT INTO livre
VALUES (56, 'L homme qui murmurait à l oreille des chevaux', 'EVANS', 'LI', 'Le secret des mots qui guérissent...',
        14.64, 432);
INSERT INTO livre
VALUES (57, 'Mais t as-tout pour être heureuse!', 'BURTON', 'LI', 'A nous deux la déprime!', 11.89, 216);
INSERT INTO livre
VALUES (58, 'La mouflette', 'DORIN', 'LI', 'Enfant à charge pour couple trop libre.', 14.94, 320);
INSERT INTO livre
VALUES (59, 'Nuremberg', 'MAZEAU', 'LI', 'Passion condamnée sur champ de ruine', 10.37, 256);
INSERT INTO livre
VALUES (60, 'Je ne te dirai jamais adieu', 'REY', 'LI', 'Le bonheur n était pas au rendez-vous.', 13.42, 432);
INSERT INTO livre
VALUES (61, 'Le hussard sur le toit', 'GIONO', 'LI', 'Une folle équipée sous menace de mort.', 14.94, 512);
INSERT INTO livre
VALUES (62, 'L iris de Suse', 'GIONO', 'LI', 'Férocité de l amour', 13.72, 368);
INSERT INTO livre
VALUES (63, 'Jean le Bleu', 'GIONO', 'LI', 'Une enfance provençale.', 13.72, 314);
INSERT INTO livre
VALUES (64, 'Les âmes fortes', 'GIONO', 'LI', 'Des passions extrêmes.', 14.64, 528);
INSERT INTO livre
VALUES (65, 'Les grands chemins', 'GIONO', 'LI', 'Errances et fatalités dangereuses.', 14.33, 384);
INSERT INTO livre
VALUES (66, 'Le chant du monde', 'GIONO', 'LI', 'Chants d amour et passions fatales.', 14.64, 512);
INSERT INTO livre
VALUES (67, 'Les terres abandonnées', 'CORNAILLE', 'LI', 'Le destin mouvementé d une femme de la terre.', 13.42, 348);
INSERT INTO livre
VALUES (68, 'La maîtresse d école', 'ARMAND', 'LI', 'Partagée entre l amour et le désir d enseigner.', 14.33, 336);
INSERT INTO livre
VALUES (69, 'Les vignes de Sainte Colombe', 'SIGNOL', 'LI', 'Passions et drames d une dynastie vigneronne.', 15.55,
        486);
INSERT INTO livre
VALUES (70, 'Le pain blanc', 'CROZES', 'LI', 'Une force d amour au cœur d une épopée paysanne.', 15.09, 384);
INSERT INTO livre
VALUES (71, 'La soupe à la fourchette', 'ANGLADE', 'LI', 'Un amour de gosses sous l Occupation.', 13.42, 368);
INSERT INTO livre
VALUES (72, 'La colline des contre-bandiers', 'BRUEL', 'LI', 'Le bonheur à l état sauvage.', 13.42, 272);
INSERT INTO livre
VALUES (73, 'Les grandes filles', 'JEURY', 'LI', 'Défis féminins pour une institutrice.', 14.94, 384);
INSERT INTO livre
VALUES (74, 'L année du certif', 'JEURY', 'LI', 'Quand le adultes rivalisent sur le dos des enfants.', 14.94, 384);
INSERT INTO livre
VALUES (75, 'Histoires de nos villages', NULL, 'LI',
        'Histoires réelles ou imaginaires, souvenirs du temps passé ou compositions fantaisistes.', 12.5, 368);
INSERT INTO livre
VALUES (76, 'Un village pourtant si tranquille', 'VAREL', 'LI', 'Les inquiétants mystères d un village.', 13.42, 496);
INSERT INTO livre
VALUES (78, 'Han d Islande', 'HUGO', 'LI', 'Un démon humain assoiffé de vengeance.', 15.24, 528);
INSERT INTO livre
VALUES (79, 'Notre-Dame de Paris', 'HUGO', 'LI', 'Un flamboyant roman "gothique".', 16.16, 672);
INSERT INTO livre
VALUES (80, 'Les Misérables (tome 1)', 'HUGO', 'LI', 'Les prodigues d un bagnard.', 19.06, 1024);
INSERT INTO livre
VALUES (81, 'Les Misérables (tome 2)', 'HUGO', 'LI', 'Sous la colère d un peuple révolté...', 19.06, 1040);
INSERT INTO livre
VALUES (82, 'Les travailleurs de la mer', 'HUGO', 'LI', 'Les sacrifices d un marin au grand cœur.', 16.46, 624);
INSERT INTO livre
VALUES (83, 'L homme qui rit', 'HUGO', 'LI', 'Le drame d un aristocrate défiguré.', 17.07, 800);
INSERT INTO livre
VALUES (84, 'La nouvelle vie de Barbara Devane', 'KOEN', 'LI', 'Drames et passions d une femme de caractère.', 15.55,
        656);
INSERT INTO livre
VALUES (85, 'Sur les rives du Mississippi', 'JEKEL', 'LI', 'Une flamboyante dynastie du Sud.', 14.64, 512);
INSERT INTO livre
VALUES (86, 'Louisiana', 'PEYRAMAURE', 'LI', 'A la conquête d une nouvelle terre.', 18.14, 840);
INSERT INTO livre
VALUES (87, 'Le jardin des ombres', 'ANDREWS', 'LI', NULL, 13.72, 350);
INSERT INTO livre
VALUES (88, 'Fleurs captives', 'ANDREWS', 'LI', NULL, 13.72, 378);
INSERT INTO livre
VALUES (89, 'Pétales au vent', 'ANDREWS', 'LI', NULL, 13.72, 448);
INSERT INTO livre
VALUES (90, 'Bouquet d épines', 'ANDREWS', 'LI', NULL, 13.72, 392);
INSERT INTO livre
VALUES (91, 'Les secrets de l aube', 'ANDREWS', 'LI', NULL, 13.26, 392);
INSERT INTO livre
VALUES (92, 'L enfant du crépuscule', 'ANDREWS', 'LI', NULL, 13.26, 432);
INSERT INTO livre
VALUES (93, 'Les démons de la nuit', 'ANDREWS', 'LI', NULL, 13.26, 434);
INSERT INTO livre
VALUES (94, 'La foudre', 'STEEL', 'LI', 'Quand la maladie foudroie un couple.', 13.72, 400);
INSERT INTO livre
VALUES (95, 'Plein ciel', 'STEEL', 'LI', 'Prouesses et passions d une aviatrice.', 13.72, 432);
INSERT INTO livre
VALUES (96, 'Une saison de passion', 'STEEL', 'LI', 'Défi amoureux pour une recluse.', 12.96, 576);
INSERT INTO livre
VALUES (97, 'L heure des secrets', 'GOUDGE', 'LI', 'Femmes en mal de maternité.', 14.48, 544);
INSERT INTO livre
VALUES (98, 'Ballade italienne', 'RIVERS SIDDONS', 'LI', 'La hantise d un monde inconnu.', 8.38, 352);
INSERT INTO livre
VALUES (99, 'Le silence d une femme', 'SIMONS', 'LI', 'En quête d un équilibre amoureux.', 16.16, 496);
INSERT INTO livre
VALUES (100, 'Passions dangereuses', 'BRADFORD', 'LI', 'La fatale revanche du passé.', 14.94, 336);
INSERT INTO livre
VALUES (101, 'Cet enfant est le nôtre', 'BENKER', 'LI', 'Drame poignant autour d une adoption.', 14.03, 448);
INSERT INTO livre
VALUES (102, 'Une femme en blanc', 'BOISSARD', 'LI', 'Les déchirements d une femme chirurgien.', 14.03, 496);
INSERT INTO livre
VALUES (103, 'Une ombre sur le miroir', 'KRENTZ', 'LI', 'Mystères autour d une rencontre amoureuse.', 13.42, 336);
INSERT INTO livre
VALUES (104, 'Les roses du Texas', 'WOODS WINDLE', 'LI', 'Des héroïnes légendaires du Texas.', 14.64, 400);
INSERT INTO livre
VALUES (105, 'L or du ciel', 'MICHAEL', 'LI', 'Fabuleusement riche du jour au lendemain.', 14.64, 512);
INSERT INTO livre
VALUES (106, 'Le secret du docteur Guillard', 'ARNAUD', 'LI', 'Le combat d une femme médecin.', 13.72, 304);
INSERT INTO livre
VALUES (107, 'La nurse anglaise', 'SAN-ANTONIO', 'LI', 'Les exploits d un nain criminel.', 14.94, 336);
INSERT INTO livre
VALUES (108, 'Le jeune homme au téléphone', 'SIMPÈRE', 'LI', 'Confidences sur ligne chaude.', 10.67, 162);
INSERT INTO livre
VALUES (109, 'La fortune des Laufer', 'LENTÉRIC', 'LI', 'Les manœuvres d un couple diabolique.', 15.24, 432);
INSERT INTO livre
VALUES (110, 'La révolution des fourmis', 'WERBER', 'LI', 'Le génie des fourmis au service de la paix des hommes.',
        16.46, 544);
INSERT INTO livre
VALUES (111, 'Le complot des anges', 'SULITZER', 'LI', 'Un trust diabolique des fous de Dieu.', 14.64, 432);
INSERT INTO livre
VALUES (112, 'Ne pleure pas', 'FIELDING', 'SU', 'Menaces sur une femme trop gênante.', 14.94, 352);
INSERT INTO livre
VALUES (113, 'L arène blanche', 'CHALON', 'SU', 'Folie meurtrière en montagne.', 14.03, 384);
INSERT INTO livre
VALUES (114, 'Les larmes du dragon', 'KOONTZ', 'SU', 'Dans la spirale d effroyables terreurs.', 13.57, 312);
INSERT INTO livre
VALUES (115, 'Le soleil en embuscade', 'SUYIN', 'SU', 'Des meurtres qui sentent la poudre... blanche.', 8.38, 288);
INSERT INTO livre
VALUES (116, 'Insomnie', 'KING', 'SU', 'Ces forces obscures qui hantent les nuits blanches.', 18.29, 720);
INSERT INTO livre
VALUES (117, 'Non coupable', 'GRISHAM', 'SU', 'Crime justifié contre haine raciale?', 15.24, 720);
INSERT INTO livre
VALUES (118, 'Le client', 'GRISHAM', 'SU', 'L enfant qui en savait trop...', 14.94, 592);
INSERT INTO livre
VALUES (119, 'Le pouvoir d exécutera', 'BALDACCI', 'SU', 'Un homme à abattre pour voyeurisme.', 17.07, 432);
INSERT INTO livre
VALUES (120, 'Amnésia', 'MERCER', 'SU', 'Quête d identité autour d un meurtre.', 14.48, 364);
INSERT INTO livre
VALUES (121, 'Relations dangereurses', 'LOVETT', 'SU', 'Quand un malade mental mène le jeu.', 13.42, 320);
INSERT INTO livre
VALUES (122, 'Les 7 masques', 'SADOUL', 'SU', 'Un jeu de pistes criminel.', 11.89, 352);
INSERT INTO livre
VALUES (123, 'La nuit des voleurs', 'BURDETT', 'SU', 'Un dangereux ménage à trois.', 13.42, 368);
INSERT INTO livre
VALUES (124, 'Souviens-toi', 'HIGGINS CLARK', 'SU', 'Mystère et terreur à domicile...', 15.24, 400);
INSERT INTO livre
VALUES (125, 'Un jour tu verras...', 'HIGGINS CLARK', 'SU', 'La ressemblance était trop parfaite...', 14.64, 352);
INSERT INTO livre
VALUES (126, 'Nous n irons plus au bois', 'HIGGINS CLARK', 'SU', 'Crime passionnel ou folie meurtrière?', 14.64, 352);
INSERT INTO livre
VALUES (127, 'Recherche jeune femme aimant danser', 'HIGGINS CLARK', 'SU', 'Danse macabre.', 11.59, 352);
INSERT INTO livre
VALUES (128, 'La clinique du docteur H.', 'HIGGINS CLARK', 'SU', 'Diagnostic pour la mort.', 11.89, 336);
INSERT INTO livre
VALUES (129, 'Un cri dans la nuit', 'HIGGINS CLARK', 'SU', 'La maison des grandes terreurs.', 11.89, 352);
INSERT INTO livre
VALUES (130, 'Ce que vivent les roses.', 'HIGGINS CLARK', 'SU', 'Troublantes sosies', 15.09, 288);
INSERT INTO livre
VALUES (131, 'La nuit du renard', 'HIGGINS CLARK', 'SU', '"Renard" : la signature de l assassin.', 11.59, 288);
INSERT INTO livre
VALUES (132, 'Dors ma jolie', 'HIGGINS CLARK', 'SU', 'Un meurtre cousu main dans le monde de la mode.', 11.89, 304);
INSERT INTO livre
VALUES (133, 'Ne pleure pas ma belle', 'HIGGINS CLARK', 'SU', 'Enquête sur une mort suspecte.', 10.82, 352);
INSERT INTO livre
VALUES (134, 'Le démon du passé', 'HIGGINS CLARK', 'SU', 'Crimes et passions à l ombre de la Maison Blanche.', 10.82,
        352);
INSERT INTO livre
VALUES (135, 'Douce nuit', 'HIGGINS CLARK', 'SU', 'Noël d effroi pour un petit garçon/µ.', 10.82, 224);
INSERT INTO livre
VALUES (136, 'La maison du clair de lune', 'HIGGINS CLARK', 'SU', 'Puzzle mortel autour d une femme trop curieuse.',
        14.33, 384);
INSERT INTO livre
VALUES (137, 'Dans l ombre de Mary', 'SCOTTOLINE', 'SU', 'Une femme traquée dans sa réussite.', 13.72, 352);
INSERT INTO livre
VALUES (138, 'Lucky Luke : Billy the kid 2', 'MORRIS ET GOSCINNY', 'BD', NULL, 5.95, 48);
INSERT INTO livre
VALUES (139, 'Lucky Luke : Les Daltons courent toujours', 'MORRIS ET GOSCINNY', 'BD', NULL, 5.95, 48);
INSERT INTO livre
VALUES (140, 'Lucky Luke : Les Daltons se rachètent', 'MORRIS ET GOSCINNY', 'BD', NULL, 5.95, 48);
INSERT INTO livre
VALUES (141, 'Lucky Luke : Tortillas pour les Daltons', 'MORRIS ET GOSCINNY', 'BD', NULL, 5.95, 48);
INSERT INTO livre
VALUES (142, 'Lucky Luke : Calamity Jane', 'MORRIS ET GOSCINNY', 'BD', NULL, 5.95, 48);
INSERT INTO livre
VALUES (143, 'Lucky Luke : L escorte', 'MORRIS ET GOSCINNY', 'BD', NULL, 5.95, 48);
INSERT INTO livre
VALUES (144, 'Tintin : Les 7 boules de cristal', 'HERGÉ', 'BD', NULL, 6.86, 70);
INSERT INTO livre
VALUES (145, 'Tintin : Objectif lune', 'HERGÉ', 'BD', NULL, 6.86, 70);
INSERT INTO livre
VALUES (146, 'Tintin : On a marché sur la lune', 'HERGÉ', 'BD', NULL, 6.86, 70);
INSERT INTO livre
VALUES (147, 'Tintin : Les cigares du pharaon', 'HERGÉ', 'BD', NULL, 6.86, 70);
INSERT INTO livre
VALUES (148, 'Tintin : Le lotus bleu', 'HERGÉ', 'BD', NULL, 6.86, 70);
INSERT INTO livre
VALUES (149, 'Tintin : Le secret de la Licorne', 'HERGÉ', 'BD', NULL, 6.86, 70);
INSERT INTO livre
VALUES (150, 'Tintin : Le crabe aux pinces d or', 'HERGÉ', 'BD', NULL, 6.86, 70);
INSERT INTO livre
VALUES (151, 'A se rouler par terre', 'SIMON', 'HU', 'Une mine d humour irrésistible.', 10.98, 324);
INSERT INTO livre
VALUES (152, 'Nouvelles histoires d en rire', 'ZABEL', 'HU',
        'Autour de Roger Zabel, de Guy Job et de leurs invités, c est  la grande parade du rire sur TF1.', 10.67, 192);
INSERT INTO livre
VALUES (153, 'Les vacances de Nicolas', 'SEMPÉ ET GOSCINNY', 'HU',
        'Avec les talents ironiques et conjoints du dessinateur Sempé et du conteur Goscinny.', 14.48, 228);
INSERT INTO livre
VALUES (154, 'Les grosses têtes', 'BOUVARD', 'HU', 'Un florilège des meilleurs moments de l émission.', 11.43, 208);
INSERT INTO livre
VALUES (155, 'La chinoise verte', 'HAMEL', 'TE', 'Le calvaire d un esclavage conjugal.', 15.43, 320);
INSERT INTO livre
VALUES (156, 'Blessée à jamais', 'PATTYN', 'TE', 'Le message d espoir d une femme dont l enfance fut un martyre.',
        12.74, 240);
INSERT INTO livre
VALUES (157, 'Les filles du Sultana', 'SASSON', 'TE', 'La terreur des femmes musulmanes sous le joug viril.', 14.09,
        256);
INSERT INTO livre
VALUES (158, 'Le poids du silence', 'MARÉCHAL', 'TE', 'Un combat qu il vont mener seuls, car personne ne doit savoir.',
        14.76, 306);
INSERT INTO livre
VALUES (159, 'Testament...', 'ABBÉ PIERRE', 'TE', 'Une voix fraternelle.', 11.4, 192);
INSERT INTO livre
VALUES (160, 'Paula', 'ALLENDE', 'TE', 'Un beau chant de la mémoire pour conjurer la mort.', 15.93, 464);
INSERT INTO livre
VALUES (161, 'Le pèlerin de Compostelle', 'COELHO', 'TE', 'Quête spirituelle sur une route légendaire.', 14.42, 378);
INSERT INTO livre
VALUES (162, 'Mon frère l idiot', 'CASTILLO', 'TE', 'Comment un enfant martyr devient un écrivain.', 17.44, 392);
INSERT INTO livre
VALUES (163, 'Le petit', 'COUDERC', 'TE', 'A l heure des premières amours.', 14.25, 416);
INSERT INTO livre
VALUES (164, 'Thérèse de Lisieux', 'CHALON', 'TE', 'L étonnant destin de "la fiancé de Jésus".', 17.1, 300);
INSERT INTO livre
VALUES (165, 'La traversée', 'LABRO', 'TE', 'En tête-à-tête avec la mort.', 16.1, 304);
INSERT INTO livre
VALUES (166, 'L exercice de vivre.', 'ALIZON', 'TE', 'Un adolescence à Auschwitz.', 15.76, 384);
INSERT INTO livre
VALUES (167, 'L esprit de la forêt', 'BUINAIMA', 'TE', 'Le témoignage d un enfant de la Forêt sacrée.', 15.76, 208);
INSERT INTO livre
VALUES (168, 'La montagne des parfums', 'WALTER', 'TE', 'Le récit d un rescapé de la tragédie vietnamienne.', 17.1,
        464);
INSERT INTO livre
VALUES (169, 'Peuples en danger', 'DAVIDSON', 'TE', 'Les populations menacées dans le monde.', 15.09, 208);
INSERT INTO livre
VALUES (170, 'Le Moyen Age', 'HARPUR ET HALLAM', 'HI', 'Cinq siècles de vie médiévale.', 19.82, 128);
INSERT INTO livre
VALUES (171, 'Atlas de la civilisation occidentale', 'LAMAISONA', 'HI',
        'Le faits, les hommes, les événements qui ont fait la parenté européenne.', 15.09, 352);
INSERT INTO livre
VALUES (172, 'Histoire de la Chine', 'GROUSSET', 'HI', 'La fascinante épopée d un empire.', 16.77, 368);
INSERT INTO livre
VALUES (173, 'Les grands procès', NULL, 'HI', 'Les 150 affaires et procès les plus célèbres.', 25.61, 320);
INSERT INTO livre
VALUES (174, 'C était le XXème siècle', 'DECAUX', 'HI', 'Des événements-clés dans la mémoire du siècle.', 14.94, 496);
INSERT INTO livre
VALUES (175, 'Atlas de l Histoire de France', NULL, 'HI', 'De la préhistoire à nos jours.', 27.44, 256);
INSERT INTO livre
VALUES (176, 'La sagesse orientale', 'LITTLETON', 'HI', 'Les traditions spirituelles et philosophiques de l Asie.',
        24.39, 176);
INSERT INTO livre
VALUES (177, 'Madame de Pompadour', 'LEVRON', 'HI', 'L éclat d une grande favorite.', 17.68, 320);
INSERT INTO livre
VALUES (178, 'Fouché', 'ZWEIG', 'HI', 'Une diabolique manœuvrier du pouvoir.', 14.48, 256);
INSERT INTO livre
VALUES (179, 'Ramsès II', 'DESROCHES NOBLECOURT', 'HI', 'Soixante ans de passion au service d un pharaon.', 16.46, 432);
INSERT INTO livre
VALUES (180, 'Histoire mondiale de l affiche politique', 'GERVEREAU', 'AR', 'Le siècle qui a fait parler les murs',
        21.34, 200);
INSERT INTO livre
VALUES (181, 'Notre siècle en images', NULL, 'AR', 'La mémoire collective du siècle.', 24.09, 424);
INSERT INTO livre
VALUES (182, 'Mythologies du monde entier', NULL, 'AR', NULL, 24.09, 320);
INSERT INTO livre
VALUES (183, 'Les pays et leurs peuples', NULL, 'AR', 'A la rencontre des hommes et des civilisations.', 37.81, 1664);
INSERT INTO livre
VALUES (184, 'L art khmer', 'GITEAU ET GUÉRET', 'AR', 'Les chefs-d œuvre de la civilisation cambodgienne.', 17.68, 140);
INSERT INTO livre
VALUES (185, 'Les grandes tragédies', NULL, 'AR', 'De la préhistoire à nos jours.', 25.61, 320);
INSERT INTO livre
VALUES (186, 'L affiche de sport dans le monde', 'LAGET', 'AR', '200 affiches exceptionnelles.', 21.34, 192);
INSERT INTO livre
VALUES (187, 'Histoire de la peinture', 'SOEUR WENDY BECKETT', 'AR',
        'Huit cents ans de création de la peinture occidentale.', 30.18, 400);
INSERT INTO livre
VALUES (188, 'Les trésors retrouvés', 'KOSTENEVICH', 'AR',
        'Soixante-quinze chefs-d œuvre impressionnistes enfin retrouvés en Russie.', 36.59, 292);
INSERT INTO livre
VALUES (189, 'Douceur de France 1', 'LE NORMRAND', 'EV', 'Le bonheur de vivre des régions de France.', 20.12, 192);
INSERT INTO livre
VALUES (190, 'Atlas des routes de France', NULL, 'EV', 'Le meilleur guide de la route.', 23.17, 370);
INSERT INTO livre
VALUES (191, 'Destination de rêve', NULL, 'EV', 'Les plus beaux voyages du monde.', 19.82, 224);
INSERT INTO livre
VALUES (192, 'La Sologne', 'GRAVELINE', 'EV', 'Terre au charme prenant et mystérieux.', 12.2, 72);
INSERT INTO livre
VALUES (193, 'Le pays cathare', 'GRAVELINE', 'EV', 'Le brûlant royaume de "l hérésie".', 8.99, 72);
INSERT INTO livre
VALUES (194, 'La route des vins d Alsace', 'KLÜCKS', 'EV', 'Pays de tradition et de vignoble.', 8.99, 72);
INSERT INTO livre
VALUES (195, 'L île des esprits : Madagascar', 'SARANO', 'EV', 'Magie et misère de la Grande Ile.', 16.77, 208);
INSERT INTO livre
VALUES (196, 'La Thaïlande', 'GOODMAN', 'EV', 'Le plus beau livre jamais consacré à la Thaïlande !', 19.51, 128);
INSERT INTO livre
VALUES (197, 'La Vanoise', 'MONTAGU', 'EV', 'Une réserve de vie naturelle.', 14.03, 100);
INSERT INTO livre
VALUES (198, 'Les Alpilles', 'BOGÉ', 'EV', 'Une terre magique au cœur de la Provence.', 14.03, 100);
INSERT INTO livre
VALUES (199, 'La Sierra Nevada', 'MASSON', 'EV', 'Une réserve de la biosphère classée par l U.N.E.S.C.O.', 14.03, 100);
INSERT INTO livre
VALUES (200, 'La Camargue', 'GRAVELINE', 'EV', 'Un fascinant univers amphibie.', 14.03, 100);
INSERT INTO livre
VALUES (201, 'Ce qu il faut voir dans les Alpes', 'DUPUY', 'EV', 'Splendeurs des sites montagnards.', 13.11, 140);
INSERT INTO livre
VALUES (202, 'Ce qu il faut voir dans le Sud-Ouest et Périgord', 'GRAVELINE', 'EV', 'De bordeaux à Lascaux.', 13.11,
        136);
INSERT INTO livre
VALUES (203, 'Chateaux du Val de Loire', 'POLIDORI', 'EV', 'Les joyaux de l architecture royale.', 25.61, 160);
INSERT INTO livre
VALUES (204, 'Ce qu il faut voir de Lyon et en Beaujolais', 'DUPUY', 'EV', NULL, 13.11, 140);
INSERT INTO livre
VALUES (205, 'Bretagne', NULL, 'EV', 'Une terre légendaire à la proue de la France.', 20.73, 456);
INSERT INTO livre
VALUES (206, 'Vallée de la Loire', NULL, 'EV', 'Pays des vins et des princes.', 20.73, 360);
INSERT INTO livre
VALUES (207, 'Provence', NULL, 'EV', 'Sites et modes de vie d un pays de lumière.', 20.73, 408);
INSERT INTO livre
VALUES (208, 'Les oiseaux  d Europe dans leurs milieux', 'DUPUET', 'LO', NULL, 20.43, 320);
INSERT INTO livre
VALUES (209, 'La pêche en douce et en mer', NULL, 'LO', 'Un guide complet pour tous les types de pêche.', 22.56, 288);
INSERT INTO livre
VALUES (210, 'Les champignons 1', 'GARNWEIDNER', 'LO', 'Un guide photos très utile.', 12.5, 160);
INSERT INTO livre
VALUES (211, 'Chasse succès', 'DURANTEL', 'LO', 'Plaisir de la chasse dans le respect de la nature.', 19.51, 224);
INSERT INTO livre
VALUES (212, 'Le chat et nous', 'DIETTRICH', 'LO', 'Le plus fascinant des compagnons.', 12.5, 140);
INSERT INTO livre
VALUES (213, 'Aventures et découvertes dans la nature', 'LUX', 'LO',
        'Une initiation détaillée aux activités de plein air.', 18.14, 240);
INSERT INTO livre
VALUES (214, 'Restez jeune en mangeant mieux', 'MONTIGNAC', 'SA', NULL, 11.89, 272);
INSERT INTO livre
VALUES (215, 'Un ventre plat pour la vie', 'CLERGEAUD', 'SA', 'Une remise en forme complète.', 11.89, 192);
INSERT INTO livre
VALUES (216, 'La méthode Gesta', 'GESTA', 'SA', 'Une méthode française qui révolutionne les régimes.', 11.89, 240);
INSERT INTO livre
VALUES (217, 'Je mange, donc je maigris', 'MONTIGNAC', 'SA', 'Une condamnation sans appel des régimes basses calories.',
        11.89, 240);
INSERT INTO livre
VALUES (218, 'La méthode Montignac spécial femme', 'MONTIGNAC', 'SA', 'Les bonnes recettes pour une féminité épanouie.',
        11.89, 352);
INSERT INTO livre
VALUES (219, 'Grand dictionnaire médical pour toute la famille', 'BELLICHA', 'SA', 'Par ordre alphabétique.', 24.24,
        480);
INSERT INTO livre
VALUES (220, 'Les remèdes maison des médecins', NULL, 'SA', 'Le guide médical le plus vendu au monde.', 23.78, 728);
INSERT INTO livre
VALUES (221, 'Le langage du corps', 'MOLCHO', 'PS', 'Le langage du corps ne ment pas.', 18.29, 224);
INSERT INTO livre
VALUES (222, 'ABC de la psychologie et de la psychanalyse', 'MOREL', 'PS', 'Connaissance de soi-même.', 11.59, 320);
INSERT INTO livre
VALUES (223, 'Comprendre et interpréter vos rêves', 'LÉONARD', 'PS', 'Un guide pour décoder les symboles des rêves.',
        16.77, 368);
INSERT INTO livre
VALUES (224, 'Bébé guide', 'STOPPARD', 'PS', 'Tout ce qu il faut savoir de la naissance à 3 ans.', 19.51, 384);
INSERT INTO livre
VALUES (225, 'Développez votre mémoire', 'BALLINARI', 'PS', 'Un livre-jeu amusant pour tester votre mémoire.', 12.04,
        128);
INSERT INTO livre
VALUES (226, 'Conflits parents-enfants', 'SAMALIN', 'PS', 'Pour désamorcer les crises familiales.', 12.04, 256);
INSERT INTO livre
VALUES (227, 'Un million de menus minceur', 'CHARRETTON', 'CU', NULL, 22.56, 268);
INSERT INTO livre
VALUES (228, 'La bonne cuisine d aujourd hui', NULL, 'CU', 'Le plus complet des livres de cuisine.', 23.78, 656);
INSERT INTO livre
VALUES (229, 'A table! Un milliion de menus', NULL, 'CU', 'Composer des repas de A à Z.', 20.89, 220);
INSERT INTO livre
VALUES (230, 'La cuisine saveur', 'CHARRETTON', 'CU', 'Fonctions et recettes du micro-ondes.', 8.38, 192);
INSERT INTO livre
VALUES (231, 'Les desserts', NULL, 'CU', 'Cuisiner c est facile', 12.04, 144);
INSERT INTO livre
VALUES (232, 'Le régime d un gourmand', 'CHARRETTON', 'CU', '200 recettes savoureuses pour 28 jours de régime.', 17.68,
        192);
INSERT INTO livre
VALUES (233, 'Les fêtes autour d un plat', 'DEVAUX', 'CU', '50 façons originales de recevoir sa famille  et ses amis.',
        19.51, 160);
INSERT INTO livre
VALUES (234, 'Cuisine de printemps', 'LECLÈRE-FERRIÈRE', 'CU',
        'A chaque saison, son climat, sa mode et ses humeurs. Mais aussi sa cuisine.', 11.89, 128);
INSERT INTO livre
VALUES (235, '50 menus en 30 minutes', 'VERGNE', 'CU', 'Une cuisine rapide et savoureuse.', 10.98, 112);
INSERT INTO livre
VALUES (236, 'Les buffets', 'VERGNE', 'CU', 'Des menus "tout prêts" pour des réceptions conviviales.', 10.98, 96);
INSERT INTO livre
VALUES (237, 'Les carnets de cuisine de Monet', 'JOYES', 'CU',
        'C est en 1883 que Claude Monet et sa femme s installent à Giverny.', 24.39, 192);
INSERT INTO livre
VALUES (238, 'Le savoir écrire', 'JOUETTE', 'VP', 'Une lettre pour chaque circonstance.', 14.03, 424);
INSERT INTO livre
VALUES (239, 'Le nouveau manuel de l automobiliste', 'FONDIN', 'VP',
        'Un livre précis qui répond à toutes les questions.', 12.2, 320);
INSERT INTO livre
VALUES (240, 'Le nouveau guide pratique du droit', 'LAGADEC', 'VP',
        'Tout ce qu il faut savoir pour défendre vos droits.', 15.24, 576);
INSERT INTO livre
VALUES (241, 'Un prénom pour la vie', 'ROUZIC', 'VP', 'Dis-moi ton prénom, je te dirai qui tu es !', 14.33, 432);
INSERT INTO livre
VALUES (242, 'ABC de généalogie', 'GAUTIER', 'VP', 'Constituez "l arbre" de votre famille.', 18.14, 480);
INSERT INTO livre
VALUES (243, 'Guide des nouveautés qui nous changent la vie', NULL, 'VP',
        'L inventaire critique des nouveaux produits et services.', 9.6, 480);
INSERT INTO livre
VALUES (244, 'ABC de la géobiologie', 'SEMELLE', 'VP', 'Pour établir un environnement domestique favorable.', 11.59,
        176);
INSERT INTO livre
VALUES (245, 'Super dico-trucs', 'LOOCK', 'VP', 'Pour remédier à tous les petits inconvénients domestiques.', 11.89,
        416);
INSERT INTO livre
VALUES (246, 'Atlas mondial', NULL, 'VP', 'Nouvelle cartographie de la Terre.', 19.51, 400);
INSERT INTO livre
VALUES (247, 'Les 50 secrets que toute femme devrait connaître', 'RENAUX', 'VP', 'Toutes les informations utiles',
        16.77, 480);
INSERT INTO livre
VALUES (248, 'Dessin', 'SMITH', 'LO', 'Toutes les notions fondamentales illustrées par l exemple.', 18.29, 160);
INSERT INTO livre
VALUES (249, 'L agenda des fleurs', NULL, 'LO', 'Une toile de maître pour chaque semaine de l année.', 11.28, 120);
INSERT INTO livre
VALUES (250, 'Tours de magie', 'TREMAINE', 'LO', 'Les secrets de l illusionniste à la portée de tous.', 13.42, 128);
INSERT INTO livre
VALUES (251, 'Les jeux d Armand Jammot', 'JAMMOT', 'LO',
        'Mots croisés, mots fléchés, mots codés, jeux de connaissance, etc.', 4.27, 144);
INSERT INTO livre
VALUES (252, 'Tout faire en pâte à sel', 'DESCAMPS', 'LO', 'Des idées magiques pour des réalisations simples.', 13.11,
        96);
INSERT INTO livre
VALUES (253, 'Le grand livre des travaux d aiguilles', NULL, 'LO', 'Un enseignement complet, commenté point par point.',
        22.56, 256);
INSERT INTO livre
VALUES (254, 'Tout faire en papier mâché', 'DESCAMPS', 'LO', 'Des créations originales à la portée de tous.', 13.11,
        96);
INSERT INTO livre
VALUES (255, 'Peinture d intérieur', 'WAGSTAFF', 'VP',
        'Un ouvrage de référence pratique pour tous vos travaux de peinture.', 18.9, 192);
INSERT INTO livre
VALUES (256, 'Le grand livre de la décoration', 'BARNARD', 'VP', 'Des centaines de projets à réaliser vous-même !',
        23.93, 288);
INSERT INTO livre
VALUES (257, 'Le grand livre du bricolage et de la décoration', NULL, 'VP', 'Pour tous les travaux d intérieur.', 22.56,
        288);
INSERT INTO livre
VALUES (258, 'La couture dans la maison', 'GOUNY', 'VP', 'Savoir "habiller" votre environnement.', 21.8, 128);
INSERT INTO livre
VALUES (259, 'Le livre des cadeaux  parfumés', 'NEWDICK', 'VP', '70 idées qui sentent bon...', 14.94, 96);
INSERT INTO livre
VALUES (260, 'Les 1000 plus belles plantes d intérieur', 'KRÜGER', 'VP',
        'Tout ce qu il faut savoir pour une maison verte et fleurie.', 23.78, 384);
INSERT INTO livre
VALUES (261, 'Guide vert : fleurs et bouquets', 'BARASSI', 'VP', 'Tout l art de la composition florale.', 19.51, 254);
INSERT INTO livre
VALUES (262, 'Jardins de curé', 'HERSCHER', 'VP', 'Havres de paix et de beauté.', 24.39, 192);
INSERT INTO livre
VALUES (263, 'La maison de campagne', 'ASHLEY', 'VP', 'Tout le charme du style rustique.', 21.95, 208);
INSERT INTO livre
VALUES (264, 'Les sciences et les techniques', 'LE BRUN', 'DI', 'De l astronomie à l informatique.', 12.81, 128);
INSERT INTO livre
VALUES (265, 'L histoire et les idées', 'LE BRUN', 'DI', 'Un ABC des sciences humaines.', 12.81, 128);
INSERT INTO livre
VALUES (266, 'Le monde et la vie', 'LE BRUN', 'DI', 'Les caractéristiques de notre planète.', 12.81, 128);
INSERT INTO livre
VALUES (267, 'Les arts', 'LE BRUN', 'DI', 'Pour comprendre toutes les expressions artistiques.', 12.81, 144);
INSERT INTO livre
VALUES (268, 'L économie et la politique', 'LE BRUN', 'DI', 'Le monde des besoins et des lois.', 12.81, 144);
INSERT INTO livre
VALUES (269, 'La société au quotidien', 'LE BRUN', 'DI', 'Rites, codes et loisirs.', 12.81, 144);
INSERT INTO livre
VALUES (270, 'Dictionnaire des jeux et des lettres', NULL, 'DI', 'Pour savoir jongler avec les mots.', 12.2, 1032);
INSERT INTO livre
VALUES (271, 'Dictionnaire analogique', 'NIOBEY', 'DI', 'Un mot en appelle un autre.', 12.2, 864);
INSERT INTO livre
VALUES (272, 'Dictionnaire des synonymes', 'BERTAUD DU CHAZAUD', 'DI', 'Trouver le mot juste.', 11.28, 740);
INSERT INTO livre
VALUES (273, 'Toute la science', 'RONAN', 'DI', 'Les secrets de la science sous l angle de la vie quotidienne.', 15.09,
        240);
INSERT INTO livre
VALUES (274, '"Entre guillements"', 'GAGNIÈRE', 'DI', 'Plus de 3000 mots du meilleur esprit.', 14.48, 460);
INSERT INTO livre
VALUES (275, 'Dictionnaire de la psychanalyse', NULL, 'DI', 'Définir et expliquer les concepts de la psychanalyse.',
        12.2, 320);
INSERT INTO livre
VALUES (276, 'Dictionnaire de la sociologie', NULL, 'DI', 'Initiation simple et efficace au vocabulaire.', 11.59, 288);
INSERT INTO livre
VALUES (277, 'Dictionnaire Harrap s compact (Anglais)', NULL, 'DI', 'L anglais tel qu on le parle.', 16.77, 1060);
INSERT INTO livre
VALUES (278, 'Dictionnaire Haarap s compact (allemand)', NULL, 'DI', 'Près de 100000 mots pour comprendre l allemand.',
        16.77, 1254);
INSERT INTO livre
VALUES (279, 'Dictionnaire Hispano Bordas (espagnol)', NULL, 'DI', 'La 3ème langue la plus parlée au monde !', 20.43,
        1938);
INSERT INTO livre
VALUES (280, 'Le Robert illustré d aujourd hui en couleur', NULL, 'DI', 'Français classique moderne, actuel.', 23.78,
        1600);
INSERT INTO livre
VALUES (281, 'Dictionnaire de l orthorgraphe', NULL, 'DI', 'Pour répondre aux  besoins réels des usagers du français.',
        17.68, 800);
INSERT INTO livre
VALUES (282, 'Bescherelle', NULL, 'DI', 'Une méthode simple et claire pour maîtriser la langue.', 19.51, 784);
INSERT INTO livre
VALUES (283, 'Les concours administratifs', NULL, 'DI', 'Un guide complet pour une bonne préparation.', 18.29, 768);
INSERT INTO livre
VALUES (284, 'Les clés du tarot', 'LOOCK', 'AD', 'Un guide pour une vie positive.', 13.11, 256);
INSERT INTO livre
VALUES (285, 'Le vrai tarot de Marseille', 'LOOCK', 'AD', 'Le tout premier tarot de Marseille enfin réédité !', 18.14,
        0);
INSERT INTO livre
VALUES (286, 'Tarot astro karmique', NULL, 'AD', 'Prendre la méthode astrologique comme support divinatoire.', 17.53,
        0);
INSERT INTO livre
VALUES (287, 'L oracle de Pluton', NULL, 'AD', 'Méthode originale et inédite de lire l avenir.', 15.09, 0);
INSERT INTO livre
VALUES (288, 'ABC de l encromanie', 'MUKANDA', 'AD', 'La tache d encre : expression de votre personnalité.', 15.09,
        288);
INSERT INTO livre
VALUES (289, 'Le pendule coffret-kit', 'LONEGREN', 'AD', 'Comment communiquer avec votre moi profond.', 18.29, 0);
INSERT INTO livre
VALUES (290, 'Bien vivre avec la lune', 'GRAF', 'AD', 'Comment tirer parti de l énergie lunaire au quotidien.', 12.5,
        128);
INSERT INTO livre
VALUES (291, 'Exorcistes', 'FROC', 'AD', 'Un combat contre les puissances du mal.', 10.67, 234);
INSERT INTO livre
VALUES (292, 'La source noire', 'VAN EERSEL', 'AD', 'La mort : porte d une autre vie.', 14.03, 324);
INSERT INTO livre
VALUES (293, 'Le langage secret des étoiles et des planètes', 'CORNELIUS', 'AD',
        'Les rapports de l homme et du cosmos.', 18.29, 176);
INSERT INTO livre
VALUES (294, 'Voyage au pays du magique', 'CARMUS', 'AD', 'Les professionnels du "paranormal".', 16.77, 368);
INSERT INTO livre
VALUES (295, 'Prophéties du millénaire', 'SKINNER', 'AD', 'Les révélations des devins et des mystiques.', 14.64, 160);
INSERT INTO livre
VALUES (300, 'Villages de charme en France', 'VILLERS', 'EV', 'Les plus belles promenades régionales.', 20.12, 224);
INSERT INTO livre
VALUES (302, 'Un début à Paris', 'LABRO', 'LI', 'Une éducation d amour et d ambition.', 14.94, 320);

INSERT INTO vendeur
VALUES (1, 'Andre');
INSERT INTO vendeur
VALUES (2, 'Favreau');
INSERT INTO vendeur
VALUES (3, 'Hachette');

INSERT INTO commande
VALUES (2, 'STI001', TO_DATE('2/Jan/2018'), 'CB', 1);
INSERT INTO commande
VALUES (3, 'ABO001', TO_DATE('2/Jan/2018'), 'CB', 1);
INSERT INTO commande
VALUES (4, 'AIM001', TO_DATE('2/Jan/2018'), 'CB', 3);
INSERT INTO commande
VALUES (5, 'ARO001', TO_DATE('2/Jan/2018'), 'CP', 3);
INSERT INTO commande
VALUES (6, 'BON001', TO_DATE('3/Jan/2018'), 'CB', 1);
INSERT INTO commande
VALUES (7, 'MAL001', TO_DATE('3/Jan/2018'), 'CB', 2);
INSERT INTO commande
VALUES (8, 'IAC001', TO_DATE('3/Jan/2018'), 'CB', 2);
INSERT INTO commande
VALUES (9, 'IKA001', TO_DATE('4/Jan/2018'), 'CB', 2);
INSERT INTO commande
VALUES (10, 'ICI001', TO_DATE('4/Jan/2018'), 'CA', 3);
INSERT INTO commande
VALUES (11, 'JAV001', TO_DATE('4/Jan/2018'), 'CP', 3);
INSERT INTO commande
VALUES (12, 'MAT001', TO_DATE('5/Jan/2018'), 'CB', 1);
INSERT INTO commande
VALUES (13, 'MOI001', TO_DATE('5/Jan/2018'), 'CB', 2);
INSERT INTO commande
VALUES (14, 'MNA001', TO_DATE('8/Jan/2018'), 'CA', 3);
INSERT INTO commande
VALUES (15, 'MOI002', TO_DATE('8/Jan/2018'), 'CB', 1);
INSERT INTO commande
VALUES (16, 'NEN001', TO_DATE('9/Jan/2018'), 'CP', 1);
INSERT INTO commande
VALUES (17, 'COG001', TO_DATE('12/Jan/2018'), 'CP', 2);
INSERT INTO commande
VALUES (18, 'COM001', TO_DATE('12/Jan/2018'), 'CB', 2);
INSERT INTO commande
VALUES (19, 'SAB001', TO_DATE('15/Jan/2018'), 'CA', 3);
INSERT INTO commande
VALUES (20, 'SWI001', TO_DATE('15/Jan/2018'), 'CB', 1);
INSERT INTO commande
VALUES (21, 'SAH001', TO_DATE('17/Jan/2018'), 'CB', 2);
INSERT INTO commande
VALUES (22, 'SUJ001', TO_DATE('17/Jan/2018'), 'CP', 2);
INSERT INTO commande
VALUES (23, 'SAN001', TO_DATE('18/Jan/2018'), 'CP', 2);
INSERT INTO commande
VALUES (24, 'STI001', TO_DATE('18/Jan/2018'), 'CB', 3);
INSERT INTO commande
VALUES (25, 'ENE001', TO_DATE('19/Jan/2018'), 'CB', 3);
INSERT INTO commande
VALUES (26, 'EPR001', TO_DATE('19/Jan/2018'), 'CA', 1);
INSERT INTO commande
VALUES (27, 'NEN001', TO_DATE('22/Jan/2018'), 'CB', 1);
INSERT INTO commande
VALUES (29, 'NIO001', TO_DATE('22/Jan/2018'), 'CB', 1);
INSERT INTO commande
VALUES (30, 'PAO001', TO_DATE('23/Jan/2018'), 'CP', 3);
INSERT INTO commande
VALUES (31, 'PEU001', TO_DATE('23/Jan/2018'), 'CP', 3);
INSERT INTO commande
VALUES (32, 'PAS001', TO_DATE('24/Jan/2018'), 'CB', 2);
INSERT INTO commande
VALUES (33, 'GRA001', TO_DATE('25/Jan/2018'), 'CB', 2);
INSERT INTO commande
VALUES (34, 'GON001', TO_DATE('25/Jan/2018'), 'CP', 2);
INSERT INTO commande
VALUES (35, 'LEC001', TO_DATE('26/Jan/2018'), 'CB', 1);
INSERT INTO commande
VALUES (36, 'ZET001', TO_DATE('29/Jan/2018'), 'CA', 1);
INSERT INTO commande
VALUES (37, 'ZEB001', TO_DATE('30/Jan/2018'), 'CA', 1);
INSERT INTO commande
VALUES (38, 'DAB001', TO_DATE('1/Feb/2018'), 'CB', 1);
INSERT INTO commande
VALUES (39, 'DEV001', TO_DATE('1/Feb/2018'), 'CB', 1);
INSERT INTO commande
VALUES (40, 'DIN001', TO_DATE('2/Feb/2018'), 'CB', 1);
INSERT INTO commande
VALUES (41, 'DAS001', TO_DATE('2/Feb/2018'), 'CB', 1);
INSERT INTO commande
VALUES (42, 'DES001', TO_DATE('2/Feb/2018'), 'CB', 2);
INSERT INTO commande
VALUES (43, 'DEC001', TO_DATE('6/Feb/2018'), 'CP', 2);
INSERT INTO commande
VALUES (44, 'DEJ001', TO_DATE('6/Feb/2018'), 'CP', 2);
INSERT INTO commande
VALUES (45, 'DEM001', TO_DATE('6/Feb/2018'), 'CP', 1);
INSERT INTO commande
VALUES (46, 'DEP001', TO_DATE('6/Feb/2018'), 'CB', 3);
INSERT INTO commande
VALUES (47, 'DER001', TO_DATE('9/Feb/2018'), 'CB', 3);
INSERT INTO commande
VALUES (48, 'FON001', TO_DATE('9/Feb/2018'), 'CB', 3);
INSERT INTO commande
VALUES (49, 'HAI001', TO_DATE('9/Feb/2018'), 'CB', 3);
INSERT INTO commande
VALUES (50, 'HIS001', TO_DATE('9/Feb/2018'), 'CB', 1);
INSERT INTO commande
VALUES (52, 'HOC001', TO_DATE('9/Feb/2018'), 'CA', 2);
INSERT INTO commande
VALUES (53, 'OFA001', TO_DATE('12/Feb/2018'), 'CA', 3);
INSERT INTO commande
VALUES (54, 'ONI001', TO_DATE('12/Feb/2018'), 'CA', 1);
INSERT INTO commande
VALUES (55, 'OPI001', TO_DATE('12/Feb/2018'), 'CA', 2);
INSERT INTO commande
VALUES (56, 'OPO001', TO_DATE('12/Feb/2018'), 'CB', 3);
INSERT INTO commande
VALUES (57, 'REN001', TO_DATE('13/Feb/2018'), 'CA', 1);
INSERT INTO commande
VALUES (58, 'TAC001', TO_DATE('14/Feb/2018'), 'CB', 1);
INSERT INTO commande
VALUES (59, 'TER001', TO_DATE('14/Feb/2018'), 'CB', 2);
INSERT INTO commande
VALUES (60, 'TER002', TO_DATE('15/Feb/2018'), 'CP', 2);
INSERT INTO commande
VALUES (61, 'TIN001', TO_DATE('19/Feb/2018'), 'CP', 2);
INSERT INTO commande
VALUES (62, 'TIN002', TO_DATE('19/Feb/2018'), 'CB', 1);
INSERT INTO commande
VALUES (63, 'TIN003', TO_DATE('22/Feb/2018'), 'CB', 2);
INSERT INTO commande
VALUES (64, 'TOU001', TO_DATE('22/Feb/2018'), 'CA', 3);
INSERT INTO commande
VALUES (65, 'TOU002', TO_DATE('23/Feb/2018'), 'CB', 1);
INSERT INTO commande
VALUES (66, 'TOU003', TO_DATE('23/Feb/2018'), 'CP', 1);
INSERT INTO commande
VALUES (67, 'BOS001', TO_DATE('1/Apr/2018'), 'CB', 2);
INSERT INTO commande
VALUES (68, 'ABO001', TO_DATE('2/Apr/2018'), 'CB', 2);
INSERT INTO commande
VALUES (69, 'AIM001', TO_DATE('2/Apr/2018'), 'CA', 3);
INSERT INTO commande
VALUES (70, 'ARO001', TO_DATE('2/Apr/2018'), 'CB', 3);
INSERT INTO commande
VALUES (71, 'BON001', TO_DATE('2/Apr/2018'), 'CB', 3);
INSERT INTO commande
VALUES (72, 'MAL001', TO_DATE('8/Apr/2018'), 'CP', 1);
INSERT INTO commande
VALUES (73, 'IAC001', TO_DATE('9/Apr/2018'), 'CB', 2);
INSERT INTO commande
VALUES (74, 'IKA001', TO_DATE('9/Apr/2018'), 'CB', 2);
INSERT INTO commande
VALUES (75, 'ICI001', TO_DATE('9/Apr/2018'), 'CP', 2);
INSERT INTO commande
VALUES (76, 'JAV001', TO_DATE('10/Apr/2018'), 'CP', 3);
INSERT INTO commande
VALUES (77, 'MAT001', TO_DATE('10/Apr/2018'), 'CB', 1);
INSERT INTO commande
VALUES (78, 'MOI001', TO_DATE('19/Apr/2018'), 'CB', 1);
INSERT INTO commande
VALUES (79, 'MNA001', TO_DATE('22/Apr/2018'), 'CA', 2);
INSERT INTO commande
VALUES (80, 'MOI002', TO_DATE('22/Apr/2018'), 'CB', 2);
INSERT INTO commande
VALUES (81, 'NEN001', TO_DATE('22/Apr/2018'), 'CP', 2);
INSERT INTO commande
VALUES (82, 'COG001', TO_DATE('22/Apr/2018'), 'CP', 3);
INSERT INTO commande
VALUES (83, 'COM001', TO_DATE('23/Apr/2018'), 'CB', 2);
INSERT INTO commande
VALUES (84, 'SAB001', TO_DATE('23/Apr/2018'), 'CA', 1);
INSERT INTO commande
VALUES (85, 'SWI001', TO_DATE('25/Apr/2018'), 'CB', 1);
INSERT INTO commande
VALUES (86, 'SAH001', TO_DATE('25/Apr/2018'), 'CB', 2);
INSERT INTO commande
VALUES (87, 'SUJ001', TO_DATE('25/Apr/2018'), 'CP', 3);
INSERT INTO commande
VALUES (88, 'SAN001', TO_DATE('26/Apr/2018'), 'CP', 3);
INSERT INTO commande
VALUES (89, 'STI001', TO_DATE('26/Apr/2018'), 'CB', 3);
INSERT INTO commande
VALUES (90, 'ENE001', TO_DATE('29/Apr/2018'), 'CB', 2);
INSERT INTO commande
VALUES (91, 'NEN001', TO_DATE('29/Apr/2018'), 'CB', 2);
INSERT INTO commande
VALUES (92, 'NIO001', TO_DATE('29/Apr/2018'), 'CB', 2);
INSERT INTO commande
VALUES (93, 'PAO001', TO_DATE('30/Apr/2018'), 'CP', 2);
INSERT INTO commande
VALUES (94, 'PEU001', TO_DATE('30/Apr/2018'), 'CP', 1);
INSERT INTO commande
VALUES (95, 'PAS001', TO_DATE('30/Apr/2018'), 'CB', 2);
INSERT INTO commande
VALUES (96, 'GRA001', TO_DATE('30/Apr/2018'), 'CB', 1);
INSERT INTO commande
VALUES (97, 'GON001', TO_DATE('30/Apr/2018'), 'CP', 3);
INSERT INTO commande
VALUES (98, 'LEC001', TO_DATE('2/May/2018'), 'CB', 3);
INSERT INTO commande
VALUES (99, 'ZET001', TO_DATE('2/May/2018'), 'CA', 3);
INSERT INTO commande
VALUES (100, 'ZEB001', TO_DATE('3/May/2018'), 'CA', 2);
INSERT INTO commande
VALUES (101, 'DEV001', TO_DATE('3/May/2018'), 'CB', 2);
INSERT INTO commande
VALUES (102, 'DAS001', TO_DATE('3/May/2018'), 'CB', 2);
INSERT INTO commande
VALUES (103, 'DES001', TO_DATE('6/May/2018'), 'CB', 1);
INSERT INTO commande
VALUES (104, 'DEC001', TO_DATE('6/May/2018'), 'CP', 1);
INSERT INTO commande
VALUES (105, 'DEM001', TO_DATE('5/Jun/2018'), 'CP', 2);
INSERT INTO commande
VALUES (106, 'DEP001', TO_DATE('6/May/2018'), 'CB', 2);
INSERT INTO commande
VALUES (107, 'DER001', TO_DATE('6/May/2018'), 'CB', 1);
INSERT INTO commande
VALUES (108, 'DER001', TO_DATE('7/May/2018'), 'CB', 2);
INSERT INTO commande
VALUES (109, 'FON001', TO_DATE('7/May/2018'), 'CB', 2);
INSERT INTO commande
VALUES (110, 'HIS001', TO_DATE('7/May/2018'), 'CB', 3);
INSERT INTO commande
VALUES (111, 'OFA001', TO_DATE('7/May/2018'), 'CA', 2);
INSERT INTO commande
VALUES (112, 'ONI001', TO_DATE('8/May/2018'), 'CA', 1);
INSERT INTO commande
VALUES (113, 'REN001', TO_DATE('8/May/2018'), 'CA', 1);
INSERT INTO commande
VALUES (114, 'TAC001', TO_DATE('9/May/2018'), 'CB', 1);
INSERT INTO commande
VALUES (115, 'TER002', TO_DATE('9/May/2018'), 'CB', 1);
INSERT INTO commande
VALUES (116, 'TER002', TO_DATE('9/May/2018'), 'CB', 1);
INSERT INTO commande
VALUES (117, 'TIN001', TO_DATE('16/May/2018'), 'CP', 2);
INSERT INTO commande
VALUES (118, 'TIN002', TO_DATE('16/May/2018'), 'CB', 2);
INSERT INTO commande
VALUES (119, 'TIN003', TO_DATE('16/May/2018'), 'CB', 2);
INSERT INTO commande
VALUES (120, 'TOU001', TO_DATE('17/May/2018'), 'CP', 3);
INSERT INTO commande
VALUES (121, 'TOU002', TO_DATE('20/May/2018'), 'CA', 3);
INSERT INTO commande
VALUES (122, 'TOU003', TO_DATE('20/May/2018'), 'CB', 3);
INSERT INTO commande
VALUES (123, 'ABO001', TO_DATE('2/Sep/2018'), 'CB', 3);
INSERT INTO commande
VALUES (124, 'AIM001', TO_DATE('2/Sep/2018'), 'CA', 1);
INSERT INTO commande
VALUES (125, 'ARO001', TO_DATE('2/Sep/2018'), 'CB', 1);
INSERT INTO commande
VALUES (126, 'ICI001', TO_DATE('3/Sep/2018'), 'CB', 1);
INSERT INTO commande
VALUES (127, 'MOI002', TO_DATE('3/Sep/2018'), 'CA', 2);
INSERT INTO commande
VALUES (128, 'NEN001', TO_DATE('4/Sep/2018'), 'CP', 2);
INSERT INTO commande
VALUES (129, 'COG001', TO_DATE('5/Sep/2018'), 'CP', 3);
INSERT INTO commande
VALUES (130, 'SWI001', TO_DATE('5/Sep/2018'), 'CB', 3);
INSERT INTO commande
VALUES (131, 'SAH001', TO_DATE('9/Sep/2018'), 'CB', 3);
INSERT INTO commande
VALUES (132, 'SUJ001', TO_DATE('9/Sep/2018'), 'CP', 2);
INSERT INTO commande
VALUES (133, 'STI001', TO_DATE('10/Sep/2018'), 'CB', 1);
INSERT INTO commande
VALUES (134, 'ENE001', TO_DATE('11/Sep/2018'), 'CB', 1);
INSERT INTO commande
VALUES (135, 'EPR001', TO_DATE('12/Sep/2018'), 'CB', 3);
INSERT INTO commande
VALUES (136, 'NEN001', TO_DATE('13/Sep/2018'), 'CB', 3);
INSERT INTO commande
VALUES (137, 'NIO001', TO_DATE('13/Sep/2018'), 'CB', 1);
INSERT INTO commande
VALUES (138, 'PAO001', TO_DATE('13/Sep/2018'), 'CP', 1);
INSERT INTO commande
VALUES (139, 'GON001', TO_DATE('16/Sep/2018'), 'CA', 3);
INSERT INTO commande
VALUES (140, 'LEC001', TO_DATE('16/Sep/2018'), 'CB', 2);
INSERT INTO commande
VALUES (141, 'ZET001', TO_DATE('16/Sep/2018'), 'CA', 2);
INSERT INTO commande
VALUES (142, 'DAB001', TO_DATE('17/Sep/2018'), 'CA', 2);
INSERT INTO commande
VALUES (143, 'DEV001', TO_DATE('17/Sep/2018'), 'CB', 1);
INSERT INTO commande
VALUES (144, 'DIN001', TO_DATE('19/Sep/2018'), 'CB', 1);
INSERT INTO commande
VALUES (145, 'DES001', TO_DATE('19/Sep/2018'), 'CB', 3);
INSERT INTO commande
VALUES (146, 'DEJ001', TO_DATE('20/Sep/2018'), 'CP', 3);
INSERT INTO commande
VALUES (147, 'DEM001', TO_DATE('23/Sep/2018'), 'CA', 3);
INSERT INTO commande
VALUES (148, 'DEP001', TO_DATE('23/Sep/2018'), 'CB', 2);
INSERT INTO commande
VALUES (149, 'DER001', TO_DATE('24/Sep/2018'), 'CB', 2);
INSERT INTO commande
VALUES (150, 'HAI001', TO_DATE('25/Sep/2018'), 'CB', 2);
INSERT INTO commande
VALUES (151, 'HIS001', TO_DATE('25/Sep/2018'), 'CB', 1);
INSERT INTO commande
VALUES (152, 'HOC001', TO_DATE('26/Sep/2018'), 'CA', 1);
INSERT INTO commande
VALUES (153, 'OFA001', TO_DATE('1/Oct/2018'), 'CB', 1);
INSERT INTO commande
VALUES (154, 'ONI001', TO_DATE('1/Oct/2018'), 'CA', 3);
INSERT INTO commande
VALUES (155, 'OPI001', TO_DATE('2/Oct/2018'), 'CA', 3);
INSERT INTO commande
VALUES (156, 'OPO001', TO_DATE('3/Oct/2018'), 'CB', 3);
INSERT INTO commande
VALUES (157, 'TAC001', TO_DATE('3/Oct/2018'), 'CB', 1);
INSERT INTO commande
VALUES (158, 'TER001', TO_DATE('4/Oct/2018'), 'CB', 1);
INSERT INTO commande
VALUES (159, 'TER002', TO_DATE('7/Oct/2018'), 'CP', 1);
INSERT INTO commande
VALUES (160, 'TIN001', TO_DATE('8/Oct/2018'), 'CP', 2);
INSERT INTO commande
VALUES (161, 'TIN002', TO_DATE('8/Oct/2018'), 'CB', 2);
INSERT INTO commande
VALUES (162, 'TIN003', TO_DATE('9/Oct/2018'), 'CA', 1);
INSERT INTO commande
VALUES (163, 'TOU001', TO_DATE('9/Oct/2018'), 'CA', 1);
INSERT INTO commande
VALUES (164, 'TOU003', TO_DATE('9/Oct/2018'), 'CP', 1);
INSERT INTO commande
VALUES (165, 'BOS001', TO_DATE('2/Jan/2019'), 'CA', 2);
INSERT INTO commande
VALUES (166, 'ABO001', TO_DATE('2/Jan/2019'), 'CB', 3);
INSERT INTO commande
VALUES (167, 'AIM001', TO_DATE('3/Jan/2019'), 'CP', 3);
INSERT INTO commande
VALUES (168, 'BON001', TO_DATE('3/Jan/2019'), 'CB', 3);
INSERT INTO commande
VALUES (169, 'MAL001', TO_DATE('6/Jan/2019'), 'CB', 3);
INSERT INTO commande
VALUES (170, 'IKA001', TO_DATE('6/Jan/2019'), 'CB', 3);
INSERT INTO commande
VALUES (171, 'ICI001', TO_DATE('6/Jan/2019'), 'CP', 1);
INSERT INTO commande
VALUES (172, 'JAV001', TO_DATE('7/Jan/2019'), 'CP', 1);
INSERT INTO commande
VALUES (173, 'MAT001', TO_DATE('7/Jan/2019'), 'CB', 1);
INSERT INTO commande
VALUES (174, 'MNA001', TO_DATE('8/Jan/2019'), 'CA', 2);
INSERT INTO commande
VALUES (175, 'MOI002', TO_DATE('8/Jan/2019'), 'CB', 2);
INSERT INTO commande
VALUES (176, 'COG001', TO_DATE('9/Jan/2019'), 'CP', 3);
INSERT INTO commande
VALUES (177, 'SAB001', TO_DATE('10/Jan/2019'), 'CA', 3);
INSERT INTO commande
VALUES (178, 'SWI001', TO_DATE('10/Jan/2019'), 'CB', 3);
INSERT INTO commande
VALUES (179, 'SAH001', TO_DATE('10/Jan/2019'), 'CB', 1);
INSERT INTO commande
VALUES (180, 'SAN001', TO_DATE('13/Jan/2019'), 'CP', 2);
INSERT INTO commande
VALUES (181, 'ENE001', TO_DATE('13/Jan/2019'), 'CB', 3);
INSERT INTO commande
VALUES (182, 'EPR001', TO_DATE('14/Jan/2019'), 'CA', 1);
INSERT INTO commande
VALUES (183, 'PEU001', TO_DATE('14/Jan/2019'), 'CP', 2);
INSERT INTO commande
VALUES (184, 'PAS001', TO_DATE('15/Jan/2019'), 'CB', 3);
INSERT INTO commande
VALUES (185, 'GRA001', TO_DATE('15/Jan/2019'), 'CB', 1);
INSERT INTO commande
VALUES (186, 'ZEB001', TO_DATE('15/Jan/2019'), 'CA', 2);
INSERT INTO commande
VALUES (187, 'DIN001', TO_DATE('16/Jan/2019'), 'CB', 3);
INSERT INTO commande
VALUES (188, 'DAS001', TO_DATE('16/Jan/2019'), 'CB', 1);
INSERT INTO commande
VALUES (189, 'DES001', TO_DATE('17/Jan/2019'), 'CB', 2);
INSERT INTO commande
VALUES (190, 'DEC001', TO_DATE('20/Jan/2019'), 'CP', 3);
INSERT INTO commande
VALUES (191, 'DEJ001', TO_DATE('20/Jan/2019'), 'CP', 1);
INSERT INTO commande
VALUES (192, 'DEM001', TO_DATE('21/Jan/2019'), 'CP', 2);
INSERT INTO commande
VALUES (193, 'DEP001', TO_DATE('21/Jan/2019'), 'CB', 3);
INSERT INTO commande
VALUES (194, 'DER001', TO_DATE('22/Jan/2019'), 'CB', 3);
INSERT INTO commande
VALUES (195, 'FON001', TO_DATE('22/Jan/2019'), 'CB', 3);
INSERT INTO commande
VALUES (196, 'OFA001', TO_DATE('23/Jan/2019'), 'CA', 2);
INSERT INTO commande
VALUES (197, 'ONI001', TO_DATE('24/Jan/2019'), 'CA', 2);
INSERT INTO commande
VALUES (198, 'OPI001', TO_DATE('27/Jan/2019'), 'CA', 3);
INSERT INTO commande
VALUES (199, 'OPO001', TO_DATE('27/Jan/2019'), 'CB', 1);
INSERT INTO commande
VALUES (200, 'REN001', TO_DATE('27/Jan/2019'), 'CA', 1);
INSERT INTO commande
VALUES (201, 'TAC001', TO_DATE('28/Jan/2019'), 'CB', 1);
INSERT INTO commande
VALUES (202, 'TER001', TO_DATE('28/Jan/2019'), 'CB', 1);
INSERT INTO commande
VALUES (203, 'TER002', TO_DATE('29/Jan/2019'), 'CP', 3);
INSERT INTO commande
VALUES (204, 'TIN001', TO_DATE('29/Jan/2019'), 'CB', 3);
INSERT INTO commande
VALUES (205, 'TOU001', TO_DATE('29/Jan/2019'), 'CA', 3);
INSERT INTO commande
VALUES (206, 'TOU002', TO_DATE('30/Jan/2019'), 'CB', 2);
INSERT INTO commande
VALUES (207, 'ARO001', TO_DATE('11/Jan/2019'), 'CB', 3);
INSERT INTO commande
VALUES (208, 'IAC001', TO_DATE('13/Jan/2019'), 'CB', 3);
INSERT INTO commande
VALUES (211, 'MAT001', TO_DATE('6/Feb/2019'), 'CB', 1);
INSERT INTO commande
VALUES (220, 'BOS001', TO_DATE('6/Mar/2019'), 'CP', 3);

INSERT INTO contient
VALUES (2, 8, 14.0253, 1);
INSERT INTO contient
VALUES (2, 27, 14.0253, 1);
INSERT INTO contient
VALUES (3, 22, 12.5008, 1);
INSERT INTO contient
VALUES (3, 55, 16.4645, 1);
INSERT INTO contient
VALUES (3, 250, 13.4155, 1);
INSERT INTO contient
VALUES (4, 1, 10.9763, 1);
INSERT INTO contient
VALUES (4, 3, 13.1106, 1);
INSERT INTO contient
VALUES (5, 223, 16.7694, 1);
INSERT INTO contient
VALUES (6, 9, 10.9763, 1);
INSERT INTO contient
VALUES (6, 10, 10.9763, 2);
INSERT INTO contient
VALUES (7, 4, 10.3665, 1);
INSERT INTO contient
VALUES (7, 140, 5.9455, 1);
INSERT INTO contient
VALUES (7, 147, 6.8602, 1);
INSERT INTO contient
VALUES (8, 7, 14.3302, 1);
INSERT INTO contient
VALUES (8, 9, 10.9763, 1);
INSERT INTO contient
VALUES (8, 235, 10.9763, 1);
INSERT INTO contient
VALUES (9, 56, 14.6351, 1);
INSERT INTO contient
VALUES (9, 65, 14.3302, 1);
INSERT INTO contient
VALUES (9, 295, 14.6351, 1);
INSERT INTO contient
VALUES (10, 258, 21.8002, 1);
INSERT INTO contient
VALUES (11, 14, 14.6351, 1);
INSERT INTO contient
VALUES (11, 188, 36.5878, 1);
INSERT INTO contient
VALUES (12, 225, 12.0435, 1);
INSERT INTO contient
VALUES (12, 277, 16.7694, 1);
INSERT INTO contient
VALUES (13, 21, 20.1233, 1);
INSERT INTO contient
VALUES (13, 128, 11.891, 1);
INSERT INTO contient
VALUES (13, 208, 20.4282, 1);
INSERT INTO contient
VALUES (14, 192, 12.1959, 1);
INSERT INTO contient
VALUES (15, 148, 6.8602, 2);
INSERT INTO contient
VALUES (16, 2, 12.5008, 1);
INSERT INTO contient
VALUES (16, 3, 13.1106, 1);
INSERT INTO contient
VALUES (17, 27, 14.0253, 1);
INSERT INTO contient
VALUES (17, 125, 14.6351, 1);
INSERT INTO contient
VALUES (18, 295, 14.6351, 1);
INSERT INTO contient
VALUES (19, 19, 15.2449, 1);
INSERT INTO contient
VALUES (19, 158, 13.4155, 1);
INSERT INTO contient
VALUES (20, 290, 12.5008, 1);
INSERT INTO contient
VALUES (21, 39, 15.2449, 1);
INSERT INTO contient
VALUES (21, 165, 14.6351, 1);
INSERT INTO contient
VALUES (22, 291, 10.6714, 1);
INSERT INTO contient
VALUES (22, 295, 14.6351, 1);
INSERT INTO contient
VALUES (23, 121, 13.4155, 1);
INSERT INTO contient
VALUES (23, 122, 11.891, 1);
INSERT INTO contient
VALUES (24, 42, 15.0925, 1);
INSERT INTO contient
VALUES (25, 44, 15.0925, 1);
INSERT INTO contient
VALUES (25, 52, 13.7204, 1);
INSERT INTO contient
VALUES (26, 111, 14.6351, 1);
INSERT INTO contient
VALUES (27, 6, 16.4645, 1);
INSERT INTO contient
VALUES (29, 103, 13.4155, 1);
INSERT INTO contient
VALUES (29, 125, 14.6351, 1);
INSERT INTO contient
VALUES (30, 15, 5.9455, 1);
INSERT INTO contient
VALUES (30, 22, 12.5008, 1);
INSERT INTO contient
VALUES (31, 10, 10.9763, 1);
INSERT INTO contient
VALUES (31, 253, 22.5625, 1);
INSERT INTO contient
VALUES (32, 18, 15.2449, 1);
INSERT INTO contient
VALUES (32, 45, 18.1414, 1);
INSERT INTO contient
VALUES (32, 287, 15.0925, 1);
INSERT INTO contient
VALUES (33, 115, 8.3847, 1);
INSERT INTO contient
VALUES (33, 116, 18.2939, 1);
INSERT INTO contient
VALUES (34, 6, 16.4645, 1);
INSERT INTO contient
VALUES (34, 11, 14.0253, 1);
INSERT INTO contient
VALUES (35, 12, 16.1596, 1);
INSERT INTO contient
VALUES (36, 274, 14.4827, 1);
INSERT INTO contient
VALUES (36, 300, 20.1233, 1);
INSERT INTO contient
VALUES (37, 84, 15.5498, 1);
INSERT INTO contient
VALUES (37, 87, 13.7204, 1);
INSERT INTO contient
VALUES (38, 153, 14.4827, 1);
INSERT INTO contient
VALUES (39, 121, 13.4155, 1);
INSERT INTO contient
VALUES (40, 98, 8.3847, 1);
INSERT INTO contient
VALUES (40, 166, 14.3302, 2);
INSERT INTO contient
VALUES (40, 193, 8.9945, 1);
INSERT INTO contient
VALUES (41, 16, 10.8239, 1);
INSERT INTO contient
VALUES (41, 171, 15.0925, 1);
INSERT INTO contient
VALUES (42, 7, 14.3302, 1);
INSERT INTO contient
VALUES (42, 133, 10.8239, 1);
INSERT INTO contient
VALUES (43, 78, 15.2449, 1);
INSERT INTO contient
VALUES (43, 285, 18.1414, 1);
INSERT INTO contient
VALUES (44, 43, 15.5498, 1);
INSERT INTO contient
VALUES (44, 161, 13.1106, 1);
INSERT INTO contient
VALUES (45, 46, 17.6841, 1);
INSERT INTO contient
VALUES (45, 115, 8.3847, 1);
INSERT INTO contient
VALUES (46, 19, 15.2449, 1);
INSERT INTO contient
VALUES (46, 27, 14.0253, 1);
INSERT INTO contient
VALUES (47, 34, 14.3302, 1);
INSERT INTO contient
VALUES (48, 100, 14.94, 1);
INSERT INTO contient
VALUES (49, 137, 13.7204, 1);
INSERT INTO contient
VALUES (49, 201, 13.1106, 1);
INSERT INTO contient
VALUES (50, 122, 11.891, 1);
INSERT INTO contient
VALUES (50, 234, 11.891, 1);
INSERT INTO contient
VALUES (52, 131, 11.5861, 1);
INSERT INTO contient
VALUES (52, 192, 12.1959, 1);
INSERT INTO contient
VALUES (53, 80, 19.0561, 1);
INSERT INTO contient
VALUES (53, 81, 19.0561, 1);
INSERT INTO contient
VALUES (54, 29, 17.5316, 1);
INSERT INTO contient
VALUES (55, 95, 13.7204, 1);
INSERT INTO contient
VALUES (55, 103, 13.4155, 1);
INSERT INTO contient
VALUES (56, 147, 6.8602, 1);
INSERT INTO contient
VALUES (56, 148, 6.8602, 1);
INSERT INTO contient
VALUES (57, 132, 11.891, 1);
INSERT INTO contient
VALUES (58, 2, 12.5008, 1);
INSERT INTO contient
VALUES (58, 25, 14.3302, 1);
INSERT INTO contient
VALUES (59, 110, 16.4645, 1);
INSERT INTO contient
VALUES (60, 29, 17.5316, 1);
INSERT INTO contient
VALUES (60, 178, 14.4827, 1);
INSERT INTO contient
VALUES (61, 286, 17.5316, 1);
INSERT INTO contient
VALUES (61, 290, 12.5008, 1);
INSERT INTO contient
VALUES (62, 14, 14.6351, 1);
INSERT INTO contient
VALUES (62, 17, 11.891, 1);
INSERT INTO contient
VALUES (62, 21, 20.1233, 1);
INSERT INTO contient
VALUES (63, 28, 11.5861, 1);
INSERT INTO contient
VALUES (63, 30, 11.891, 1);
INSERT INTO contient
VALUES (63, 32, 15.2449, 1);
INSERT INTO contient
VALUES (64, 76, 13.4155, 1);
INSERT INTO contient
VALUES (64, 117, 15.2449, 1);
INSERT INTO contient
VALUES (65, 78, 15.2449, 1);
INSERT INTO contient
VALUES (66, 104, 14.6351, 1);
INSERT INTO contient
VALUES (66, 127, 11.5861, 1);
INSERT INTO contient
VALUES (67, 229, 20.8855, 1);
INSERT INTO contient
VALUES (68, 8, 14.0253, 1);
INSERT INTO contient
VALUES (69, 152, 10.6714, 1);
INSERT INTO contient
VALUES (69, 177, 17.6841, 1);
INSERT INTO contient
VALUES (70, 246, 19.5135, 1);
INSERT INTO contient
VALUES (71, 5, 16.9218, 1);
INSERT INTO contient
VALUES (71, 294, 16.7694, 1);
INSERT INTO contient
VALUES (72, 30, 11.891, 1);
INSERT INTO contient
VALUES (73, 10, 10.9763, 1);
INSERT INTO contient
VALUES (73, 28, 11.5861, 1);
INSERT INTO contient
VALUES (74, 199, 14.0253, 1);
INSERT INTO contient
VALUES (75, 156, 11.5861, 1);
INSERT INTO contient
VALUES (76, 282, 19.5135, 1);
INSERT INTO contient
VALUES (77, 8, 14.0253, 1);
INSERT INTO contient
VALUES (77, 128, 11.891, 1);
INSERT INTO contient
VALUES (78, 236, 10.9763, 2);
INSERT INTO contient
VALUES (79, 151, 10.9763, 1);
INSERT INTO contient
VALUES (79, 159, 10.3665, 1);
INSERT INTO contient
VALUES (80, 244, 11.5861, 1);
INSERT INTO contient
VALUES (81, 192, 12.1959, 1);
INSERT INTO contient
VALUES (81, 273, 15.0925, 1);
INSERT INTO contient
VALUES (82, 101, 14.0253, 1);
INSERT INTO contient
VALUES (83, 86, 18.1414, 1);
INSERT INTO contient
VALUES (83, 194, 8.9945, 1);
INSERT INTO contient
VALUES (84, 61, 14.94, 1);
INSERT INTO contient
VALUES (84, 123, 13.4155, 1);
INSERT INTO contient
VALUES (85, 120, 14.4827, 1);
INSERT INTO contient
VALUES (85, 264, 12.8057, 1);
INSERT INTO contient
VALUES (86, 31, 11.891, 1);
INSERT INTO contient
VALUES (87, 292, 14.0253, 1);
INSERT INTO contient
VALUES (88, 105, 14.6351, 2);
INSERT INTO contient
VALUES (89, 96, 12.9582, 1);
INSERT INTO contient
VALUES (89, 163, 12.9582, 1);
INSERT INTO contient
VALUES (90, 118, 14.94, 1);
INSERT INTO contient
VALUES (90, 124, 15.2449, 1);
INSERT INTO contient
VALUES (91, 126, 14.6351, 1);
INSERT INTO contient
VALUES (91, 242, 18.1414, 1);
INSERT INTO contient
VALUES (92, 69, 15.5498, 1);
INSERT INTO contient
VALUES (93, 167, 14.3302, 1);
INSERT INTO contient
VALUES (94, 191, 19.8184, 2);
INSERT INTO contient
VALUES (94, 224, 19.5135, 1);
INSERT INTO contient
VALUES (95, 88, 13.7204, 1);
INSERT INTO contient
VALUES (96, 108, 10.6714, 1);
INSERT INTO contient
VALUES (96, 275, 12.1959, 1);
INSERT INTO contient
VALUES (97, 63, 13.7204, 1);
INSERT INTO contient
VALUES (98, 24, 13.7204, 1);
INSERT INTO contient
VALUES (99, 265, 12.8057, 1);
INSERT INTO contient
VALUES (99, 266, 12.8057, 1);
INSERT INTO contient
VALUES (100, 141, 5.9455, 1);
INSERT INTO contient
VALUES (100, 142, 5.9455, 1);
INSERT INTO contient
VALUES (100, 143, 5.9455, 1);
INSERT INTO contient
VALUES (100, 144, 6.8602, 1);
INSERT INTO contient
VALUES (100, 145, 6.8602, 1);
INSERT INTO contient
VALUES (101, 66, 14.6351, 1);
INSERT INTO contient
VALUES (101, 149, 6.8602, 1);
INSERT INTO contient
VALUES (102, 214, 11.891, 1);
INSERT INTO contient
VALUES (102, 289, 18.2939, 1);
INSERT INTO contient
VALUES (103, 71, 13.4155, 1);
INSERT INTO contient
VALUES (104, 106, 13.7204, 1);
INSERT INTO contient
VALUES (104, 107, 14.94, 1);
INSERT INTO contient
VALUES (105, 196, 19.5135, 1);
INSERT INTO contient
VALUES (106, 48, 16.4645, 1);
INSERT INTO contient
VALUES (107, 202, 13.1106, 1);
INSERT INTO contient
VALUES (107, 203, 25.6114, 1);
INSERT INTO contient
VALUES (108, 90, 13.7204, 1);
INSERT INTO contient
VALUES (108, 160, 14.4827, 1);
INSERT INTO contient
VALUES (109, 113, 14.0253, 1);
INSERT INTO contient
VALUES (109, 247, 16.7694, 1);
INSERT INTO contient
VALUES (110, 64, 14.6351, 1);
INSERT INTO contient
VALUES (111, 184, 17.6841, 1);
INSERT INTO contient
VALUES (112, 99, 16.1596, 1);
INSERT INTO contient
VALUES (112, 138, 5.9455, 1);
INSERT INTO contient
VALUES (113, 119, 17.0743, 1);
INSERT INTO contient
VALUES (113, 261, 19.5135, 1);
INSERT INTO contient
VALUES (114, 189, 20.1233, 1);
INSERT INTO contient
VALUES (114, 249, 11.2812, 1);
INSERT INTO contient
VALUES (115, 59, 10.3665, 1);
INSERT INTO contient
VALUES (115, 74, 14.94, 1);
INSERT INTO contient
VALUES (115, 91, 13.2631, 1);
INSERT INTO contient
VALUES (116, 49, 18.2939, 1);
INSERT INTO contient
VALUES (117, 268, 12.8057, 1);
INSERT INTO contient
VALUES (117, 280, 23.782, 1);
INSERT INTO contient
VALUES (118, 181, 24.0869, 1);
INSERT INTO contient
VALUES (119, 75, 12.5008, 1);
INSERT INTO contient
VALUES (119, 79, 16.1596, 1);
INSERT INTO contient
VALUES (120, 83, 17.0743, 1);
INSERT INTO contient
VALUES (121, 227, 22.5625, 1);
INSERT INTO contient
VALUES (121, 241, 14.3302, 1);
INSERT INTO contient
VALUES (122, 209, 22.5625, 1);
INSERT INTO contient
VALUES (123, 114, 13.568, 1);
INSERT INTO contient
VALUES (124, 195, 16.7694, 1);
INSERT INTO contient
VALUES (124, 263, 21.9527, 1);
INSERT INTO contient
VALUES (125, 178, 14.4827, 1);
INSERT INTO contient
VALUES (125, 179, 16.4645, 1);
INSERT INTO contient
VALUES (125, 243, 9.6043, 1);
INSERT INTO contient
VALUES (126, 62, 13.7204, 1);
INSERT INTO contient
VALUES (126, 85, 14.6351, 1);
INSERT INTO contient
VALUES (127, 119, 17.0743, 1);
INSERT INTO contient
VALUES (127, 194, 8.9945, 1);
INSERT INTO contient
VALUES (128, 173, 25.6114, 1);
INSERT INTO contient
VALUES (129, 72, 13.4155, 1);
INSERT INTO contient
VALUES (129, 93, 13.2631, 1);
INSERT INTO contient
VALUES (130, 145, 6.8602, 1);
INSERT INTO contient
VALUES (130, 238, 14.0253, 1);
INSERT INTO contient
VALUES (131, 60, 13.4155, 1);
INSERT INTO contient
VALUES (131, 162, 15.8547, 1);
INSERT INTO contient
VALUES (132, 139, 5.9455, 1);
INSERT INTO contient
VALUES (132, 240, 15.2449, 1);
INSERT INTO contient
VALUES (133, 102, 14.0253, 1);
INSERT INTO contient
VALUES (133, 139, 5.9455, 1);
INSERT INTO contient
VALUES (134, 97, 14.4827, 1);
INSERT INTO contient
VALUES (134, 228, 23.782, 1);
INSERT INTO contient
VALUES (135, 155, 14.0253, 1);
INSERT INTO contient
VALUES (135, 157, 12.8057, 1);
INSERT INTO contient
VALUES (136, 63, 13.7204, 1);
INSERT INTO contient
VALUES (136, 186, 21.3429, 1);
INSERT INTO contient
VALUES (137, 16, 10.8239, 1);
INSERT INTO contient
VALUES (137, 254, 13.1106, 1);
INSERT INTO contient
VALUES (138, 53, 13.4155, 1);
INSERT INTO contient
VALUES (138, 237, 24.3918, 1);
INSERT INTO contient
VALUES (139, 16, 10.8239, 1);
INSERT INTO contient
VALUES (139, 36, 8.3847, 1);
INSERT INTO contient
VALUES (140, 16, 10.8239, 1);
INSERT INTO contient
VALUES (140, 50, 17.0743, 1);
INSERT INTO contient
VALUES (140, 175, 27.4408, 1);
INSERT INTO contient
VALUES (141, 262, 24.3918, 1);
INSERT INTO contient
VALUES (142, 174, 14.94, 1);
INSERT INTO contient
VALUES (142, 220, 23.782, 1);
INSERT INTO contient
VALUES (142, 239, 12.1959, 1);
INSERT INTO contient
VALUES (143, 198, 14.0253, 1);
INSERT INTO contient
VALUES (143, 233, 19.5135, 1);
INSERT INTO contient
VALUES (144, 16, 10.8239, 1);
INSERT INTO contient
VALUES (145, 75, 12.5008, 1);
INSERT INTO contient
VALUES (145, 217, 11.891, 1);
INSERT INTO contient
VALUES (146, 136, 14.3302, 1);
INSERT INTO contient
VALUES (146, 245, 11.891, 1);
INSERT INTO contient
VALUES (147, 16, 10.8239, 1);
INSERT INTO contient
VALUES (147, 121, 13.4155, 1);
INSERT INTO contient
VALUES (148, 35, 14.6351, 1);
INSERT INTO contient
VALUES (148, 211, 19.5135, 1);
INSERT INTO contient
VALUES (149, 12, 16.1596, 1);
INSERT INTO contient
VALUES (149, 206, 20.7331, 1);
INSERT INTO contient
VALUES (150, 78, 15.2449, 1);
INSERT INTO contient
VALUES (150, 130, 15.0925, 1);
INSERT INTO contient
VALUES (151, 5, 16.9218, 1);
INSERT INTO contient
VALUES (151, 16, 10.8239, 1);
INSERT INTO contient
VALUES (152, 6, 16.4645, 1);
INSERT INTO contient
VALUES (152, 180, 21.3429, 1);
INSERT INTO contient
VALUES (153, 16, 10.8239, 1);
INSERT INTO contient
VALUES (153, 66, 14.6351, 1);
INSERT INTO contient
VALUES (154, 169, 13.7204, 1);
INSERT INTO contient
VALUES (154, 215, 11.891, 1);
INSERT INTO contient
VALUES (155, 57, 11.891, 2);
INSERT INTO contient
VALUES (155, 94, 13.7204, 1);
INSERT INTO contient
VALUES (155, 256, 23.9345, 1);
INSERT INTO contient
VALUES (156, 4, 10.3665, 1);
INSERT INTO contient
VALUES (156, 13, 14.94, 1);
INSERT INTO contient
VALUES (157, 3, 13.1106, 1);
INSERT INTO contient
VALUES (157, 162, 15.8547, 1);
INSERT INTO contient
VALUES (158, 16, 10.8239, 1);
INSERT INTO contient
VALUES (158, 94, 13.7204, 1);
INSERT INTO contient
VALUES (159, 220, 23.782, 1);
INSERT INTO contient
VALUES (160, 38, 15.2449, 1);
INSERT INTO contient
VALUES (160, 76, 13.4155, 1);
INSERT INTO contient
VALUES (161, 151, 10.9763, 3);
INSERT INTO contient
VALUES (162, 128, 11.891, 1);
INSERT INTO contient
VALUES (163, 185, 25.6114, 1);
INSERT INTO contient
VALUES (163, 277, 16.7694, 1);
INSERT INTO contient
VALUES (164, 95, 13.7204, 1);
INSERT INTO contient
VALUES (164, 153, 14.4827, 1);
INSERT INTO contient
VALUES (165, 10, 10.9763, 1);
INSERT INTO contient
VALUES (165, 53, 13.4155, 1);
INSERT INTO contient
VALUES (166, 3, 13.1106, 1);
INSERT INTO contient
VALUES (167, 235, 10.9763, 1);
INSERT INTO contient
VALUES (168, 192, 12.1959, 1);
INSERT INTO contient
VALUES (168, 225, 12.0435, 1);
INSERT INTO contient
VALUES (169, 147, 6.8602, 1);
INSERT INTO contient
VALUES (170, 125, 14.6351, 1);
INSERT INTO contient
VALUES (171, 244, 11.5861, 1);
INSERT INTO contient
VALUES (172, 192, 12.1959, 1);
INSERT INTO contient
VALUES (172, 236, 10.9763, 1);
INSERT INTO contient
VALUES (173, 212, 12.5008, 1);
INSERT INTO contient
VALUES (174, 120, 14.4827, 1);
INSERT INTO contient
VALUES (175, 31, 11.891, 1);
INSERT INTO contient
VALUES (176, 146, 6.8602, 1);
INSERT INTO contient
VALUES (176, 244, 11.5861, 1);
INSERT INTO contient
VALUES (177, 27, 14.0253, 1);
INSERT INTO contient
VALUES (177, 294, 16.7694, 1);
INSERT INTO contient
VALUES (178, 49, 18.2939, 1);
INSERT INTO contient
VALUES (178, 119, 17.0743, 1);
INSERT INTO contient
VALUES (179, 90, 13.7204, 1);
INSERT INTO contient
VALUES (179, 166, 14.3302, 1);
INSERT INTO contient
VALUES (180, 300, 20.1233, 1);
INSERT INTO contient
VALUES (181, 285, 18.1414, 1);
INSERT INTO contient
VALUES (182, 84, 15.5498, 1);
INSERT INTO contient
VALUES (183, 16, 10.8239, 1);
INSERT INTO contient
VALUES (183, 44, 15.0925, 1);
INSERT INTO contient
VALUES (183, 46, 17.6841, 1);
INSERT INTO contient
VALUES (184, 166, 14.3302, 1);
INSERT INTO contient
VALUES (185, 43, 15.5498, 1);
INSERT INTO contient
VALUES (186, 15, 5.9455, 1);
INSERT INTO contient
VALUES (186, 107, 14.94, 1);
INSERT INTO contient
VALUES (187, 125, 14.6351, 1);
INSERT INTO contient
VALUES (188, 44, 15.0925, 1);
INSERT INTO contient
VALUES (189, 12, 16.1596, 1);
INSERT INTO contient
VALUES (189, 44, 15.0925, 1);
INSERT INTO contient
VALUES (190, 14, 14.6351, 1);
INSERT INTO contient
VALUES (190, 28, 11.5861, 1);
INSERT INTO contient
VALUES (191, 157, 12.8057, 1);
INSERT INTO contient
VALUES (191, 176, 24.3918, 1);
INSERT INTO contient
VALUES (192, 17, 11.891, 1);
INSERT INTO contient
VALUES (192, 94, 13.7204, 1);
INSERT INTO contient
VALUES (193, 92, 13.2631, 1);
INSERT INTO contient
VALUES (193, 210, 12.5008, 1);
INSERT INTO contient
VALUES (194, 29, 17.5316, 1);
INSERT INTO contient
VALUES (195, 80, 19.0561, 1);
INSERT INTO contient
VALUES (195, 81, 19.0561, 1);
INSERT INTO contient
VALUES (195, 103, 13.4155, 1);
INSERT INTO contient
VALUES (196, 16, 10.8239, 1);
INSERT INTO contient
VALUES (196, 125, 14.6351, 1);
INSERT INTO contient
VALUES (197, 109, 15.2449, 1);
INSERT INTO contient
VALUES (197, 112, 14.94, 1);
INSERT INTO contient
VALUES (198, 62, 13.7204, 1);
INSERT INTO contient
VALUES (198, 148, 6.8602, 1);
INSERT INTO contient
VALUES (199, 73, 14.94, 1);
INSERT INTO contient
VALUES (199, 135, 10.8239, 1);
INSERT INTO contient
VALUES (200, 16, 10.8239, 1);
INSERT INTO contient
VALUES (200, 59, 10.3665, 1);
INSERT INTO contient
VALUES (201, 273, 15.0925, 1);
INSERT INTO contient
VALUES (202, 52, 13.7204, 1);
INSERT INTO contient
VALUES (202, 121, 13.4155, 1);
INSERT INTO contient
VALUES (203, 15, 5.9455, 1);
INSERT INTO contient
VALUES (203, 22, 12.5008, 1);
INSERT INTO contient
VALUES (204, 115, 8.3847, 1);
INSERT INTO contient
VALUES (205, 252, 13.1106, 1);
INSERT INTO contient
VALUES (205, 253, 22.5625, 1);
INSERT INTO contient
VALUES (206, 43, 15.5498, 1);
INSERT INTO contient
VALUES (207, 42, 15.0925, 1);
INSERT INTO contient
VALUES (208, 24, 13.7204, 1);
INSERT INTO contient
VALUES (208, 233, 19.5135, 1);
INSERT INTO contient
VALUES (211, 7, 14.3302, 1);
INSERT INTO contient
VALUES (211, 217, 11.891, 1);
INSERT INTO contient
VALUES (220, 5, 16.9218, 1);
INSERT INTO contient
VALUES (220, 201, 13.1106, 1);

--Requetes SQL
--1
SELECT livre.numlivre, titre FROM LIVRE
    INNER JOIN CONTIENT
        ON LIVRE.numLivre = CONTIENT.numLivre
    INNER JOIN COMMANDE
        ON commande.numCom = contient.numCom
    WHERE to_char(datecom, 'YYYY') = 2018
    GROUP BY livre.numLivre, livre.titre
    HAVING SUM(contient.qte) =
                (SELECT MAX(SUM(contient.qte)) FROM LIVRE
                    INNER JOIN CONTIENT
                        ON LIVRE.numLivre = CONTIENT.numLivre
                    INNER JOIN COMMANDE
                        ON commande.numCom = contient.numCom
                    WHERE to_char(datecom, 'YYYY') = 2018
                    GROUP BY LIVRE.numLivre
                );

/* Résultat : La maison du guet*/

--2
select count(numlivre), libelleCat
FROM LIVRE
    INNER JOIN categorie ON livre.codeCat = categorie.CODECAT
GROUP BY libelleCat;
/*
21,Evasion Tourisme
6,Psychologie
11,Cuisine Forme Santé
14,Bande dessinée
7,Santé
86,Littérature
9,Art
4,Humour
29,Suspense
23,Histoire
19,Vie pratique
15,Témoignages
20,Encyclopédies
14,Loisirs Plein air
12,Arts divinatoires
*/

--3
select nom, prenom, sum(qte * prixvente) as "Montant des commandes en 2019"
FROM contient
    INNER JOIN COMMANDE on contient.numCom = COMMANDE.NUMCOM
    INNER JOIN client on commande.codeCli = client.codeCli
WHERE to_char(dateCom, 'YYYY') = 2019
group by nom, prenom;
/*
 sabadel,Emile,30.8
pascot,Sophie,14.33
zebiri,Agathe,20.89
dinelli,Ferdinand,14.64
derlon,Stéphane,17.53
opocci,Henri,25.76
IACono,Hermann,33.23
mnach,Anne,14.48
FONTAINE,Claire,51.54
opillard,Marthe,20.58
cognets,Delphine,18.45
swiderski,Guillaume,35.36
gravaud,Hugues,15.55
moiroux,Judith,11.89
peulon,Firmin,43.59
dasci,Richard,15.09
de massol,Hélène,25.61
tertre,Alex,18.45
tinguy,Alexandre,8.38
aime,Anne,10.98
ICIbo,Angèle,11.59
javaudin,Aude,23.18
enet,Eugénie,18.14
OFARIN,Annick,25.46
onillon,Anne,30.18
terrone,Alain,27.14
AROn,Olive,15.09
IKASSION,Patricia,14.64
sahan,Christophe,28.05
deschamp,Ella,31.25
dejoux,Odette,37.2
RENAUD,Fançoise,21.19
tachet,Béranger,15.09
bosseau,Edmond,54.43
aboville,Elisabeth,13.11
depernet,Denis,25.76
tourtelier,Marc,35.67
touroux,Emma,15.55
BONNEAU,Philippe,24.24
malard,Mélanie,6.86
mathelier,Elodie,38.72
sandron,Théodore,20.12
eprinchard,Estelle,15.55
decemme,Benoît,26.23
 */

--4
SELECT DISTINCT CLIENT.nom, client.prenom, count(numcom) FROM CLIENT
    INNER JOIN COMMANDE
        ON commande.codeCli = commande.codeCli
    WHERE TO_CHAR(datecom, 'YYYY') = 2018
    GROUP BY commande.codeCli, client.prenom, client.nom
    HAVING count(*) > 10;
/*
 N'affiche rien car personne n'a passé plus de 10 commandes le maximum étant 6
 */

 --Q5
SELECT DISTINCT trunc(AVG(CONTIENT.qte), 1) as moyenne, MAX(CONTIENT.qte) as maximum FROM CONTIENT
    INNER JOIN COMMANDE
        ON CONTIENT.numCom = commande.numCom
    WHERE TO_CHAR(COMMANDE.dateCom, 'YYYY') = '2018';
/*
1,3
*/

select numVendeur, count(*) from commande group by numVendeur;

--Q6
SELECT VENDEUR.nomVendeur, count(*) FROM VENDEUR
    INNER JOIN COMMANDE
        ON COMMANDE.numVendeur = VENDEUR.numVendeur
    GROUP BY VENDEUR.nomVendeur
    HAVING count(*) = (
                SELECT MAX(COUNT(*)) FROM VENDEUR
            INNER JOIN COMMANDE
                ON COMMANDE.numVendeur = VENDEUR.numVendeur
            GROUP BY VENDEUR.nomVendeur
        );
/*
 Andre,71
 */

--Q7
SELECT nom, prenom
FROM client
WHERE codepostal LIKE '17%';
/*
 decemme,Benoît
dinelli,Ferdinand
enet,Eugénie
eprinchard,Estelle
moisan,Edith
PAON,Frédéric
 */

--Q8
SELECT count(*), substr(codepostal, 0, 2) as "Code"
FROM client
GROUP BY substr(codepostal, 0, 2)
ORDER BY substr(codepostal, 0, 2);

--Q9
SELECT count(*), libelleCat
FROM CATEGORIE
    INNER JOIN livre on categorie.codeCat = livre.codeCat
    INNER JOIN contient on livre.numLivre = contient.numLivre
group by libelleCat
HAVING count(*) >= ALL(SELECT max(count(*))
                        FROM CATEGORIE
                            INNER JOIN livre on categorie.codeCat = livre.codeCat
                            INNER JOIN contient on livre.numLivre = contient.numLivre
                        GROUP BY libelleCat);
/*
126,Littérature
 */

--Q11
SELECT concat(to_char(dateCom, 'MONTH /'), to_char(dateCom, ' YYYY')),nomVendeur, count(*)
FROM vendeur
    INNER JOIN COMMANDE on vendeur.numVendeur = commande.NUMVENDEUR
    INNER JOIN CONTIENT on commande.numCom = contient.NUMCOM
group by dateCom, nomVendeur
order by dateCom;

select C2.numCom
FROM vendeur
inner join COMMANDE C2 on vendeur.numVendeur = C2.NUMVENDEUR
inner join contient c3 on C2.numCom = c3.numCom
where nomVendeur = 'Andre'
group by C2.numCom;

select sum(qte)
FROM vendeur
inner join COMMANDE C2 on vendeur.numVendeur = C2.NUMVENDEUR
inner join contient c3 on C2.numCom = c3.numCom
where nomVendeur = 'Andre';

--Q12
SELECT libellep, sum (qte * contient.prixVente)
FROM contient
    INNER JOIN commande on commande.numCom = contient.numCom
    INNER JOIN paiement p on commande.modeP = p.modeP
GROUP BY libelleP;
/*
 Chèque bancaire,2900.79
Chèque postal,1231.98
Carte bancaire,1138.65
 */

--Q13
SELECT nom
FROM client
    INNER JOIN commande c2 on client.codeCli = c2.codeCli
    INNER JOIN paiement p on c2.modeP = p.modeP
WHERE libelleP = 'Chèque bancaire'
INTERSECT
SELECT nom
FROM client
    INNER JOIN commande c2 on client.codeCli = c2.codeCli
    INNER JOIN paiement p on c2.modeP = p.modeP
WHERE libelleP != 'Chèque bancaire';
/*
 Résultat : 15 lignes
 */

--Q14
SELECT client.codeCli
FROM CLIENT
    INNER JOIN commande c2 on client.codeCli = c2.codeCli
    INNER JOIN paiement p on c2.modeP = p.modeP
WHERE libelleP = 'Carte bancaire'
INTERSECT
SELECT client.codeCli
FROM CLIENT
    INNER JOIN commande c2 on client.codeCli = c2.codeCli
    INNER JOIN paiement p on c2.modeP = p.modeP
WHERE libelleP = 'Chèque bancaire'
INTERSECT
SELECT client.codeCli
FROM CLIENT
    INNER JOIN commande c2 on client.codeCli = c2.codeCli
    INNER JOIN paiement p on c2.modeP = p.modeP
WHERE libelleP = 'Chèque postal'
INTERSECT
SELECT client.codeCli
FROM CLIENT
    INNER JOIN commande c2 on client.codeCli = c2.codeCli
    INNER JOIN paiement p on c2.modeP = p.modeP
WHERE libelleP = 'Espèce'
INTERSECT
SELECT client.codeCli
FROM CLIENT
    INNER JOIN commande c2 on client.codeCli = c2.codeCli
    INNER JOIN paiement p on c2.modeP = p.modeP
WHERE libelleP = 'Mandat-lettre';
/*
 Aucune ligne, personne n'a utilisé tout les moyens en paiement (0 mandat-lettre)
 */

--Q15
SELECT client.nom FROM CLIENT
    INNER JOIN commande CMD1
        ON CMD1.codeCli = client.codeCli
    INNER JOIN commande CMD2
        ON CMD2.codeCli = client.codeCli

    INNER JOIN CONTIENT CT1
        ON CT1.numCom = CMD1.numCom
    INNER JOIN CONTIENT CT2
        ON CT2.numCom = CMD2.numCom

    INNER JOIN LIVRE L1
        ON L1.numLivre = CT1.numLivre
    INNER JOIN LIVRE L2
        ON L2.numLivre = CT2.numLivre

    INNER JOIN CATEGORIE C1
        ON C1.codeCat = L1.codeCat
    INNER JOIN CATEGORIE C2
        ON C2.codeCat = L2.codeCat

    where C1.libelleCat = 'Histoire'
        AND C2.libelleCat = 'Littérature'
    GROUP BY client.nom;
/*
 Résultat 15 lignes
 */

--Q16
SELECT nomVendeur
FROM vendeur
    INNER JOIN commande c2 on vendeur.numVendeur = c2.numVendeur
    INNER JOIN contient c3 on c2.numCom = c3.numCom
    INNER JOIN livre l on c3.numLivre = l.numLivre
MINUS
SELECT nomVendeur
FROM vendeur
    INNER JOIN commande c2 on vendeur.numVendeur = c2.numVendeur
    INNER JOIN contient c3 on c2.numCom = c3.numCom
    INNER JOIN livre l on c3.numLivre = l.numLivre
WHERE codeCat = 'BD';
/*
 Aucune ligne, tous les vendeurs ont vendu au moins une BD
 */

--Q17

--Q18
SELECT LIVRE.TITRE, SUM(CONTIENT.qte) FROM LIVRE
    INNER JOIN CONTIENT
        ON CONTIENT.numLivre = LIVRE.numLivre
    WHERE livre.TITRE LIKE 'Tintin%' OR
          livre.TITRE LIKE 'Lucky Luke%'
    group by LIVRE.TITRE
    ORDER BY LIVRE.TITRE;
/*
 Résultat 13 lignes
 */

--Q19
SELECT NVL(AUTEUR, 'sans auteur'), COUNT(*) FROM LIVRE
    GROUP BY AUTEUR;
/*
 Résultat 181 lignes
 */


--Q20
SELECT VENDEUR.nomVendeur FROM VENDEUR
    INNER JOIN COMMANDE
        ON commande.numVendeur = VENDEUR.numVendeur
    GROUP BY VENDEUR.nomVendeur
    ORDER BY COUNT(DISTINCT commande.dateCom) DESC
    OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;
/*
 Résultat : Andre
 */

 --Q21
SELECT titre, auteur
FROM livre
WHERE codeCat = (SELECT codeCat
                    FROM livre
                    WHERE titre = 'La maison du guet')
MINUS
SELECT titre, auteur
FROM livre
WHERE auteur = (SELECT auteur
                FROM livre
                where titre = 'La maison du guet');
/*
 Résultat 21 lignes
 */











