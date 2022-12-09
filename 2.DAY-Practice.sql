create table ogrenciler(
OgrenciNo char(6),
Isim varchar(30),
Soyisim varchar(30),
Fakulte varchar(30),
Gano real
);

create table mezunlar
as select Isim,Soyisim,Fakulte
from ogrenciler;

INSERT INTO ogrenciler VALUES('123456','Sercan','ÜST','Hukuk',3.25);
INSERT INTO ogrenciler VALUES('654321','Ali','DOĞAN','Fen Edebiyat',3.03);
INSERT INTO ogrenciler VALUES('564213','Ahmet','AS','Tıp',3.14);

select * from ogrenciler;

INSERT INTO mezunlar VALUES ('Abdullah','KUL','Ziraat Mühendisliği');
INSERT INTO mezunlar(Isim,Soyisim) VALUES('Murat','TUR');

SELECT * FROM mezunlar;

select isim from mezunlar;
select gano from ogrenciler;

create table calisanlar(
calisan_ıd char(3) PRIMARY KEY,
isim varchar(25) NOT NULL,
soyisim varchar(25)UNIQUE,
maas int CHECK(maas>7500),
yaş int
)

create table emekliler(
emekli_id char(3),
isim varchar(25),
soyisim varchar(25),
	FOREIGN KEY (emekli_id) REFERENCES calisanlar(calisan_ıd)
);

INSERT INTO calisanlar VALUES('123','Ali','AL',7750,42);
INSERT INTO calisanlar VALUES('124','Ahmet','AS',8500,48);
INSERT INTO calisanlar VALUES('125','Abdullah','AR',9750,50);

INSERT INTO calisanlar VALUES('126','','AT',9770,51);
INSERT INTO calisanlar VALUES('127','','AZ',9750,50);

INSERT INTO calisanlar VALUES('128','Mustafa','AF',9750,50);
INSERT INTO calisanlar VALUES('129','Veli','AY',7501,25);



SELECT * FROM calisanlar;
SELECT * FROM emekliler;

INSERT INTO emekliler VALUES ('129','Murat','KA');
INSERT INTO emekliler VALUES ('128','Adil','TAK');

CREATE TABLE bilgisayarlar(
id_no char(6),
marka varchar(15),
fiyat real
);

INSERT INTO bilgisayarlar VALUES('123456','MONSTER',18500);
INSERT INTO bilgisayarlar VALUES('123457','CASPER',16500);
INSERT INTO bilgisayarlar VALUES('123458','ASUS',14500);
INSERT INTO bilgisayarlar VALUES('123459','LENOVO',17500);

SELECT * FROM bilgisayarlar;

SELECT id_no FROM bilgisayarlar WHERE fiyat>17000;


DELETE FROM bilgisayarlar WHERE fiyat>18000 and id_no='123456';

delete from bilgisayarlar;


