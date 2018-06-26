entities.ground = {
  x = 0, 
  y = 440, 
  w = FrameWidth, 
  h = 280, 
  color = {1,0.3,0,1}
}

function ground_draw()
  lg.setColor(entities.ground.color)
  lg.rectangle("fill",entities.ground.x,entities.ground.y,entities.ground.w,entities.ground.h)
end
