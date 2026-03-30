SET FOREIGN_KEY_CHECKS = 0;

USE igallini;

-- drop the many-to-many or final child tables first
DROP TABLE IF EXISTS sold_ticket;
DROP TABLE IF EXISTS ticket;

-- drop the weak entities/children
DROP TABLE IF EXISTS performance;
DROP TABLE IF EXISTS seat;

-- drop the main entities
DROP TABLE IF EXISTS show_relation;
DROP TABLE IF EXISTS performer;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS section;
DROP TABLE IF EXISTS bookingAgency;

SET FOREIGN_KEY_CHECKS = 1;

--- independent tables
CREATE TABLE bookingAgency (
    name VARCHAR(50) PRIMARY KEY,
    phone VARCHAR(20),
    contactPerson VARCHAR(50)
);

CREATE TABLE section (
    id VARCHAR(10) PRIMARY KEY,
    level INT
);

CREATE TABLE customer (
    id INT PRIMARY KEY,
    phone VARCHAR(20)
);

CREATE TABLE performer (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    bookingAgency_name VARCHAR(50),
    FOREIGN KEY (bookingAgency_name) REFERENCES bookingAgency(name)
);

--- will have 2 FKs since it has two relationships
CREATE TABLE show_relation (
    id INT PRIMARY KEY,
    title VARCHAR(100),
    performer_id INT,
    opening_performer_id INT,
    FOREIGN KEY (performer_id) REFERENCES performer(id),
    FOREIGN KEY (opening_performer_id) REFERENCES performer(id)
);

--- weak entities
CREATE TABLE performance (
    show_relation_id INT,
    date DATE,
    time TIME,
    PRIMARY KEY (show_relation_id, date, time), 
    FOREIGN KEY (show_relation_id) REFERENCES show_relation(id)
);

CREATE TABLE seat (
    section_id VARCHAR(10),
    number INT,
    PRIMARY KEY (section_id, number),
    FOREIGN KEY (section_id) REFERENCES section(id)
);

--- many to many relationships
CREATE TABLE ticket (
    number INT NOT NULL,
    show_relation_id INT,
    performance_date DATE,
    performance_time TIME,
    section_id VARCHAR(10),
    seat_number INT,
    PRIMARY KEY (number),
    CONSTRAINT ticket_ibfk_1 FOREIGN KEY (show_relation_id, performance_date, performance_time) 
    REFERENCES performance (show_relation_id, date, time),
    CONSTRAINT ticket_ibfk_2 FOREIGN KEY (section_id, seat_number) 
    REFERENCES seat (section_id, number)
);

CREATE TABLE sold_ticket (
    ticket_number INT,
    customer_id INT,
    price INT, -- Price in cents
    PRIMARY KEY (ticket_number, customer_id),
    FOREIGN KEY (ticket_number) REFERENCES ticket(number),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);