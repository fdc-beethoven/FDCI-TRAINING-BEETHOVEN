use employees;
SELECT * from employees; --1

SELECT * from employees WHERE last_name = 'Piveteau'; --2

SELECT * from employees ORDER BY hire_date ASC; --3

SELECT COUNT(*) from employees; --4

SELECT COUNT(*),YEAR(hire_date) from employees GROUP BY YEAR(hire_date); --5

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees AS e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no; --6

SELECT e.emp_no,e.first_name, e.last_name, t.title
FROM employees AS e
LEFT JOIN titles AS t ON e.emp_no = t.emp_no; --7

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name, s.salary
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
JOIN salaries AS s ON e.emp_no = s.emp_no
WHERE d.dept_no = 'd007' AND s.salary > (SELECT AVG(salary) from salaries); --8

SELECT e.emp_no AS emp_no, e.first_name AS first_name, e.last_name AS last_name, COUNT(t.title) AS title_count
FROM employees e
LEFT JOIN titles t ON e.emp_no = t.emp_no
GROUP BY e.emp_no; --9

SELECT e.emp_no, e.first_name, e.last_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
WHERE de.dept_no = 'd005' AND de.to_date = '9999-01-01'; --10

SELECT d.dept_no, d.dept_name, AVG(s.salary)
FROM departments AS d
JOIN dept_emp AS de ON d.dept_no = de.dept_no
JOIN salaries AS s ON de.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
GROUP BY d.dept_no; --11

SELECT e.emp_no, e.first_name, e.last_name, m.first_name, m.last_name
FROM employees AS e
LEFT JOIN dept_emp AS de ON e.emp_no = de.emp_no
LEFT JOIN dept_manager AS dm ON de.dept_no = dm.dept_no 
    AND de.from_date <= dm.to_date 
    AND (de.to_date >= dm.from_date OR de.to_date = '9999-01-01')
LEFT JOIN employees AS m ON dm.emp_no = m.emp_no; --12



SELECT 
    e1.emp_no AS emp_no1, CONCAT(e1.first_name, ' ', e1.last_name) AS f_name1, 
    e2.emp_no AS emp_no2, CONCAT(e2.first_name, ' ', e2.last_name) AS f_name2, 
    e1.birth_date AS shared_birth_date
FROM employees AS e1
INNER JOIN employees AS e2 ON e1.birth_date = e2.birth_date AND e1.emp_no < e2.emp_no; --13

SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name, 
    CASE 
        WHEN de.dept_no IS NOT NULL THEN 'Yes'
        ELSE 'No'
    END AS worked_in_sales
FROM 
    employees e
LEFT JOIN 
    (SELECT DISTINCT emp_no
     FROM dept_emp AS de
     INNER JOIN departments AS d ON de.dept_no = d.dept_no
     WHERE d.dept_no = 'd007') AS sales_dept ON e.emp_no = sales_dept.emp_no
ORDER BY 
    e.emp_no; --14

SELECT d.dept_no, d.dept_name, MAX(s.salary)
FROM departments AS d
JOIN dept_emp AS de ON d.dept_no = de.dept_no
JOIN salaries AS s ON de.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
GROUP BY d.dept_no, d.dept_name; --15