# 날짜 : 2024/07/11
# 이름 : 전규찬
# 내용 : SQL 연습문제4

#실습 4-1

create Database `Theater`;
create user 'theater'@'%' identified by '1234';
grant all privileges on Theater.* to 'theater'@'%';
flush privileges;

#실습 4-2

create table `Movies` (
	`movie_id` int auto_increment primary key,
    `title` varchar(30) not null,
    `genre` varchar(10) not null,
    `release_date` date not null
    );
    
create table `Customers` (
	`customer_id` int auto_increment primary key,
    `name` varchar(20) not null,
    `email` varchar(50) not null,
    `phone` char(13) not null
    );
    
create table `Bookings` (
	`booking_id` int primary key,
    `customer_id` int not null,
    `movie_id` int not null,
    `num_tickets` int not null,
    `booking_date` datetime not null
    );

#실습 4-3

INSERT INTO `Movies` (title, genre, release_date) VALUES
('쇼생크의 탈출', '드라마', '1994-10-14'),
('타이타닉', '로맨스', '1997-03-24'),
('탑건', '액션', '1987-07-16'),
('쥬라기공원', '액션', '1994-02-11'),
('글래디에이터', '액션', '2000-05-03'),
('시네마천국', '드라마', '1995-04-12'),
('미션임파서블', '액션', '1995-11-11'),
('노트북', '로맨스', '2003-08-23'),
('인터스텔라', 'SF', '2011-05-26'),
('아바타', 'SF', '2010-02-10');

INSERT INTO `Customers` (name, email, phone) VALUES
('김유신', 'kys@example.com', '010-1234-1001'),
('김춘추', 'kcc@example.com', '010-1234-1002'),
('장보고', 'jbg@example.com', '010-1234-1003'),
('강감찬', 'kgc@example.com', '010-1234-1004'),
('이순신', 'lss@example.com', '010-1234-1005');

INSERT INTO `Bookings` VALUES
(101, 1, 1, 2, '2023-01-10 00:00:00'),
(102, 2, 2, 3, '2023-01-11 00:00:00'),
(103, 3, 2, 2, '2023-01-13 00:00:00'),
(104, 4, 3, 1, '2023-01-17 00:00:00'),
(105, 5, 5, 2, '2023-01-21 00:00:00'),
(106, 3, 8, 2, '2023-01-21 00:00:00'),
(107, 1, 10, 4, '2023-01-21 00:00:00'),
(108, 2, 9, 1, '2023-01-22 00:00:00'),
(109, 5, 7, 2, '2023-01-23 00:00:00'),
(110, 3, 4, 2, '2023-01-23 00:00:00'),
(111, 1, 6, 1, '2023-01-24 00:00:00'),
(112, 3, 5, 3, '2023-01-25 00:00:00');



#실습 4-4

select title from `Movies`;

#실습 4-5

select * from `Movies` where genre = '로맨스';

#실습 4-6

select title, release_date
from `Movies`
where release_date >= '2010-01-01';

#실습 4-7

select booking_id, booking_date
from `Bookings` 
where num_tickets >= 3;

#실습 4-8

select * from Bookings where booking_date < '2023-01-20';

#실습 4-9

select * from movies where release_date between '1990-01-01' and '1999-12-31';

#실습 4-10

select * from bookings
order by booking_date desc
limit 3;

#실습 4-11

select title, release_date from movies
order by release_date asc
limit 1;

#실습 4-12

select
	concat(title, ' - ', release_date) as movie_info
from movies
where genre = '액션' and title like '%공원%'
order by release_date asc
limit 1;

#실습 4-13

select booking_date, title
from bookings
join movies
on bookings.movie_id = movies.movie_id
where customer_id = 2;

select booking_date, title
from bookings
join movies
using (movie_id)
where customer_id = 2;

#실습 4-14

select
	name,
    phone,
    booking_date,
    title
