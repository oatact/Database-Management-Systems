/* --------------------------------------------------------------
--   Please fill in your information in this comment block --  
--   Student ID: 6288077
--   Fullname: Wasin Heesawat
--   Section: 3
------------------------------------------------------------- */
DROP DATABASE IF EXISTS tinycompany; 
CREATE DATABASE IF NOT EXISTS tinycompany;
USE tinycompany;
-- Department Table 
CREATE TABLE department(
	dnumber		INT 		 PRIMARY KEY,  -- dnumber is a primary key
	dname		VARCHAR(20)  NOT NULL,
	location	VARCHAR(100), -- location is nullable 
	CONSTRAINT chk_dnumber CHECK (dnumber >= 1 AND dnumber <=20 ) -- dnumber range from 1 to 20
);

-- Project Table 
CREATE TABLE project(
	pnumber		INT 		 PRIMARY KEY,  -- dnumber is a primary key
	pname		VARCHAR(50)  NOT NULL,
	dept_no	 	INT 		 NOT NULL,
	CONSTRAINT FK_DeptProj FOREIGN KEY (dept_no) REFERENCES department(dnumber)
);

-- Write your DDL for employee and assignment here 
-- Hint: Review the CREATE sequence, i.e., which tables should be created first

	create table employee(
	fname		varchar(20) not null,
    lname		varchar(20) not null,
    ssn			varchar(9),
    bdate		date,
    sex			varchar(1),
    salary		decimal(12,2),
    dept_no		int,
	primary key (ssn),
    constraint FK_EmpDept foreign key (dept_no) references department(dnumber)
);

	create table assignment(
	essn		varchar(9),
	projno		int,
    hours		decimal(9,2),
    hourlyrate	decimal(9,2),
    primary key (essn, projno),
    constraint FK_AsmEmp foreign key (essn) references employee(ssn),
	constraint FK_AsmPrj foreign key (projno) references Project(pnumber)
);
 




