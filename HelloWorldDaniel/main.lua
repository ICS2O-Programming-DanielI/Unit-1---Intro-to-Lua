-- Title: HelloWorld
-- Name: Daniel Imperadeiro
-- Course: ICS2O/3C
-- This program displays Hello to the simulator and to the command terminal.-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- print "Hello, World" to the command terminal
print ("By:Daniel")
print ("Hello Patrick!")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets the background colour
display.setDefault("background", 65/255, 105/255, 225/255)

-- create a local variable
local textObject
local textObjectSignature

-- displays text on the screen at the position x = 500 and y = 500 with
-- a deafult font style and font size of 50
textObject = display.newText( "By:Daniel", 500, 500, nil, 50)
textObjectSignature = display.newText( "Hello, Patrick!", 500, 200, nil, 75)

-- sets the color of the text
textObject:setTextColor(72/255, 209/255, 204/255)
textObjectSignature:setTextColor(250/255, 128/255, 114/255)
