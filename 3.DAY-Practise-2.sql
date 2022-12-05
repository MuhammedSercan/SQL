CREATE TABLE calisanlar10
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);

INSERT INTO calisanlar10 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar10 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar10 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar10 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar10 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar10 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar10 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar10
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar10 VALUES(100, 'Vakko', 12000);
INSERT INTO markalar10 VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar10 VALUES(102, 'Adidas', 10000);
INSERT INTO markalar10 VALUES(103, 'LCWaikiki', 21000);

SELECT * FROM calisanlar10;
SELECT * FROM markalar10;

--Çalışan sayıları 15.000 den çok olan markların isimlerini ve bu markada çalışanların isimlerini ve maaşlarını listeleyin

select isim, maas, isyeri from calisanlar10
where isyeri in(select marka_isim from markalar10 where calisan_sayisi>15000);

-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.

select isim,maas,sehir from calisanlar10
where isyeri in(select marka_isim from markalar10 where marka_id>101);

--ÖDEV- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.

select marka_id,calisan_sayisi from markalar10
where marka_isim in(select isyeri from calisanlar10 where sehir='Ankara' );

select max(maas) as en_yuksek_maas from calisanlar10;
select min(maas) as en_dusuk_maas from calisanlar10;

select sum(maas) from calisanlar10;
select avg(maas) from calisanlar10;
select round(avg(maas)) from calisanlar10;
select round(avg(maas),2) from calisanlar10;

select count(maas) from calisanlar10;

--Her markanın ıd sini,ismini, ve toplam kaç şehirde bulunduğunu listeleyen bir sorgu yazınız
SELECT * FROM calisanlar10;
SELECT * FROM markalar10;

select marka_id,marka_isim,
(select count(sehir) from calisanlar10 where marka_isim=isyeri)
from markalar10;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz

select marka_isim,calisan_sayisi,
(select sum(maas) from calisanlar10 where marka_isim=isyeri)
from markalar10;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.

select marka_isim,calisan_sayisi,
(select max(maas) from calisanlar10 where isyeri=marka_isim)as maas_max,
(select min(maas) from calisanlar10 where isyeri=marka_isim)as maas_min
from markalar10;

--VIEW

CREATE VIEW maxminmaas
as
select marka_isim,calisan_sayisi,
(select max(maas) from calisanlar10 where isyeri=marka_isim)as maas_max,
(select min(maas) from calisanlar10 where isyeri=marka_isim)as maas_min
from markalar10;

select * from maxminmaas;


--EXISTS CONDITION

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
where exists (select urun_id from nisan where mart.urun_id=nisan.urun_id);

--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.

select urun_isim,musteri_isim from nisan
where exists (select urun_isim from mart where nisan.urun_isim=mart.urun_isim);

--UPDATE

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

update tedarikciler set firma_ismi='Vestel' where vergi_no=102;

-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
update tedarikciler set firma_ismi='casper', irtibat_ismi='Ali Veli' where vergi_no=101;


