-- Title: PhysicsAndCollisions
-- Name: Daniel Imperadeiro
-- Course: ICS2O/3C
-- This program...

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

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


	-- rotate the beam -60 degrees so its on an angle
	beam:rotate(-60)

	-- send it to the back layer
	beam:toBack()

	--add to physics
	physics.addBody(beam, "static", {friction=0.5, bounce=0.3})
	-- physics.addBody()

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

	-- add to physics
	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.3, radius=25})
end

---------------------------------------------------------------------------------------------------------------------

local function secondBall()
	-- create second ball
	local ball2 = display.newImage("Images/super_ball.png", 0, 0)

	-- adding to physics
	physics.addBody(ball2, {density=1.0, friction=0.5, bounce=0.3, radius=12.5})

	-- scale the image by 
	ball2:scale(0.50, 0.50 )
end

--------------------------------------------------------------------------------------------------------------------

local function thirdBall()
	-- create third ball
	local ball3 = display.newImage("Images/super_ball.png", 0, 0)

	-- adding to physics
	physics.addBody(ball3, {density=1.0, friction=0.5, bounce=0.3, radius=12.5})

	-- scale the image by 
	ball3:scale(2, 2 )
end

---------------------------------------------------------------------------------------------------------------------

local function fourthBall()
	-- create fourth ball
	local ball4 = display.newImage("Images/super_ball.png", 0, 0)

	-- adding to physics
	physics.addBody(ball4, {density=1.0, friction=0.5, bounce=0.3, radius=12.5})

	-- scale the image by 
	ball4:scale(5, 5 )
end

----------------------------------------------------------------------------------------------------------------------
--TIMER DELAYS - call each function after the given millisecond
----------------------------------------------------------------------------------------------------------------------
timer.performWithDelay( 0, firstBall)

timer.performWithDelay( 500, secondBall)

timer.performWithDelay( 1000, thirdBall)

timer.performWithDelay( 1500, fourthBall)