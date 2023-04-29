-- PRIMÁRNÍ TABULKA 

CREATE OR REPLACE
TABLE t_matej_novak_project_SQL_primary_final AS
SELECT
	avg(cp.value) AS price_value,
	cp.category_code,
	YEAR(cp.date_from) AS year_price,
	cpay.id AS payroll_id,
	avg(cpay.value) AS payroll_value,
	cpay.value_type_code,
	cpay.payroll_year,
	cpay.industry_branch_code,
	cpc.name AS product,
	cpib.name AS industry,
	e.GDP AS HDP
FROM
	czechia_price AS cp
JOIN czechia_payroll AS cpay ON
	YEAR(cp.date_from) = cpay.payroll_year
JOIN czechia_payroll_industry_branch AS cpib ON
	cpay.industry_branch_code = cpib.code
JOIN czechia_price_category AS cpc ON
	cp.category_code = cpc.code
JOIN economies AS e ON
	cpay.payroll_year = e.`year`
WHERE
	value_type_code = 5958
	AND cp.region_code IS NULL
	AND e.country = 'Czech republic'
GROUP BY
	category_code,
	payroll_year,
	industry_branch_code;

SELECT * FROM t_matej_novak_project_sql_primary_final;
	
-- SEKUNDÁRNÍ TABULKA

CREATE OR REPLACE
TABLE t_matej_novak_project_SQL_secondary_final AS
SELECT
	e.country,
	e.GDP,
	e.gini,
	e.population,
	e.`year`
FROM
	economies e
JOIN countries c
    ON
	e.country = c.country
WHERE
	c.continent = 'europe'
	AND e.year BETWEEN 2006 AND 2018
ORDER BY
	country,
	`year`;

SELECT *
FROM t_matej_novak_project_SQL_secondary_final;