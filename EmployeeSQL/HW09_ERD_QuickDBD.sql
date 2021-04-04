-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/xc0bXX
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "dept_no" varchar(10)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" varchar(10)   NOT NULL,
    "dept_no" varchar(10)   NOT NULL,
    "(dept_no," emp_no)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "(dept_no,"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(10)   NOT NULL,
    "emp_no" varchar(10)   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" varchar(10)   NOT NULL,
    "emp_title_id" varchar(10)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "sex" varchar(10)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" varchar(10)   NOT NULL,
    "salary" numeric(12,2)   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" varchar(10)   NOT NULL,
    "title" varchar(50)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "salaries" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");


-----------------------------------------------------------------------------------------------------
departments
-
dept_no PK varchar(10) 
dept_name  varchar(50)

dept_emp
-
emp_no varchar(10) FK - employees.emp_no
dept_no varchar(10) FK >- departments.dept_no
(dept_no, emp_no) PK

dept_manager
-
dept_no varchar(10) FK >- departments.dept_no
emp_no PK varchar(10) FK - employees.emp_no

employees
-
emp_no PK varchar(10) FK - salaries.emp_no
emp_title_id varchar(10) FK >- titles.title_id
birth_date DATE
first_name varchar(50)
last_name varchar(50)
sex varchar(10)
hire_date DATE

salaries
-
emp_no PK varchar(10)
salary numeric(12,2)

titles
-
title_id PK varchar(10) 
title varchar(50)