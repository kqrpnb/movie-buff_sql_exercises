select title from movies;

select title, year_released from movies
order by year_released desc;

select * from directors
order by country asc;

select * from directors
order by country asc, last_name asc;

insert into directors (first_name, last_name, country)
values ("Rob", "Reiner", "USA");

select last_name, director_id from directors
where last_name="Reiner";

insert into movies (title, year_released, director_id)
values ("The Princess Bride", 1987, (select director_id from directors
where last_name="Reiner"));

-- bonus mission 
select title as "Movie name", year_released as "Year", last_name as "Director" from movies
inner join directors ON movies.director_id = directors.director_id;

select movies.*, first_name, last_name from movies
inner join directors on movies.director_id = directors.director_id
order by last_name;

select first_name, last_name from directors
where director_id = (select director_id from movies where title = "The Incredibles");

select last_name, country from movies
inner join directors ON movies.director_id = directors.director_id;

select * from movies
inner join directors ON movies.director_id = directors.director_id;

delete from directors where director_id = 5;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`movie-buff`.`movies`, CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`director_id`) REFERENCES `directors` (`director_id`))

-- Bonus mission
select title as "Movie Name", concat_ws(' ', first_name, last_name) as "Director" from movies
inner join directors ON movies.director_id = directors.director_id
where movies.director_id = (select director_id from directors where first_name like "ava" and last_name like "duvernay");

-- Bonus Mission
alter table movies
add gross dec(10);
-- update_movies_with_gross_earnings.sql

-- Bonus Mission
select title as "Movie Name", concat_ws(' ', first_name, last_name) as "Director", format(gross,0) as "Box Office Gross", year_released as "Year" from movies
inner join directors ON movies.director_id = directors.director_id
order by gross desc;

-- Bonus Mission
select title as "Movie Name", concat_ws(' ', first_name, last_name) as "Director", format(gross,0) as "Box Office Gross", year_released as "Year" from movies
inner join directors ON movies.director_id = directors.director_id
where gross >= 100000000
order by gross desc;
