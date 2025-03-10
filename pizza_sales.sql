
use pizzadb;

SELECT * FROM PIZZA_SALES; 
SELECT SUM(TOTAL_PRICE) AS TOTAL_REVENUE FROM PIZZA_SALES;

SELECT SUM(QUANTITY) AS TOTAL_PIZZA_SOLD FROM PIZZA_SALES;

SELECT COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS FROM PIZZA_SALES;

UPDATE PIZZA_SALES 
SET ORDER_DATE = STR_TO_DATE(ORDER_DATE, '%d-%m-%Y');






-- DAILY TERENDS:
SELECT DAYNAME(ORDER_DATE) AS ORDER_DAY, COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS 
FROM PIZZA_SALES 
GROUP BY DAYNAME(ORDER_DATE);

-- HOURLY TRENDS:
SELECT HOUR(ORDER_TIME) AS ORDER_HOURS, COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS
FROM PIZZA_SALES
GROUP BY  HOUR(ORDER_TIME);

-- 4:
  SELECT PIZZA_SIZE , CAST(SUM(TOTAL_PRICE) AS DECIMAL(10,2)) AS TOTAL_SALES ,
  CAST(SUM(TOTAL_PRICE)*100/(SELECT SUM(TOTAL_PRICE) FROM PIZZA_SALES) AS DECIMAL(10,2))
  AS PCT FROM PIZZA_SALES 
 group by PIZZA_SIZE
 ORDER BY PCT DESC;
 


-- 3:
 SELECT PIZZA_CATEGORY ,SUM(TOTAL_PRICE)*100/(SELECT SUM(TOTAL_PRICE)
 FROM PIZZA_SALES ) AS PCT FROM PIZZA_SALES 
 group by PIZZA_CATEGORY;
 
  SELECT PIZZA_CATEGORY , SUM(TOTAL_PRICE) AS TOTAL_SALES ,
  SUM(TOTAL_PRICE)*100/(SELECT SUM(TOTAL_PRICE) FROM PIZZA_SALES ) 
  AS PCT FROM PIZZA_SALES 
 group by PIZZA_CATEGORY;
 
   SELECT PIZZA_CATEGORY , SUM(TOTAL_PRICE) AS TOTAL_SALES ,
   SUM(TOTAL_PRICE)*100/(SELECT SUM(TOTAL_PRICE)
   FROM PIZZA_SALES WHERE MONTH(ORDER_DATE) = 1 ) AS PCT FROM PIZZA_SALES 
  WHERE MONTH(ORDER_DATE) = 1
  group by PIZZA_CATEGORY;
  
  
-- 5:
SELECT PIZZA_CATEGORY , SUM(QUANTITY) AS TOTAL_PIZZAS_SOLD FROM PIZZA_SALES
GROUP BY PIZZA_CATEGORY;


-- 6:
SELECT PIZZA_NAME , SUM(QUANTITY) AS TOTAL_PIZZAS_SOLD FROM PIZZA_SALES
GROUP BY PIZZA_NAME
ORDER BY SUM(QUANTITY) DESC LIMIT 5;

SELECT PIZZA_NAME , SUM(QUANTITY) AS TOTAL_PIZZAS_SOLD FROM PIZZA_SALES
WHERE MONTH(ORDER_DATE) = 1
GROUP BY PIZZA_NAME
ORDER BY SUM(QUANTITY) DESC LIMIT 5 ;

-- 7:
SELECT PIZZA_NAME , SUM(QUANTITY) AS TOTAL_PIZZAS_SOLD FROM PIZZA_SALES
WHERE MONTH(ORDER_DATE) = 1
GROUP BY PIZZA_NAME
ORDER BY SUM(QUANTITY) ASC LIMIT 5 ;


    

SELECT SUM(TOTAL_PRICE) / COUNT(DISTINCT ORDER_ID) AS AVERAGE_ORDER_VALUE FROM PIZZA_SALES;
SELECT CAST((CAST(SUM(QUANTITY) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT ORDER_ID) AS DECIMAL(10,2))) AS DECIMAL(10,2)) AS AVERAGE_PIZZAS_PER_ORDER FROM PIZZA_SALES;




 