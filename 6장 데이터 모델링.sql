#날짜 : 2024/07/15
#이름 : 전규찬
#내용 : 데이터 모델링 실습하기

#실습 6-1

#실습 6-2

insert into `Customer` values ('c101', '김유신', '010-1234-1001', '경남 김해시', '2023-01-01');
insert into `Customer` values ('c102', '김춘추', '010-1234-1002', '경남 경주시', '2023-01-02');
insert into `Customer` values ('c103', '장보고', '010-1234-1003', '전남 완도군', '2023-01-03');
insert into `Customer` values ('c104', '강감찬', '010-1234-1004', '서울시 관악구', '2023-01-04');
insert into `Customer` values ('c105', '이순신', '010-1234-1005', '부산시 금정구', '2023-01-05');

insert into `Product` values (1, '새우깡',5000 ,1500 , '농심');
insert into `Product` values (2, '초코파이',2500 ,2500 , '오리온');
insert into `Product` values (3, '포카칩',3600 ,1700 , '오리온');
insert into `Product` values (4, '양파링',1250 ,1800 , '농심');
insert into `Product` values (5, '죠리퐁',2200 ,NULL , '크라운');

insert into `Order` (orderId, orderProduct, orderCount, orderDate) values ('c102',3 ,2 , '2023-01-01 13:15:10');
insert into `Order` (orderId, orderProduct, orderCount, orderDate) values ('c101',4 ,1 , '2023-01-01 13:15:12');
insert into `Order` (orderId, orderProduct, orderCount, orderDate) values ('c102',1 ,1 , '2023-01-01 13:15:14');
#prodNo와 일치하는 orderProduct번호가 아님(6번 없음)insert into `Order` (orderId, orderProduct, orderCount, orderDate) values ('c103',6 ,5 , '2023-01-01 13:15:16');
insert into `Order` (orderId, orderProduct, orderCount, orderDate) values ('c105',2 ,1 , '2023-01-01 13:15:18');

#실습 6-3

select orderNo as `주문번호`,
	   name as `주문한 고객명`,
       prodName as `주문한 상품명`,
       orderCount as `주문 수량`,
       orderDate as `주문일` from `Customer` as a
join `Order` as b on a.custId = b.orderId
join `Product` as c on b.orderProduct = c.prodNo;


#강사님 풀이--------------------------------------
select 	
    `orderNo`,
    `name`,
    `prodName`,
    `orderCount`,
    `orderDate`    
 from `Order` as a
join `Customer` as b on a.orderId = b.custId
join `Product` as c on a.orderProduct = c.prodNo;



select orderNo as `주문번호`,
	   prodNo as `상품번호`,
       prodName as `상품명`,
       price as `가격`,
	   orderCount as `주문수량`,
       orderDate as `주문일` from `Customer` as a
join `Order` as b on a.custId = b.orderId
join `Product` as c on b.orderProduct = c.prodNo
where a.name = '김유신';


#강사님 풀이--------------------------------------
select 	
    `orderNo`,
    `prodNo`,        
    `prodName`,
    `price`,
    `orderCount`,
    `orderDate`    
 from `Order` as a
join `Customer` as b on a.orderId = b.custId
join `Product` as c on a.orderProduct = c.prodNo
where `name`='김유신';


select sum(price * orderCount) from `Product` as a
join `Order` as b on a.prodNo = b.orderProduct;

#강사님 풀이--------------------------------------
select 
	SUM(`price` * `orderCount`)
from `Order` as a
join `Product` as b on a.orderProduct = b.prodNo;


#실습 6-4

#실습 6-5

insert into `bank_customer` values ('730423-1000001', '김유신', 1, '010-1234-1001', '경남 김해시');
insert into `bank_customer` values ('730423-1000002', '김춘추', 1, '010-1234-1002', '경남 경주시');
insert into `bank_customer` values ('750423-1000003', '장보고', 1, '010-1234-1003', '전남 완도군');
insert into `bank_customer` values ('102-12-51094', '(주)정보산업', 2, '051-500-1004', '부산시 부산진구');
insert into `bank_customer` values ('930423-1000005', '이순신', 1, '010-1234-1005', '서울 종로구');

