-- 2. DOTAZ

SELECT
	product,
	payroll_year,
	avg(price_value) AS avereage_price,
	avg(payroll_value) AS average_payroll, 
	round(avg(payroll_value) / avg(price_value)) AS average_ks
FROM
	t_matej_novak_project_sql_primary_final
WHERE
	category_code IN (114201, 111301)
	AND payroll_year IN (2006, 2018)
GROUP BY
	payroll_year,
	product
ORDER BY
	product,
	payroll_year;