CREATE TABLE calisanlar7 (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);

INSERT INTO calisanlar7 VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO calisanlar7 VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO calisanlar7 VALUES(345678901, 'Mine Bulut', 'Izmir');
INSERT INTO calisanlar7 VALUES(345678901, null, 'Izmir');

SELECT * FROM calisanlar7;
--Eğer iki sutunun verilerini birleştirmek istersek concat sembolu || kullanırız
SELECT calisan_id || ' ' || calisan_isim AS id_isim FROM calisanlar7;

SELECT * FROM calisanlar7 WHERE calisan_isim IS null;

--Insanlar tablosunda null değer almış verileri no name olarak değiştiriniz
UPDATE calisanlar7
SET calisan_isim='No Name'
WHERE calisan_isim IS null;

SELECT * FROM calisanlar7 ORDER BY LENGTH (calisan_isim) DESC;

SELECT calisan_isim || ' ' || calisan_id AS isim_id FROM calisanlar7 ORDER BY LENGTH (calisan_isim || calisan_id);

CREATE TABLE manav1
(
isim varchar(50),  
Urun_adi varchar(50),
Urun_miktar int
);

INSERT INTO manav1 VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav1 VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav1 VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav1 VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav1 VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav1 VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav1 VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav1 VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav1 VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav1 VALUES( 'Ayse', 'Uzum', 2);


SELECT * FROM manav1; 


--Isme gore alinan toplam urunleri bulun
SELECT isim,SUM(Urun_miktar) FROM manav1 GROUP BY isim;

-- Isme gore alinan toplam urunleri bulun ve bu urunleri buyukten kucuge listeleyiniz
SELECT isim,SUM(Urun_miktar) AS toplam FROM manav1 GROUP BY isim ORDER BY toplam DESC;















