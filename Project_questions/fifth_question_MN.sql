-- 5. DOTAZ

CREATE OR REPLACE
VIEW v_fifth_quest AS 
SELECT
	t.payroll_year,
	round( avg(t.price_value), 2) AS average_price,
	round( avg(t.payroll_value), 2) AS average_salary,
	t2.payroll_year + 1 AS year_prev,
	round( ( avg(t.price_value) - avg(t2.price_value) ) / avg(t2.price_value) * 100, 2 ) AS price_growth,
	round( ( avg(t.payroll_value) - avg(t2.payroll_value) ) / avg(t2.payroll_value) * 100, 2) AS payroll_percent,
	t.hdp,
	round( ( avg(t.hdp) - avg(t2.hdp) ) / avg(t2.hdp) * 100, 2) AS hdp_percent
FROM
	t_matej_novak_project_sql_primary_final AS t
JOIN t_matej_novak_project_sql_primary_final AS t2
    ON
	t.payroll_year = t2.payroll_year + 1
GROUP BY
	payroll_year
ORDER BY
	payroll_year;


SELECT *,
	CASE
		WHEN hdp_percent > 5 THEN 'high_hdp_growth'
		WHEN hdp_percent > 0 THEN 'small_hdp_growth'
		WHEN hdp_percent < 0 THEN 'negative_hdp_growth'
	END AS hdp_growth
FROM v_fifth_quest;