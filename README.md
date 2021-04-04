# sql-challenge

This research project is on employees of the corporation from the 1980s and 1990s. The record is in six csv files. I design the **SQL** tables under **pgAdmin 4** to hold data in the CSVs and imported it into a SQL database called EmployeeSQL. 
  - Use the unique column as the **primary key** or create a **composite key** as the primary key.
  - Specify the data types and **foreign keys**.
  - Import each CSV file into the corresponding SQL table

**Queries**:
  - List the following details of each employee: employee number, last name, first name, sex, and salary.
  - List first name, last name, and hire date for employees who were hired in 1986.
  - List the department manager with the following information: department number, department name, the manager's employee number, last name, first name.
  - List the department of each employee with the following information: employee number, last name, first name, and department name.
  - List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
  - List all employees in the Sales department, including their employee number, last name, first name, and department name.
  - List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
  - In descending order, list the frequency count of employee last names, i.e., how many employees share each other's last name.

**Pandas** with **SQLalchemy**:
  - Import the SQL database into Pandas.
  - Plot salary data to showcase the findings.


File Organization
- Schemata.sql stores the table schemata, query.sql stores the queries.
- ERD.png shows the **ERD**
- A jupyter Notebook file shows the analysis on salary histogram and average salary by title in a bar chart.
