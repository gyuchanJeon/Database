#날짜 : 2024/07/02
#이름 : 전규찬
#내용 : 3장 제약조건

#실습 3-1
CREATE TABLE `user2` (
    `uid` VARCHAR(10) PRIMARY KEY,
    `name` VARCHAR(10),
    `birth` CHAR(10),
    `addr` VARCHAR(50)
);
drop table `user2`;

#실습 3-2

insert into `user2` values ('A101', '김유신', '1968-05-09', '경남 김해시');
insert into `user2` values ('A102', '김춘추', '1972-11-23', '경남 경주시');    
insert into `user2` values ('A103', '장보고', '1978-03-01', '전남 완도군');
insert into `user2` values ('A104', '강감찬', '1979-08-16', '서울시 관악구');
insert into `user2` values ('A105', '이순신', '1981-05-23', '부산시 진구');

select*from `user2`;

describe `user2`;
delete from `user2` where `uid` is null;

#실습 3-3

CREATE TABLE `user3` (
    `uid` VARCHAR(10) PRIMARY KEY,
    `name` VARCHAR(10),
    `birth` CHAR(10),
    `hp` CHAR(13) UNIQUE,
    `addr` VARCHAR(50)
);
    
drop table `user3`;

#실습 3-4

insert into `user3` values ('A101', '김유신', '1968-05-09', '010-1234-1001', '경남 김해시');
insert into `user3` values ('A102', '김춘추', '1972-11-23', '010-1234-1002', '경남 경주시');    
insert into `user3` values ('A103', '장보고', '1978-03-01', '010-1234-1003', '전남 완도군');
insert into `user3` values ('A104', '강감찬', '1979-08-16', '010-1234-1004', '서울시 관악구');
insert into `user3` values ('A105', '이순신', '1981-05-23', '010-1234-1005', '부산시 진구');

select*from `user3`;

#실습 3-5

CREATE TABLE `parent` (
    `pid` VARCHAR(10) PRIMARY KEY,
    `name` VARCHAR(10),
    `birth` CHAR(10),
    `addr` VARCHAR(100)
);

drop table `parent`;

insert into `parent` values ('p101', '김유신', '1968-05-09', '경남 김해시');
insert into `parent` values ('p102', '김춘추', '1972-11-23', '경남 경주시');
insert into `parent` values ('p103', '장보고', '1978-03-01', '전남 완도시');
insert into `parent` values ('p104', '강감찬', '1979-08-16', '서울시 관악구');
insert into `parent` values ('p105', '이순신', '1981-05-23', '부산시 진구');

select*from `parent`;

#실습 3-6

CREATE TABLE `child` (
    `cid` VARCHAR(10) PRIMARY KEY,
    `name` VARCHAR(10),
    `hp` CHAR(13) UNIQUE,
    `parent` VARCHAR(10),
    FOREIGN KEY (`parent`)
        REFERENCES `parent` (`pid`)
);

drop table `child`;

insert into `child` values ('c101', '김철수', '010-1234-1001', 'p101');
insert into `child` values ('c102', '김영희', '010-1234-1002', 'p101');
insert into `child` values ('c103', '장철수', '010-1234-1003', 'p103');
insert into `child` values ('c104', '이철수', '010-1234-1004', 'p105');

select*from `child`;

#실습 3-7

CREATE TABLE `user4` (
    `uid` VARCHAR(10) PRIMARY KEY,
    `name` VARCHAR(10) NOT NULL,
    `gender` CHAR(1),
    `age` INT DEFAULT 1,
    `hp` CHAR(13) UNIQUE,
    `addr` VARCHAR(20)
);
    
drop table `user4`;

#실습 3-8

insert into `user4` values ('a101', '김유신', 'M', 25, '010-1234-1111', '경남 김해시');
insert into `user4` values ('a102', '김춘추', 'M', 23, '010-1234-2222', '경남 경주시');
insert into `user4` values ('a103', '장보고', 'M', 35, '010-1234-3333', '전남 완도시');
insert into `user4` values ('a104', '강감찬', 'M', 42, '010-1234-4444', '서울시 관악구');
insert into `user4` values ('a105', '(null)', 'M', null, '010-1234-5555', '부산시 진구');
insert into `user4` values ('a106', '신사임당', 'F', 32, null, '강릉시');
insert into `user4` values ('a107', '허난설헌', 'F', 27, null, '경기도 광주시');

select*from `user4`;

#실습 3-9

CREATE TABLE `user5` (
    `seq` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(10) NOT NULL,
    `gender` CHAR(1) CHECK (`gender` IN ('M' , 'F')),
    `age` INT DEFAULT 1 CHECK (`age` > 0 AND `age` < 100),
    `addr` VARCHAR(20)
);
    
drop table `user5`;

#실습 3-10

insert into `user5` values (1, '김유신', 'M', 25, '경남 김해시');
insert into `user5` values (2, '김춘추', 'M', 23, '경남 경주시');
insert into `user5` values (3, '장보고', 'M', 35, '전남 완도시');
insert into `user5` values (4, '강감찬', 'M', 42, '서울시 관악구');
insert into `user5` values (5, '이순신', 'M', 51, '부산시');
insert into `user5` values (6, '신사임당', 'F', 37, '강릉시');

select*from `user5`;
