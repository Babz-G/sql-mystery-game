-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?


-- ✨✨ Case # 001: The Vanishing Briefcase ✨✨
-- Set in the gritty 1980s, a valuable briefcase has disappeared from the Blue Note Lounge.
-- A witness reported that a man in a trench coat was seen fleeing the scene.
--Investigate the crime scene, review the list of suspects, and examine interview transcripts
--to reveal the culprit.

-- ✨✨ Objectives ✨✨
-- 1. Retrieve the correct crime scene details to gather the key clue.
-- 2. Identify the suspect whose profile matches the witness description.
-- 3. Verify the suspect using their interview transcript

SELECT * FROM crime_scene;
-- 100 diff results returned. Should have inititally used WHERE as well.

SELECT * FROM crime_scene
WHERE location = 'Blue Note Lounge';

-- ✨✨Returns:✨✨
-- id: 76
-- date: 19851120
-- type: theft
-- location: Blue Note Lounge
-- description: A briefcase containing sensitive documents vanished.
-- A witness reported a man in a trench coat with a scar on his left cheek fleeing the scene.

SELECT * FROM suspects
WHERE scar = 'left cheek'
AND attire = 'trench coat';

-- ✨✨Returns:✨✨
-- id: 3
-- name: Frankie Lombardi
-- attire: trench coat
-- scar: left cheek

-- id: 183
-- name: Vincent Malone
-- attire: trench coat
-- scar: left cheek


SELECT * FROM interviews
WHERE suspect_id = 3
OR suspect_id = 183;

-- ✨✨Returns:✨✨
-- suspect_id: 3
-- transcript: NULL

-- suspect_id: 183
-- transcript: I wasn’t going to steal it, but I did.
-- 
✨✨ Suspect = Vincent Malone ✨✨

-- ✨✨Case Solved!✨✨
-- Congratulations, detective! You have successfully identified Vincent Malone as the culprit.

-- ✨✨Explanation✨✨
-- First, you retrieved the crime scene details from the 'crime_scene' table which mentioned
-- a man in a trench coat with a scar on his left cheek. Next, querying the 'suspects' table
-- narrowed the field down to two individuals. Finally, examining the 'interviews' table confirmed
-- that Vincent Malone indeed stole the briefcase.