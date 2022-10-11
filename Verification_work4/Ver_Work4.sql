1.	Ќаписать запрос на добавление в таблицу manufacturer нового производител€ HP из јмерики.

INSERT INTO manufacturer ([name], [country_id])
VALUES ('HP', 4)

2.	Ќаписать запрос, благодар€ которому возраст пользовател€ јндрей в таблице user уменьшитс€ в 3 раза.

UPDATE [User]
SET [age]/3
WHERE [name]='Aндрей'

3.	Ќайти название продукта с максимальной ценой.

a)
SELECT [name], price
FROM
(SELECT [name], price, MAX (price) OVER () AS max_p
FROM product) as T
WHERE price=max_p

b)
SELECT TOP 1 [name], price
FROM product
ORDER BY price

c)
SELECT [name], price
FROM product
WHERE price=(SELECT MAX(price AS max_p)
				FROM product)

				
4.	Ќаписать запрос на выборку всех пользователей с телефонами, начинающимис€ на 3 и заканчивающимис€ на 4, либо с возрастом > 35.

SELECT p.id, p.[name], age, s.[name]
FROM [user] p 
	JOIN [phone] s ON p.id=s.id
WHERE [age]>35 OR s.[name] LIKE '+3%4'

5.	Ќайти топ 5 пользователей, кто купил больше всего продуктов.

SELECT TOP 5 p.[name] COUNT (s.product_id) OVER (PARTITION BY s.user_id ORDER BY s.product_id) AS sum
FROM [order] s 
	JOIN [user] p ON p.id=s.user_id
