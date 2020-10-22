-- Title: NumericTextFields
-- Name: Daniel Imperadeiro
-- Course: ICS2O/3C
-- This program displays a math question and asks the user to answer in a numeric textfield.
---------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 221/255, 160/255, 221/255)

----------------------------------------------------------------------------------------------
-- LOCAL VARIABLES 
----------------------------------------------------------------------------------------------

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
local userAnswer

local questionObject
local AskQuestion
local questionObject
local correctObject

local numericField 

local incorrectObject
local incorrectanswer

local clear
local mathRound

-- variables fpr the timer
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer
local seconds

local lives = 5
local heart1
local heart2
local heart3
local heart4

---------------------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------------

-- Chaching sound 
local chachingSound = audio.loadSound( "Sounds/Chaching.mp3" ) 
local chachingSoundChannel

-- wrong sound 
local wrongSound = audio.loadSound( "Sounds/wrongSound.mp3" )
local wrongSoundChannel

-- whack sound
local whackSound = audio.loadSound( "Sounds/Whack.mp3" )
local whackSoundChannel

--collect coin sound
local collectcoinSound = audio.loadSound( "Sounds/collectcoin.wav" ) 
local collectcoinSoundChannel

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------


local function UpdateTime()

	-- decrement the number of seconds 
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0) then
		-- reset the number of seconds left 
		secondsLeft = totalSeconds
		lives = lives - 1

		-- *** IF THERE ARE NO LIVES LEFT, PLAY A LOSE SOUND, SHOW A YOU LOSE IMAGE 
		-- AND CANCEL THE TIMER REMOVE THE THIRD HEART BY MAKING IT INVISIBLE 
		if (lives == 4) then
			heart4.isVisible = false
		elseif (lives == 3) then
			heart3.isVisible = false
		elseif (lives == 2) then
			heart2.isVisible = false
		elseif (lives == 1) then
			heart1.isVisible = false
		elseif (lives == 0) then
			timer.cancel(countDownTimer)

			whackSoundChannel = audio.play(whackSound)

 			timer.performWithDelay(2000, HideWhack)
 
			gameOver.isVisible = true
			questionObject.isVisible = false
			numericField.isVisible = false
			pointsText.isVisible = false
			numWrongText.isVisible = false
			clockText.isVisible = false
		end 

	end
end

-- function that calls the timer 
local function StartTimer()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

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

			collectcoinSoundChannel = audio.play(collectcoinSound)

			timer.performWithDelay(2000, HideCollectCoin)

			-- update it in the display object
			pointsText.text = "Points = " .. points
			correctObject.isVisible = true
			timer.performWithDelay(500, HideCorrect)
			event.target.text = ""

			-- if user gets 5 points display you win 
			if (points == 5) then

				chachingSoundChannel = audio.play(chachingSound)

				timer.performWithDelay(2000, HideChaching)

				youWin.isVisible = true
				questionObject.isVisible = false
				numericField.isVisible = false
				pointsText.isVisible = false
				numWrongText.isVisible = false
			end 
		else
			numWrong = numWrong + 1

			wrongSoundChannel = audio.play(wrongSound)

			timer.performWithDelay(2000, HideWrongsound)

			numWrongText.text = "Number Incorrect " .. numWrong
			incorrectObject.text = "Incorrect! The correct anwser is : " .. correctAnswer
			incorrectObject.isVisible = true			
			timer.performWithDelay(1000, HideIncorrect)
			event.target.text = ""

			-- if user gets 3 incorrect display game over 
			if (numWrong == 3) then
 				
 				whackSoundChannel = audio.play(whackSound)

 				timer.performWithDelay(2000, HideWhack)

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

-- create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 80, 80)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 80, 80)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 80, 80)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

heart4 = display.newImageRect("Images/heart.png", 80, 80)
heart4.x = display.contentWidth * 4 / 8
heart4.y = display.contentHeight * 1 / 7

-- display the amount of points as a text object
pointsText = display.newText("Points = " .. points, display.contentWidth/7, display.contentHeight/13, nil, 40)

-- display the amount of points as a text object
numWrongText = display.newText("Number Incorrect = " .. numWrong, display.contentWidth/5, display.contentHeight/6, nil, 40)


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

-- change text colour of countdown timer
clockText = display.newText("", display.contentWidth/2, display.contentHeight*2/3, nil, 90 )
clockText:setTextColor(0/255, 0/255, 128/255)

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

-- call the function to start the timer
StartTimer()
 