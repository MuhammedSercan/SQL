--DDL --DATA DEFINATION LANGUAGE
--CREATE --TABLO OLUŞTURMA
CREATE TABLE ogrenciler
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,--Ondalıklı sayılar için kullanılır(Double gibi)
kayit_tarih date
)

--VAROLAN TABLODAN YENİ TABLO OLUŞTURMA
create table ogrenci_notlari
as select isim,soyisim,not_ort
From ogrenciler;

--DML -DATA MANIPULATION LANGUAGE
--INSERT (Database'e veri ekleme)

INSERT INTO ogrenciler Values ('1234567','Ali','AL',85.5,'2022-12-1');
INSERT INTO ogrenciler Values ('1234567','Ali','AL',85.5,now());

--BIR TABLOYA PARÇALI VERİ EKLEMEK İSTERSEK

INSERT INTO ogrenciler(isim,soyisim)VALUES('Sercan','ÜST');

--DQL - DATA QUERY LANG.
-- SELECT

select * FROM ogrenciler;
select isim from ogrenciler;

--Constraint
--UNIQEU

CREATE TABLE ogrenciler5
(
ogrenci_no char(7) UNIQUE,
isim varchar(20) not null,
soyisim varchar(25),
not_ort real,
kayit_tarih date
)

select *from ogrenciler5


INSERT INTO ogrenciler5 VALUES('1234567','Ali','VELİ',88.8,'2020-10-10');
select *from ogrenciler5;

INSERT INTO ogrenciler5 VALUES('1234567','Ahmet','HASSAN',88.8,'2020-10-10');--UNIQUE OLDUĞUNDAN HATA VERDİ
select *from ogrenciler5;

INSERT INTO ogrenciler5 (ogrenci_no,soyisim,not_ort)VALUES('1234564','EVREN',87.8);--NOT NULL OLDUĞUNDAN HATA VERİR

--PRIMARY KEY ATAMASI

CREATE TABLE ogrenciler6
(
ogrenci_no char(7) PRIMARY KEY,
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayit_tarih date
)

--PRIMARY KEY ATAMASI 2.YOL

CREATE TABLE ogrenciler7
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayit_tarih date,
	CONSTRAINT ogr PRIMARY KEY(ogrenci_no)
)
--Practice 4:
--“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun ve
--“tedarikci_id” yi Primary Key yapin.
--“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
--“tedarikci_id” yi Foreign Key yapin.

CREATE TABLE tedarikciler3(
tedarikci_id char(5) PRIMARY KEY,
tedarikci_ismi varchar(25),
iletisim_isim varchar(25)
)

CREATE TABLE urunler(
tedarikci_id char(5),
urun_id char(5),
FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
)

select * from tedarikciler3;

/*“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama” field’lari olsun. 
“id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, 
“sokak”, “cadde” ve “sehir” fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.
*/

create table calisanlar(
id char(5)PRIMARY KEY,
isim varchar(20)UNIQUE,
maas int NOT NULL,
ise_baslama date
)

create table adresler(
adres_id char(5),
sokak varchar(20),
cadde varchar(20),
sehir varchar(20)
	FOREIGN KEY (adres_id) references calisanlar (id)
)
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');


INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

select * from calisanlar
select * from adresler

create table calisanlar1(
id char(5)PRIMARY KEY,
isim varchar(20)UNIQUE,
maas int check(maas>10000),
ise_baslama date
)
INSERT INTO calisanlar1 VALUES ('10002','mEHMET yılmaz',19000,'2018-04-14')

--DQL --WHERE KULLANIMI

SELECT * FROM calisanlar;
SELECT isim FROM calisanlar;

--calisanlar tablosunda maaşı 5000 den büyük olan isimleri listele

select isim from calisanlar where maas>5000;

--calisanlar tablosunda ismi Veli Han olan tüm verileri listele

select * from calisanlar where isim='Veli Han';

--calisanlar tablosunda maaşı 5000 olan tüm verileri listele

select * from calisanlar where maas=5000;

--DML --DELETE KOMUTU

delete from ogrenciler7;
delete from adresler where sehir








