-- Title: WhackAMole
-- Name: Daniel Imperadeiro
-- Course: ICS2O/3C
-- This program places a random object on the screen. If the user clicks on it in time,
-- the score increases by 1

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--set points
local points = 0

--Creating Background 
local bkg = display.newRect( 0, 0, display.contentWidth, display.contentHeight )

	display.setDefault("background", 124/255, 249/255, 199/255)

	--Setting Position
	bkg.anchorX = 0
	bkg.anchorY = 0
	bkg.x = 0
	bkg.y = 0

--Creating Mole
local mole = display.newImage( "Images/mole.png" , 0, 0 )

	--Setting Position
	mole.x = display.contentCenterX
	mole.y = display.contentCenterY

	-- Scale the image by 200% (X) and 50% (Y)
	mole:scale(.5,.5)

	-- set the mole to be transparent
	mole.alpha = 0







--------------------------------Functions----------------------------------------

-- This function that makes mole appear in a random (x,y) position on the screen
-- before calling the Hide function
function PopUp( )
	
	---Choosing Random Position on the screen between 0 and the size of the screen
	mole.x = math.random( 0, display.contentWidth )
	mole.y = math.random( 0, display.contentHeight )

	mole.alpha = 1

	timer.performWithDelay(2000, Hide)
end

--This function calls the PopUp function after 3 seconds
function PopUpDelay( )
	timer.performWithDelay( 3000, PopUp )
end 

-- This function makes the mole invisible and then calls the PopUpDelay function
function Hide( )
	
	--Changing Visibility
	mole.isVisible = false
	
end

--This function starts the game
function Whacked( event )

	--If touch phase just started 
	if (event.phase == "began") then
		-- give a point to the user
		points = points + 1

		-- update it in the display object
		pointsText.text = "Points = " .. points
	end

end

-----------------------------------Event Listeners-------------------------------------
-- I add the event listener to the moles so that if the mole is touched, the Whacked function
-- is called
mole:addEventListener( "touch", Whacked )
------------------------------------- Start 
PopUp()