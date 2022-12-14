CREATE TABLE ogrenciler10
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
iNSERT INTO ogrenciler10 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler10 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler10 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler10 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler10 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler10 VALUES(127, 'Mustafa Bak', 'Ali', 99);

SELECT * FROM ogrenciler10;

-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.
delete from ogrenciler10 where isim= 'Nesibe Yilmaz' or isim ='Mustafa Bak';

--Veli ismi Hasan olan datayı silelim
delete from ogrenciler10 where veli_isim='Hasan';

--TRUNCATE
--Bir tablodaki tüm verileri geri alamayacağımız şekilde siler ve şartlı silme yapmaz(sadece ism sütununu sil gibi)

truncate table ogrenciler10;



--ON DELETE CASCADE
DROP TABLE if exist talebeler--Eğer tablo varsa tabloyu siler

CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade
);

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

select * from talebeler;
select * from notlar;

--notlar tablosundan talebe_id'si 123 olan datayı silelim
delete from notlar where talebe_id='123';

--talebeler tablosundan id'si 126 olan datayı silelim
delete from talebeler where id='126';

--IN CONDITION 
DROP TABLE if exists musteriler;

CREATE TABLE musteriler (
urun_id int,
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');  
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

select * from musteriler;

--musteriler tablosundan urun ismi Orange,Apple veya Apricot olan dataları listeleyiniz

select * from musteriler where urun_isim='Orange' or urun_isim='Apple' or urun_isim='Apricot';

--IN CONDITION

select * from musteriler where urun_isim in ('Orange','Apple','Apricot');

--NOT IN--> Yazdığımız verilerin dışındakileri getirir.

select * from musteriler where urun_isim not in ('Orange','Apple','Apricot');

--Between condition

--ıd'si 20 ile 40 arasında olan verileri listeleyiniz

select * from musteriler where urun_id >= 20 and urun_id <=40;

select * from musteriler where urun_id between 20 and 40;

select * from musteriler where urun_id not between 20 and 40;

--SUBQUERIES-->sorgu içinde sorgu

CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);



select * from calisanlar2;
select * from markalar;

--Çalışan sayıları 15.000 den çok olan markların isimlerini ve bu markada çalışanların isimlerini ve maaşlarını listeleyin


select isim,maas,isyeri from calisanlar2 where isyeri in(select marka_isim from markalar where calisan_sayisi>15000);

-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.

select isim,maas,isyeri from calisanlar2 where isyeri in(select marka_isim from markalar where marka_id>101);

--ÖDEV- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.

--AGGREGATE METHOD

SELECT MAX (maas) from calisanlar2;
SELECT MAX (maas) as maksimum_maas from calisanlar2;

select min (maas) as minimum_maas from calisanlar2;

select sum(maas) from calisanlar2;
select sum(maas) as toplam from calisanlar2;

select avg (maas) from calisanlar2;
select avg (maas) as ortalama_maas from calisanlar2;
select round(avg (maas)) from calisanlar2;
select round(avg (maas),2) from calisanlar2;

select count (maas) from calisanlar2; -- maas(sütun adı) null olunca saymaz .
select count(*) from calisanlar2; -- maas null olunca da sayar ,tüm satır sayısını sayar.

--AGGREGATE METHODLARDA SUBQUERY

--Her markanın ıd sini,ismini, ve toplam kaç şehirde bulunduğunu listeleyen bir sorgu yazınız

select marka_id,marka_isim,(select count(sehir) as sehir_sayisi from calisanlar2 where marka_isim=isyeri)from markalar;


-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz

select marka_isim,calisan_sayisi,
(select sum(maas) from calisanlar2 where isyeri=marka_isim) as toplam_maas
from markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.

select marka_isim,calisan_sayisi,
(select max(maas) from calisanlar2 where isyeri=marka_isim)as maas_max,
(select min(maas) from calisanlar2 where isyeri=marka_isim)as maas_min
from markalar;

--VIEW KULLANIMI
/*yaptığımız sorguları hafızaya alır ve tekrar bizden istenen sorgulama yerine view ' e atadığımız ismi SELECT komutuyla çağırırız
*/
CREATE VIEW maxminmaas
as
select marka_isim,calisan_sayisi,
(select max(maas) from calisanlar2 where isyeri=marka_isim)as maas_max,
(select min(maas) from calisanlar2 where isyeri=marka_isim)as maas_min
from markalar;

select * from maxminmaas;

--EXIST CONDITION

CREATE TABLE mart
(   
urun_id int,    
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan 
(   
urun_id int ,
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

SELECT * FROM mart;
Select * from nisan;

--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
--URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
--MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
 
 select urun_id,musteri_isim from mart 
 where exists(select urun_id from nisan where mart.urun_id=nisan.urun_id);
 
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.

select urun_isim,musteri_isim from nisan
where exists(select urun_isim from mart where mart.urun_isim=nisan.urun_isim);

--DML   --UPDATE 

CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

SELECT * from tedarikciler;

-- vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.

UPDATE tedarikciler
SET firma_ismi='Vestel' where vergi_no=102;


-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.

UPDATE tedarikciler
SET firma_ismi='Casper',
irtibat_ismi='Ali Veli'
where vergi_no=101;







