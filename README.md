# Analýza dostupnost základních potravin široké veřejnosti
Zde je analýza dostupnosti základních potravin široké veřejnosti - SQL projekt.  ,

	
Je definováno 5 otázek-  
1.Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?			
  
2.Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?			  
  
3.Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?			 
  
4.Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?  
  
5.Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?   

  
Sql dotazy jsou v skriptu společně s hlavní i sekundární tabulkou ze zadání.  

Poznámky k projektu:    

Hlavní tabulka - Spojil jsem několik tabulek do sebe pro získání potřebných dat. Začínal jsem s czechia_price a postupně jsem napojil všechny další na základě     společných hodnot. Problémové pro mě zde bylo již ze začátku jak spojit dvě nejdůlěžitější tabulky czechia_price a czechia_payroll. Šel jsem na to přes roky - tak jak   je i v zadání. V tabulce czechia_payroll byl přímo rok a v datovém typu INT, s tím se dalo pracovat. Ale v druhé tabulce, byl jiný typ date_from a musel jsem z něj   získat pouze rok. Pro to se dá použít DATE_FORMAT(cp.date_from, '%Y') nebo funkce YEAR (date_from). Druhá funkce mi v určitých dotazech házela špatné hodnoty, tak jsem   použil to první. Napojení dalších tabulek bylo bez problému. Stejně tak určení WHERE, abych data očistil - pracuji s celorepublikovými průměry. A na závěr seskupil.  

1. Dotaz - Připravil jsem podklady pro následnou vizualizaci, ze které by byla jasná odpověď na otázku. Dá se to seřadit primárně podle odvětví a následně podle roků, nebo naopak.  
  
2. Dotaz - Určil jsem období - první a poslední srovnatelné období jsou roky 2006 a 2018. v selectu jsem vybral pro nás potřebné sloupce, omezil jsem to na dvě určené potraviny a vypočítal možnost koupit si určitý počet kg/l potravin. Nutno dodat, že jsem zde, jako ve většině tabulky pracoval za prvé - s celoročnímy průměry mezd napříc všemi odvětvími pro určitý rok, za druhé s celoročnímy průměrnými cenami potravin pro určitý rok a určitou potravinu.  
  
3. Dotaz - Zde jsem měl celkem problém. Nejsou zde data ze stejných období a nějaká jsou až později, nebo jich je méně.  
Zde mám dvě varianty - První počitá procentuální nárusty cen potravin pro roky 2006 a 2018 (u vína je 0, nejsou data pro rok 2006). A z tohoto vyplívá, že celkově    nejpomaleji rostou banány. A to o 7,38% za celé období.  
  
  A pak druhý dotaz, který to počítá vše, bez ohledu na roky, ale to je asi špatně.  
  
4. Dotaz - Tento a následující dotaz pro mě byl už opravdu hodně těžký a strávail jsem u toho dost hodin. Vypočítal jsem meziroční procentní nárusty pro 1.průměr všech   potravin napříč a 2.průměr všech odvětví napříč podle let. Tyto nárusty jsou vyjádřeny v posledních dvou sloupcích, v %. A z mých dat vychází, že nebyl meziroční   nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %). Největší nárust cen potravin byl v roce 2017 a to o 9,63% (mzdy rostly o 6,28%).    
  
5. Dotaz - Ten jsem navázal na předchozí, doplnil jsem k němu HDP, vypočítal meziroční procentní nárust HDP a vytvořil z toho view. K tomu jsem poté přidal pomoci CASE   sloupec s informací o tom, jestli HDP rostlo 1. Hodně 2. Trochu 3. Bylo záporné. Výraznější růst HDP jsem nastavil jako růst větší než 5%. Souvislost s takovým   nárůstem jsem zaznamenal tuto -    
Když HDP vzroste výrazněji než obvykle (nad 5 %),  
tak se to projevuje na zvýšeném nárůstu mezd následujícího roku. HDP nad 5% bylo 3x - v letech 2007, 2015 a 2017.  
 a nárust mezd po těchto letech byl - 2008 o 7,87%, 2016 o 3,65% a 2018 o 7,62%.  
   
   
   
 Kdyby bylo potřeba cokoliv objasnit, nebo doplnit - určitě to hned udělám. S sql jinak začínám a je to můj první projekt. Budu rád za jakoukoliv pomoc, opravu nebo radu co tam mám doplnit.  
   
 Děkuji moc, Matěj Novák  
