USE athletes_db;


#views


# view_french_speaking_athletes
# Purpose: Displays the french speaking swimmers in a table
# Uses: JOIN, WHERE

-- Drop the view if it exists
DROP VIEW IF EXISTS view_french_speaking_athletes;

-- Create view
CREATE VIEW view_french_speaking_athletes AS
SELECT i.first_name, i.last_name, l.language
FROM information i
JOIN information_languages il ON i.information_id = il.information_id
JOIN languages l ON il.language_id = l.language_id
WHERE l.language = 'French';



# view_french_birth_count
# Purpose: Count the number of athletes born in France
# Uses: JOIN, WHERE, COUNT or aggregate

-- Drop the view if it exists
DROP VIEW IF EXISTS view_french_birth_count;

-- Create view
CREATE VIEW view_french_birth_count AS
SELECT b.birth_country, COUNT(i.information_id) AS french_born_athlete_count
FROM information i
JOIN birth b ON i.information_id = b.birth_id
WHERE b.birth_country = 'France'
GROUP BY b.birth_country;



# view_birth_year_2000
# Purpose: Displays a table of athletes born in the year 2000 with their birthdays and the number of athletes born on that day
# Uses: WHERE, subquery, COUNT or aggregate

-- Drop the view if it exists
DROP VIEW IF EXISTS view_birth_year_2000;

-- Create the view using a subquery
CREATE VIEW view_birth_year_2000 AS
SELECT birth_date, COUNT(DISTINCT information_id) AS athletes_born
FROM (
    SELECT i.information_id, i.birth_date
    FROM information i
    WHERE i.birth_date LIKE '%2000%'
) AS year_2000
GROUP BY birth_date;



# view_events_freestyle
# Purpose: Displays a table of the names of athletes do participated in a freestyle event
# Uses: JOIN, WHERE, subquery

-- Drop the view if it exists
DROP VIEW IF EXISTS view_events_freestyle;

-- Create the view using a subquery
CREATE VIEW view_events_freestyle AS
SELECT first_name, last_name, event
FROM (
    SELECT i.information_id, i.first_name, i.last_name, e.event
    FROM information i
    JOIN information_events ie ON i.information_id = ie.information_id
    JOIN events e ON ie.event_id = e.event_id
    WHERE e.event LIKE '%freestyle%'
) AS freestyle;



#procedues

#1
DROP PROCEDURE IF EXISTS filter_athlete;

DELIMITER //
CREATE PROCEDURE filter_athlete(IN first_name_entry VARCHAR(20))
BEGIN
SELECT First_Name, Last_Name FROM information
WHERE First_name LIKE CONCAT('%', first_name_entry, '%');
END //
DELIMITER ;

-- Calling the procedure
CALL filter_athlete("ALEX");


#2
DROP PROCEDURE IF EXISTS set_nickname;

DELIMITER //
CREATE PROCEDURE set_nickname(IN info INT)
BEGIN
    UPDATE information
    SET nick_name = 'Cami'
    WHERE information_id = info;
END //
DELIMITER ;

-- Calling the procedure
CALL set_nickname(7);



#functions

#1
DROP FUNCTION IF EXISTS all_spanish_female_athletes;

DELIMITER //
CREATE FUNCTION all_spanish_female_athletes(gender_entry VARCHAR(10), country_entry VARCHAR(20))
RETURNS VARCHAR(25)
DETERMINISTIC
BEGIN
DECLARE spanish_lady_athletes VARCHAR(25);
    SELECT COUNT(*) INTO spanish_lady_athletes
    FROM information
    JOIN countries USING (Countries_id)
    JOIN gender USING (Gender_id)
    WHERE Gender = gender_entry AND Country = country_entry;
    RETURN spanish_lady_athletes;
END //
DELIMITER ;

# select statement to see if it works
SELECT all_spanish_female_athletes('Female', 'Spain');


#2
DROP FUNCTION IF EXISTS fetched_athlete_birthday;

DELIMITER //
CREATE FUNCTION fetched_athlete_birthday(birthday_date_entry VARCHAR(20))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
DECLARE an_athlete_birthday VARCHAR(20);
SELECT COUNT(*) INTO an_athlete_birthday
FROM information
WHERE birthday_date_entry = Birth_date;
RETURN an_athlete_birthday;
END //
DELIMITER ;

# select statement to see if it works
SELECT fetched_athlete_birthday(CAST('1995-02-14' AS DATE));


################################
DROP TRIGGER IF EXISTS trg_set_nickname;

DELIMITER //
CREATE TRIGGER trg_set_nickname
BEFORE UPDATE ON information
FOR EACH ROW
BEGIN
    SET NEW.nick_name = 'Cami';
END //
DELIMITER ;




