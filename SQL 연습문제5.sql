#날짜 : 2024/07/12
#이름 : 전규찬
#내용 : SQL 연습문제 5

#실습 5-1

create database `Bookstore`;
create user 'bookstore'@'%' identified by '1234';
grant all privileges on `Bookstore`.* to 'bookstore'@'%';
flush privileges;

#실습 5-2

create table `Customer` (
	`custId` int auto_increment primary key,
    `name` varchar(10) not null,
    `address` varchar(20) default null,
    `phone` varchar(13) default null
    );
    
create table `Book` (
	`bookId` int primary key,
    `bookName` varchar(20) not null,
    `publisher` varchar(20) not null,
    `price` int default null
    );
    
create table `Order` (
	`orderId` int auto_increment primary key,
    `custId` int not null,
    `bookId` int not null,
    `salePrice` int not null,
    `orderDate` datetime not null
    );

#실습 5-3

INSERT INTO `Customer` (name, address, phone) VALUES
('박지성', '영국 맨체스타', '000-5000-0001'),
('김연아', '대한민국 서울', '000-6000-0001'),
('장미란', '대한민국 강원도', '000-7000-0001'),
('추신수', '미국 클리블랜드', '000-8000-0001'),
('박세리', '대한민국 대전', NULL);

INSERT INTO `Book` (bookid, bookname, publisher, price) VALUES
(1, '축구의 역사', '굿스포츠', 7000),
(2, '축구아는 여자', '나무수', 13000),
(3, '축구의 이해', '대한미디어', 22000),
(4, '골프 바이블', '대한미디어', 35000),
(5, '피겨 교본', '굿스포츠', 8000),
(6, '역도 단계별기술', '굿스포츠', 6000),
(7, '야구의 추억', '이상미디어', 20000),
(8, '야구를 부탁해', '이상미디어', 13000),
(9, '올림픽 이야기', '삼성당', 7500),
(10, 'Olympic Champions', 'Pearson', 13000);

INSERT INTO `Order` (custid, bookid, saleprice, orderdate) VALUES
(1, 1, 6000, '2014-07-01'),
(1, 3, 21000, '2014-07-03'),
(2, 5, 8000, '2014-07-03'),
(3, 6, 6000, '2014-07-04'),
(4, 7, 20000, '2014-07-05'),
(1, 2, 12000, '2014-07-07'),
(4, 8, 13000, '2014-07-07'),
(3, 10, 12000, '2014-07-08'),
(2, 10, 7000, '2014-07-09'),
(3, 8, 13000, '2014-07-10');

#실습 5-4

select custId, name, address from `Customer`;

#실습 5-5

select bookname, price from `Book`;

#실습 5-6

select price, bookname from `Book`;

#실습 5-7

select * from `Book`;

#실습 5-8

select publisher from `Book`;

#실습 5-9

select distinct publisher from `Book`;

#실습 5-10

select * from `Book` where price >= 20000;

#실습 5-11

select * from `Book` where price < 20000;

#실습 5-12

select * from `Book` where price between 10000 and 20000;

#실습 5-13

select bookid, bookname, price
from `Book`
where price between 15000 and 30000;

#실습 5-14

select * from `Book` where bookid = 2 or bookid = 3 or bookid = 5;
select * from `Book` where bookid in(2, 3, 5);

#실습 5-15

select * from `Book` where bookid % 2 = 0;

#실습 5-16

select * from `Customer` where name like '박%';

#실습 5-17

select * from `Customer` where address like '%대한민국%';

#실습 5-18

select * from `Customer` where phone is not null;

#실습 5-19

select * from `Book` where publisher = '굿스포츠' or publisher = '대한미디어';
select * from `Book` where publisher in('굿스포츠', '대한미디어');

#실습 5-20

select publisher from `Book` where bookname = '축구의 역사';

#실습 5-21

select publisher from `Book` where bookname like '%축구%';

#실습 5-22

select * from `Book` where bookname like '_구%';

#실습 5-23

select * from `Book` where bookname like '%축구%' and price >= 20000;

#실습 5-24

select * from `Book` order by bookname;

#실습 5-25

select * from `Book` order by price, bookname;

#실습 5-26

select * from `Book` order by price desc, publisher asc;

#실습 5-27

select * from `Book` order by price desc limit 3;

#실습 5-28

select * from `Book` order by price asc limit 3;

#실습 5-29

select sum(saleprice) as `총판매액` from `Order`;

#실습 5-30

select sum(saleprice) as `총판매액`, 
	   avg(saleprice) as `평균값`, 
       min(saleprice) as `최저가`, 
       max(saleprice) as `최고가`
from `Order`;

#실습 5-31

select count(*) as `판매건수` from `Order`;

#실습 5-32------------------새로운 개념 replace 등장

update `Book` set bookname = replace(bookname, '야구', '농구');
select custid, replace(bookname, '야구', '농구') from `Book`;

#실습 5-33

select custid, count(custid) as `수량` from `Customer`
join `Order` using (custid)
where saleprice >= 8000
group by custid
having `수량` >= 2
order by custid;

#실습 5-34

select * from `Customer` as a
join `Order` as b on a.custid = b.custid;

#실습 5-35

select * from `Customer` as a
join `Order` as b on a.custid = b.custid
order by a.custid;

#실습 5-36

select name, saleprice from `Customer`
join `Order` using (custid)
order by custid;

#실습 5-37

select name, sum(saleprice) from `Customer`
join `Order` using (custid)
group by custid
order by name; 

#실습 5-38

select name, bookname from `Customer`
join `Order` using (custid)
join `Book` using (bookid)
order by custid;

#실습 5-39

select name, bookname from `Customer`
join `Order` using (custid)
join `Book` using (bookid)
where saleprice = 20000;

#실습 5-40

select name, saleprice from `Customer`
left join `Order` using (custid);

#실습 5-41

select sum(saleprice) as `총매출` from `Customer`
join `Order` using (custid)
where custid = 2;

#실습 5-42

select bookname from `Book`
order by price desc limit 1;

select bookname from `Book` where price = (select max(price) from `Book`);

#실습 5-43

select name from `Customer`
left join `Order` using (custid)
where orderid is null;

#실습 5-44

insert into `Book` values (11, '스포츠의학', '한술의학서적', null);
insert into `Book` set bookid = 11,
					   bookname = '스포츠의학',
                       publisher = '한술의학서적';

#실습 5-45

update `Customer` set address = '대한민국 부산' where custid = 5;

#실습 5-46---------------delete from `table` where ~~~; 

delete from `Customer` where custid = 5;
