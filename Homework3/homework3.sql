-- How can you produce a list of facilitites that charge a fee to memebers and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost and monthly maintenance of the facilities in question 
SELECT facilities.facid, name, membercost, monthlymaintenance FROM facilities
INNER JOIN bookings
ON facilities.facid = bookings.facid
WHERE membercost < (2 * monthlymaintenance)/ 100
-- SELECT facid, name, membercost, monthlymaintenance FROM facilities
-- INNER JOIN bookings
-- ON facilities.facid = bookings.facid
-- WHERE membercost < (1/50 * monthlymaintenance);

-- How can you retrive the details of facilities with id 1 and 5
SELECT * FROM facilities 
INNER JOIN bookings
ON bookings.facid = facilities.facid
WHERE facilities.facid IN (1, 5)

-- You'd like to get the signup date of your last member. How can you retrive this information
SELECT joindate FROM members
ORDER BY joindate DESC
FETCH FIRST ROW ONLY
-- OR
SELECT joindate FROM members
ORDER BY joindate DESC
LIMIT 1


-- You'd like to get the first and last name of the last member(s) who sigend up not just the date 
SELECT joindate, firstname, surname FROM members
ORDER BY joindate DESC
FETCH FIRST ROW ONLY


-- Produce a list of total number of slots book per facility. For now just produce an output table consisting facility id and slots sorted by facility id
SELECT facilities.facid, SUM(slots) AS totalSlots FROM facilities
INNER JOIN bookings
ON facilities.facid = bookings.facid
GROUP BY facilities.facid
ORDER BY facilities.facid

-- Find the total amount of members(including guests) who have made at least one booking
SELECT firstname, COUNT(*) FROM bookings
INNER JOIN members
ON members.memid = bookings.memid
GROUP BY firstname

-- Calculate the total amount per businessentity on all orders in the system from customers with id < 5
SELECT name, SUM(totalprice) FROM businessentity
INNER JOIN "Order"
ON businessentity.id = "Order".businessentityid
WHERE "Order".customerid < 5
GROUP BY name
-- OR
SELECT businessentityid, SUM(totalprice) FROM "Order" 
WHERE customerid < 5
GROUP BY businessentityid


-- Find the maximal order amount and the average order amount per businessentity on all orders in the system
SELECT name, MAX(totalprice), AVG(totalprice)
FROM businessentity
INNER JOIN "Order"
ON businessentity.id = "Order".businessentityid
GROUP BY name
-- OR 
SELECT businessentityid, MAX(totalprice) AS maxprice, AVG(totalprice) AS averageprice 
FROM "Order"
GROUP BY businessentityid
