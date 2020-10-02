-- Title: AreaOfRectangleAndCircle
-- Name: Daniel Imperaderadeiro
-- Course: ICS2O/3C
-- This program displays a circle and a rectangle and shows its area

-- create my local variables
local areaTextRectangle
local areaTextCircle
local textSize = 50
local myRectangle
local myCircle
local widthOfRectangle = 200
local heightOfRectangle = 150
local radius = 150
local PI= 3.14
local areaOfRectangle 

-- set the background colour of my screen.Remember that colors are between 0 and 1.
display.setDefault("background", 0/255, 255/255, 127/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

--draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

myCircle = display.newCircle( 670, 190, radius )

--anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

-- set the width of the border
myRectangle.strokeWidth = 20

myCircle.strokeWidth = 20
-- set the colour of the rectangle
myRectangle:setFillColor(1, 0, 1)

myCircle:setFillColor(1, 0.27, 0)

--set the color of the border
myRectangle:setStrokeColor(0.25, 0.87, 0.81)

myCircle:setStrokeColor(0, 0, 1)

-- calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

areaOfCircle = radius * radius * PI

-- write the area on the screen. Take into consideration the size of the font when positioning it on the screen
areaTextRectangle = display.newText("The area of this rectangle with a width of \n" ..
	widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
	areaOfRectangle .. " pixels².", 0, 0, Arial, textSize)

areaTextCircle = display.newText("The area of this circle with a radius of \n" ..
	radius .. " is " .. areaOfCircle .. " pixels². ", 0, 0, Arial, textSize)

--anchor the text and set its (x,y) position
areaTextRectangle.anchorX = 0
areaTextRectangle.anchorY = 0
areaTextRectangle.x = 20
areaTextRectangle.y = display.contentHeight/2

areaTextCircle.anchorX = 0
areaTextCircle.anchorY = 0
areaTextCircle.x = 30
areaTextCircle.y = display.contentHeight*3/4

--set the colour of the newText
areaTextRectangle:setTextColor(1, 1, 1)

areaTextCircle:setTextColor(1, 1, 1)