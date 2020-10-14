-- Title: MathFun
-- Name: Daniel Imperadeiro
-- Course: ICS2O/3C
-- This program...

-- create local variables
local randomNumber1
local randomNumber2
local randomOperator
local correctAnswer
local questionObject
local AskQuestion
local questionObject
local correctObject
local numericField 
local userAnswer
local incorrectObject
local incorrectanswer
local clear

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate a random number between 1 and 2
	-- *** MAKE SURE TO DECLARE THIS VARIABLE ABOVE
	randomOperator = math.random(1,4)

	-- generate 2 random numbers
	randomNumber1 = math.random(0, 4)
	randomNumber2 = math.random(0, 4)

	-- if the random operator is 1, then do addition
	if (randomOperator == 1) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	-- otherwise, if the random operator is 2, do subtraction
	elseif (randomOperator == 2) then
		-- calculate the correct answer
		correctAnswer = randomNumber1 - randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

	-- otherwise, if the random operator is 3, do divison
	elseif (randomOperator == 3) then
		-- calculate the correct answer
		correctAnswer = math.round( 0.1 ) randomNumber1 / randomNumber2 )

		-- create question in text object
		questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "

	-- otherwise, if the random operator is 4, do multiplication
	elseif (randomOperator == 4) then
		-- calculate correct answer
		correctAnswer = math.round( 0.1 ) randomNumber1 * randomNumber2 ) 

		-- create question in text object
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "
	end

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
numericField = native.newTextField( display.contentWidth*2/3, display.contentHeight/2, 400, 90 )
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )


----------------------------------------------------------------------------------------
-- FUNCTION CALLS
----------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()