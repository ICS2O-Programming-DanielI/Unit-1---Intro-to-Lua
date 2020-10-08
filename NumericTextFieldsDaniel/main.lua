-- Title: NumericTextFields
-- Name: Daniel Imperadeiro
-- Course: ICS2O/3C
-- This program displays a math question and asks the user to answer in a numeric textfield.
---------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 250/255, 128/255, 114/255)

-----------------------------------------------------------------------------------------
--LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- create local variables
local points = 0
local questionObject
local correctObject
local numericField 
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectObject
local incorrectanswer
local clear

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(1, 8)
	randomNumber2 = math.random(1, 8)

	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- User begins editing "numericField"
	if ( event.phase == "began" ) then

		--clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.performWithDelay(800, HideCorrect)
			event.target.text = "" 
			
			-- give a point if user gets the correct answer
			points = points + 1

			-- update it in the display object
			pointsText.text = "Points = " .. points

		else
			incorrectObject.isVisible = true
			timer.performWithDelay(1000, HideIncorrect)
			event.target.text = "" 

		end
	end     
end

----------------------------------------------------------------------------------------
-- OBJECT CREATION
----------------------------------------------------------------------------------------

-- display the amount of the points as a text object
pointsText = display.newText("Points = " .. points, display.contentWidth/3, nil, 50)

-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 70 )
questionObject:setTextColor(255/255, 218/255, 185/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(65/255, 105/255, 225/255)
correctObject.isVisible = false

incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
incorrectObject:setTextColor(255/255, 0/255, 0/255)
incorrectObject.isVisible = false

-- Create numeric field
numericField = native.newTextField( display.contentWidth*2/3, display.contentHeight/4, 400, 90 )
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

----------------------------------------------------------------------------------------
-- FUNCTION CALLS
----------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()
