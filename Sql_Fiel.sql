use datawarehouseanalytics;

-- Which Borders encounters the most crossings?

SELECT 
border,
COUNT(*) no_of_crossings
FROM border_crossings
GROUP BY 1
ORDER BY 2 DESC;


-- What are the states where crossings are done? 


SELECT 
border,
state,
count(*) no_of_crossings
FROM border_crossings
GROUP BY 1,2
ORDER BY 1,2


-- What are the Most preffered Port of Enteries by each State?


SELECT 
state,
port_name,
count(*) no_of_crossings
FROM border_crossings
GROUP BY 1 ,2
ORDER BY 1,3 DESC;


-- What are method of Enteries? 

SELECT 
measure,
COUNT(*) cnt
FROM border_crossings
GROUP BY 1
ORDER BY 2 DESC;


-- Most Prefered method of entry by each state.

WITH CTE AS 
(SELECT 
state,
measure method,
COUNT(*) cnt
FROM border_crossings
GROUP BY 1,2
),
CTE2 AS
(SELECT 
*,
ROW_NUMBER() OVER(PARTITION BY state ORDER BY cnt DESC) rnk
FROM CTE
)
SELECT * 
FROM CTE2
WHERE rnk <= 3;


-- Which month has the most crossings?


SELECT
MONTH(date) yr,
COUNT(*) crossings
FROM border_crossings
GROUP BY 1
ORDER BY 2 DESC


