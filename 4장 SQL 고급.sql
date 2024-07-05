#날짜 : 2024/07/03
#이름 : 전규찬
#내용 : 4장 SQL 고급

#실습 4-1

CREATE TABLE `Member` (
    `uid` VARCHAR(10) PRIMARY KEY,
    `name` VARCHAR(10) NOT NULL,
    `hp` VARCHAR(13) UNIQUE NOT NULL,
    `pos` VARCHAR(10) DEFAULT '사원',
    dep TINYINT,
    rdate DATETIME NOT NULL
);
    
drop table `Member`;
SELECT 
    *
FROM
    `Member`;

CREATE TABLE `Department` (
    `depNo` TINYINT PRIMARY KEY,
    `name` VARCHAR(10) NOT NULL,
    `tel` CHAR(12) NOT NULL
);
    
drop table `Department`;
SELECT 
    *
FROM
    `Department`;

CREATE TABLE `Sales` (
    `seq` INT AUTO_INCREMENT PRIMARY KEY,
    `uid` VARCHAR(10) NOT NULL,
    `year` YEAR NOT NULL,
    `month` TINYINT NOT NULL,
    `sale` INT
);
    
drop table `Sales`;
SELECT 
    *
FROM
    `Sales`;

#실습 4-2

insert into `Member` values ('a101', '박혁거세', '010-1234-1001', '부장', 101, '2020-11-19 11:39:48');
insert into `Member` values ('a102', '김유신', '010-1234-1002', '차장', 101, '2020-11-19 11:39:48');
insert into `Member` values ('a103', '김춘추', '010-1234-1003', '사원', 101, '2020-11-19 11:39:48');
insert into `Member` values ('a104', '장보고', '010-1234-1004', '대리', 102, '2020-11-19 11:39:48');
insert into `Member` values ('a105', '강감찬', '010-1234-1005', '과장', 102, '2020-11-19 11:39:48');
insert into `Member` values ('a106', '이성계', '010-1234-1006', '차장', 103, '2020-11-19 11:39:48');
insert into `Member` values ('a107', '정철', '010-1234-1007', '차장', 103, '2020-11-19 11:39:48');
insert into `Member` values ('a108', '이순신', '010-1234-1008', '부장', 104, '2020-11-19 11:39:48');
insert into `Member` values ('a109', '허균', '010-1234-1009', '부장', 104, '2020-11-19 11:39:48');
insert into `Member` values ('a110', '정약용', '010-1234-1010', '사원', 105, '2020-11-19 11:39:48');
insert into `Member` values ('a111', '박지원', '010-1234-1011', '사원', 105, '2020-11-19 11:39:48');

insert into `Department` values (101, '영업1부', '051-512-1001');
insert into `Department` values (102, '영업2부', '051-512-1002');
insert into `Department` values (103, '영업3부', '051-512-1003');
insert into `Department` values (104, '영업4부', '051-512-1004');
insert into `Department` values (105, '영업5부', '051-512-1005');
insert into `Department` values (106, '영업지원부', '051-512-1006');
insert into `Department` values (107, '인사부', '051-512-1007');

insert into `Sales` values (1, 'a101', 2018, 1, 98100); 
insert into `Sales` values (2, 'a102', 2018, 1, 136000); 
insert into `Sales` values (3, 'a103', 2018, 1, 80100); 
insert into `Sales` values (4, 'a104', 2018, 1, 78000); 
insert into `Sales` values (5, 'a105', 2018, 1, 93000); 
insert into `Sales` values (6, 'a101', 2018, 2, 23500); 
insert into `Sales` values (7, 'a102', 2018, 2, 126000); 
insert into `Sales` values (8, 'a103', 2018, 2, 18500); 
insert into `Sales` values (9, 'a105', 2018, 2, 19000); 
insert into `Sales` values (10, 'a106', 2018, 2, 53000); 
insert into `Sales` values (11, 'a101', 2019, 1, 24000); 
insert into `Sales` values (12, 'a102', 2019, 1, 109000); 
insert into `Sales` values (13, 'a103', 2019, 1, 101000); 
insert into `Sales` values (14, 'a104', 2019, 1, 43000); 
insert into `Sales` values (15, 'a107', 2019, 1, 24000); 
insert into `Sales` values (16, 'a102', 2019, 2, 160000); 
insert into `Sales` values (17, 'a103', 2019, 2, 101000); 
insert into `Sales` values (18, 'a104', 2019, 2, 43000); 
insert into `Sales` values (19, 'a105', 2019, 2, 24000); 
insert into `Sales` values (20, 'a106', 2019, 2, 109000); 
insert into `Sales` values (21, 'a102', 2020, 1, 201000); 
insert into `Sales` values (22, 'a104', 2020, 1, 63000); 
insert into `Sales` values (23, 'a105', 2020, 1, 74000); 
insert into `Sales` values (24, 'a106', 2020, 1, 122000); 
insert into `Sales` values (25, 'a107', 2020, 1, 111000); 
insert into `Sales` values (26, 'a102', 2020, 2, 120000); 
insert into `Sales` values (27, 'a103', 2020, 2, 93000); 
insert into `Sales` values (28, 'a104', 2020, 2, 84000); 
insert into `Sales` values (29, 'a105', 2020, 2, 180000); 
insert into `Sales` values (30, 'a108', 2020, 2, 76000); 

