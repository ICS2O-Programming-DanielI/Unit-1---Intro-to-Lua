-- Title: PhysicsAndCollisions
-- Name: Daniel Imperadeiro
-- Course: ICS2O/3C
-- This program displays mutiple different sized balls that each have different physics

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- Sounds
local motionSound = audio.loadSound( "Sounds/motionSound.mp3" )
local motionSoundChannel

motionSoundChannel = audio.play(motionSound)

-- load physics
local physics = require("physics")

-- start physics
physics.start()

-----------------------------------------------------------------------------------------------
--Objects
-----------------------------------------------------------------------------------------------
--Ground
local ground = display.newImage("Images/ground.png", 510, 745)
   --Change the width to be the same as the screen

   ground.width = display.contentWidth

   -- Add to physics

   physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

--------------------------------------------------------------------------------------------------------
--Beam
local beam = display.newImage("Images/beam.png", 0, 0)
	
	--set the x and y pos
	beam.x = display.contentCenterX/5
	beam.y = display.contentCenterY*1.65

	beam.width = 60
	beam.height = 4000

	-- rotate the beam -60 degrees so its on an angle
	beam:rotate(-60)

	-- send it to the back layer
	beam:toBack()

	--add to physics
	physics.addBody(beam, "static", {friction=0.5, bounce=0.3})

-- beam 2
local beam2 = display.newImage("Images/beam.png", 0, 0)
	
	--set the x and y pos
	beam2.x = display.contentCenterX/0.6
	beam2.y = display.contentCenterY*1.65

	beam2.width = 50
	beam2.height = 4000

	-- rotate the beam 60 degrees so its on an angle
	beam2:rotate(60)

	-- send it to the back layer
	beam2:toBack()

	--add to physics
	physics.addBody(beam2, "static", {friction=0.5, bounce=0.3})

-- create bkg
local bkg = display.newImage("Images/bkg.png", 0, 0)

	-- set the x and y pos
	bkg.x = display.contentCenterX
	bkg.y = display.contentCenterY

	-- scale image 
	bkg:scale(1.8, 1.8 )

	-- send to back
	bkg:toBack()

--------------------------------------------------------------------------------------------------------------------
--FUNCTIONS
--------------------------------------------------------------------------------------------------------------------

-- create the first ball
local function firstBall()
	-- creating first ball
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)

	ball1.width = 200
	ball1.height = 200

	-- add to physics
	physics.addBody(ball1, {density=1.0, friction=0, bounce=0.1, radius=100})
end

---------------------------------------------------------------------------------------------------------------------

local function secondBall()
	-- create second ball
	local ball2 = display.newImage("Images/super_ball.png", 1024, 0)

	ball2.width = 25
	ball2.height = 25


	-- adding to physics
	physics.addBody(ball2, {density=0, friction=0.5, bounce=0.7, radius=12.5})

end

--------------------------------------------------------------------------------------------------------------------

local function thirdBall()
	-- create third ball
	local ball3 = display.newImage("Images/super_ball.png", 1024, 0)

	ball3.width = 100
	ball3.height = 100

	-- adding to physics
	physics.addBody(ball3, {density=1.0, friction=0.5, bounce=0.3, radius=50})

end

---------------------------------------------------------------------------------------------------------------------

local function fourthBall()
	-- create fourth ball
	local ball4 = display.newImage("Images/super_ball.png", 0, 0)

	ball4.width = 150
	ball4.height = 150

	-- adding to physics
	physics.addBody(ball4, {density=1, friction=0.9, bounce=0.7, radius=75})
end

----------------------------------------------------------------------------------------------------------------------
--TIMER DELAYS - call each function after the given millisecond
----------------------------------------------------------------------------------------------------------------------
timer.performWithDelay( 0, firstBall)

timer.performWithDelay( 1000, secondBall)

timer.performWithDelay( 2000, thirdBall)

timer.performWithDelay( 3000, fourthBall)