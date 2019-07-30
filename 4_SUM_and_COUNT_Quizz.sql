-- 1
 SELECT SUM(population) FROM bbc WHERE region = 'Europe';

-- 2
 SELECT COUNT(name) FROM bbc WHERE population < 150000;

-- 3
AVG(), COUNT(), MAX(), MIN(), SUM()

-- 4
 SELECT region, SUM(area)
   FROM bbc 
  WHERE SUM(area) > 15000000 
  GROUP BY region; -- INVALID

-- 5
 SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark');

-- 6
 SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region;


-- 7
 SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc);


-- 8
SELECT region, SUM(area) 
   FROM bbc 
  GROUP BY region 
  HAVING SUM(area)<= 20000000;