prompt printing todays date

SELECT SYSDATE FROM DUAL;

conn / as sysdba;

-- drop user sms cascade;

create user stepApplicant identified by tripathi quota unlimited on MYTABLESPACE default tablespace MYTABLESPACE;

grant create session to sms;

grant resource to sms; 

conn stepApplicant/tripathi;

create table stepstudent (Id number(10) primary key, 
	Name varchar(50), 
	DOB Date, Address_1 varchar(200), 
	Address_2 varchar(200), City varchar(50), 
	State varchar(50), PinCode number(20), 
	ContactNo varchar(20), E_mailId varchar(200),
	Gender char(10), IsPH varchar(20),mark1 number(5),
	mark2 number(5),mark3 number(5),total number(5) );

create table Office (Id number(10) primary key, 
	Office_Name varchar(50),Dept_Id number(5) CONSTRAINT Dept_Id_u  UNIQUE,Dept_name varchar(20),
	Add_1 varchar(25),Add_2 varchar(25),Add_3 varchar(25));

create table empolyee (Id number(10) primary key, Name varchar(50),
	Email varchar(50), Account_No number(25),Dept_Id number(5),
	Gender varchar(50) NOT NULL,Office_id  number(20),
	foreign key (Dept_Id) references Office(Dept_Id),
	foreign key (Office_id) references Office(Id) );



insert into student values(10001,'prashant',TO_DATE('01-jan-2015', 'DD-MON-YY'),'8/8 juhi safed colony kanpur','8/8 juhi safed colony kanpur','Kanpur','Uttar pradesh', 208014,9696909604, 'prashantt9506@gmail.com', 'male', 'no',60,70,80,210);
insert into student values(10002,'brajesh',TO_DATE('01-feb-2015', 'DD-MON-YY'),'8/8 Barra 2 kanpur','8/8 Barra 2 kanpur.', 'Kanpur', 'uttar pradesh', 208014,9696909604, 'brajesh007bondkumar@gmail.com', 'male', 'no',50,40,70,160);
insert into student values(10003,'mohit',TO_DATE('01-jan-2011', 'DD-MON-YY'),'13/4 juhi safed colony kanpur','13/4 juhi safed colony kanpur.', 'Kanpur', 'uttar pradesh', 208014,9096786756, 'coolmohitgupta@gmail.com', 'male', 'no',70,50,60,180);
insert into student values(10004,'aman',TO_DATE('15-jan-2015', 'DD-MON-YY'),'8/8 juhi safed colony kanpur','8/8 juhi safed colony kanpur.', 'Kanpur', 'uttar pradesh', 208014, 7612341225, 'amant9506@gmail.com', 'male', 'no',50,60,75,185);
insert into student values(10005,'uday',TO_DATE('01-march-2015', 'DD-MON-YY'),'21/12 juhi safed colony kanpur','21/12 juhi safed colony kanpur.', 'Kanpur', 'uttar pradesh', 208014, 7676672314, 'udaypratap9506@gmail.com', 'male', 'no',70,60,60,190);
insert into student values(10006,'satayam',TO_DATE('01-jan-2013', 'DD-MON-YY'),'1/1 juhi safed colony kanpur','1/1 juhi safed colony kanpur.', 'Kanpur', 'uttar pradesh', 208014, 7676781226, 'satyamshukla9506@gmail.com', 'male', 'no',60,70,65,195);
insert into student values(10007,'vipin',TO_DATE('01-jan-2014', 'DD-MON-YY'),'12/34 juhi safed colony kanpur','12/34 juhi safed colony kanpur.', 'Kanpur', 'uttar pradesh', 208014, 7610238324, 'vipint9506@gmail.com', 'male', 'no',50,60,80,190);
insert into student values(10008,'Asha',TO_DATE('01-jan-2014', 'DD-MON-YY'),'8/8 juhi hari colony kanpur','8/8 juhi hari colony kanpur.', 'Kanpur', 'uttar pradesh', 208014, 9012241324, 'ashaupa@gmail.com', 'female', 'no',70,75,65,210);
insert into student values(10009,'pappu',TO_DATE('01-jan-1980', 'DD-MON-YY'),'13/1 juhi safed colony kanpur','13/1 juhi safed colony kanpur.', 'Kanpur', 'uttar pradesh', 208014, 9012351283, 'pappusingh9506@gmail.com', 'male', 'no',65,70,80,216);
insert into student values(10010,'komal',TO_DATE('01-jan-2015', 'DD-MON-YY'),'131/12 rajarampur kanpur','131/12 rajarampur kanpur.', 'Kanpur', 'uttar pradesh', 208032, 3423102318, 'komalm9506@gmail.com', 'male', 'no',70,80,70,220);

