# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS roles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

DROP TABLE IF EXISTS skills;
CREATE TABLE skills (
    id int not null,
    name varchar(255) not null,
    description varchar(255) not null,
    tag varchar(255) not null,
    url varchar(255),
    skills_time_commitment int,
    primary key (id)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills ( id, name, description, tag ) values
( 1, 'Juggling', 'The act of continuously tossing items into the air and catching them.', 'Skill 1'),
( 2, 'Gaming', 'The act of participating in an electronic videogame.', 'Skill 2'),
( 3, 'Cooking', 'The act of preparing food.', 'Skill 3'),
( 4, 'Archery', 'The practice of using a bow and arrow.', 'Skill 4'),
( 5, 'Public Speaking', 'The concept of talking with intent in a public area, ususally in front of a crowd.', 'Skill 5'),
( 6, 'Playing the Hurdy Gurdy', 'The ability to play the strange instrument known as the Hurdy Gurdy', 'Skill 6'),
( 7, 'Bouldering', 'The act of climbing various rocks and stone formations without much equipment, usually on a trail', 'Skill 7'),
( 8, 'Drawing', 'The act of creating an image using a writing utensil and some object to use that utensil on', 'Skill 8');


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

DROP TABLE IF EXISTS people;
CREATE TABLE people (
    people_id int NOT NULL,
    people_first_name varchar(256),
    people_last_name varchar(256) NOT NULL,
    people_email varchar(256),
    people_linkedin_url varchar(256),
    people_discord_handle varchar(256),
    people_brief_bio varchar(4096),
    people_date_joined date NOT NULL,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (people_id, people_first_name, people_last_name, people_email, people_linkedin_url, people_discord_handle, people_brief_bio, people_date_joined) VALUES 
(1, 'John', 'Person 1', 'john.person1@example.com', 'https://www.linkedin.com/johndoe', 'johndoe#1234', 'Software Engineer', '2023-01-15'),
(2, 'Jane', 'Person 2', 'jane.person2@example.com', 'https://www.linkedin.com/janesmith', 'janesmith#5678', 'Data Scientist', '2023-02-20'),
(3, 'Alice', 'Person 3', 'alice.person3@example.com', 'https://www.linkedin.com/alicejohnson', 'alicejohnson#9876', 'Marketing Specialist', '2023-03-10'),
(4, 'Eve', 'Person 4', 'eve.person4@example.com', 'https://www.linkedin.com/evesmith', 'evesmith#5678', 'Graphic Designer', '2023-05-15'),
(5, 'Charlie', 'Person 5', 'charlie.person5@example.com', 'https://www.linkedin.com/charliebrown', 'charliebrown#9876', 'HR Consultant', '2023-06-20'),
(6, 'Grace', 'Person 6', 'grace.person6@example.com', 'https://www.linkedin.com/gracejohnson', 'gracejohnson#1234', 'Financial Analyst', '2023-07-10'),
(7, 'Michael', 'Person 7', 'michael.person7@example.com', 'https://www.linkedin.com/michaelsmith', 'michaelsmith#1234', 'Product Manager', '2023-08-25'),
(8, 'Sarah', 'Person 8', 'sarah.person8@example.com', 'https://www.linkedin.com/sarahwilson', 'sarahwilson#5678', 'UX Designer', '2023-09-12'),
(9, 'David', 'Person 9', 'david.person9@example.com', 'https://www.linkedin.com/davidjones', 'davidjones#9876', 'Sales Representative', '2023-10-05'),
(10, 'Olivia', 'Person 10', 'olivia.person10@example.com', 'https://www.linkedin.com/oliviamiller', 'oliviamiller#5678', 'Content Writer', '2023-11-18');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can be NULL. ID can be auto_increment.

DROP TABLE IF EXISTS peopleskills;
CREATE TABLE peopleskills (
    id INT AUTO_INCREMENT NOT NULL,
    skills_id INT NOT NULL,
    people_id INT NOT NULL,
    date_acquired DATE DEFAULT (current_date),
    PRIMARY KEY (id),
    FOREIGN KEY (skills_id) REFERENCES skills (id) ON DELETE CASCADE,
    FOREIGN KEY (people_id) REFERENCES people (people_id),
    unique (skills_id, people_id)
);




# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

insert into peopleskills (people_id, skills_id) values
(1,1),
(1,3),
(1,6),
(2,3),
(2,4),
(2,5),
(3,1),
(3,5),
(5,3),
(5,6),
(6,2),
(6,3),
(6,4),
(7,3),
(7,5),
(7,6),
(8,1),
(8,3),
(8,5),
(8,6),
(9,2),
(9,5),
(9,6),
(10,1),
(10,4),
(10,5);


 

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

DROP TABLE IF EXISTS roles;
CREATE TABLE roles (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(256),
    sort_priority INT
);



# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (role_id, role_name, sort_priority) VALUES
(1, 'Designer', 10),
(2, 'Developer', 20),
(3, 'Recruit', 30),
(4, 'Team Lead', 40),
(5, 'Boss', 50),
(6, 'Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

DROP TABLE IF EXISTS peopleroles;
CREATE TABLE peopleroles (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    people_id INT NOT NULL,
    role_id INT NOT NULL,
    date_assigned DATE NOT NULL
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES 
(1, 2, '2023-05-17'),
(2, 5, '2023-11-08'),
(2, 6, '2023-06-23'),
(3, 2, '2023-08-14'),
(3, 4, '2023-03-02'),
(4, 3, '2023-10-20'),
(5, 3, '2023-07-31'),
(6, 2, '2023-02-11'),
(6, 1, '2023-09-05'),
(7, 1, '2023-04-29'),
(8, 1, '2023-06-12'),
(8, 4, '2023-12-03'),
(9, 2, '2023-08-28'),
(10, 2, '2023-05-05'),
(10, 1, '2023-10-09');


    
    
        
    
    
    
    
    
   
    
    
    
    

