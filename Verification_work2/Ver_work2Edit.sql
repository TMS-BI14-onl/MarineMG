

/*Railway station
1.board (ID, 6.1.Driver ID, 3.1.Train number, 2.1 ID Route, (1.5.-1.6.)Parking,  (3.3.-4.1.)number of empty seats, 5.1.Ways) FC
2.Route (2.1.ID 7.1.ID city of departure, 7.1.ID city of arrival, 2.4.time of arrival, 2.5 time of departure) FC
3.Train (3.1. Train number, 3.2. type, 3.3. number of seats) DIM
4.Tickets (4.1. Ticket number, 4.2. Seat, 4.3. full name, 4.4. type, 4.5. cost, 4.6.Date Birth) DIM
5.Ways (5.1.id, 5.2.name) DIM
6.Driver(6.1.ID, 6.2.Full Name, 6.3.ID document) DIM
7.Cities(7.1.ID, 7.2.City) DIM


Find fast train

SELECT a.TrainNumber,
		b.time of arrival, 
		b.time of departure,
		min_time
FROM board a
JOIN 
(SELECT  MIN (b.time of arrival -b.time of departure) AS min_time
FROM Route) b 
ON b.ID = a.ID Route


Find ID document driver 505 Train number/

SELECT a.ID document
		a.Full name
		b.Train number
FROM board a
JOIN Driver b ON b.ID=a.Driver ID
WHERE a.Train number LIKE '505'
