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
-- one who lives on 300ish "Ocean Drive" and another whose first name ends with "ul" and his last name ends with "ez".