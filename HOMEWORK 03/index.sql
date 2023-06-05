-- HOMEWORK 03

-- How can you retrieve all the information from the facilities table?
SELECT * FROM facilities

-- How can you produce a list of facilities that charge a fee to members? All facilities that are in the bookings.

SELECT * FROM bookings

SELECT DISTINCT   name,membercost
FROM facilities  AS f
INNER JOIN bookings AS b ON  f.facid = b.facid
WHERE f.membercost > 0;

-- How can you produce a list of facilities that charge a fee to members,
-- and that fee is less than 1/50th of the monthly maintenance cost?
-- Return the facid, facility name, member cost,
-- and monthly maintenance of the facilities in question.
SELECT DISTINCT f.facid ,f.name,f.membercost,f.monthlymaintenance
FROM facilities  AS f
INNER JOIN bookings AS b ON  f.facid = b.facid
WHERE f.membercost > 0
AND f.membercost < f.monthlymaintenance /  50;

-- How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.

SELECT * FROM facilities
WHERE facid IN (1,5)

--  You'd like to get the signup date of your last member. How can you retrieve this information?

SELECT joindate FROM members
ORDER BY joindate DESC

-- You'd like to get the first and last name of the last member(s)
-- who signed up - not just the date. How can you do that?
SELECT joindate ,surname,firstname FROM members
ORDER BY joindate DESC

-- Produce a list of the total number of slots booked per facility.
-- For now, just produce an output table consisting of facility id and slots, sorted by facility id.

SELECT * FROM facilities
SELECT * FROM bookings

SELECT facid , COUNT(*)  AS slots
FROM bookings
GROUP BY facid


-- . Find the total number of members (including guests) who have made at least one booking.


SELECT * FROM members
SELECT * FROM bookings

SELECT DISTINCT m.firstname
FROM members  AS m
INNER JOIN bookings AS b ON  m.memid = b.memid
WHERE m.memid > 0


SELECT COUNT(DISTINCT memid) AS total_members_with_bookings
FROM bookings;

