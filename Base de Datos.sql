-- Conteo General 
use employees;
select count(emp_no) as cantidad_empleados from employees;

-- Salarios Extremos
use salaries;
SELECT MAX(salary), MIN(salary) FROM salaries;

-- Promedio Salarial
use salary;
SELECT AVG(salary) FROM salaries;

-- Agrupación por Género
use gender;
SELECT gender, COUNT(*) FROM employees GROUP BY gender;

-- Conteo de Cargo
use title;
SELECT title, COUNT(*) AS total_empleados FROM titles GROUP BY title ORDER BY total_empleados DESC;

-- Filtro de Grupos
use title;
SELECT title, COUNT(*) AS total_empleados FROM titles GROUP BY title HAVING total_empleados > 75000;

-- Agrupación Múltiple
use title;
SELECT t.title, e.gender, COUNT(*) AS total_por_genero FROM employees AS e JOIN titles AS t ON e.emp_no = t.emp_no GROUP BY t.title, e.gender;

-- Nombres de Departamentos
use emp_no;
SELECT e.emp_no, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01';

-- Empleados de un Departamento Específico
use first_name;
SELECT e.first_name, e.last_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Marketing' AND de.to_date = '9999-01-01';

-- Gerentes Actuales
use emp_no;
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees AS e
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
JOIN departments AS d ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01';

-- Salario por Departamento
use dept_name;
SELECT d.dept_name, AVG(s.salary) AS promedio_salarial
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE s.to_date = '9999-01-01' AND de.to_date = '9999-01-01'
GROUP BY d.dept_name;

-- Historial de Cargos de un Empleado
use title;
SELECT title, from_date, to_date FROM titles WHERE emp_no = 10006;

-- Departamentos sin Empleados
use dept_name;
SELECT d.dept_name FROM departments AS d LEFT JOIN dept_emp AS de ON d.dept_no = de.dept_no WHERE de.emp_no IS NULL;

-- Salario Actual del Empleado
use first_name;
SELECT e.first_name, e.last_name, s.salary
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01';

-- Salarios por Encima del Promedio
use first_name;
SELECT e.first_name, e.last_name, s.salary
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
AND s.salary > (SELECT AVG(salary) FROM salaries WHERE to_date = '9999-01-01');

-- Nombres de los Gerentes
use first_name;
SELECT first_name, last_name FROM employees WHERE emp_no IN (SELECT emp_no FROM dept_manager);

-- Empleados que no son Gerentes
use first_name;
SELECT first_name, last_name FROM employees WHERE emp_no NOT IN (SELECT emp_no FROM dept_manager);

-- Último Empleado Contratado
use fist_name;
SELECT first_name, last_name, hire_date FROM employees ORDER BY hire_date DESC LIMIT 1;

-- Jefes del Departamento de "Development
use fisrt_name;
SELECT e.first_name, e.last_name
FROM employees AS e
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
JOIN departments AS d ON dm.dept_no = d.dept_no
WHERE d.dept_name = 'Development';

-- Empleados con el Salario Máximo
use  first_name;
SELECT e.first_name, e.last_name, s.salary
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
WHERE s.salary = (SELECT MAX(salary) FROM salaries);

-- Nombres Completos
use first_name;
SELECT CONCAT(first_name, ' ', last_name) AS nombre_completo FROM employees LIMIT 100;

-- Antigüedad del Empleado: 
use emp_no;
SELECT emp_no, DATEDIFF(CURDATE(), hire_date) / 365.25 AS antiguedad_en_años FROM employees;

-- Categorización de Salarios 
use salary;
SELECT salary,
    CASE
        WHEN salary < 50000 THEN 'Bajo'
        WHEN salary BETWEEN 50000 AND 90000 THEN 'Medio'
        ELSE 'Alto'
    END AS categoria_salarial
FROM salaries
WHERE to_date = '9999-01-01';

-- Mes de Contratación
use hire_date;
SELECT MONTH(hire_date) AS mes_contratacion, COUNT(*) AS total_empleados
FROM employees
GROUP BY mes_contratacion
ORDER BY mes_contratacion;

-- Iniciales de Empleados
use first_name;
SELECT CONCAT(LEFT(first_name, 1), '.', LEFT(last_name, 1), '.') AS iniciales FROM employees;

-- Departamento con el Mejor Salario Promedio
use dept_name;
SELECT d.dept_name, AVG(s.salary) AS promedio_salarial
FROM salaries AS s
JOIN dept_emp AS de ON s.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE s.to_date = '9999-01-01' AND de.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY promedio_salarial DESC
LIMIT 1;

-- Gerente con Más Tiempo en el Cargo

SELECT e.first_name, e.last_name, DATEDIFF(dm.to_date, dm.from_date) AS dias_en_cargo
FROM employees AS e
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
ORDER BY dias_en_cargo DESC
LIMIT 1;

-- Incremento Salarial por Empleado
SELECT
    (SELECT salary FROM salaries WHERE emp_no = 10001 ORDER BY to_date DESC LIMIT 1) -
    (SELECT salary FROM salaries WHERE emp_no = 10001 ORDER BY from_date ASC LIMIT 1) AS incremento_salarial;

-- Empleados Contratados el Mismo Día
SELECT e1.first_name, e1.last_name, e2.first_name, e2.last_name, e1.hire_date
FROM employees AS e1
JOIN employees AS e2 ON e1.hire_date = e2.hire_date AND e1.emp_no <> e2.emp_no
ORDER BY e1.hire_date;

 -- El Ingeniero Mejor Pagado
 SELECT e.first_name, e.last_name, s.salary
FROM employees AS e
JOIN titles AS t ON e.emp_no = t.emp_no
JOIN salaries AS s ON e.emp_no = s.emp_no
WHERE t.title = 'Senior Engineer' AND s.to_date = '9999-01-01'
ORDER BY s.salary DESC
LIMIT 1;
 