select*from `Member`;
select*from `Department`;
select*from `Sales`;


#실습 4-3

SELECT * FROM `Member` WHERE `name` = '김유신';
select * from `Member` where `pos` = '차장' and dep=101;
select * from `Member` where `pos` = '차장' or dep=101;
select * from `Member` where `name` !='김춘추';
select * from `Member` where `name` <> '김춘추'; #<>는 != 즉 같지 않다는 뜻
select * from `Member` where `pos` = '사원' or `pos`='대리';
select * from `Member` where `pos` in('사원', '대리');
select * from `Member` where `dep` in(101,102,103);
select * from `Member` where `name` like '%신';
select * from `Member` where `name` like '김%';
select * from `Member` where `name` like '김__';
select * from `Member` where `name` like '_성_';
select * from `Member` where `name` like '정_';
select * from `Sales` where `sale` > 50000;
select * from `Sales` where `sale` > 50000 and `sale` < 100000 and `month`=1;
select * from `Sales` where `sale` between 50000 and 100000;
select * from `Sales` where `sale` not between 50000 and 100000;
select * from `Sales` where `year` in(2020);
select * from `Sales` where `month` in(1, 2);


#실습 4-4

select * from `Sales` order by `sale`;
select * from `Sales` order by `sale` ASC;
select * from `Sales` order by `sale` DESC;
select * from `Member` order by `name`;
select * from `Member` order by `name` DESC;
select * from `Member` order by `rdate` ASC;
select * from `Sales` where `sale` > 50000 order by `sale` DESC;
select * from `Sales`
where `sale` >50000
order by `year`, `month`, `sale` DESC;

#실습 4-5

select * from Sales LIMIT 3;
select * from Sales LIMIT 0, 3;
select * from Sales LIMIT 1, 2;
select * from Sales LIMIT 5, 3;
select * from Sales ORDER BY `sale` DESC LIMIT 3, 5;
select * from Sales WHERE `sale` < 50000 ORDER BY `sale` DESC LIMIT 3;
select * from Sales WHERE `sale` > 50000 
ORDER BY `year` DESC, `month`, `sale` DESC 
LIMIT 5;


#실습 4-6

select SUM(sale) as `합계` from `Sales`;
select AVG(sale) as `평균` from `Sales`; 
select MAX(sale) as `최대값` from `Sales`; 
select MIN(sale) as `최소값` from `Sales`; 
select ceiling(1.2);
select ceiling(1.8);
select floor(1.2);
select floor(1.8);
select round(1.2);
select round(1.8);
select rand();
select ceiling(rand() * 10);
select count(sale) as `갯수` from `Sales`;
select count(*) as `갯수` from `Sales`;
select concat('Hello',' World!') as `결과`;  #둘을 이어주는 명령어
select now();


select left('HelloWorld', 5);
select right('HelloWorld', 5);
select substring('HelloWorld', 6, 5);
select concat('Hello', 'World');
select concat(`uid`, `name`, `hp`) from `member` where `uid`='a108';

select curdate();
select curtime();
select now();
insert into `member` values ('a112','유관순','010-1234-1012','대리',107,now());


#실습 4-7

select sum(sale) as `매출의 총합` from `Sales` where `year` = 2018 and `month` = 1;

#실습 4-8

select sum(sale) as `매출의 총합`,avg(sale) as `매출의 평균` from `Sales` where year = 2019 and month = 2 and `sale`>=50000;

#실습 4-9

select max(sale) as `최고 매출`, min(sale) as `최저 매출` from `Sales` where year = 2020;

#실습 4-10

SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
select * from `Sales` GROUP BY `uid`;
select * from `Sales` GROUP BY `year`;
select * from `Sales` GROUP BY `uid`, `year`;
select `uid`, count(*) as `건수` from `sales` group by `uid`;
select `uid`, sum(sale) as `합계` from `sales` group by `uid`;
select `uid`, avg(sale) as `평균` from `sales` group by `uid`;

