-- NOTE: This script does not include foreign key columns. 

--  booking agency
SELECT name, phone, contactPerson FROM bookingAgency LIMIT 1;

-- section
SELECT id, level FROM section  LIMIT 1;

-- customer
SELECT id, phone FROM customer LIMIT 1;

-- performer
SELECT id, name FROM performer LIMIT 1;

-- seat
SELECT number FROM seat  LIMIT 1;

-- show_relation
SELECT id, title, performer_id,  opening_performer_id FROM show_relation  LIMIT 1;

-- performance
SELECT date, time FROM performance LIMIT 1;

-- ticket
SELECT number FROM ticket LIMIT 1;

-- sold_ticket
SELECT price FROM sold_ticket LIMIT 1;
