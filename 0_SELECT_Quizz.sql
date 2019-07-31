-- 1
SELECT name, population
  FROM world
 WHERE population BETWEEN 1000000 AND 1250000;

-- 2
 SELECT name, population
      FROM world
      WHERE name LIKE "Al%";

--   3
SELECT name FROM world
 WHERE name LIKE '%a' OR name LIKE '%l';

--  4
SELECT name,length(name)
FROM world
WHERE length(name)=5 and region='Europe';

-- 5
SELECT name, area*2 FROM world WHERE population = 64000;

-- 6
SELECT name, area, population
  FROM world
 WHERE area > 50000 AND population < 10000000;

--  7
SELECT name, population/area
  FROM world
 WHERE name IN ('China', 'Nigeria', 'France', 'Australia');