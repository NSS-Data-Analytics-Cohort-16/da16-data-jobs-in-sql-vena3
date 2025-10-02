-- 1.	How many rows are in the data_analyst_jobs table?

SELECT COUNT(*)
FROM data_analyst_jobs;

-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

select company
from data_analyst_jobs
limit 10;

-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

select count(*) as location
from data_analyst_jobs
where location='TN';

select count(*) as location
from data_analyst_jobs
where (location='TN' or location='KY');

-- 4.	How many postings in Tennessee have a star rating above 4?

select count(*) AS star_rating
from data_analyst_jobs
where star_rating>4
and location='TN'

-- 5.	How many postings in the dataset have a review count between 500 and 1000?

select count(*) AS star_rating
from data_analyst_jobs
where review_count between 500 and 1000;

-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?

select location As state, Round(AVG(star_rating),2) AS avg_rating
from data_analyst_jobs
where star_rating IS NOT NULL
group by location;


-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?

select distinct title AS unique_title
from data_analyst_jobs


select count(distinct title) AS unique_title_count
from data_analyst_jobs


-- 8.	How many unique job titles are there for California companies?

select count(distinct title) AS unique_title_count
from data_analyst_jobs
where location ='CA'

-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

select company,
round(AVG(star_rating), 2) AS avg_star_rating, sum(review_count) AS total_review
from data_analyst_jobs
where review_count >5000
And company IS NOT NULL
group by company;


-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

select company,
round(AVG(star_rating), 2) AS avg_star_rating, sum(review_count) AS total_review
from data_analyst_jobs
where review_count >5000
And company IS NOT NULL
group by company
order by  total_review DESC
limit 1

-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 

select title
from data_analyst_jobs

select distinct title AS analyst_title
from data_analyst_jobs
where title ilike '%Analyst%';


-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

select distinct(title)
from data_analyst_jobs
where title not ilike '%Analyst%'
AND title not ilike '%Analytics%'

-- **BONUS:**
-- Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
-- Disregard any postings where the domain is NULL. 
-- Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
-- Which three industries are in the top 3 on this list? How many jobs have been listed for more than 3 weeks for each of the top 3?
select title
from data_analyst_jobs

select domain, title, days_since_posting, skill
from data_analyst_jobs
where days_since_posting> 21
AND domain IS NOT NULL
AND skill LIKE '%SQL%' 
order by days_since_posting  DESC