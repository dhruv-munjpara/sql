create database tops_date_time;
use tops_date_time;
create table date_example(id int primary key,d_name varchar(50),visit_date date);
insert into date_example(id,d_name,visit_date) values (1,"dhruv","2025-10-23"),(2,"jdnd","2026-01-17"),(3,"eeee","2024-09-10");

select date(now());
select now();
select d_name,year(visit_date) as yearonly,month(visit_date) as monthonly, day(visit_date) as dayonly from date_example;