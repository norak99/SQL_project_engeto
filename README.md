# Analýza dostupnosti základních potravin široké veřejnosti

 ### Popis datových sad a tabulek použitých v projektu -    
 
   
 **PRIMÁRNÍ TABULKA PROJEKTU**   
   
 **czechia_payroll** – Informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.      
   
 **czechia_price** – Informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.     
   
**czechia_payroll_industry_branch** – Číselník odvětví v tabulce mezd.      
   
**czechia_price_category** – Číselník kategorií potravin, které se vyskytují v našem přehledu.    
  
**economies** - HDP, gini, daňová zátěž... pro daný stát a rok   

**SEKUNDÁRNÍ TABULKA PROJEKTU**  
  
**economies** - HDP, gini, daňová zátěž... pro daný stát a rok   
  
**countries** - všemožné informace o zemích na světě, například hlavní město, měna, národní jídlo nebo průměrná výška populace


	
Je definováno 5 otázek-  
  
**1.Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?**		
  
 Ve většině odvětví byl rok, kdy mzda byla nižší, než mzda roku předchozího.  
 Konkrétně byl tento pokles zaznamenaný u **15** odvětví z celkových **19**.  
 Nejčastěji mzdy klesaly v roce 2013 - to bylo hlavně z důvodu předčasného vyplácení mimořádné odměny vrcholným manažerům z důvodů očekávaného zavedení takzvané solidární daně pro nejvyšší výdělky.  
 Největší počet poklesů zaznamenalo odvětví "Těžba a dobývaní" - 4 poklesy v letech 2009, 2013, 2014 a 2016. Naopak žádné poklesy (resp. pouze meziroční růsty) byly v odvětvích "doprava a skladování", "ostatní činnosti", "zdravotní a sociální péče" a "zpracovatelský průmysl".
  
**2.Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?**		
  
Za první období, rok **2006** je možné si z průměrné mzdy 20.753 Kč koupit -  
**1.287** Ks chlebů, při ceně 16,12 Kč / Ks nebo **1.437** L mléka, při ceně 14,43 Kč / L.  

Za poslední srovnatelné období, rok **2018** při průměrné mzdě 32.535 Kč je možné koupit -  
**1.342** Ks chlebů při ceně 24,23 Kč / Ks nebo **1.642** L mléka, při ceně 19,81 Kč / L. 

Z těchto dat můžeme také říci, že průměrná mzda mezi danými roky vzrostla o 56,77 %. Cena chleba vzrostla o 50,31 % a cena mléka o 37,28 %.
  
**3.Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?**	
  
 Nejnižší procentuální meziroční nárůst je u potravin -  
 Rajská jablka červená kulatá v roce 2007 - pokles o **30,28 %** z 57,82 Kč na 40,31 Kč  
 Pečivo pšeničné bílé v roce 2009 - pokles o **28,5%** z 54,31 Kč na 38,83 Kč  
 Konzumní brambory v roce 2008 - pokles o **23,54 %** z 14,1 Kč na 10,78 Kč   
 
 Při porovnání prvního a posledního měřeného období - roků 2006 a 2018 můžeme i definovat tento rozdíl v cenách.  
 Nejpomaleji zdražuje za celé období -  
 Cukr krystalový - pokles o 27,5 % z 21,72 Kč na 15,75 Kč  
 Rajská jablka červená kulatá - pokles o 23,07 % z 57,82 Kč na 44,48 Kč  
 Banány žluté - nárůst o 7,38 % z 27,3 Kč na 29,32 Kč
  
**4.Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?**  
  
 **Neexistuje rok**, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %).  
 Největší rozdíl nárůstu cen potravin a mezd byl v roce 2013 o 6,66% (potraviny rostly o 5,1 % a naopak mzdy klesaly o 1,56 %)  
 Největší nárůst cen potravin byl v roce 2017 a to o 9,63% (mzdy rostly o 6,28 %)  
 Největší nárůst mezd byl v roce 2008 o 7,87 % (potraviny rostly o 6,18 %)
  
**5.Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?**   
  
Výraznější růst HDP jsem nastavil jako růst větší než 5%. Souvislost s takovým nárůstem jsem zaznamenal tuto -    
Když HDP vzroste výrazněji než obvykle (nad 5 %),  
tak se to projevuje na **zvýšeném nárůstu mezd následujícího roku**. HDP nad 5% bylo 3x - v letech 2007, 2015 a 2017.  
 a nárust mezd po těchto letech byl - 2008 o 7,87%, 2016 o 3,65% a 2018 o 7,62%.  
 

 

Poznámky k projektu:    


>**SQL dotazy** jsou v jednotlivých skriptech pro lepší přehlednost, pojmenované od první otázky (first_question_MN) po pátou, poslední otázku (fifth_question_MN).  
>
>**Tabulky** jsou obě uloženy ve stejném skriptu, pojmenovaném jako project_tables.


>**Primární tabulka** - Spojil jsem několik tabulek do sebe pro získání potřebných dat. Začínal jsem s czechia_price a postupně jsem napojil všechny další na základě společných hodnot. Problémové pro mě zde bylo již ze začátku jak spojit dvě nejdůlěžitější tabulky czechia_price a czechia_payroll. Šel jsem na to přes roky - tak jak   je i v zadání. V tabulce czechia_payroll byl přímo rok a v datovém typu INT, s tím se dalo pracovat. Ale v druhé tabulce, byl jiný typ date_from a musel jsem z něj   získat pouze rok. Pro to se dá použít DATE_FORMAT(cp.date_from, '%Y') nebo funkce YEAR (date_from). Použil jsem tedy funkci YEAR, která je k tomu přímo určená. Napojení dalších tabulek bylo bez problému. Stejně tak určení WHERE, abych data očistil - pracuji s celorepublikovými průměry. A na závěr seskupil.   
> 
> Sloupce v primární tabulce:  
>  price_value - průměry cen v Kč,   
>   category_code - kategorie potravin,   
>     year_price - rok měření cen potravin,   
>        payroll_id - jedinečné ID z tabulky mezd,  
>          payroll_value - mzda v Kč,  
>            value_type_code - kód pro mzdy zaměstnanců (5958),   
>               payroll_year - rok vyplácení mezd,  
>                 industry_branch_code - kód odvětví,   
>                    product - potravina,    
>                   industry - odvětví ,  
>                      HDP

  
>**Sekundární tabulka** - Spojil jsem tabulky economies a countries pomocí konkrétních zemí. V obou tabulkách jsou shodně pojmenovány tyto sloupce jako country. Poté jsem to omezil na společené roky i pro měření v ČR a to 2006 až 2018. Poslední podmínka byla, ať jsou tyto země v Evropě
>
>Sloupce v sekundární tabulce:  
>country - země,  
>GDP - HDP,   
>gini - gini koeficient bohatství,   
>population - populace,   
>year - rok měření
 

   
*Matěj Novák*  
