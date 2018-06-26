local font0 = lg.newFont("fonts/Prociono.ttf",20)
local title = "K A Z A M I R"
local pause = {
  titleDisplay = lg.newText(font0, title)
  }

function pause:draw()
  --lg.print("START SCREEN",FrameWidth/2,FrameHeight/2)
  lg.setColor(1,1,1,1)
  lg.draw(self.titleDisplay,FrameWidth/2-self.titleDisplay:getWidth()/2,FrameHeight/4)
end






return pause