use movie_db;
select title,ranking,budget
from movies
where budget > 10000000 and ranking < 6;

select title, rating, year
from movies m 
join genres g on m.movie_id = g.movie_id
where g.genre_name = 'Action' and m.rating > 8.8 and m.year > 2009;

select title, duration, oscars
from movies m
join genres g on m.movie_id = g.movie_id
where g.genre_name = 'Drama' and m.duration > 150 and m.oscars > 2;

select title, duration, oscars
from movies
where duration > 150 and oscars > -2
and movie_id in(select movie_id from genres where genre_name = 'Drama');

select movie_id, title, budget
from movies
where budget > 23000000 
and movies.movie_id in (select movie_id from genres where genre_name = 'Thriller');

select movies.movie_id, movies.title, movies.budget
from movies
join genres on movies.movie_id = genres.movie_id
where movies.budget > 25000000 and genres.genre_name = 'Thriller';

select m.title, m.year
from movies m
join genres g on m.movie_id = g.movie_id
join languages l on m.movie_id = l.movie_id
where g.genre_name = 'Drama' and l.language_name = 'Italian' and m.year between 1990 and 2000;


