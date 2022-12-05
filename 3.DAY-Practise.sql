create table buyuk
(
isim varchar(25),
soyisim varchar(25),
numara char(5) PRIMARY KEY	
)

INSERT INTO buyuk VALUES ('Ali','AZ','12345');
INSERT INTO buyuk VALUES ('Ahmet','AR','12346');
INSERT INTO buyuk VALUES ('Murat','AF','12347');
INSERT INTO buyuk VALUES ('Mustafa','AL','12348');


create table kucuk
(
x varchar(20),
y varchar(20),
id_n char(5),
	foreign key (id_n) references buyuk (numara)
	

)
INSERT INTO kucuk VALUES ('A','A','12345');
INSERT INTO kucuk VALUES ('B','B','12346');
INSERT INTO kucuk VALUES ('C','C','12347');


DELETE FROM buyuk where isim='Ali';
DELETE FROM buyuk where numara='12347';

select * from buyuk;
select * from kucuk;

SELECT * FROM buyuk WHERE isim IN('Ali','Ahmet');
SELECT * FROM buyuk WHERE isim ='Ali' or isim='Ahmet';

SELECT * FROM buyuk WHERE isim NOT IN('Ali','Ahmet');

SELECT * FROM buyuk WHERE numara>='12345' and numara<='12348' ;
SELECT * FROM buyuk WHERE numara between '12345' and '12348';


