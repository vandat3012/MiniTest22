drop database if exists mini_test_2;
create database if not exists mini_test_2;

use mini_test_2;

create table city (
city_id int primary key,
city_name varchar(50)
);

create table category (
cag_id int primary key,
cag_code varchar(50),
cag_name varchar(50)
);

create table destination (
des_id int primary key,
des_name varchar(50),
des_information varchar(255),
des_price_avg float,
city_id int,
foreign key (city_id) references city(city_id)
);

create table customer (
customer_id int primary key,
customer_name varchar(50),
customer_code int,
customer_yearbirth date,
city_id int,
foreign key (city_id) references city(city_id)
);

create table tour (
tour_id int primary key,
tour_code varchar(50),
cag_id int,
des_id int,
tour_date_start date,
tour_date_end date,
foreign key (cag_id) references category(cag_id),
foreign key (des_id) references destination(des_id)
);

create table bill (
bill_id int primary key,
tour_id int,
customer_id int,
statuss varchar(255),
foreign key (tour_id) references tour(tour_id),
foreign key (customer_id) references customer(customer_id)
);

insert into city values
(1,"ĐN"),
(2,"HN"),
(3,"HUE"),
(4,"SG"),
(5,"ĐL");

insert into category values
(1,"F1","VIP"),
(2,"F2","NORMAL");

insert into destination values
(1,"SONTRA","no",5000000,1),
(2,"HOGUOM","no",6000000,2),
(3,"CODO","no",7000000,3),
(4,"TANSOMNHAT","no",8000000,4),
(5,"QUANGTRUONG","no",10000000,5);

insert into customer values
(1,"A",111,'2000-11-11',1),
(2,"A1",112,'2001-11-11',2),
(3,"A2",113,'2002-11-11',4),
(4,"A3",114,'2000-11-11',5),
(5,"A4",115,'2003-11-11',1),
(6,"A5",116,'2004-11-11',5),
(7,"A6",117,'2005-11-11',3),
(8,"A7",118,'2006-11-11',2),
(9,"A8",119,'2001-11-11',1),
(10,"A9",1110,'2000-11-11',1);

insert into tour values
(1,"M1",1,1,'2022-2-11','2022-3-12'),
(2,"M2",2,2,'2022-1-11','2022-3-12'),
(3,"M3",1,1,'2022-3-11','2022-4-12'),
(4,"M4",1,4,'2022-3-11','2022-4-12'),
(5,"M5",2,5,'2022-2-11','2022-4-15'),
(6,"M6",1,3,'2022-1-11','2022-3-12'),
(7,"M15",2,5,'2022-3-11','2022-5-12'),
(8,"M7",1,1,'2022-2-11','2022-4-12'),
(9,"M8",1,2,'2022-3-11','2022-11-12'),
(10,"m9",2,1,'2022-1-11','2022-4-12'),
(11,"M10",1,1,'2022-4-11','2022-5-12'),
(12,"M11",1,4,'2022-2-11','2022-3-12'),
(13,"M12",2,5,'2022-3-11','2022-4-12'),
(14,"M13",2,1,'2022-3-11','2022-5-12'),
(15,"M14",1,3,'2022-4-11','2022-11-12');

insert into bill values
(1,1,1,"no"),
(2,3,4,"no"),
(3,4,5,"no"),
(4,6,6,"no"),
(5,1,8,"no"),
(6,7,1,"no"),
(7,10,4,"no"),
(8,13,5,"no"),
(9,8,3,"no"),
(10,15,2,"no");

-- Thống kê số lượng tour của các thành phố
select c.city_name,count(t.des_id) as quantity
from city c 
left join destination d on d.city_id = c.city_id
left join tour t on t.des_id = d.des_id
group by c.city_name;

-- Tính số tour có ngày bắt đầu trong tháng 3
select count(b.tour_id) as quantity
from tour t
join bill b on b.tour_id = t.tour_id
where month(t.tour_date_start) = 3;

-- Tính số tour có kết thúc tháng 4
select count(b.tour_id) as quantity 
from tour t
join bill b on b.tour_id = t.tour_id
where month(t.tour_date_end) = 4;

