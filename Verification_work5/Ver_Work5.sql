--1. Найти ProductSubcategoryID из Production.Product, где мин вес такого ProductSubcategoryID больше 150. 

SELECT *
FROM Production.Product[WeightUnitMeasureCode]

SELECT DISTINCT ProductSubcategoryID
FROM Production.Product
WHERE [Weight] > 150 AND ProductSubcategoryID IS NOT NULL

--Найти самый дорогой продукт (поле StandardCost) из Production.Product. (4 способа)

SELECT TOP 1 WITH Ties Name, StandardCost
FROM Production.Product
ORDER BY StandardCost DESC

SELECT Name, StandardCost
FROM Production.Product
WHERE StandardCost=(SELECT MAX(StandardCost) 
FROM Production.Product) 

SELECT Name, StandardCost
FROM (SELECT Name, StandardCost, RANK () OVER (ORDER BY StandardCost DESC) as rnk
FROM Production.Product) as F
WHERE rnk=1


SELECT  Name, StandardCost
FROM (SELECT Name, StandardCost, MAX(StandardCost) OVER () as max_cost
	FROM Production.Product) AS d
WHERE StandardCost=max_cost


--3. Найти магазины, в которых за последний год не было куплено ни одного продукта. (схема GROUP1)

SELECT Name
FROM Store
EXCEPT
SELECT a.Name
FROM Store a JOIN Sales b ON a.id_Store=b.id_Store
WHERE DATEDIFF(year, b.OrderDate, GETDATE())<=1


--4. Найти для каждого продавца кол-во продаж за последние 15 лет.  (схема GROUP3)

SELECT a.Name, COUNT (b.Seller_id) as cnt
FROM Seller a JOIN Sales b ON a.Seller_id=b.Seller_id
HAVING DATEDIFF(year, b.Date, GETDATE())<15

/*5. 
a   Users (
    id bigint NOT NULL,
    email varchar(255) NOT NULL
);

b   Notifications (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    category varchar(100),
    is_read boolean DEFAULT false
);

Найти список категорий для пользователя alex@gmail.com, в которых более 50 непрочитанных нотификаций*/


SELECT category, COUNT (id) as cnt
FROM  Users a JOIN Notifications b ON b.user_id=a.id
WHERE is_read=false AND email='alex@gmail.com'
GROUP BY category
HAVING cnt > 50

