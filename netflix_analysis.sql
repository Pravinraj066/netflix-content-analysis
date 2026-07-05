/* ==========================================
   question 1 : retrieve all records from the netflix dataset
========================================== */

select *
from netflix;

/* ==========================================
   question 2 : count the total number of titles
========================================== */

select count(*) as total_titles
from netflix;

/* ==========================================
   question 3 : count the total number of movies and tv shows
========================================== */

select type, count(*) as total_titles
from netflix
group by type;

/* ==========================================
   question 4 : find the top 10 countries with the highest number of titles
========================================== */

select country, count(*) as total_titles
from netflix
where country is not null
group by country
order by total_titles desc
limit 10;

/* ==========================================
   question 5 : find the top 10 directors with the highest number of titles
========================================== */

select director, count(*) as total_titles
from netflix
where director is not null
group by director
order by total_titles desc
limit 10;

/* ==========================================
   question 6 : analyze the number of netflix titles released each year
========================================== */

select release_year, count(*) as total_titles
from netflix
group by release_year
order by release_year;

/* ==========================================
   question 7 : count the number of titles in each rating category
========================================== */

select rating, count(*) as total_titles
from netflix
group by rating
order by total_titles desc;

/* ==========================================
   question 8 : find the top 10 most common genres
========================================== */

select listed_in, count(*) as total_titles
from netflix
group by listed_in
order by total_titles desc
limit 10;

/* ==========================================
   question 9 : find the longest movie on netflix
========================================== */

select title, duration
from netflix
where type = 'movie'
order by cast(replace(duration,' min','') as unsigned) desc
limit 1;

/* ==========================================
   question 10 : retrieve all movies released after 2018
========================================== */

select title, release_year
from netflix
where type = 'movie'
and release_year > 2018;

/* ==========================================
   question 11 : retrieve all tv shows released after 2018
========================================== */

select title, release_year
from netflix
where type = 'tv show'
and release_year > 2018;

/* ==========================================
   question 12 : count the number of titles added each year
========================================== */

select added_year, count(*) as total_titles
from netflix
group by added_year
order by added_year;

/* ==========================================
   question 13 : find the month with the highest number of titles added to netflix
========================================== */

select added_month, count(*) as total_titles
from netflix
group by added_month
order by total_titles desc;

/* ==========================================
   question 14 : find all titles containing the word 'love'
========================================== */

select title
from netflix
where title like '%love%';

/* ==========================================
   question 15 : retrieve all titles from india
========================================== */

select *
from netflix
where country like '%india%';

/* ==========================================
   question 16 : retrieve all titles from the united states
========================================== */

select *
from netflix
where country like '%united states%';

/* ==========================================
   question 17 : find the oldest 10 movies
========================================== */

select title, release_year
from netflix
where type = 'movie'
order by release_year
limit 10;

/* ==========================================
   question 18 : find the top 5 years with the highest number of releases
========================================== */

select release_year, count(*) as total_titles
from netflix
group by release_year
order by total_titles desc
limit 5;

/* ==========================================
   question 19 : count the total number of unique directors
========================================== */

select count(distinct director) as total_directors
from netflix;

/* ==========================================
   question 20 : count the total number of unique countries
========================================== */

select count(distinct country) as total_countries
from netflix;


/* ==========================================
   question 21 : classify movies based on duration using case statement
========================================== */

select title,
       duration,
       case
           when cast(replace(duration,' min','') as unsigned) < 60 then 'short movie'
           when cast(replace(duration,' min','') as unsigned) between 60 and 120 then 'medium movie'
           else 'long movie'
       end as movie_length
from netflix
where type = 'movie';

/* ==========================================
   question 22 : find countries with more than 100 titles
========================================== */

select country,
       count(*) as total_titles
from netflix
where country is not null
group by country
having count(*) > 100
order by total_titles desc;

/* ==========================================
   question 23 : rank directors based on the number of titles
========================================== */

select director,
       count(*) as total_titles,
       dense_rank() over(order by count(*) desc) as director_rank
from netflix
where director is not null
group by director;

