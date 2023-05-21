-- How can you produce a list of facilitites that charge a fee to memebers and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost and monthly maintenance of the facilities in question 
--ne mi dava facid da ga selektiram 
SELECT facid, name, membercost, monthlymaintenance FROM facilities
INNER JOIN bookings
ON facilities.facid = bookings.facid
WHERE membercost < (1/50 * monthlymaintenance);

-- How can you retrive the details of facilities with id 1 and 5
SELECT * FROM bookings 
INNER JOIN facilities
ON bookings.facid = facilities.facid
WHERE facilities.facid IN (1, 5)

-- You'd like to get the signup date of your last member. How can you retrive this information
SELECT joindate FROM members
LEFT OUTER JOIN bookings
ON bookings.memid = members.memid
ORDER BY joindate DESC
FETCH FIRST ROW ONLY


-- You'd like to get the first and last name of the last member(s) who sigend up not just the date 
SELECT joindate, firstname, surname FROM members
LEFT OUTER JOIN bookings
ON bookings.memid = members.memid
ORDER BY joindate DESC
FETCH FIRST ROW ONLY


-- Produce a list of total number of slots book per facility. For now just produce an output table consisting facility id and slots sorted by facility id
SELECT name, COUNT(*) FROM bookings
INNER JOIN facilities
ON bookings.facid = facilities.facid
GROUP BY name


-- Find the total amount of members(including guests) who have made at least one booking
SELECT firstname, COUNT(*) FROM bookings
INNER JOIN members
ON members.memid = bookings.memid
GROUP BY firstname


-- Calculate the total amount per businessentity on all orders in the system from customers with id >5
SELECT name, SUM(totalprice) FROM businessentity
INNER JOIN "Order"
ON businessentity.id = "Order".businessentityid
WHERE businessentity.id > 5
GROUP BY name


-- Find the maximal order amount and the average order amount per businessentity on all orders in the system
SELECT name, MAX(totalprice), AVG(totalprice)
FROM businessentity
INNER JOIN "Order"
ON businessentity.id = "Order".businessentityid
GROUP BY name