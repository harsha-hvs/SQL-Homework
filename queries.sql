-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employee.emp_no AS "Employee Number", employee.last_name AS "Last Name", employee.first_name AS "First Name", 
employee.gender AS "Gender", salary.salary AS "Salary"
FROM salaries AS salary INNER JOIN employees AS employee
ON employee.emp_no = salary.emp_no;

-- 2. List employees who were hired in 1986.

SELECT emp_no AS "Employee Number",
birth_date AS "Birth Date",
first_name AS "First Name",
last_name AS "Last Name",
gender AS "Gender",
hire_date AS "Hire Date"
FROM employees WHERE date_part('year', hire_date) = '1986'

-- 3. List the manager of each department with the following information:department number, 
-- department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT department.dept_no AS "Department Number", department.dept_name AS "Department Name",
manager.emp_no AS "Employee Number", employee.last_name AS "Last Name", employee.first_name AS "First Name",
manager.from_date AS "Start Date", manager.to_date AS "End Date"
FROM departments department
INNER JOIN dept_manager manager ON department.dept_no = manager.dept_no
JOIN employees employee ON manager.emp_no = employee.emp_no 

-- 4. List the department of each employee with the following information:
--    employee number, last name, first name, and department name.

SELECT employee.emp_no AS "Employee Number",
employee.last_name AS "Last Name",
employee.first_name AS "First Name",
department.dept_name AS "Department Name"
FROM employees employee INNER JOIN dept_emp dept
ON employee.emp_no = dept.emp_no 
INNER JOIN departments department
ON department.dept_no = dept.dept_no

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT emp_no AS "Employee Number",
birth_date AS "Birth Date",
first_name AS "First Name",
last_name AS "Last Name",
gender AS "Gender",
hire_date AS "Hire Date" FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name,
--    first name, and department name.

SELECT employee.emp_no AS "Employee Number",
employee.last_name AS "Last Name",
employee.first_name AS "First Name",
department.dept_name AS "Department Name"
FROM employees employee INNER JOIN dept_emp dept
ON employee.emp_no = dept.emp_no 
INNER JOIN departments department
ON department.dept_no = dept.dept_no
WHERE department.dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, including their employee number,
--    last name, first name, and department name.

SELECT employee.emp_no AS "Employee Number",
employee.last_name AS "Last Name",
employee.first_name AS "First Name",
department.dept_name AS "Department Name"
FROM employees employee INNER JOIN dept_emp dept
ON employee.emp_no = dept.emp_no 
INNER JOIN departments department
ON department.dept_no = dept.dept_no
WHERE department.dept_name = 'Sales' OR department.dept_name = 'Development'

-- 8. In descending order, list the frequency count of employee last names, 
--    i.e., how many employees share each last name.

SELECT last_name AS "Last Name", count(last_name) AS "Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Name Count" DESC

