-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

-- ✨✨Case # 4: The Vanishing Diamond✨✨
-- At Miami’s prestigious Fontainebleau Hotel charity gala, the famous “Heart of Atlantis” diamond
--necklace suddenly disappeared from its display.

-- ✨✨Objectives✨✨
-- 1. Find who stole the diamond.

SELECT * FROM crime_scene
WHERE location = 'Fontainebleau Hotel';

-- ✨✨RESULTS✨✨
-- id: 48
-- date: 19870520
-- location: Fontainebleau Hotel
-- description: The Heart of Atlantis necklace disappeared. Many guests were questioned but only two
-- of them gave valuable clues. One of them is a really famous actor. The other one is a woman who
-- works as a consultant for a big company and her first name ends with "an".

SELECT * FROM guest
WHERE name LIKE '%an %'
AND occupation = 'consultant';

-- ✨✨RESULTS✨✨
-- Nada 🤷🏻‍♀️

SELECT * FROM guest
WHERE name LIKE '%an %'

-- ✨✨RESULTS✨✨
-- id: 14
-- name: Ethan Taylor
-- occupation: Financial Analyst
-- invitation_code: VIP-B

-- id: 22
-- name: Sebastian Lewis
-- occupation: Music Producer
-- invitation_code: VIP-R

-- id: 40
-- name: Julian Wood
-- occupation: Sports Team Owner
-- invitation_code: VIP-R

-- id: 60
-- name: Roman Fisher
-- occupation: Nightclub Owner
-- invitation_code: VIP-G

-- id: 116
-- name: Vivian Nair
-- occupation: Consultant
-- invitation_code: VIP-R

✨✨Vivian Nair = Consultant and first name ends in "an"✨✨

SELECT * FROM guest
WHERE occupation = 'Actor';

-- ✨✨RESULTS✨✨
-- id: 43
-- name: Ruby Baker
-- occupation: Actor
-- invitation_code: VIP-R

-- id: 129
-- name: Clint Eastwood
-- occupation: Actor
-- invitation_code: VIP-G

-- id: 164
-- name: River Bowers
-- occupation: Actor
-- invitation_code: VIP-B

-- id: 189
-- name: Sage Dillon
-- occupation: Actor
-- invitation_code: VIP-G

-- id: 192
-- name: Phoenix Pitts
-- occupation: Actor
-- invitation_code: VIP-G

✨✨Clint Eastwood = Famous actor from list✨✨