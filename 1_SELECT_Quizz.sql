-- 1
SELECT name
  FROM world
 WHERE name LIKE 'U%';

-- 2
SELECT population
  FROM world
 WHERE name = 'United Kingdom';

-- 3
 SELECT continent 
   FROM world 
  WHERE name = 'France';

-- 4
 SELECT name, population / 10 
  FROM world 
 WHERE population < 10000;

-- 5
SELECT name, population
  FROM world
 WHERE continent IN ('Europe', 'Asia');

-- 6
SELECT name FROM world
 WHERE name IN ('Cuba', 'Togo');

-- 7
SELECT name FROM world
 WHERE continent = 'South America'
   AND population > 40000000;