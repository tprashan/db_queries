create table Applicant (
	id number(5) primary key,
	name varchar(30) not null,
	dob date not null,
	resume blob
);

alter table Applicant add (gender char(1));
alter table Applicant add constraint check_gender check (gender in ('M','F','T')); 

create table Qualification(
	id number(7) primary key,
	applicant_id number(5),
	foreign key (applicant_id) references Applicant(id),
	degree varchar(50) not null,
	board varchar(50) not null,
	college varchar(50),
	year_of_passing number(5) not null,
	registration_no varchar(20) not null unique,
	percentage number(3) not null,
	document blob
);

create table Work_Experience(
	id number(7) primary key,
	applicant_id number(5),
	foreign key (applicant_id) references Applicant(id),
	company varchar(50) ,
	designation varchar(50) ,
	years_of_experience number(2)
);

create table Roles(
	id number(3) primary key,
	role varchar(15) not null
);

Create table Priveleges(
	id number(5) primary key,
	privelege varchar(50) not null
);

Create table Privelege_Access(
	id number(5) primary key,
	role_id number(3),
	foreign key(role_id) references Roles(id),
	privelege_id number(5),
	foreign key(privelege_id) references Priveleges(id)
);

Create table Telephonic_Interview(
	id number(5) primary key,
	applicant_id number(5),
	foreign key (applicant_id) references Applicant(id),
	date_and_time TIMESTAMP not null,
	feedback varchar(500),
	status char(10)
);

create table Centre_Category(
	id number(3) primary key,
	name varchar(30) not null
);

Create table Centres(
	code number(5) primary key,
	name varchar(50) not null,
	category_id number(3),
	foreign key(category_id) references Centre_Category(id),
	address varchar(50) not null,
	city varchar(30) not null,
	state varchar(30) not null,
	country varchar(30) not null,
	pincode number(10) not null
);

Create table Apptitude_Test(
	id number(5) primary key,
	centre_code number(5),
	foreign key (centre_code) references Centres(code),
	date_and_time TIMESTAMP not null,
	score number(3),
	feedback varchar(500),
	status char(10)
);

Create table Technical_Interview(
	id number(5) primary key,
	centre_code number(5),
	foreign key (centre_code) references Centres(code),
	date_and_time TIMESTAMP not null,
	feedback varchar(500),
	status char(10)
);

Create table Contact_Details(
	id number(5) primary key,
	applicant_id number(5),
	foreign key (applicant_id) references Applicant(id),
	email_id varchar(30),
	phone_number number(15),
	address varchar(50) not null,
	city varchar(30) not null,
	state varchar(30) not null,
	country varchar(30) not null,
	pincode number(10) not null
);


Create table Login(
	id number(5) primary key,
	email_id varchar(30) unique,
	password varchar(50),
	--foreign key (applicant_id) references Applicant(id),
);