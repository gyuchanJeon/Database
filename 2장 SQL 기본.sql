#날짜 : 2024/07/01
#이름 : 전규찬
#내용 : 2장 SQL 기본

#실습 2-1. 테이블 생성, 제거
use StudyDB;

CREATE TABLE `User1` (
	`uid`	varchar(10),
    `name`	varchar(10),
    `hp`	char(13),
    `age`	int
    );
    drop table `user1`;
    
   
    #실습 2-2. 데이터 입력
    insert into `User1` values ('A101', '김유신', '010-1234-1111', 25);
    insert into `User1` values ('A102', '김춘추', '010-1234-2222', 23);
    insert into `User1` values ('A103', '장보고', '010-1234-3333', 32);
    insert into `User1`(`uid`, `name`, `age`) values ('A104', '강감찬', 45);
    insert into `User1` SET `uid`='A105',    
							`name`='이순신',
                            `hp`='010-1234-5555';
                            
	#실습 2-3. 데이터 조회
    select * from `user1`;
    select * from `user1` where `uid`='A101';
	select * from `user1` where `name`='김춘추';
    select * from `user1` where `age` <30;
    select * from `user1` where `age` >=30;
    select `uid`, `name`, `age` from `user1`;
    
    #실습 2-4. 데이터 수정
    SET SQL_SAFE_UPDATES = 0;
    update `user1` set `hp`='010-1234-4444' where `uid`='A104';
    update `user1` set `age`=51 where `uid`='A105';
    update `user1` set `hp`='010-1234-1001', `age`=27 where `uid`='A101';
    
    #실습 2-5. 데이터 삭제
    delete from `user1` where `uid`='A101';
    delete from `user1` where `uid`='A102' and `age`=25;
    delete from `user1` where `age` >= 30;
    
    #실습 2-6. 테이블 컬럼 수정
    alter table `user1` add `gender` tinyint;
    alter table `user1` add `birth` char(10) after `name`;
    alter table `user1` modify `gender` char(1);
    alter table `user1` modify `age` tinyint;
    alter table `user1` drop `gender`;
    
    #실습 2-7. 테이블 복사
    create table `user1copy` like `user1`;
    insert into `user1copy` select*from `user1`;
    
    #실습 2-8
    
    create table `TblUser` (
    `user_id`char(4),
    `user_name`varchar(10),
    `user_hp`char(13),
    `user_age`int,
    `user_addr` varchar(10)
    );
    drop table `tbluser`;
    
    insert into `tbluser` values ('p101', '김유신', '010-1234-1001', 25, '경남 김해시');
    insert into `tbluser` values ('p102', '김춘추', '010-1234-1002', 23, '경남 경주시');
    insert into `tbluser` set `user_id`='p103',
						      `user_name`='장보고',
                              `user_age`=31,
							  `user_addr`='전남 완도군';
	insert into `tbluser` set `user_id`='p104',
						      `user_name`='강감찬',                              
							  `user_addr`='서울시 중구';
    insert into `tbluser` set `user_id`='p105',
						      `user_name`='이순신',
                              `user_hp`='010-1234-1005',
                              `user_age`=50;   
                             
select*from `tbluser`;
                              
	create table `TblProduct`(
    `prod_no` char(4),
    `prod_name` varchar(10),
    `prod_price` int,
    `prod_stock` int,
    `prod_company` varchar(10),
    `prod_date` date
    );
    drop table `tblproduct`;
    
    insert into `tblproduct` values ('1001', '냉장고', 800000, 25, 'LG전자', '2022-01-06');
    insert into `tblproduct` values ('1002', '노트북', 1200000, 120, '삼성전자', '2022-01-07');
    insert into `tblproduct` values ('1003', '모니터', 350000, 35, 'LG전자', '2023-01-13');
    insert into `tblproduct` values ('1004', '세탁기', 1000000, 80, '삼성전자', '2021-01-01');
    insert into `tblproduct` values ('1005', '컴퓨터', 1500000, 20, '삼성전자', '2023-10-01');
    insert into `tblproduct` SET
							`prod_no`='1006',
                            `prod_name`='휴대폰',
                            `prod_price`=950000,
                            `prod_stock`=102;
    select*from `tblproduct`;                        
	#실습 2-9. 아래 SQL을 실행하시오
    select*from `tbluser`;
    select `user_name` from `tbluser`;
    select `user_name`, `user_hp` from `tbluser`;
    select*from `tbluser` where `user_id`='p102';
    select*from `tbluser` where `user_id`='p104' or `user_id`='p105';
    select*from `tbluser` where `user_addr`='부산시 금정구';
    select*from `tbluser` where `user_age`> 30;
    select*from `tbluser` where `user_hp`is null;
    update `tbluser` set `user_age`=42 where `user_id`='p104';
    update `tbluser` set `user_addr`='부산시 진구' WHERE 'user_id'='p105';
   	delete from `tbluser` where `user_id` = 'p103';
   
   select*from `tblproduct` ;
   select `prod_name` from `tblproduct`;
   select `prod_name`, `prod_company`, `prod_price` from `tblproduct`;
   select*from `tblproduct` where `prod_company` = 'LG전자';
   select*from `tblproduct` where `prod_company` = '삼성전자';
   update `tblproduct` set 
   						`prod_company`='삼성전자',
   						`prod_date`='2024-01-01'
   						where 
   						`prod_no`=1006;
    
    
    

    
    
    
    
                            