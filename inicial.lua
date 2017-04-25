
local composer = require("composer")


local scene = composer.newScene()

function scene:create(event)
  
  local sceneGroup = self.view
  
  local rect = display.newRect(160,240,200,200)
  
  sceneGroup:insert(rect)
  
end

scene:addEventListener("create",scene)

return scene