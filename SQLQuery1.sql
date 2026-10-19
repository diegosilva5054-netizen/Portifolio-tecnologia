CREATE DATABASE INTERVIAS_MIRACATIBA

/* COLUNA;
ID CARRO;
NUMERO CARRO;
CHASSI;
KM TOTAL;
ID VIAGEM;
DESTINO;
HORAIRIO SAIDA;
VALOR PASSAGEM;
QTD PASSAGEIROS.*/

CREATE TABLE [TABELA CARRO](

Id_carro INT PRIMARY KEY NOT NULL,
Numero_carro VARCHAR (10) NOT NULL,
Chassi VARCHAR (30) UNIQUE,
Km_total INT NULL

);

CREATE TABLE [TABELA VIAGEM](

Id_viagem INT IDENTITY (1,1) PRIMARY KEY,
Id_carro INT NOT NULL,
Destino VARCHAR (50) NULL,
Horario_saida TIME NOT NULL,
Valor_passagem DECIMAL (5,2) NOT NULL,
Qtd_passageiro INT,
Numero_carro VARCHAR (10) NOT NULL,
CONSTRAINT FK_Viagem_Carro
FOREIGN KEY (id_carro) REFERENCES Tabela_Carro (id_carro)

);

INSERT INTO [TABELA CARRO] (Id_carro, Numero_carro, Chassi, Km_total)

VALUES
(513,'950','9BWZZZ377VT004251',480513),
(513,'951','8ABALDH54DI3MF9U7',413574),
(513,'952','P8A45EV11FS6RDKJH',462821),
(513,'953','AOQJD5779EJV13F5C',41579256),
(513,'954','KSO5136WUR577DDFH',74135985),
(513,'958','NCD516YFJGN5426FG',41657265),
(513,'1069','NJSHD2556S1FF125D',91545557),
(513,'1070','SHDU5798431XJDC79',47987569),
(239,'1071','JD5FE9536DEHDU98D',78984265),
(239,'1072','SJD264RF26G5D3D1G',78495462),
(239,'1073','SHD71000E2262C626',00215075),
(239,'1074','QOPÇMJSHDE21562SD',01203046),
(239,'1075','KHSOW546S2D56W365',74986320),
(239,'1186','LJSUE87953Q25E4T5',71649536),
(239,'1187','WOEKRPIEU5415515S',98436215),
(239,'1188','766522Q65S2D1R56F',00210329),
(239,'1189','00316QIEHBCM2Z1X5',70031550),
(001,'1190','46AZBXMQUTY515D21',00032015),
(001,'1191','OWDHEBF2164E12FG1',02140325),
(001,'1192','QOWDH213CZZZ36551',00217779),
(001,'1193','PPP5125ZZ65AA1A2S',77846585),
(001,'1194','PO825AJSBHX5261A6',0054756),
(001,'1195','WOJEDN221562A5A5A',1125460),
(001,'1196','APQKS15246KAMNSHX',7652435),
(001,'1197','QQJWBSH1545214A21',0142562),
(484,'1198','LQNS25464AJH54265',00321552),
(484,'1199','PQLSJHDE45232FFF3',77844445),
(484,'1200','OQU545SS6D8FF12RR',89210023),
(484,'1201','LLL366O6O6O5II5I5',63251000),
(484,'1202','PQQ55266E5RR8R22F',98265623),
(551,'1203','POEJF5265YYY6255U',36598400),
(551,'1204','OQKHD895D62F562SS',00003361);

INSERT INTO [TABELA VIAGEM] (Id_carro, Destino, Horario_saida, Valor_passagem, Qtd_passageiro, Numero_carro)

VALUES

(513,'Jardim das oliveira x Capão redondo','03:10',5.20,1200,'950'),
(513,'Jardim das oliveira x Capão redondo','03:20',5.20,1000,'951'),
(513,'Jardim das oliveira x Capão redondo','03:30',5.20,700,'952'),
(513,'Jardim das oliveira x Capão redondo','03:40',5.20,1150,'953'),
(513,'Jardim das oliveira x Capão redondo','03:50',5.20,900,'954'),
(513,'Jardim das oliveira x Capão redondo','04:00',5.20,1050,'958'),
(513,'Jardim das oliveira x Capão redondo','04:10',5.20,1090,'1069'),
(513,'Jardim das oliveira x Capão redondo','04:20',5.20,780,'1070'),
(513,'Jardim das oliveira x Capão redondo','04:30',5.20,1030,'1071'),
(239,'Jardim são marcos x Cotia','03:00',6.70,3120,'1072'),
(239,'Jardim são marcos x Cotia','03:10',6.70,3100,'1073'),
(239,'Jardim são marcos x Cotia','03:20',6.70,3020,'1074'),
(239,'Jardim são marcos x Cotia','03:30',6.70,3320,'1075'),
(239,'Jardim são marcos x Cotia','03:40',6.70,3310,'1186'),
(239,'Jardim são marcos x Cotia','03:50',6.70,3220,'1187'),
(239,'Jardim são marcos x Cotia','04:00',6.70,3150,'1188'),
(239,'Jardim são marcos x Cotia','04:10',6.70,3950,'1189'),
(239,'Jardim são marcos x Cotia','04:20',6.70,3650,'1190'),
(001,'Parque paraiso x capão redondo','03:00',5.20,1400,'1191'),
(001,'Parque paraiso x capão redondo','03:10',5.20,1590,'1192'),
(001,'Parque paraiso x capão redondo','03:20',5.20,1460,'1193'),
(001,'Parque paraiso x capão redondo','03:30',5.20,1309,'1194'),
(001,'Parque paraiso x capão redondo','03:40',5.20,1203,'1195'),
(001,'Parque paraiso x capão redondo','03:50',5.20,1403,'1196'),
(001,'Parque paraiso x capão redondo','04:00',5.20,1422,'1197'),
(001,'Parque paraiso x capão redondo','04:10',5.20,1022,'1198'),
(484,'Jardim da luz x capão redondo','03:00',5.20,1000,'1199'),
(484,'Jardim da luz x capão redondo','03:10',5.20,1006,'1200'),
(484,'Jardim da luz x capão redondo','03:20',5.20,1040,'1201'),
(484,'Jardim da luz x capão redondo','03:30',5.20,1100,'1202'),
(484,'Jardim da luz x capão redondo','03:40',5.20,1007,'1203'),
(551,'Jardim vista alegre x capão redondo','03:00',5.20,2100,'1204');
