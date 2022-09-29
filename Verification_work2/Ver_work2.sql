SELECT f.FirstName,
	f.MiddleName,
	f.LastName,
	g.PhoneNumber
FROM [AdventureWorks2017].Person.Person f
JOIN [AdventureWorks2017].Person.PersonPhone g ON f.BusinessEntityID=g.BusinessEntityID
WHERE g.PhoneNumber LIKE '4_5%'


SELECT NationalIDNumber,
	BirthDate,
CASE  WHEN 17 <= (2022 - DATEADD (year, 0, BirthDate)) AND  (2022 - DATEADD (year, 0, BirthDate)) <= 20 THEN "Adolescence"
	WHEN 21 <= (2022 - DATEADD (year, 0, BirthDate)) AND  (2022 - DATEADD (year, 0, BirthDate)) <= 59 THEN "Adults"
	WHEN 60 <= (2022 - DATEADD (year, 0, BirthDate)) AND  (2022 - DATEADD (year, 0, BirthDate)) <= 75 THEN "Elderly"
	WHEN 60 <= (2022 - DATEADD (year, 0, BirthDate)) AND  (2022 - DATEADD (year, 0, BirthDate)) <= 75 THEN "Senile"
END [AdventureWorks2017].[HumanResources].[Employee].NationalIDNumber
FROM [AdventureWorks2017].[HumanResources].[Employee]


SELECT Name, StandardCost, Color
FROM [AdventureWorks2017].[Production].[Product] 
WHERE StandardCost IN (SELECT MAX (StandardCost) as m
	FROM [AdventureWorks2017].[Production].[Product]
	GROUP BY Color)


--Railway station
-- Tickets (Flight Number Date Name)
--route (number, from where, to)
--train (number, route, departure time, arrival time, driver, number of passengers)
--Driver (number, NAME, ID right)