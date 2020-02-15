--delete existing tables with the same name, if necessary
drop table departments;
drop table dept_emp;
drop table dept_manager;
drop table employees;
drop table salaries;
drop table titles;

--create tables
CREATE TABLE "departments" (
    "dept_no" varchar(4) primary key  NOT NULL,
    "dept_name" varchar(24)   NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(4)   NOT NULL,
    "from_date" varchar(10)   NOT NULL,
    "to_date" varchar(10)   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(4)   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" varchar(10)   NOT NULL,
    "to_date" varchar(10)   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" int  primary key NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "gender" varchar(1)   NOT NULL,
    "hire_date" varchar(10)   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" int primary key  NOT NULL,
    "salary" int   NOT NULL,
    "from_date" varchar(10)   NOT NULL,
    "to_date" varchar(10)   NOT NULL
);

CREATE TABLE "titles" (
	"emp_no" int   NOT NULL,
    "title" varchar(30)   NOT NULL,
    "from_date" varchar(10)   NOT NULL,
    "to_date" varchar(10)   NOT NULL
);

--link csv files to respective tables
copy departments from '\Users\Jake\Desktop\Homework9\sql-challenge\EmployeeSQL\Data\departments.csv'
delimiter ',' csv header;

copy dept_emp from '\Users\Jake\Desktop\Homework9\sql-challenge\EmployeeSQL\Data\dept_emp.csv'
delimiter ',' csv header;

copy dept_manager from '\Users\Jake\Desktop\Homework9\sql-challenge\EmployeeSQL\Data\dept_manager.csv'
delimiter ',' csv header;

copy employees from '\Users\Jake\Desktop\Homework9\sql-challenge\EmployeeSQL\Data\employees.csv'
delimiter ',' csv header;

copy salaries from '\Users\Jake\Desktop\Homework9\sql-challenge\EmployeeSQL\Data\salaries.csv'
delimiter ',' csv header;

copy titles from '\Users\Jake\Desktop\Homework9\sql-challenge\EmployeeSQL\Data\titles.csv'
delimiter ',' csv header;

--view all tables
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;