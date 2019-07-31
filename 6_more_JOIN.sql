-- 1
SELECT id, title
 FROM movie
 WHERE yr=1962;

--  2
SELECT yr FROM movie WHERE title = 'Citizen Kane';

-- 3
SELECT id, title, yr FROM movie WHERE title LIKE 'Star Trek%' ORDER BY yr;

-- 4
SELECT DISTINCT actor.id FROM movie INNER JOIN casting ON movie.id = casting.movieid INNER JOIN actor ON casting.actorid = actor.id WHERE actor.name = 'Glenn Close';

-- 5
SELECT id FROM movie WHERE title = 'Casablanca';

-- 6
SELECT name FROM actor INNER JOIN casting ON actor.id = casting.actorid WHERE movieid = 11768;

-- 7
SELECT name FROM actor INNER JOIN casting ON actor.id = casting.actorid INNER JOIN movie ON casting.movieid = movie.id WHERE movie.title = 'Alien';

-- 8
SELECT title FROM movie INNER JOIN casting ON movie.id = casting.movieid INNER JOIN actor ON casting.actorid = actor.id WHERE name = 'Harrison Ford';

-- 9
SELECT title FROM movie INNER JOIN casting ON movie.id = casting.movieid INNER JOIN actor ON casting.actorid = actor.id WHERE name = 'Harrison Ford' AND casting.ord != 1;

-- 10
SELECT movie.title, actor.name FROM movie INNER JOIN casting ON movie.id = casting.movieid INNER JOIN actor ON casting.actorid = actor.id WHERE movie.yr = 1962 AND casting.ord = 1;

-- 11
SELECT yr,COUNT(title) FROM movie JOIN casting ON movie.id=movieid INNER JOIN actor ON actorid=actor.id
where name='John Travolta'
GROUP BY yr HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie INNER JOIN casting ON movie.id=movieid
         INNER JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t);

-- 12
SELECT title, name FROM movie INNER JOIN casting x ON movie.id = movieid
 INNER JOIN actor ON actor.id =actorid
 WHERE ord=1 AND movieid IN
 (SELECT movieid FROM casting y
   INNER JOIN actor ON actor.id=actorid
   WHERE name='Julie Andrews');

--    13
SELECT name
FROM actor
  INNER JOIN casting ON (id = actorid AND (SELECT COUNT(ord) FROM casting 
  WHERE actorid = actor.id AND ord=1)>=30)
GROUP BY name;

-- 14
SELECT title, COUNT(actorid) AS actors FROM movie INNER JOIN casting ON id = movieid
WHERE yr = 1978
GROUP BY title
ORDER BY actors DESC, title;

-- 15
SELECT a.name
  FROM (SELECT movie.*
          FROM movie
          INNER JOIN casting
            ON casting.movieid = movie.id
          INNER JOIN actor
            ON actor.id = casting.actorid
         WHERE actor.name = 'Art Garfunkel') AS m
  INNER JOIN (SELECT actor.*, casting.movieid
          FROM actor
          INNER JOIN casting
            ON casting.actorid = actor.id
         WHERE actor.name != 'Art Garfunkel') as a
    ON m.id = a.movieid;