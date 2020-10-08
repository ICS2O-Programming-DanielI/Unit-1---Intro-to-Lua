-- Title: TouchAndReact
-- Name: Daniel Imperadeiro
-- Course: ICS2O/3C
-- This program does something when I click on the button.

--set background colour
display.setDefault ("background", 0/255, 255/255, 255/255)

--hide status bar
display.setStatusBar(display.HiddenStatusBar)

local correctanswersound = audio.loadStream( "Sounds/Correct Answer Sound Effect.mp3" )
local correctanswersoundeffect

-- create blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png",198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true 

-- create red button, set its position and make it invisable
local redButton = display.newImageRect("Images/Fast Button Active@2x.png",198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create checkmark, set its position and make it invisable
local checkmark = display.newImageRect("Images/checkmark.png",210, 140)
checkmark.x = display.contentWidth/2
checkmark.y = display.contentHeight/2
checkmark.isVisible = false

-- create text object, set its position and make it invisible
local textObject = display.newText ("Clicked", 0 , 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (0.8, 0, 0.4)
textObject.isVisible = false



-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make the text appear with the red button,
-- and make the blue button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		checkmark.isVisible = true
		-- Play the laser on any available channel
		correctanswersoundeffect = audio.play(correctanswersound)
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		checkmark.isVisible = false
	end
end

local function RedButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = true
		checkmark.isVisible = false
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		checkmark.isVisible = false
		
	end
end

-- add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)

redButton:addEventListener("touch", RedButtonListener)