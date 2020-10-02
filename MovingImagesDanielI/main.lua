-- Title: MovingObjects
-- Name: Daniel Imperadeiro
-- Course: ICS2O/3C
-- This program moves a beetleship and an octopus across the screen and then makes it fade out.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 3

scrollSpeed2 = 9 

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

local octopus = display.newImageRect("Images/octopus.png", 300, 200)

-- set the image to be transparent
beetleship.alpha = 1

octopus.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3
 
octopus.x = 1024
octopus.y = display.contentHeight/1.3

octopus:scale (-1, 1)

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	-- change the transparency of the ship every time it moves so that it fades out
	beetleship.alpha = beetleship.alpha - 0.001
	-- Scale the image by 200% (x) and 50% (y)
	beetleship:scale( 1.002, 1.002 )
end

local function MoveShip2(event)
	-- add the scroll speed to the x-value of the ship
	octopus.x = octopus.x - scrollSpeed2
	-- change the transparency of the ship every time it moves so that it fades out
	octopus.alpha = octopus.alpha + 0.01
	
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

Runtime:addEventListener("enterFrame", MoveShip2)
