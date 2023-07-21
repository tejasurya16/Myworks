create table employee(
emp_id int PRIMARY KEY,
first_name varchar(20),
last_name VARCHAR(40),
birth_date date,
sex varchar(1),
salary int,
super_id int,
branch_id int);

create table branch(
branch_id int primary key,
branch_name varchar(40),
mgr_id int,
mgr_start_date date,
foreign key(mgr_id) REFERENCES employee (emp_id) on delete set null );

alter table employee add foreign key (branch_id) references branch(branch_id) on delete set null;

alter table employee add foreign  key(super_id) references employee(emp_id) on delete set null;


CREATE TABLE client(
client_id int primary key,
client_name varchar(40),
branch_id int,
foreign key(branch_id) references branch(branch_id) on delete set null);

create table works_with(
emp_id int,
client_id int,
total_sales int,
foreign key (emp_id) references employee (emp_id) on delete cascade,
foreign key (client_id) references client(client_id) on delete cascade);

create table branchsupplier(
branch_id int,
supplier_name varchar(40),
supply_type varchar(40),
primary key (branch_id,supplier_name),
foreign key (branch_id) references branch(branch_id) on delete cascade);
drop table branchsupplier;
select*from employee;
select*from branch;
select*from client;
select*from works_with;
select*from branchsupplier;
insert into employee values(100,'david','wallance','1964-03-15','m',250000,null,null);


insert into branch values(1,'corporate',100,'2006-02-09');


update employee
set branch_id=1
where emp_id=100;

insert into employee values(101,'jan','levinson','1961-05-11','f',110000,100,1);

insert into employee values(102,'michael','scott','1964-03-15','m',75000,100,null);

insert into branch values(2,'scranton',102,'1992-04-06');

update employee
set branch_id=2
where emp_id=102;

insert into employee values(103,'angela','martin','1971-06-25','f',63000,102,2);

insert into employee values(104,'kelly','kapoor','1980-02-05','f',55000,102,2);

insert into employee values(105,'stanley','hudson','1958-02-19','m',69000,102,2);

insert into employee values(106,'josh','porter','1969-09-05','m',78000,100,null);

insert into branch values(3,'stmford',106,'1998-02-13');

update employee
set branch_id=3
where emp_id=106;

insert into employee values(107,'andy','bernard','1973-07-22','m',65000,106,3);

insert into employee values(108,'jim','halpert','1978-10-01','m',71000,106,3);

insert into client values(400,'dunmore high school',2);
insert into client values(401,'lackawanacountry',2);
insert into client values(402,'fedex',3);
insert into client values(403,'john daly law,llc',3);
insert into client values(404,'scranton whitepages',2);
insert into client values(405,'timesnewspaper',3);
INSERT INTO Client values(406,'fedex',2);

insert into works_with values(105,400,55000);
insert into works_with values(102,401,267000);
insert into works_with values(108,402,22500);
insert into works_with values(107,403,5000);
insert into works_with values(108,403,12000);
insert into works_with values(105,404,33000);
insert into works_with values(107,405,26000);
insert into works_with values(102,406,15000);
insert into works_with values(105,406,130000);

insert into branchsupplier values(2,'hammmermill','paper');
insert into branchsupplier values(2,'uni-ball','writting utensils');
insert into branchsupplier values(3,'patriot paper','paper');
insert into branchsupplier values(2,'j.t.forms&labels','customforms');
insert into branchsupplier values(3,'uniball','writting utensils');
insert into branchsupplier values(3,'hammer mill','paper');
insert into branchsupplier values(3,'stamford labels','custom forms');


select works_with.total_sales
from works_with
where total_sales >30000;

select employee.first_name,employee.last_name
from employee
where employee.emp_id in (
select works_with.emp_id
from works_with
where total_sales >30000);

select branch.branch_id
from branch
where branch.mgr_id=102;


delete from branch
where branch_id=2;

select*from branchsupplier;



 

  
  













