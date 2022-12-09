--GROUP BY

CREATE TABLE personel
(
id int,
isim varchar(50),  
sehir varchar(50),
maas int,  
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

--Isme gore toplam maaslari bulun
SELECT isim,SUM(maas) AS toplam_maas FROM personel GROUP BY isim;

--Personel tablosundaki isimleri gruplayınız
SELECT isim FROM personel GROUP BY isim; 

--HAVING KULLANIMI

/*
	Having komutu yalnizca GROUP BY komutu ile kullanilir
	Eger gruplamadan sonra bir sart varsa HAVING komutu kullanilir
	WHERE kullanımı ile aynı mantıkta çalışır
*/

SELECT * FROM personel;
--Her sirketin MIN maaslarini eger 4000’den buyukse goster
SELECT sirket,MIN(maas) FROM personel GROUP BY sirket HAVING MIN(maas)>4000;

-- Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi ve toplam maasi gosteren sorgu yaziniz
SELECT isim,SUM(maas) FROM personel GROUP BY isim HAVING SUM(maas)>10000;

-- Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz
SELECT sehir,COUNT(isim) FROM personel GROUP BY sehir HAVING COUNT(isim)>1; 

-- Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorgu yaziniz
SELECT sehir,MAX(maas) FROM personel GROUP BY sehir HAVING MAX(maas)<5000;

--UNION OPERATOR

-- Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan sehirleri gosteren sorguyu yaziniz
SELECT isim,maas FROM personel WHERE maas>4000
UNION
SELECT sehir,maas FROM personel WHERE maas>5000 

-- Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini bir tabloda gosteren sorgu yaziniz
SELECT isim,maas FROM personel WHERE isim='Mehmet Ozturk'
UNION
SELECT sehir,maas FROM personel WHERE sehir='Istanbul'

DROP TABLE IF EXISTS personel

CREATE TABLE personel
(
id int,
isim varchar(50),  
sehir varchar(50), 
maas int,  
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

CREATE TABLE personel_bilgi  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int
);

INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

SELECT * FROM personel;
SELECT * FROM personel_bilgi;
-- id’si 123456789 olan personelin personel tablosundan sehir ve maasini, 
-- personel_bilgi  tablosundan da tel ve cocuk sayisini yazdirin

SELECT sehir,maas FROM personel WHERE id=123456789
UNION
SELECT tel,cocuk_sayisi FROM personel_bilgi WHERE id=123456789;

--UNIONN ALL
/*
Union tekrarli verileri teke düşürür ve bize o şekilde sonuç verir
Union All ise tekrarli verilerle birlikte tün sorguları getirir
*/

--Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslari bulunuz
SELECT isim,maas FROM personel WHERE maas<5000
UNION ALL
SELECT isim,maas FROM personel WHERE maas<5000

--INTERSECT(Kesişim)

 /*
Farkli iki tablodaki ortak verileri INTERSECT komutu ile getirebiliriz
*/

--Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
--Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin

SELECT id FROM personel WHERE sehir IN ('Istanbul','Ankara')
INTERSECT
SELECT id FROM personel_bilgi WHERE cocuk_sayisi IN(2,3) 

-- Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin
SELECT isim FROM personel WHERE sirket='Honda'
INTERSECT
SELECT isim FROM personel WHERE sirket='Ford'
INTERSECT
SELECT isim FROM personel WHERE sirket='Tofas'