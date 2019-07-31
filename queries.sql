-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employee.emp_no AS "Employee Number", employee.last_name AS "Last Name", employee.first_name AS "First Name", 
employee.gender AS "Gender", salary.salary AS "Salary" from salaries AS salary INNER JOIN employees AS employee
ON employee.emp_no = salary.emp_no;

-- 2. List employees who were hired in 1986.
SELECT emp_no AS "Employee Number",
birth_date AS "Birth Date",
first_name AS "First Name",
last_name AS "Last Name",
gender AS "Gender",
hire_date AS "Hire Date" from employees  where date_part('year', hire_date) = '1986'