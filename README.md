# athlete_database
This SQL project is an Olympic Swimmer Database that stores and organizes information about swimmers who have competed in the Olympic Games. The database includes
details such as personal information, country, and events participated in.

#Project Overview
The project's dataset describes several attributes of different Olympic swimmers that have participated in the Olympics at least once. The database we are building
can be described as a compilation of Olympian swimmers’ personal data (i.e. full name, birth country, gender, languages spoken) and of their relay type (i.e. Men’s
100m Breaststroke, Women’s 200m Freestyle). The objective of our database is to create a resource that contains personal and relay data solely on Olympic swimmers.
This way, our resource can be effective for data miners and/or analysts who are looking to write SQL queries that fetch Olympian swimmer data only. The goal of
this project is to create a structured database of Olympic swimmers. It provides easy access to data, allowing users to search for swimmers by various
attributes, such as name, country, event, or even their birth details.

The database contains the following fields:

- **Last Name**: The swimmer's last name.
- **First Name**: The swimmer's first name.
- **Nickname**: The swimmer's common nickname.
- **Birth Date**: The swimmer's date of birth.
- **Gender**: The swimmer's gender (e.g., Male, Female).
- **Country Code**: The swimmer's country code (e.g., USA for the United States).
- **Country**: The swimmer's country (e.g., United States).
- **Country (Long)**: The long-form name of the country (e.g., United States of America).
- **Birth Place**: The city or region where the swimmer was born.
- **Birth Country**: The country where the swimmer was born.
- **Languages**: The languages spoken by the swimmer.
- **Events**: The Olympic events the swimmer has competed in.

This project allows you to filter, sort, and view detailed swimmer data to analyze trends, performances, and even explore various records in the Olympics.

## Development Process

The project was built using the following approach:

1. Dataset Discovery & Project Planning
We began by sourcing the dataset from Kaggle, a trusted platform for high-quality public datasets. After reviewing the data, we outlined the primary goals of the
project and brainstormed potential queries that users might run — such as searching swimmers by event, filtering by country, or analyzing participation by gender
or era.

3. Entity Relationship Diagram (ERD) & Normalization
Using the dataset as a foundation, we designed an Entity Relationship Diagram (ERD) in SQL workbench that adheres to the principles of Third Normal Form (3NF). The
schema included at least seven tables, along with necessary linking tables to support many-to-many relationships (e.g., swimmers and events). This ensured the
database was logically structured and avoided redundancy. Once the data was validated, we saved it as a .mwb to use for later when creating the schema.

4. Sample Data Preparation in Excel
We prepared sample data for each table in Microsoft Excel. Each worksheet corresponded to a table from the ERD, with correctly defined column names, data types,
and clear primary-foreign key (PK-FK) relationships. This step was crucial for ensuring a smooth data import later in the process.

5. Database Schema Creation & Data Import
Using MySQL Workbench, we created the full database schema, reflecting the ERD structure. After that, we imported the prepared Excel sheets into their
corresponding tables. Once the data was validated, we exported the entire schema and data as a .sql file for portability and backup.

6. Stored Programs Development
To enhance database functionality and support common queries, we created a set of stored programs in SQL. This included views, functions and procedures. 


## Functionality or Programs

**4 Views**
1. view_french_speaking_athletes: Displays the French speaking swimmers in a table.
2. view_french_birth_count: Counts the number of athletes born in France.
3. view_birth_year_2000: Displays a table of athletes born in the year 2000 with their birthdays and the number of athletes born on that day.
4. view_events_freestyle: Displays a table of the names of athletes do participated in a freestyle event.


**2 Functions**
1. all_spanish_female_athletes: Generate a function of female athletes from Spain.
2. fetched_athlete_birthday:the user will enter in a birthdate using the following format: YYYY-MM-DD, and this function will return the number of athletes that
3. have that birthday. 



**2 Procedures**
1. filter_athlete: Show a table with athlete first names filtered by a search term.
2. set_nickname: Update the nickname of a athlete in the information table.






