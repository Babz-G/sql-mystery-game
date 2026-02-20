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

SELECT guest.name, witness_statements.clue
FROM guest
JOIN witness_statements ON guest.id = witness_statements.guest_id
WHERE guest.id = 116
OR guest.id = 129;

-- ✨✨RESULTS✨✨
-- name: Vivian Nair
-- clue: I saw someone holding an invitation ending with "-R". He was wearing a navy suit and a white tie.

-- name: Clint Eastwood
-- clue: I overheard someone say, "Meet me at the marina, dock 3".

SELECT guest.name, attire_registry.note
FROM guest
JOIN attire_registry ON guest.id = attire_registry.guest_id
WHERE attire_registry.note LIKE '%navy%'
AND attire_registry.note LIKE '%white tie%';

-- ✨✨RESULTS✨✨
-- name: Phoenix Velazquez
-- note: navy suit, white tie

-- name: Eden Todd
-- note: navy suit, white tie

-- name: Mike Manning
-- note: navy suit, white tie

-- name: Atlas Owens
-- note: navy suit, white tie

-- name: Atlas Roach
-- note: navy suit, white tie

-- name: Sage Dillion
-- note: navy suit, white tie

-- name: Luna Dalton
-- note: navy suit, white tie

-- name: Atlas Roach
-- note: navy suit, white tie

SELECT guest.name, guest.invitation_code, attire_registry.note
FROM guest
JOIN attire_registry ON guest.id = attire_registry.guest_id
WHERE attire_registry.note LIKE '%navy%'
AND attire_registry.note LIKE '%white tie%'
AND guest.invitation_code LIKE '%-R';

-- ✨✨RESULTS✨✨

-- name: Mike Manning
-- invitation_code: VIP-R
-- note: navy suit, white tie

SELECT guest.name, marina_rentals.dock_number, marina_rentals.boat_name
FROM guest JOIN marina_rentals ON guest.id = marina_rentals.renter_guest_id
WHERE guest.name = 'Mike Manning' AND marina_rentals.dock_number = 3;

-- RESULTS
-- name: Mike Manning
-- dock_number: 3
-- boat_name: Coastal Spirit

SELECT guest.name, final_interviews.confession
FROM guest
JOIN final_interviews ON guest.id = final_interviews.guest_id
WHERE guest.name = 'Mike Manning';

-- ✨✨RESULTS✨✨
-- name: Mike Manning
-- confession: I was the one who took the crystal. I guess I need a lawyer now?

✨✨ Suspect = Mike Manning ✨✨

-- ✨✨Case Solved!✨✨
-- Outstanding detective work! The evidence conclusively shows that Mike Manning is the thief.

-- ✨✨Explanation✨✨
-- You began by retrieving the crime scene record and examining witness statements, which mentioned a dock rental,
-- part of a VIP-R invitation and a navy suit. Filtering marina rentals by these clues returned multiple entries.
-- A multiple JOIN with the guest table and attire registry returned one candidate. A final interview with that
-- candidate resulted in a confession. Thus, the true thief is Mike Manning.