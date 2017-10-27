--Names of all the actors in the movie 'Die Another Day'
SELECT Actor.first, Actor.last
FROM Actor, MovieActor, Movie
WHERE Actor.id = MovieActor.aid AND Movie.id = MovieActor.mid AND Movie.title = 'Die Another Day';

--Count of all the actors who acted in multiple movies
SELECT COUNT(*)
FROM (SELECT COUNT(aid)
	FROM MovieActor
	GROUP BY aid
	HAVING COUNT(aid) > 1) M;

--Count of directors who had directed Crime movies before
SELECT COUNT(*)
FROM (SELECT COUNT(*)
	FROM MovieGenre, MovieDirector 
	WHERE genre = 'Crime' AND MovieGenre.mid = MovieDirector.mid
	GROUP BY did) M;

--Movie id, Movie title, and number of actors in every movie directed by Ang Lee
SELECT id, title, COUNT(aid)
FROM Movie, MovieActor
WHERE mid IN (SELECT mid
		FROM MovieDirector, Director
		WHERE Director.first = 'Ang' AND Director.last = 'Lee' AND Director.id = MovieDirector.did)
AND Movie.id = MovieActor.mid
GROUP BY mid;

--Query that we came up with
--Names of all actors who have played themselves in movies (no duplicates)
SELECT first, last
FROM MovieActor, Actor
WHERE (MovieActor.role = 'Himself' OR MovieActor.role = 'Herself') AND Actor.id = MovieActor.aid
GROUP BY first, last;