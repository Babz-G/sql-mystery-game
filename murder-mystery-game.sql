-- Record your SQL detective process here!  Write down: 
--   1. The SQL queries you ran
--   2. Any notes or insights as SQL comments
--   3. Your final conclusion: who did it?

-- Using these SQL clauses will help you solve the mystery: 
--    SELECT, FROM, WHERE, AND, OR, ORDER BY, LIMIT, LIKE, DISTINCT, BETWEEN, AS

-- writing a comment like this

-- selecting all columns from the crime scene report

-- A crime has taken place and the detective needs your help.
-- The detective gave you the crime scene report, but you somehow lost it.
-- You vaguely remember that the crime was a ​murder​ that occurred sometime on 
-- Jan.15, 2018​ and that it took place in ​SQL City​. Start by retrieving the
-- corresponding crime scene report from the police department’s database.

SELECT * FROM crime_scene_report;

SELECT *  FROM crime_scene_report WHERE date = '20180115'

SELECT *  FROM crime_scene_report
WHERE date = '20180115'
AND city = 'SQL City'
AND type = 'murder'

-- Date: 20180115
--Type: murder
--Description: Security footage shows that there were
--2 witnesses. The first witness lives at the last house on "Northwestern Dr".
--The second witness, named Annabel, lives somewhere on "Franklin Ave".
--City: SQL City

SELECT * FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;

--id: 14887
--name: Morty Schapiro
--license_id: 118009
--address_number: 4919
--address_street_name: Northwestern Dr
--ssn: 111564949

SELECT * FROM person
WHERE name LIKE 'Annabel%'
AND address_street_name = 'Franklin Ave';

--id: 16371
--name: Annabel Miller
--license_id: 490173
--address_number: 103
--address_strret_name: Franklin Ave
--ssn: 318771143

SELECT * FROM interview
WHERE person_id = 14887 OR person_id = 16371;

--person_id: 14887	
--transcript: I heard a gunshot and then saw a man run out.
--He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z".
--Only gold members have those bags. The man got into a car with a plate that included "H42W".

--person_id: 16371
--transcript: I saw the murder happen, and I recognized the killer from my gym when I was
--working out last week on January the 9th.

SELECT * FROM get_fit_now_member
WHERE id LIKE '48Z%'
AND membership_status = 'gold';

--id: 48Z7A
--person_id: 28819
--name: Joe Germuska
--membership_start_date: 20160305
--membership_status: gold
		
--id: 48Z55
--person_id: 67318
--name: Jeremy Bowers
--membership_start_date: 20160101
--membership_status: gold