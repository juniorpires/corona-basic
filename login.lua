
local composer = require("composer")


local scene = composer.newScene()


local x = display.contentCenterX
local y = display.contentCenterY

local background

local txtUsername
local username

local txtPassword
local password
  
  
 
  
function scene:create(event)
  
  local sceneGroup = self.view
  
  
  background = display.newRect(0,0,display.actualContentWidth*2, display.actualContentHeight*2)
  background:setFillColor(0,0,0.2)

  local widget = require("widget")

 txtUsername = display.newText({text="Username",x = x, y = y-70 })
 username = native.newTextField(x,y-30,200,30)

 txtPassword = display.newText({text="Password",x = x, y = y+10})
 password = native.newTextField(x,y+40,200,30)
 password.isSecure = true

bt = widget.newButton(
   {
       x = x,
       y = y+100,
       label = "Login",
       shape = "roundedRect",
       width = 100,
       height = 40,
       cornerRadius = 2,
       labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
       fillColor = { default={1,0,0,}, over={1,0.1,0.7,0.4} },
       strokeWidth = 4
    })
  
  sceneGroup:insert(background)
  sceneGroup:insert(txtUsername)
  sceneGroup:insert(username)
  sceneGroup:insert(txtPassword)
  sceneGroup:insert(password)
  sceneGroup:insert(bt)
  
  bt:addEventListener("touch",click)
  
end


function scene:hide(event)
  if event.phase == "did" then
    username:removeSelf()
    password:removeSelf()
  end  
  
end  
function click(event)
  if event.phase=="began" then
      if username.text=="admin" and password.text=="admin" then
        composer.gotoScene("inicial")
      else
        native.showAlert("Aviso","Login e/ou senha incorreto(s)")
      end 
    end
  end
  
scene:addEventListener("create",scene)
scene:addEventListener("hide",scene)
return scene