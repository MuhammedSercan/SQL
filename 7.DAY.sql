--DISTINCT KULLANIMI
CREATE TABLE maas 
(
id int, 
musteri_isim varchar(50),
maas int 
);

INSERT INTO maas VALUES (10, 'Ali', 5000); 
INSERT INTO maas VALUES (10, 'Ali', 7500); 
INSERT INTO maas VALUES (20, 'Veli', 10000); 
INSERT INTO maas VALUES (30, 'Ayse', 9000); 
INSERT INTO maas VALUES (20, 'Ali', 6500); 
INSERT INTO maas VALUES (10, 'Adem', 8000); 
INSERT INTO maas VALUES (40, 'Veli', 8500); 
INSERT INTO maas VALUES (20, 'Elif', 5500);

CREATE TABLE musteri_urun 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);

INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');

SELECT * FROM musteri_urun;

--Musteri urun tablosundan urun isimlerini tekrarsız listeleyin
SELECT DISTINCT(urun_isim) FROM musteri_urun;

-- Tabloda kac farkli meyve vardir ?
SELECT COUNT(DISTINCT(urun_isim)) FROM musteri_urun;

--FETCH NEXT() ROW ONLY/OFFSET/LIMIT

--Musteri urun tablosundan urun_id ' ye gore ilk uc kaydı listeleyiniz
SELECT * FROM musteri_urun ORDER BY urun_id 
FETCH NEXT 3 ROW ONLY;  

--En yuksek maasi alan musteriyi listeleyiniz
SELECT * FROM maas ORDER BY maas DESC LIMIT 1;

--Maas tablosundan en yuksek ikinci maasi listeleyiniz
SELECT * FROM maas ORDER BY maas DESC OFFSET 1 LIMIT 1;

--Maas tablosundan en dusuk dorduncu maasi listeleyiniz
SELECT * FROM maas ORDER BY maas OFFSET 3 LIMIT 1 ;

--DDL ALTER TABLE
DROP TABLE IF EXISTS personel
CREATE TABLE personel  (
id int,
isim varchar(50),  
sehir varchar(50),  
maas int,  
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

SELECT * FROM personel;

--1) ADD default deger ile tabloya bir field ekleme

ALTER TABLE personel
ADD ulke_isim varchar(30)


ALTER TABLE personel
ADD adres varchar(30)
DEFAULT 'Türkiye'

--2) DROP tablodan sutun silme
ALTER TABLE personel
DROP COLUMN ulke_isim;

ALTER TABLE personel
DROP adres, DROP sirket;

--3)RENAME COLUMN sutun adi degistirme
ALTER TABLE personel
RENAME COLUMN sehir TO il;

--4)RENAME tablonun ismini degistirme
ALTER TABLE personel
RENAME TO isci;

SELECT * FROM isci;

--5)TYPE/SET sutunlarin ozelliklerini degistirme
ALTER TABLE isci 
ALTER COLUMN il TYPE varchar(30),
ALTER COLUMN maas SET NOT NULL;

-- TRANSACTION 
CREATE TABLE ogrenciler2
(
id serial,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real       
);

BEGIN;
INSERT INTO ogrenciler2 VALUES(default, 'Ali Can', 'Hasan',75.5);
INSERT INTO ogrenciler2 VALUES(default, 'Merve Gul', 'Ayse',85.3);
savepoint x;
INSERT INTO ogrenciler2 VALUES(default, 'Kemal Yasa', 'Hasan',85.6);
INSERT INTO ogrenciler2 VALUES(default, 'Nesibe Yilmaz', 'Ayse',95.3);
savepoint y;
INSERT INTO ogrenciler2 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler2 VALUES(default, 'Can Bak', 'Ali', 67.5);
ROLLBACK to y;
COMMIT;