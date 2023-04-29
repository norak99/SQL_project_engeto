-- 3. DOTAZ

CREATE OR REPLACE VIEW v_third_quest AS 
SELECT
	product,
	payroll_year,
	price_value AS average_price,
	LAG(price_value) OVER (PARTITION BY product ORDER BY payroll_year) AS previous_year_price
FROM t_matej_novak_project_sql_primary_final
GROUP BY 
	product,
	payroll_year
ORDER BY
	product,
	payroll_year
	
SELECT *,
	((average_price - previous_year_price) / previous_year_price) * 100 AS procentual_difference
FROM
	v_third_quest;

CREATE OR REPLACE VIEW v_third_quest_2 AS 
SELECT
	product,
	payroll_year,
	price_value AS average_price,
	LAG(price_value) OVER (PARTITION BY product ORDER BY payroll_year) AS previous_year_price
FROM t_matej_novak_project_sql_primary_final
WHERE payroll_year IN (2006, 2018)
GROUP BY 
	product,
	payroll_year
ORDER BY
	product,
	payroll_year
	
SELECT *,
	((average_price - previous_year_price) / previous_year_price) * 100 AS procentual_difference
FROM
	v_third_quest_2;