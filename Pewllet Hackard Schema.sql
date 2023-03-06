-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Titles" (
    "title_id" Varchar(5)   NOT NULL,
    "title" Varchar(30)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Employees" (
    "emp_no" Integer,   NOT NULL,
    "emp_title_id" Varchar(30)   NOT NULL,
    "birth_date" Date   NOT NULL,
    "first_name" Varchar(50)   NOT NULL,
    "last_name" Varchar(50)   NOT NULL,
    "hire_date" Date   NOT NULL,
    "sex" Varchar(1)   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Departments" (
    "dept_no" Varchar(4)   NOT NULL,
    "dept_name" Varchar(30)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_manager" (
    -- Primary key is a Composite PK
    -- with dept_no and empl_no part of it
    "dept_no" Varchar(4)   NOT NULL,
    "empl_no" Integer   NOT NULL,
    CONSTRAINT "pk_Dept_manager" PRIMARY KEY (
        "dept_no","empl_no"
     )
);

CREATE TABLE "Dept_emp" (
    -- Primary key is a Composite PK
    -- with dept_no and empl_no part of it
    "dept_no" Varchar(4)   NOT NULL,
    "empl_no" Integer   NOT NULL,
    CONSTRAINT "pk_Dept_emp" PRIMARY KEY (
        "dept_no","empl_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" Integer   NOT NULL,
    "Salary" Integer   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_empl_no" FOREIGN KEY("empl_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_empl_no" FOREIGN KEY("empl_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

