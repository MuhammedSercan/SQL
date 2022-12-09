CREATE TABLE sirketler  (
sirket_id int,  
sirket_isim varchar(20)
);

INSERT INTO sirketler VALUES(100, 'Toyota');  
INSERT INTO sirketler VALUES(101, 'Honda');  
INSERT INTO sirketler VALUES(102, 'Ford');  
INSERT INTO sirketler VALUES(103, 'Hyundai');

CREATE TABLE siparisler  (
siparis_id int,  
sirket_id int,  
siparis_tarihi date
);

INSERT INTO siparisler VALUES(11, 101, '2020-04-17');  
INSERT INTO siparisler VALUES(22, 102, ' 2020-04-18');  
INSERT INTO siparisler VALUES(33, 103, ' 2020-04-19'); 
INSERT INTO siparisler VALUES(44, 104, ' 2020-04-20'); 
INSERT INTO siparisler VALUES(55,  105, ' 2020-04-21');

SELECT * FROM sirketler;
SELECT * FROM siparisler;

--Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve siparis_tarihleri ile yeni bir tablo olusturun
SELECT sirketler.sirket_isim, sirketler.sirket_id,siparisler.siparis_tarihi 
FROM sirketler INNER JOIN siparisler
ON sirketler.sirket_id=siparisler.sirket_id;
