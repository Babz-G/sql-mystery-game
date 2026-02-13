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

SELECT * FROM get_fit_now_check_in
WHERE membership_id LIKE '48Z%'
AND check_in_date = 20180109;

-- membership_id: 48Z7A
-- check_in_date: 20180109
-- check_in_time: 1600
-- check_out_time: 1730

-- membership_id: 48Z55
-- check_in_date: 20180109
-- check_in_time: 1530
-- check_out_time: 1700

SELECT * FROM drivers_license
WHERE plate_number LIKE '%H42W%';

--id: 183779
--age: 21
--height: 65
--eye_color: blue
--hair_color: blonde
---gender: female
--plate_number: H42W0X
--car_make: Toyota
--car_model: Prius

--id: 423327
--age: 30
--height: 70
--eye_color: brown
--hair_color: brown
---gender: male
--plate_number: 0H42W2
--car_make: Chevrolet
--car_model: Spark LS

--id: 664760
--age: 21
--height: 71
--eye_color: black
--hair_color: black
---gender: male
--plate_number: 4H42WR
--car_make: Nissan
--car_model: Altima


SELECT * FROM person
WHERE id = 28819
OR id = 67318;

--id: 28819
--name: Joe Germuska
--license_id: 173289
--address_number: 111
--address_street_name: 	Fisk Rd
--ssn: 138909730


--id: 67318
--name: Jeremy Bowers
--license_id: 423327
--address_number: 530
--address_street_name: Washington Pl, Apt 3A
--ssn: 871539279

INSERT INTO solution VALUES (1, 'Jeremy Bowers');
SELECT value FROM solution;

-- value: Congrats, you found the murderer! But wait, there's more...
-- If you think you're up for a challenge, try querying the interview
-- transcript of the murderer to find the real villain behind this crime.
-- If you feel especially confident in your SQL skills, try to complete
-- this final step with no more than 2 queries. Use this same INSERT statement
-- with your new suspect to check your answer.

-- Jeremy Bowers with license_id 423327
	
--✨ I feel like I made it a lot more difficult than it should have been. ✨
--✨ I will revisit this weekend most likely. ✨
--✨ Handing in, as is, for the sake of the assignment. ✨