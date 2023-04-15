-- HLAVNÍ TABULKA 

CREATE OR REPLACE
TABLE t_matej_novak_project_SQL_primary_final AS
SELECT
	avg(cp.value) AS price_value,
	cp.category_code,
	DATE_FORMAT(cp.date_from, '%Y') AS year_price,
	cpay.id AS payroll_id,
	avg(cpay.value) AS payroll_value,
	cpay.value_type_code,
	cpay.payroll_year,
	cpay.industry_branch_code,
	cpc.name AS product,
	cpib.name AS industry,
	e.GDP AS hdp
FROM
	czechia_price AS cp
JOIN czechia_payroll AS cpay ON
	DATE_FORMAT(cp.date_from, '%Y') = cpay.payroll_year
JOIN czechia_payroll_industry_branch AS cpib ON
	cpay.industry_branch_code = cpib.code
JOIN czechia_price_category AS cpc ON
	cp.category_code = cpc.code
JOIN economies AS e ON cpay.payroll_year  = e.`year`
WHERE
	value_type_code = 5958
	AND cp.region_code IS NULL
	AND e.country = 'Czech republic'
GROUP BY
	category_code,
	payroll_year,
	industry_branch_code;

SELECT * FROM t_matej_novak_project_sql_primary_final;
	
-- DRUHÁ TABULKA

CREATE OR REPLACE TABLE t_matej_novak_project_SQL_secondary_final AS
SELECT 
    e.country,
    e.GDP,
    e.gini,
    e.population,
    e.`year`
FROM economies e 
JOIN countries c
    ON e.country = c.country
WHERE c.continent = 'europe'
    AND e.year BETWEEN 2006 AND 2018
ORDER BY country, `year`;

SELECT * FROM t_matej_novak_project_SQL_secondary_final;

-- 1. DOTAZ

SELECT industry, payroll_year, payroll_value AS prumerna_mzda
FROM
	t_matej_novak_project_SQL_primary_final
WHERE industry_branch_code IS NOT NULL
GROUP BY 
	industry,
	payroll_year
ORDER BY
	industry,
	payroll_year;

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

-- 3. DOTAZ

SELECT
	product,
	AVG(price_value) AS average_price,
	((MAX(price_value) - MIN(price_value)) / MIN(price_value)) * 100 AS procentual_growth
FROM
	t_matej_novak_project_sql_primary_final AS t
 WHERE
 	payroll_year IN (2006,2018)
GROUP BY
	product
ORDER BY
	procentual_growth
LIMIT 100;

SELECT
	product,
	((MAX(price_value) - MIN(price_value)) / MIN(price_value)) * 100 AS procentual_growth
FROM
	t_matej_novak_project_sql_primary_final
GROUP BY
	product
ORDER BY
	procentual_growth;

-- 4. DOTAZ 

SELECT t.payroll_year, round( avg(t.price_value), 2) AS prumery_cen,  round( avg( t.payroll_value), 2) AS prumery_mezd, t2.payroll_year+1 as year_prev, 
    round( ( avg( t.price_value) - avg( t2.price_value) ) / avg( t2.price_value) * 100, 2 ) as price_growth,
    round( ( avg( t.payroll_value) - avg( t2.payroll_value) ) / avg( t2.payroll_value) * 100, 2) as payroll_percent
FROM t_matej_novak_project_sql_primary_final AS t
JOIN t_matej_novak_project_sql_primary_final AS t2
    ON t.payroll_year = t2.payroll_year + 1
 GROUP BY payroll_year
ORDER BY payroll_year;


-- 5. DOTAZ

CREATE OR REPLACE VIEW v_fifth_quest AS 
SELECT t.payroll_year, round( avg(t.price_value), 2) AS prumery_cen,  round( avg( t.payroll_value), 2) AS prumery_mezd, t2.payroll_year+1 as year_prev, 
    round( ( avg( t.price_value) - avg( t2.price_value) ) / avg( t2.price_value) * 100, 2 ) as price_growth,
    round( ( avg( t.payroll_value) - avg( t2.payroll_value) ) / avg( t2.payroll_value) * 100, 2) as payroll_percent,
    t.hdp,
    round( ( avg( t.hdp) - avg( t2.hdp) ) / avg( t2.hdp) * 100, 2) as hdp_percent
FROM t_matej_novak_project_sql_primary_final AS t
JOIN t_matej_novak_project_sql_primary_final AS t2
    ON t.payroll_year = t2.payroll_year + 1
 GROUP BY payroll_year
ORDER BY payroll_year;

SELECT *,
    CASE
	    WHEN hdp_percent > 5 THEN 'high_hdp_growth'
	    WHEN hdp_percent > 0 THEN 'small_hdp_growth'
	    WHEN hdp_percent < 0 THEN 'negative_hdp_growth'
	    END AS hdp_growth
FROM v_fifth_quest AS vfq;

-- závěr - Když HDP vzroste výrazněji než obvykle (nad 5 %),
-- tak se to projevuje na nárůstu mezd následujícího roku. HDP nad 5% bylo 3x - v letech 2007, 2015 a 2017.
-- a nárust mezd po těchto letech byl - 2008 o 7,87%, 2016 o 3,65% a 2018 o 7,62%.




