-- Homework # 09
-- List out the column names of all the tables
--departments: dept_no, dept_name
--dept_emp:emp_no,dept_no
--dept_manager:dept_no, emp_no
--employees:emp_no, emp_title_id, birth_date,first_name, last_name, sex, hire_date
--salaries:emp_no, salary
--titles: title_id, title

DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE departments (dept_no character varying(5) NOT NULL,dept_name character varying(45) NOT NULL);
CREATE TABLE dept_emp (emp_no integer NOT NULL,dept_no character varying(5) NOT NULL);
CREATE TABLE dept_manager (dept_no character varying(5) NOT NULL,emp_no integer NOT NULL);
CREATE TABLE employees (emp_no integer NOT NULL,emp_title_id character varying(5) NOT NULL,birth_date DATE NOT NULL, 
						first_name character varying(45) NOT NULL,last_name character varying(45) NOT NULL, 
						sex character varying(5) NOT NULL, hire_date DATE NOT NULL);
CREATE TABLE salaries (emp_no integer NOT NULL,salary integer NOT NULL);
CREATE TABLE titles (title_id character varying(5) NOT NULL,title character varying(45) NOT NULL);