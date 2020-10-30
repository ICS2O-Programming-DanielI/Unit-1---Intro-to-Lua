-- Title: WhackAeagle
-- Name: Daniel Imperadeiro
-- Course: ICS2O/3C
-- This program places a random object on the screen. If the user clicks on it in time,
-- the score increases by 1

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Sounds
local danceSound = audio.loadSound( "Sounds/danceSound.mp3" )
local danceSoundChannel

danceSoundChannel = audio.play(danceSound)

local explosionSound = audio.loadSound( "Sounds/explosionSound.mp3" )
local explosionSoundChannel


--Creating Background 
local bkg = display.newRect( 0, 0, display.contentWidth, display.contentHeight )

	bkg:setFillColor( .48, .97, .78)

	--Setting Position
	bkg.anchorX = 0
	bkg.anchorY = 0
	bkg.x = 0
	bkg.y = 0

--Creating Eagle
local eagle = display.newImage( "Images/eagle.png" , 0, 0 )

	--Setting Position
	eagle.x = display.contentCenterX
	eagle.y = display.contentCenterY

	-- Scale the image 
	eagle:scale(.75,.75)

	-- make the eagle invisible 
	eagle.isVisible = false
 
--set score
local points = 0

-- display the amount of points as a text object
pointsText = display.newText("Points = " .. points, display.contentWidth/6, display.contentHeight/1.1, nil, 59)
pointsText:setTextColor(0, 0, .501)

--------------------------------Functions----------------------------------------

-- This function that makes eagle appear in a random (x,y) position on the screen
-- before calling the Hide function
function PopUp( )
	
	---Choosing Random Position on the screen between 0 and the size of the screen
	eagle.x = math.random( 0, display.contentWidth )
	eagle.y = math.random( 0, display.contentHeight )

	-- make the eagle visible
	eagle.isVisible = true

	timer.performWithDelay(590, Hide)
end

--This function calls the PopUp function after 3 seconds
function PopUpDelay( )
	timer.performWithDelay( 1000, PopUp )
end 

-- This function makes the eagle invisible and then calls the PopUpDelay function
function Hide( )
	
	--Changing Visibility
	eagle.isVisible = false
	
	-- call PopUpDelay function
	PopUpDelay()

end

-- This function starts the game
function GameStart( )
	PopUpDelay()
end

--This function starts the game
function Whacked( event )

	--If touch phase just started 
	if (event.phase == "began") then
		-- give a point to the user
		points = points + 1

		-- play a explosion sound when eagle is hit
		explosionSoundChannel = audio.play(explosionSound)

		timer.performWithDelay(2000, HideExplosion)

		-- update it in the display object
		pointsText.text = "Points = " .. points
	end

end

-----------------------------------Event Listeners-------------------------------------
-- I add the event listener to the eagles so that if the eagle is touched, the Whacked function
-- is called
eagle:addEventListener( "touch", Whacked )

------------------------------------- Start the Game -----------------------------------

GameStart()