from bookings B
join customers C on B.customer_id = C.customer_id
join movies M on B.movie_id = M.movie_id;

#실습 4-15

select
	M.genre,
    avg(B.num_tickets) as avg_tickets
from bookings B
join movies M on B.movie_id = M.movie_id
group by M.genre;

#실습 4-16

select
	C.name,
    avg(B.num_tickets) as avg_tickets
from bookings B
join customers C on B.customer_id = C.customer_id
group by name;

#실습 4-17

select 
	C.name,
    sum(B.num_tickets) as `전체 예매 티켓 수`
from bookings B
join customers C on B.customer_id = C.customer_id
group by C.customer_id
order by `전체 예매 티켓 수` desc;

#실습 4-18

select
	booking_id,
    movie_id,
    name,
    booking_date
from bookings B
join customers C on B.customer_id = C.customer_id
order by B.booking_date asc
limit 1;

#실습 4-19---------------------생소함(서브쿼리문)

select
	genre, title, release_date
from movies
where (genre, release_date) in (
	select genre, Max(release_date)
    from movies
	group by genre	
);

#실습 4-20

select * from movies
where movie_id in (
	select movie_id from bookings
    where customer_id = (select customer_id from customers where name = '김유신')
);

#실습 4-21

select name, email from customers
where customer_id = (
	select customer_id
    from bookings
    group by customer_id
    order by sum(num_tickets) desc
    limit 1
);

#실습 4-22

select * from bookings
where num_tickets > (select avg(num_tickets) from bookings);

#실습 4-23

select 
	M.title, sum(B.num_tickets) as total_tickets
from bookings B
join movies M on B.movie_id = M.movie_id
group by title;

#실습 4-24

select
	c.name,
    sum(b.num_tickets) as total_tickets,
    avg(b.num_tickets) as avg_tickets
from bookings b
join customers c on b.customer_id = c.customer_id
group by name;

#실습 4-25

select
	c.customer_id,
    c.name,
    c.email,
    sum(b.num_tickets) as `예매 티켓수`
from bookings b
join customers c on b.customer_id = c.customer_id
group by c.name
order by `예매 티켓수` desc;

#실습 4-26

select
	name,
    title,
    num_tickets,
    booking_date
from bookings b
join customers c on b.customer_id = c.customer_id
join movies m on b.movie_id = m.movie_id
order by num_tickets desc;

#실습 4-27

select
	M.title,
    M.genre,
    sum(B.num_tickets) as `예매 티켓 수`,
    avg(B.num_tickets) as `평균 티켓 수`
from bookings B
join movies M on B.movie_id = M.movie_id
where M.genre = '액션'
group by title
order by `평균 티켓 수` desc
limit 4;

#실습 4-28

select
	B.customer_id,
    C.name,
    sum(num_tickets) as `ticket_total`
from bookings B
join customers C on B.customer_id = C.customer_id
group by customer_id
order by ticket_total desc;

#실습 4-29------------------복잡해..

select
	B.booking_id,
    B.customer_id,
    B.movie_id,
    MaxTickets.max_tickets
from bookings B
join (
	select movie_id, max(num_tickets) as max_tickets
    from bookings
    group by movie_id
) as MaxTickets
on B.movie_id = MaxTickets.movie_id and B.num_tickets = MaxTickets.max_tickets;

#실습 4-30

select
	B.booking_id,
    B.customer_id,
    C.name,
    M.title,
    M.genre,
    sum(B.num_tickets) as `예매 티켓 수`
from bookings B
join movies M on B.movie_id = M.movie_id
join customers C on B.customer_id = C.customer_id
group by M.title
having `예매 티켓 수` = (
	select max(total_tickets)
    from (
			select sum(B2.num_tickets) as total_tickets
			from bookings B2
			join movies M2 on B2.movie_id = M2.movie_id
			where M2.genre = M.genre
			group by M2.title
		 ) as SelectMAX
)
order by `예매 티켓 수` desc;