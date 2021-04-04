-- Homework # 09

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT salaries.emp_no, employees.last_name, employees.first_name, employees.sex,salaries.salary
FROM salaries
INNER JOIN employees ON
salaries.emp_no=employees.emp_no;
--or 
SELECT em.emp_no, em.last_name, em.first_name, em.sex, sa.salary 
FROM employees em,salaries sa
WHERE em.emp_no=sa.emp_no
ORDER BY em.emp_no


-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) =1986;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, employees.emp_no, first_name, last_name
FROM dept_manager
INNER JOIN employees ON
dept_manager.emp_no=employees.emp_no
INNER JOIN departments ON
dept_manager.dept_no=departments.dept_no
--or
SELECT  d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees AS e,
(select dm.dept_no, dm.emp_no,dept.dept_name from dept_manager dm, departments dept
WHERE dm.dept_no = dept.dept_no ) d
WHERE e.emp_no = d.emp_no
ORDER BY e.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name,first_name, dept_name
FROM dept_emp
INNER JOIN employees ON
dept_emp.emp_no=employees.emp_no
INNER JOIN departments ON
departments.dept_no=dept_emp.dept_no
--or
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e,
(select de.emp_no, dept.dept_name from dept_emp de, departments dept
WHERE de.dept_no = dept.dept_no ) d
WHERE e.emp_no = d.emp_no
ORDER BY e.emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules'
	AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name,departments.dept_name
FROM employees 
INNER JOIN dept_emp ON
dept_emp.emp_no=employees.emp_no
INNER JOIN departments ON
departments.dept_no=dept_emp.dept_no
WHERE dept_name = 'Sales';
--or
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e,
(select de.emp_no, dept.dept_name from dept_emp de, departments dept
WHERE de.dept_no = dept.dept_no and  dept.dept_name ='Sales') d
WHERE e.emp_no = d.emp_no
ORDER BY e.emp_no;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name,departments.dept_name
FROM employees
INNER JOIN dept_emp ON
dept_emp.emp_no=employees.emp_no
INNER JOIN departments ON
departments.dept_no=dept_emp.dept_no
WHERE dept_name = 'Sales' OR dept_name ='Development';
--or
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e,
(select de.emp_no, dept.dept_name from dept_emp de, departments dept
WHERE de.dept_no = dept.dept_no and  dept.dept_name IN ('Sales', 'Development')) d
WHERE e.emp_no = d.emp_no
ORDER BY e.emp_no;

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) AS "frequence count of emplyee last names"
FROM employees
GROUP BY last_name
ORDER BY "frequence count of emplyee last names" desc;

--Epilogue (April Foolsday)
SELECT *
FROM employees
WHERE emp_no='499942';