-- Title: NumericTextFields
-- Name: Daniel Imperadeiro
-- Course: ICS2O/3C
-- This program displays a math question and asks the user to answer in a numeric textfield.
---------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 221/255, 160/255, 221/255)

-- create local variables
local points = 0
local pointsText

local numWrong = 0
local numWrongText

local gameOver
local youWin
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
local mathRound

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate a random number between 1 and 4
	-- *** MAKE SURE TO DECLARE THIS VARIABLE ABOVE
	randomOperator = math.random(1,4)

	-- generate 2 random numbers
	randomNumber1 = math.random(3, 4)
	randomNumber2 = math.random(0, 3)

	-- add number to round by
	mathRound = math.round( 1 )

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
		correctAnswer = randomNumber1 / randomNumber2 
		correctAnswer = math.round( randomNumber1 / randomNumber2 )

		-- create question in text object
		questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "

	-- otherwise, if the random operator is 4, do multiplication
	elseif (randomOperator == 4) then
		-- calculate correct answer
		correctAnswer = randomNumber1 * randomNumber2 
		correctAnswer = math.round( randomNumber1 * randomNumber2 )

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
			-- give a point if the user gets the correct answer
			points = points + 1

			-- update it in the display object
			pointsText.text = "Points = " .. points
			correctObject.isVisible = true
			timer.performWithDelay(800, HideCorrect)
			event.target.text = ""

			-- if user gets 5 points display you win 
			if (points == 5) then 
				youWin.isVisible = true
				questionObject.isVisible = false
				numericField.isVisible = false
				pointsText.isVisible = false
				numWrongText.isVisible = false
			end 
		else
			numWrong = numWrong + 1

			numWrongText.text = "Number Incorrect " .. numWrong
			incorrectObject.text = "Incorrect! The correct anwser is : " .. correctAnswer
			incorrectObject.isVisible = true			
			timer.performWithDelay(1000, HideIncorrect)
			event.target.text = ""

			-- if user gets 3 incorrect display game over 
			if (numWrong == 3) then 			
				gameOver.isVisible = true
				questionObject.isVisible = false
				numericField.isVisible = false
				pointsText.isVisible = false
				numWrongText.isVisible = false
			end 
		end
	end     
end


----------------------------------------------------------------------------------------
-- OBJECT CREATION
----------------------------------------------------------------------------------------

-- display the amount of points as a text object
pointsText = display.newText("Points = " .. points, display.contentWidth/1.5, display.contentHeight/13, nil, 50)

-- display the amount of points as a text object
numWrongText = display.newText("Number Incorrect = " .. numWrong, display.contentWidth/1.5, display.contentHeight/6, nil, 50)


-- display you win or game over 
youWin = display.newImageRect("Images/Youwin.png",570, 570)
youWin.x = display.contentWidth/2
youWin.y = display.contentHeight/2
youWin.isVisible = false

gameOver = display.newImageRect("Images/Gameover.png",570, 570)
gameOver.x = display.contentWidth/2
gameOver.y = display.contentHeight/2
gameOver.isVisible = false

-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 70 )
questionObject:setTextColor(255/255, 218/255, 185/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(65/255, 105/255, 225/255)
correctObject.isVisible = false

incorrectObject = display.newText( "Incorrect! ", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
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