insert into `bank_account` values ('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 1550000, '2011-04-11');
insert into `bank_account` values ('101-11-1002', 'S1', '자유저축예금', '930423-1000005', 260000, '2011-05-12');
insert into `bank_account` values ('101-11-1003', 'S1', '자유저축예금', '750423-1000003', 75000, '2011-06-13');
insert into `bank_account` values ('101-12-1001', 'S2', '기업전용예금', '102-12-51094', 15000000, '2011-07-14');
insert into `bank_account` values ('101-13-1001', 'S3', '정기저축예금', '730423-1000002', 1200000, '2011-08-15');

insert into `bank_transaction` (t_a_no, t_dist, t_amount, t_datetime) values ('101-11-1001', 1, 50000, '2023-01-01 13:15:10');
insert into `bank_transaction` (t_a_no, t_dist, t_amount, t_datetime) values ('101-12-1001', 2, 1000000, '2023-01-02 13:15:12');
insert into `bank_transaction` (t_a_no, t_dist, t_amount, t_datetime) values ('101-11-1002', 3, 260000, '2023-01-03 13:15:14');
insert into `bank_transaction` (t_a_no, t_dist, t_amount, t_datetime) values ('101-11-1002', 2, 100000, '2023-01-04 13:15:16');
insert into `bank_transaction` (t_a_no, t_dist, t_amount, t_datetime) values ('101-11-1003', 3, 75000, '2023-01-05 13:15:18');
insert into `bank_transaction` (t_a_no, t_dist, t_amount, t_datetime) values ('101-11-1001', 1, 150000, '2023-01-05 13:15:28');


#실습 6-6

select c_no as `고객번호`,
	   c_name as `이름`,
       c_phone as `연락처`,
       a_no as `계좌번호`,
       a_item_name as `계좌상품명`,
       a_balance as `현재잔액`
from `bank_customer` as a
join `bank_account` as b on a.c_no = b.a_c_no;


#강사님 풀이--------------------------------------
select 
	`c_no`,
	`c_name`,
	`c_phone`,
    `a_no`,
    `a_item_name`,
    `a_balance`
from `bank_customer` as a 
join `bank_account` as b on a.c_no = b.a_c_no;



select t_dist as `거래구분`,
	   t_amount as `거래금액`,
       t_datetime as `거래날짜`
from `bank_customer` as a
join `bank_account` as b on c_no = a_c_no
join `bank_transaction` as c on a_no = t_a_no
where c_name = '이순신';


#강사님 풀이--------------------------------------
select 
	`t_dist`,
    `t_amount`,
    `t_datetime`
from `bank_customer` as a 
join `bank_account` as b on a.c_no = b.a_c_no
join `bank_transaction` as c on b.a_no = c.t_a_no
where `c_name` = '이순신';


select c_no, c_name, a_no, a_balance, a_open_date from `bank_customer` as a
join `bank_account` as b on a.c_no = b.a_c_no
where c_dist = 1
order by a_balance desc
limit 1;


#강사님 풀이--------------------------------------
select 
	`c_no`,
    `c_name`,
    `a_no`,
    `a_balance`,
    `a_open_date`
from `bank_customer` as a 
join `bank_account` as b on a.c_no = b.a_c_no
where `c_dist`=1
order by `a_balance` desc
limit 1;

#실습 6-7

#실습 6-8

insert into `Student` values (20201011, '김유신', '010-1234-1001', 3, '경남 김해시');
insert into `Student` values (20201122, '김춘추', '010-1234-1002', 3, '경남 경주시');
insert into `Student` values (20210213, '장보고', '010-1234-1003', 2, '전남 완도군');
insert into `Student` values (20210324, '강감찬', '010-1234-1004', 2, '서울 관악구');
insert into `Student` values (20220415, '이순신', '010-1234-1005', 1, '서울 종로구');

insert into `Lecture` values (101, '컴퓨터과학 개론', 2, 40, '본301');
insert into `Lecture` values (102, '프로그래밍 언어', 3, 52, '본302');
insert into `Lecture` values (103, '데이터베이스', 3, 56, '본303');
insert into `Lecture` values (104, '자료구조', 3, 60, '본304');
insert into `Lecture` values (105, '운영체제', 3, 52, '본305');

insert into `Register` values (20220415, 101, 60, 30, NULL, NULL); 
insert into `Register` values (20210324, 103, 54, 36, NULL, NULL); 
insert into `Register` values (20201011, 105, 52, 28, NULL, NULL); 
insert into `Register` values (20220415, 102, 38, 40, NULL, NULL); 
insert into `Register` values (20210324, 104, 56, 32, NULL, NULL); 
insert into `Register` values (20210213, 103, 48, 40, NULL, NULL); 


#실습 6-9

select stdNo as `학번`,
	   stdName as `이름`,
       stdHp as `연락처`,
       stdYear as `학년`
from `Student` as a
left join `Register` as b on stdNo = regStdNo
where regStdNo is null;


#강사님 풀이
select 
	`stdNo`,
    `stdName`,
    `stdHp`,
    `stdYear`
from `Student` as a
left join `Register` as b on a.stdNo = b.regStdNo
where `regStdNo` is null; 


select regStdNo, regLecNo, regMidScore + regFinalScore as `총합`,
       case
			when (regMidScore + regFinalScore >= 90) then 'A'
			when (regMidScore + regFinalScore >= 80) then 'B'
			when (regMidScore + regFinalScore >= 70) then 'C'
			when (regMidScore + regFinalScore >= 60) then 'D'
		else 'F'
        end as `등급`
from `Register` ;


#강사님 풀이
select 
	`regStdNo`, 
    `regLecNo`, 
    `regMidScore`,
    `regFinalScore`,
    `regMidScore` + `regFinalScore` as `합`,
    case
		when (`regMidScore` + `regFinalScore` >= 90) then 'A'
		when (`regMidScore` + `regFinalScore` >= 80) then 'B'
		when (`regMidScore` + `regFinalScore` >= 70) then 'C'
		when (`regMidScore` + `regFinalScore` >= 60) then 'D'
	else 'F'
    end as `등급`
from `Register`;


select stdNo, stdName, lecName, regMidScore, regFinalScore, regTotalScore, regGrade
from `Student` as a
join `Register` as b on a.stdNo = b.regStdNo
join `Lecture` as c on b.regLecNo = c.lecNo
where stdYear = 2;


#강사님 풀이
select 
	`stdNo`,
    `stdName`,
    `stdYear`,
    `lecName`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `Student` as a
join `Register` as b on a.stdNo = b.regStdNo
join `Lecture` as c on b.regLecNo = c.lecNo
where `stdYear` = 2;
