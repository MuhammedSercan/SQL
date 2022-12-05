CREATE TABLE ogrenciler
(
id int,
isim varchar(40),
adres varchar(100),
sinav_notu int
);
--- INSERT:Veritabanına yeni veri ekler.
INSERT INTO ogrenciler VALUES(120, 'Ali Can', 'Ankara', 75);
INSERT INTO ogrenciler VALUES(121, 'Veli Mert', 'Trabzon', 85);
INSERT INTO ogrenciler VALUES(122, 'Ayşe Tan', 'Bursa', 65);
INSERT INTO ogrenciler VALUES(123, 'Derya Soylu', 'Istanbul', 95);
INSERT INTO ogrenciler VALUES(124, 'Yavuz Bal', 'Ankara', 85);
INSERT INTO ogrenciler VALUES(125, 'Emre Gül', 'Hatay', 90);
INSERT INTO ogrenciler VALUES(126, 'Harun Reşit', 'Isparta', 100);

SELECT * FROM ogrenciler;

--Soru-1: ogrenciler tablosundaki id ve isim sütununu getiriniz
SELECT id,isim FROM ogrenciler;

--SORU-2: Sınav notu 80'den büyük olan öğrencilerin tüm bilgilerini listele
SELECT * FROM ogrenciler WHERE sinav_notu>80;

--SORU-3: Adresi Ankara olan ögrencilerin tüm bilgilerini listele
SELECT * FROM ogrenciler WHERE adres='Ankara';

--SORU-4: Sınav notu 85 ve adresi Ankara olan öğrenci ismini listele
SELECT isim FROM ogrenciler WHERE adres='Ankara' AND sinav_notu=85;

--SORU-5: Sınav notu 65 veya 85 olan ogrencilerin tüm bilgilerini listele
SELECT * FROM ogrenciler WHERE sinav_notu=65 OR sinav_notu=85;

--SORU-6: Sınav notu 65 ve 85 arasında olan ogrencilerin tüm bilgilerini listele
SELECT * FROM ogrenciler WHERE sinav_notu BETWEEN 65 AND 85;

--SORU-7: id'si 122 ve 125 arasında olmayan ögrencilerin isim ve sınav notu listele
SELECT isim,sinav_notu FROM ogrenciler WHERE id NOT BETWEEN 122 AND 125;

--SORU-8: sinav_notu 75 olan satırı siliniz
DELETE FROM ogrenciler WHERE sinav_notu=75;

--SORU-9: adres'i Trabzon olan satırı siliniz
DELETE FROM ogrenciler WHERE adres='Trabzon';

--SORU-10: ismi Derya Soylu veya Yavuz Bal olan satırları siliniz
DELETE FROM ogrenciler WHERE isim='Derya Soylu' or isim='Yavuz Bal';

--SORU-11: sınav notu 100 den küçük olan satırları siliniz
DELETE FROM ogrenciler WHERE sinav_notu<100;

--SORU-12: Tablodaki tüm satırları siliniz
DELETE FROM ogrenciler;

--SORU-13: memurlar1 isminde bir tablo oluşturunuz. id, isim, maas sutunları olsun.
--id sutununun data tipi int olsun. PRİMARY KRY kısıtlaması olsun.
--isim sutununun data tipi varchar(30) olsun. UNIQUE kısıtlaması olsun.
--maas sutununun data tipi int olsun. maas 5000 buyuk olsun. NOT NULL kısıtlaması olsun.
DROP TABLE IF EXISTS memurlar;

CREATE TABLE memurlar(
id int PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK(maas>5000) NOT NULL
)
SELECT * FROM memurlar1;

--SORU-14: insanlar isminde bir tablo oluşturunuz. isim, soyisim sutunları olsun.
--isim sutununun data tipi int olsun. PRİMARY KEY kısıtlaması olsun. Kısıtlamanın ismi pr_ks olsun
--soyisim sutununun data tipi varchar(30) olsun. UNIQUE kısıtlaması olsun. Kısıtlamanın ismi uni_ks olsun
CREATE TABLE insanlar(
isim int,
soyisim varchar(30),
	CONSTRAINT pr_ks PRIMARY KEY(isim),
	CONSTRAINT uni_ks UNIQUE(soyisim)
)




