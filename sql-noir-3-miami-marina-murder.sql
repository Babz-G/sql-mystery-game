-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

-- ✨✨Case # 3: The Miami Marina Murder✨✨
-- A body was found floating near the docks of Coral Bay Marina in the early hours of August 14, 1986.
--Your job, detective, is to find the murderer and bring them to justice.
--This case might require the use of JOINs, wildcard searches, and logical deduction.
--Get to work, detective.

-- ✨✨Objectives✨✨
-- 1. Find the murderer. ( Start by finding the crime scene and go from there )

-- ✨✨TABLES✨✨
-- crime_scene: id, date, location, description
-- person: id, name, alias, occupation, address
-- interviews: id, person_id, transcript
-- hotel_checkins: id, person_id, hotel_name, check_in_date
-- surveillance_records: id, person_id, hotel_checkin_id, suspicious_activity
-- confessions: id, person_id, confession

SELECT * FROM crime_scene
WHERE date = 19860814
AND location = 'Coral Bay Marina';

-- ✨✨RESULTS✨✨
-- id: 43
-- date: 19860814
-- location: Coral Bay Marina
-- description: The body of an unidentified man was found near the docks. Two people were seen nearby:
-- one who lives on 300ish "Ocean Drive" and another whose first name ends with "ul" and his last name
--ends with "ez".

SELECT * FROM person
WHERE address LIKE '%Ocean Drive%';

-- ✨✨RESULTS✨✨
-- id: 1
-- name: Marco Romano
-- alias: The Shadow
-- occupation: Fisherman
-- address: 22 Ocean Drive

-- id: 5
-- name: Michael Santos
-- alias: Silent Mike
-- occupation: Bartender
-- address: 33 Ocena Drive

-- id: 62
-- name: Jesse Brooks
-- alias: The Judge
-- occupation: Court Clerk
-- address: 234 Ocean Drive

-- id: 101
-- name: Carolos Mendez
-- alias: Los Ojos
-- occupation: Fisherman
-- address: 369 Ocean Drive

-- id: 105
-- name: Victor Martinez
-- alias: Slick Vic
-- occupation: Bartneder
-- address: 33 Ocean Drive

-- ✨✨Witness #1 identified:✨✨
-- Closest to 300 Ocean Drive = Carlos Mendez

SELECT * FROM person
WHERE name LIKE '%ul %ez';

-- ✨✨RESULTS✨✨
-- id: 102
-- name: Raul Gutierrez
-- alias: The Cobra
-- occupation: Nightclub Owner
-- address: 45 Sunset Ave

-- ✨✨Witness #2 identified:✨✨
-- First name ends in "ul" = Raul Gutierrez

SELECT person.name, interviews.transcript
FROM person
JOIN interviews ON person.id = interviews.person_id
WHERE person.id = 101
OR person.id = 102;

-- ✨✨RESULTS✨✨
-- name: Carolos Mendez
-- transcript: I saw someone check into a hotel on August 13. The guy looked nervous.

-- name: Raul Gutierrez
-- transcript: I heard someone checked into a hotel with "Sunset" in the name.

SELECT * FROM hotel_checkins
WHERE check_in_date = 19860813
AND hotel_name LIKE '%Sunset%';

-- ✨✨RESULTS✨✨
-- (Over 100 Hotels - too many to list)

SELECT person.name, hotel_checkins.hotel_name, surveillance_records.suspicious_activity
FROM hotel_checkins
JOIN surveillance_records ON hotel_checkins.id = surveillance_records.hotel_checkin_id
JOIN person ON hotel_checkins.person_id = person.id
WHERE hotel_checkins.check_in_date = 19860813
AND hotel_checkins.hotel_name LIKE '%Sunset%';

-- ✨✨RESULTS✨✨
--(Again too many to list but "Left suddenly at 3 AM" stands out to me)

-- NAme: Jacob Campbell
-- hotel_name: Sunset Bay Hotel
-- suspicious_activity: Left suddenly at 3 AM

--(Wrong answer - whomp, whomp)

SELECT person.name, surveillance_records.suspicious_activity, confessions.confession
FROM person
JOIN surveillance_records ON person.id = surveillance_records.person_id
JOIN confessions ON person.id = confessions.person_id
WHERE surveillance_records.suspicious_activity IS NOT NULL;

-- ✨✨RESULTS✨✨
--Many different confessions

SELECT person.name, surveillance_records.suspicious_activity, confessions.confession
FROM person
JOIN surveillance_records ON person.id = surveillance_records.person_id
JOIN confessions ON person.id = confessions.person_id
WHERE surveillance_records.suspicious_activity IS NOT NULL
AND confessions.confession LIKE '%marina%';

-- (Added AND confessions.confession LIKE '%marina%'; to the query)


-- ✨✨RESULTS✨✨
-- name: Thomas Brown
-- suspicious_activity: Left suddenly at 3 AM	Alright! I did it.
-- confession: I was paid to make sure he never left the marina alive.

✨✨ Suspect = Thomas Brown ✨✨

-- ✨✨Case Solved! ✨✨
-- Great detective work! Thomas Brown has confessed to the crime.

-- ✨✨Explanation✨✨
-- The investigation started with two suspects from the crime scene, one living on Ocean Drive
-- and the other with a name ending in "ez". After interviewing them, hotel check-ins were
-- filtered using two separate clues: first by date, then further refined using surveillance records.
-- Only three people matched both filters. An interview with each of them revealed their role in the
-- case, and after pressing further, Thomas Brown confessed to the crime.