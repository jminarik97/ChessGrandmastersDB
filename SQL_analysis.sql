-- Select the ten highest rated Grandmasters
SELECT TOP 10 *
FROM Grandmaster
ORDER BY Standard_Rating DESC;

-- Total number of Grandmasters in the dataset
SELECT COUNT(Fide_id)
FROM Grandmaster;

-- Total number of women who hold the Grandmaster title
SELECT COUNT(Fide_id)
FROM Grandmaster
WHERE gender = 'F';

-- Calculate the ages of each GM
SELECT Grandmaster.Name, YEAR(GETDATE()) - Year_of_birth AS Age
FROM Grandmaster
ORDER BY age DESC;

-- Calculate the average Grandmaster's age
SELECT AVG(YEAR(GETDATE()) - Year_of_birth) AS 'Average Age'
FROM Grandmaster;

--List the oldest Grandmasters in the dataset
SELECT TOP 5 *
FROM Grandmaster
ORDER BY year_of_birth;

-- Total count of Grandmasters per federation
SELECT Federation, COUNT(Fide_id) AS 'GM Count'
FROM Grandmaster
GROUP BY Federation
ORDER BY 'GM Count' DESC;



-- Create a table containing information about each federation
SELECT g.federation Federation, g.[GM Total], 
	   s.[Avg Standard Rating], r.[Avg Rapid Rating], 
	   b.[Avg Blitz Rating],(2020 - yob.[Average YOB]) 'Average Age'
FROM (

-- GM Total
SELECT Federation, COUNT(fide_id) AS 'GM Total'
FROM Grandmaster
GROUP BY Federation
)AS g

--Average Standard Rating
INNER JOIN (
SELECT Federation, AVG(Standard_rating) AS 'Avg Standard Rating'
FROM Grandmaster
GROUP BY Federation
) AS s ON g.Federation = s.Federation 

-- Average Rapid Rating
INNER JOIN (
SELECT Federation, AVG(Rapid_rating) AS 'Avg Rapid Rating'
FROM Grandmaster
GROUP BY Federation
) AS r on g.Federation = r.Federation

--Average Blitz Rating
INNER JOIN (
SELECT Federation, AVG(Blitz_rating) AS 'Avg Blitz Rating'
FROM Grandmaster
GROUP BY Federation
) AS b ON g.Federation = b.Federation 

-- Average age
INNER JOIN (
SELECT federation, AVG(Year_of_birth) 'Average YOB'
FROM Grandmaster
GROUP BY federation
) AS yob on g.Federation = yob.Federation

ORDER BY g.[GM Total] DESC;


