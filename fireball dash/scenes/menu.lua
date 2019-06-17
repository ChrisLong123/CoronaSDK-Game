local composer = require( "composer" )
 
local scene = composer.newScene()
local groupMenu = display.newGroup()
local contador = 0 

function gotoGame() 
	composer.gotoScene( "scenes.game" )
end

function gotoRate() 
	composer.gotoScene( "scenes.rate" )
end

function scene:create( event )

	local background = display.newImageRect( "assets/background2.png", 1280, 720 )
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	groupMenu:insert( background )

	local logo = display.newImageRect( "assets/logo.png", 800, 300 )
	logo.x = display.contentCenterX + 10
	logo.y = display.contentCenterY - 100
	groupMenu:insert( logo )

	local start = display.newImageRect( "assets/buttons/start.png", 120, 70 )
	start.x = display.contentCenterX - 80
	start.y = display.contentCenterY + 90
    groupMenu:insert( start )
    
    local rate = display.newImageRect( "assets/buttons/rate.png", 50, 50 )
	rate.x = display.contentCenterX + 40
	rate.y = display.contentCenterY + 90
	groupMenu:insert( rate )

	start:addEventListener( "tap", gotoGame )

	rate:addEventListener( "tap", gotoRate )
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
 
	if ( phase == "will" ) then
		display.remove(groupMenu)

	elseif ( phase == "did" ) then
		
	end
end

function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase
 
	if ( phase == "will" ) then
		composer.removeScene("scenes.gameover")
		composer.removeScene("scenes.game")
		composer.removeScene("scenes.rate")
		-- Code here runs when the scene is still off screen (but is about to come on screen)
 
	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
 
	end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
--scene:addEventListener( "destroy", scene )
 
return scene