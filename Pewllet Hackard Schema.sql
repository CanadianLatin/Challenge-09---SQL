DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Dept_emp;
DROP TABLE IF EXISTS Dept_manager;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Titles;

CREATE TABLE Titles (
    title_id Varchar(5)   NOT NULL,
    title Varchar(30)   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);

CREATE TABLE Employees (
    emp_no Integer NOT NULL,
    emp_title_id Varchar(30)   NOT NULL,
    birth_date Date   NOT NULL,
    first_name Varchar(50)   NOT NULL,
    last_name Varchar(50)   NOT NULL,
    sex Varchar(1)   NOT NULL,
    hire_date Date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Departments (
    dept_no Varchar(10)   NOT NULL,
    dept_name Varchar(30)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE Dept_manager (
    -- Primary key is a Composite PK
    -- with dept_no and empl_no part of it
    dept_no Varchar(10)   NOT NULL,
    emp_no Integer   NOT NULL,
    CONSTRAINT pk_Dept_manager PRIMARY KEY (
        dept_no,emp_no
     )
);

CREATE TABLE Dept_emp (
    -- Primary key is a Composite PK
    -- with dept_no and empl_no part of it
    emp_no Integer   NOT NULL,
    dept_no Varchar(10)   NOT NULL,
    CONSTRAINT pk_Dept_emp PRIMARY KEY (
        emp_no,dept_no
     )
);

CREATE TABLE Salaries (
    emp_no Integer   NOT NULL,
    salary Integer   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        emp_no
     )
);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES Titles (title_id);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_emp ADD CONSTRAINT fk_Dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_emp ADD CONSTRAINT fk_Dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);


ALTER DATABASE "Pewlett_Hackard" SET datestyle TO ISO, MDY;

