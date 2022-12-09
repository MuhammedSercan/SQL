
CREATE TABLE sirketler  (
sirket_id int,  
sirket_isim varchar(20)
);

INSERT INTO sirketler VALUES(100, 'Toyota');  
INSERT INTO sirketler VALUES(101, 'Honda');  
INSERT INTO sirketler VALUES(102, 'Ford');  
INSERT INTO sirketler VALUES(103, 'Hyundai');

CREATE TABLE siparisler  (
siparis_id int,  sirket_id int,  siparis_tarihi date
);

INSERT INTO siparisler VALUES(11, 101, '2020-04-17');  
INSERT INTO siparisler VALUES(22, 102, ' 2020-04-18');  
INSERT INTO siparisler VALUES(33, 103, ' 2020-04-19'); 
INSERT INTO siparisler VALUES(44, 104, ' 2020-04-20'); 
INSERT INTO siparisler VALUES(55,  105, ' 2020-04-21');

SELECT * FROM sirketler;
SELECT * FROM siparisler;
--INNER JOIN
--Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve siparis_tarihleri ile yeni bir tablo olusturun
SELECT sirketler.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi 
FROM sirketler INNER JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id

-- LEFT JOIN
-- Iki Tabloda sirket_id'si ayni olanlarin sirket_ismi, siparis_id ve
-- siparis_tarihleri ile yeni bir tablo olusturun
SELECT sirketler.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi
FROM sirketler LEFT JOIN siparisler
ON sirketler.sirket_id=siparisler.sirket_id;

--RIGHT JOIN
-- Iki Tabloda sirket_id'si ayni olanlarin sirket_ismi, siparis_id ve
-- siparis_tarihleri ile yeni bir tablo olusturun
SELECT sirketler.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi
FROM sirketler RIGHT JOIN siparisler
ON sirketler.sirket_id=siparisler.sirket_id;

--SELF JOINS
DROP TABLE IF EXISTS personel
CREATE TABLE personel  (
id int,
isim varchar(20),  
title varchar(60),  yonetici_id int
);

INSERT INTO personel VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel VALUES(3, 'Ayse Gul', 'QA Lead', 4);  
INSERT INTO personel VALUES(4, 'Fatma Can', 'CEO', 5);

SELECT * FROM personel;
--Her personelin yanina yonetici ismini yazdiran bir tablo olusturun

--LIKE CONDITION
DROP TABLE IF EXISTS musteriler

CREATE TABLE musteriler  (
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);

INSERT INTO musteriler (id, isim, gelir) VALUES (1001, 'Ali', 62000); 
INSERT INTO musteriler (id, isim, gelir) VALUES (1002, 'Ayse', 57500);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1004, 'Fatma', 42000);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1006, 'ali', 45000);

SELECT * FROM musteriler;

-- SORU : Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM musteriler WHERE isim LIKE 'A%' ;
SELECT * FROM musteriler WHERE isim ILIKE 'A%' ;-----> ILIKE ile büyük küçük harfin önemi kalmıyor.

/*
LIKE kullanımında büyük küçük harf gözetmeksizin sonuç almak istersek ILIKE kullanırız
LIKE yerine ~~ sembollerini kullanabilirizEğer büyük küçük harf gözetmeksizin kullanmak istersek ~~* sembollerini kullanırız
*/

--Ismi e harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
SELECT isim,gelir FROM musteriler WHERE isim LIKE '%e';

--Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
SELECT isim,gelir FROM musteriler WHERE isim LIKE '%er%';

--Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM musteriler WHERE isim LIKE '_atma';

--Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM musteriler WHERE isim LIKE '_a%';

--Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM musteriler WHERE isim LIKE '__s%';

--REGEXP_LIKE----> (~) KULLANIMI

CREATE TABLE kelimeler  (
id int UNIQUE,
kelime varchar(50) NOT NULL,  
Harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3);  
INSERT INTO kelimeler VALUES (1002, 'hat', 3);  
INSERT INTO kelimeler VALUES (1003, 'hit', 3);  
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);  
INSERT INTO kelimeler VALUES (1008, 'hct', 3);  
INSERT INTO kelimeler VALUES (1005, 'adem', 4);  
INSERT INTO kelimeler VALUES (1006, 'selim', 5);  
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);

--SORU : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime ~* 'h[ai]t';

--SORU : Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin  tum bilgilerini  yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime ~* 'h[a-k]t';

--SORU : a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime ~*  '^[as]'; 