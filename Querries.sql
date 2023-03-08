-- List the employee number, last name, first name, sex, and salary of each employee.

--OPTION 1 USING JOIN

select e.emp_no as "Employee Number", 
		e.last_name as "Employee Last Name", 
		e.first_name as "Employee First Name",
		e.sex as "Employee Gender",
		s.Salary as "Employee Salary"
from employees e
join salaries s On
e.emp_no = s.emp_no;


-- Option 2 NOT Using JOIN (Same results as avove)

Select 	e.emp_no as "Employee Number", 
		e.last_name as "Employee Last Name", 
		e.first_name as "Employee First Name",
		e.sex as "Employee Gender",
		s.Salary as "Employee Salary"
from employees e, salaries s
where e.emp_no = s.emp_no ;


-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

-- ANSWER TOTAL : 36150 employess where hired in 1986
Select 	e.last_name as "Employee Last Name", 
		e.first_name as "Employee First Name",
		e.hire_date as "Employee Hiring Date"
from employees e
where hire_date Between '01/01/1986' and '12/31/1986'
order by hire_date desc;

--3. List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name

Select 	d.dept_no as "Department Number",
		d.dept_name as "Department Name",
		dm.emp_no as "Manager Employee Number",
		e.first_name as "Manager First Name",
		e.last_name as "Manager Last Name"
from 	Departments d, 
		Dept_manager dm,
		Employees e
where 	d.dept_no = dm.dept_no 
		and dm.emp_no = e.emp_no;


-- *QUESTION** Is it ok that they are more rows than employees because there is duplicated values in department employees
-- and if thats the case shouldnt be 1 to 1.

-- 4. List the department number for each employee 
-- along with that employee’s employee number, last name, first name, and department name.

Select 	--e.emp_no "Employee Number", count(e.emp_no) 
		e.emp_no "Employee Number",
		e.first_name as "Employee First Name",
		e.last_name as "Employee Last Name",
		d.dept_no as "Department Number",
		d.dept_name as "Department Name"
from 	Departments d, 
		Dept_emp de,
		Employees e
where 	(d.dept_no = de.dept_no and de.emp_no = e.emp_no)
		--and (e.emp_no  = 10029 or e.emp_no  = 10010)
;		
--group by e.emp_no 


--List first name, last name, and sex of each employee whose 
--first name is Hercules and whose last name begins with the letter B.

Select 	e.last_name as "Employee Last Name", 
		e.first_name as "Employee First Name",
		e.sex as "Employee Gender"
from employees e
where e.first_name like ('Hercules') and e.last_name like 'B%' ;


-- 6. List each employee in the Sales department, 
-- including their employee number, last name, and first name

Select 	e.emp_no "Employee Number",
		e.first_name as "Employee First Name",
		e.last_name as "Employee Last Name",
		d.dept_name as "Department Name"
from 	Departments d, 
		Dept_emp de,
		Employees e
where 	(d.dept_no = de.dept_no and de.emp_no = e.emp_no)
		and d.dept_name = 'Sales';
		
-- 7 List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name

Select 	e.emp_no "Employee Number", 
		e.first_name as "Employee First Name",
		e.last_name as "Employee Last Name",
		d.dept_name as "Department Name"
from 	Departments d, 
		Dept_emp de,
		Employees e
where 	(d.dept_no = de.dept_no and de.emp_no = e.emp_no)
		and (d.dept_name = 'Sales' or d.dept_name like 'Development%');
	
-- 8. List the frequency counts, in descending order, 
-- of all the employee last names (that is, how many employees share each last name).

select e.last_name as "Employee Last Name", count(e.last_name) AS "Frequency" 
from Employees e
group by e.last_name
order by "Frequency" DESC;
		