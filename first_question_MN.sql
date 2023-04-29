-- 1. DOTAZ

CREATE OR REPLACE VIEW v_first_quest AS 
SELECT
	industry,
	payroll_year,
	payroll_value AS average_salary,
	LAG(payroll_value) OVER (PARTITION BY industry ORDER BY payroll_year) AS previous_year_salary
FROM t_matej_novak_project_sql_primary_final
GROUP BY 
	industry,
	payroll_year
ORDER BY
	industry,
	payroll_year
	
	
SELECT *,
		CASE
		WHEN previous_year_salary < average_salary THEN 'salary increased'
		ELSE 'salary decreased'
	END AS payroll_growth
FROM v_first_quest
WHERE payroll_year BETWEEN 2007 AND 2018;