-- Movie ID must be unique (Primary Key 1)
INSERT INTO Movie VALUES (1, 'Fast and Furious 7', '2015', 'PG13', 'Universal Pictures');

-- Actor ID must be unique (Primary Key 2)
INSERT INTO Actor VALUES (1, 'Diesel', 'Vin', 'Male', '1967-7-18', NULL);

-- Director ID must be unique (Primary Key 3)
INSERT INTO Director VALUES (1, 'Wan', 'James', '1977-2-27', NULL);

-- mid in MovieGenre references id in Movie (Foreign Key 1)
DELETE FROM Movie WHERE id = 1;

-- mid in MovieDirector references id in Movie (Foreign Key 2)
DELETE FROM Movie WHERE id = 1;

-- did in MovieDirector references id in Director (Foreign Key 3)
DELETE FROM Director WHERE id = 1;

-- mid in MovieActor references id in Movie (Foreign Key 4)
DELETE FROM Movie WHERE id = 1;

-- aid in MovieActor references id in Actor (Foreign Key 5)
DELETE FROM Actor WHERE id = 1;

-- mid in Review references id in Movie (Foreign Key 6)
DELETE FROM Movie WHERE id = 1;