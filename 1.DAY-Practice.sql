create table öğrenciler(
isim varchar(25),
soyisim varchar(25),
öğrencino char(8),
fakülte varchar(25),
gano real
)

create table mezunlar
as select isim,soyisim,fakülte,gano
from öğrenciler;

insert into öğrenciler values ('Ali','Alkan','12345678','hukuk',3.85);
insert into öğrenciler values('Ahmet','As','87654321','fen edebiyat',3.45);

insert into mezunlar (isim,soyisim) values('Veli','Bozar');

select * from öğrenciler;
select * from mezunlar;
select * from öğrenciler where isim = 'Ali';