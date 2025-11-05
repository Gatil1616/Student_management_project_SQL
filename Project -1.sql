
# Project -1

create database pro;
use pro;
show tables;
create table Students(
student_id int primary key,
firstName varchar(15),
lastName varchar(15),
age int,
gender char(1),
dept varchar(50));

create table courses(
course_id int primary key,
course_name varchar(20),
credits int);

create table enrollments(
enrollment_id int primary key,
student_id int,
course_id int,
marks float,
grade char(1));

create table departments1(
dept_id int primary key,
dept_name varchar(50));

INSERT INTO Students VALUES
(101, 'Ravi', 'Kumar', 20, 'M', 1),
(102, 'Sneha', 'Patel', 21, 'F', 1),
(103, 'Arjun', 'Mehta', 22, 'M', 2),
(104, 'Priya', 'Sharma', 20, 'F', 3),
(105, 'Karan', 'Singh', 23, 'M', 4),
(106, 'Aditi', 'Verma', 21, 'F', 5),
(107, 'Rahul', 'Nair', 22, 'M', 1),
(108, 'Pooja', 'Iyer', 20, 'F', 2),
(109, 'Vikas', 'Rathore', 23, 'M', 3),
(110, 'Neha', 'Gupta', 21, 'F', 5);



INSERT INTO courses VALUES
(201, 'Database Systems', 4),
(202, 'Digital Electronics', 3),
(203, 'Thermodynamics', 4),
(204, 'Structural Analysis', 3),
(205, 'Data Structures', 4),
(206, 'Operating Systems', 3),
(207, 'Computer Networks', 3);


INSERT INTO enrollments VALUES
(301, 101, 201, 88, 'A'),
(302, 101, 205, 75, 'B'),
(303, 102, 201, 92, 'A'),
(304, 103, 202, 67, 'C'),
(305, 104, 203, 80, 'B'),
(306, 105, 204, 73, 'B'),
(307, 106, 205, 95, 'A'),
(308, 107, 206, 85, 'A'),
(309, 108, 202, 78, 'B'),
(310, 109, 203, 82, 'B'),
(311, 110, 207, 90, 'A'),
(312, 107, 205, 88, 'A'),
(313, 102, 206, 84, 'A'),
(314, 104, 207, 79, 'B');

INSERT INTO departments1 VALUES
(1, 'Computer Science'),
(2, 'Electronics'),
(3, 'Mechanical'),
(4, 'Civil'),
(5, 'Information Technology');


select c.course_name,avg(marks) as avg_marks
from courses as c 
inner join enrollments as e 
on c.course_id=e.course_id
group by c.course_name;

select s.firstName,s.lastName,e.marks
from Students as s
inner join enrollments as e
on s.student_id=e.student_id
where marks>80;

select s.firstName,s.LastName,e.student_id
from Students as s
left join enrollments as e
on s.student_id=e.student_id
where e.student_id is null;



select d.dept_name,count(student_id) as total_students
from Students as s
inner join departments1 as d
on s.dept=d.dept_id
group by dept_name;
use pro;
delimiter //
create trigger grade_trig
before insert on enrollments
for each row
begin 
if new.marks>=90 then set new.grade='A';
elseif new.marks>=80 then set new.grade='B';
else
set new.grade='C';
end if;
end //

select * from enrollments;


create view top_st as
select  s.firstName,s.lastName,s.student_id,e.marks
from Students as s
inner join enrollments as e
on s.student_id=e.student_id
where e.marks>85;

select *from top_st;








