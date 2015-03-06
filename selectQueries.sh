# *****************

# ****************** connecting dba   ******************;
conn /as sysdba;

# ****************** create new user  ******************;
create user prashant identified by tripathi quota unlimited on users;

# ****************** select table space for user_table ******************;
select tablespace_name from usertablespaces; 

# ****************** for dicconnect   ******************;
disconnect;

# ****************** for deleting an user   *************;
drop user prashant;

# ****************** for select table data *****************;
select * from student;
# ************************************ to see table fields ****************************;
 desc emp_backup;

# ****************** for select all table_name that a user have ***********************;
select table_name from user_tables;
# *******************  for select rows  *******************************;
select * from employee where rownum<3;

# ******************* for select values from different table  ******************;
select e.id,e.name,d.dept_name from employee e,department d where e.dept_id=d.id;

# ********************* or we select values from different table  *******************;
select e.id,e.name,d.dept_name from employee e join department d on(e.dept_id=d.id);

# ********************* or we select values from different table if column are same *******************;
select e.id,e.name,d.dept_name from employee e join department d on dept_id;

# *************************** for cross join **************************************
select e.id,e.name,d.id,d.dept_name from department d,employee e;
select count(*) from employee,department;

# ****************************
select e.name,e.id,e.pan_number,e.gender,e.cell_phone from employee e , department d where e.dept_id=d.id and d.dept_name='PRODUCTION';

select sum(e.salary)from department d,employee e where e.gender='F' and d.dept_name='SALES' and e.dept_id=d.id;

select avg(e.salary)from department d,employee e where e.gender='M' and d.dept_name='MARKETING' and e.dept_id=d.id;

select avg(e.salary)from department d,employee e where (d.dept_name='SALES' or d.dept_name='MARKETING') and e.dept_id=d.id;

select e.name, d.dept_name from department d,employee e where e.dept_id=d.id;

# *********************** left Right and full outer join  *************************************;

select e.name, d.dept_name from employee e join department d on (e.dept_id = d.id);

select e.name, d.dept_name from employee e left join department d on (e.dept_id = d.id);

select e.name, d.dept_name from employee e LEFT OUTER join department d on (e.dept_id = d.id);

select e.name, d.dept_name from employee e right join department d on (e.dept_id = d.id);

select e.name, d.dept_name from employee e full join department d on (e.dept_id = d.id);

select e.name from employee e join department d on (e.dept_id = d.id) 
	where d.dept_name='PRODUCTION' or d.dept_name='SALES';
					OR

select e.name from employee e join department d on (e.dept_id = d.id) 
	where d.dept_name IN('PRODUCTION','SALES');

select e.name from employee e join department d on (e.dept_id = d.id) 
	where d.dept_name NOT IN('PRODUCTION','SALES');

select e.* from employee e join department d on (e.dept_id = d.id) 
	where d.dept_name='PRODUCTION';

# ********************************** for view database **********************************

conn /as sysdba;

grant create view to emp_user;

conn emp_user/password;

create view production_employee AS
 select e.* from employee e join department d on (e.dept_id = d.id) where d.dept_name='PRODUCTION';

 # ********************************** create view *****************************************
create or replace view sales_employee AS
 select e.* from employee e join department d on (e.dept_id = d.id) where d.dept_name='SALES';


# ********************************** for limited access of another user **********************************
					select * from tab;
# As sysdba
CREATE user reporter;
# As emp_user
CREATE OR REPLACE view emp_user.production_employee;
# As emp_user
GRANT select on production_employee to reporter;
# As reporter

# As emp_user.................to see current views
select * from user_views;
# As emp_user.................to see current views
describe user_views;
# As emp_user.................to see all views
select * from all_views;

# As reporter
select user_view from owner.emp_user;
# ****************************** synonym *************************************************************
 create synonym production for emp_user.production_employee;



# ********************* SETS **************************************************
# ********************* set Union  ********************************************
 select name from production_employee union select name from sales_employee;

 select name from production_employee union all select name from sales_employee;

# ********************* set  intersect  ********************************************
  select name from production_employee intersect select name from sales_employee;

# ********************* set  minus  ********************************************
 select name from production_employee minus select name from sales_employee;
  select id,name from production_employee minus select id,name from sales_employee;

# ***********************************  for create new table from exist table ***********************;
 create table manager as select id,name from employee;
 create table manager as select * from employee where 1=2;

 # ********************************* select        ********************************************;
 select e.id,e.name,mgr.name from employee e, manager mgr where e.mgr_id = mgr.id;
 
 select e.id,e.name,m.name from employee e join manager m on (e.mgr_id = m.id);

 select e.id,e.name,d.dept_name,m.name from employee e join employee m on (e.mgr_id = m.id)
 			join department d on (e.dept_id = d.id);

 select e.id,e.name,d.dept_name,m.name from employee e, employee m,department d
 			where e.mgr_id = m.id and e.dept_id = d.id;