select `uid`, `year`, sum(sale) as `합계`
from `sales`
group by `uid`,`year`;

select `uid`, `year`, sum(sale) as `합계`
from `sales`
group by `uid`, `year`
order by `year` ASC, `합계` DESC;

#실습 4-11

select `uid`, sum(sale) as `합계` 
from `sales`
group by `uid`
having `합계` >= 200000;

select `uid`, `year`, sum(sale) as `합계`
from `sales`
where `sale` >= 100000
group by `uid`, `year`
having `합계` >= 200000
order by `합계` DESC;

#실습 4-12

create table `sales2` like `sales`;
insert into `sales2` select * from `sales`;
update `sales2` set `year` = `year` +3;
set sql_safe_updates=0; # 조건 없이 update 모드 해제

select * from `sales` union select * from `sales2`;
select * from `sales` where `sale` >= 100000
union
select * from `sales2` where `sale` >= 100000;

select `uid`, `year`, `sale` from sales
union
select `uid`, `year`, `sale` from sales2;

select `uid`, `year`, sum(sale) as `합계`
from `sales`
group by `uid`, `year`
union
select `uid`, `year`, sum(sale) as `합계`
from `sales2`
group by `uid`, `year`
order by `year` ASC, `합계` DESC;

#실습 4-13

select * from `sales` 
inner join `member` on `sales`.`uid` = `member`.`uid`;
select * from `member` 
inner join `department` on `member`.`dep` = `department`.`depNo`;

select * from `sales` as a 
join `member` as b 
on a.uid = b.uid;
select * from `member` as a 
join `department` as b 
on a.dep = b.depNo;

select * from `sales` as a, `member` as b where a.uid = b.uid;
select * from `member` as a, `department` as b where a.dep = b.depNo;

select 
	a.`seq`, 
    a.`uid`, 
    `sale`, 
    `name`, 
    `pos` 
from `sales` as a
join `member` as b 
on a.`uid` = b.`uid`;

select 
	a.`seq`, 
    a.`uid`, 
    a.`sale`, 
    b.`name`, 
    b.`pos` 
from `sales` as a
join `member` as b 
using (uid);

select a.`seq`, a.`uid`, `sale`, `name`, `pos` from `sales` as a
join `member` as b on a.`uid` = b.`uid`
where `sale` >= 100000;

select a.`seq`, a.`uid`, b.`name`, b.`pos`, `year`, sum(`sale`) as `합계` from `sales` as a
join `member` as b on a.uid = b.uid
group by a.`uid`, a.`year` having `합계` >= 100000
order by a.`year` ASC, `합계` DESC;

select * from `sales` as a
join `member` as b on a.uid = b.uid
join `department` as c on b.dep = c.depNo;

select a.`seq`, a.`uid`, a.`sale`, b.`name`, b.`pos`, c.`name` from `sales` as a
join `member` as b on a.uid = b.uid
join `department` as c on b.dep = c.depNo;

select a.`seq`, a.`uid`, a.`sale`, b.`name`, b.`pos`, c.`name` from `sales` as a
join `member` as b on a.uid = b.uid
join `department` as c on b.dep = c.depNo
where `sale` > 100000
order by `sale` DESC;


#실습 4-14

select * from `sales` as a left join `member` as b on a.uid = b.uid;
select * from `sales` as a right join `member` as b on a.uid = b.uid;
select a.seq, a.uid, `sale`, `name`, `pos` from sales as a
left join member as b using(uid);

select a.seq, a.uid, `sale`, `name`, `pos` from sales as a
right join member as b using(uid);


#실습 4-15
# 아이디 이름 직급 부서명

select b.uid, b.name, b.pos, c.name from `member` as b
left join `department` as c on b.dep = c.depNo;

#실습 4-16
# '김유신' 직원의 2019년도 매출의 합을 조회하시오

select 
	a.uid,
    b.name,
    sum(sale) as '2019년도 매출합' 
from `sales` as a
join `member` as b 
on a.uid = b.uid
where b.name = '김유신' and a.year = 2019;

#실습 4-17
# 2019년 50000 이상 매출에 대해 직원별 매출의 합이 100000원 이상인 직원이름, 부서명, 직급, 년도, 매출 합을 조회하시오. 
# 단, 매출 합이 큰 순서부터 정렬


select 
	b.name,
    c.name,
    b.pos,
    a.year,
	sum(sale) as `합계` 
from `sales` as a
join `member` as b on a.uid = b.uid
join `department` as c on b.dep = c.depNo
where `year`=2019 and `sale` >= 50000
group by a.uid
having `합계`>=100000
order by `합계` DESC
limit 2;


