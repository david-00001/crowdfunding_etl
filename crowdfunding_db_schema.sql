CREATE TABLE Contacts (
	contact_id int PRIMARY KEY NOT NULL,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	email VARCHAR(50) NOT NULL
);

CREATE TABLE Category (
	category_id VARCHAR(10) PRIMARY KEY NOT NULL,
	category VARCHAR(25) NOT NULL
);

CREATE TABLE Subcategory (
	subcategory_id VARCHAR(10) PRIMARY KEY NOT NULL,
	subcategory VARCHAR(25) NOT NULL
);

CREATE TABLE Campaign (
	cf_id int PRIMARY KEY NOT NULL,
	contact_id int NOT NULL,
	company_name VARCHAR(50),
	description VARCHAR(100),
	goal decimal,
	pledged decimal,
	outcome VARCHAR(25),
	backers_count int,
	country CHAR(2),
	currency CHAR(3),
	launched_date date,
	end_date date,
	category_id VARCHAR(10),
	subcategory_id VARCHAR(10),
	FOREIGN KEY (contact_id) REFERENCES Contacts(contact_id),
	FOREIGN KEY (category_id) REFERENCES Category(category_id),
	FOREIGN KEY (subcategory_id) REFERENCES Subcategory(subcategory_id)
);

DROP TABLE Campaign;

SELECT * FROM Campaign;
SELECT * FROM Contacts;
SELECT * FROM Category;
SELECT * FROM Subcategory;

SELECT Contacts.first_name,Contacts.last_name,Campaign.company_name,Category.category,Subcategory.subcategory
FROM Campaign
INNER JOIN Contacts ON Campaign.contact_id = Contacts.Contact_id
INNER JOIN Category ON Campaign.category_id = Category.category_id
INNER JOIN Subcategory ON Campaign.subcategory_id = Subcategory.subcategory_id;