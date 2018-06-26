lg = love.graphics
FrameWidth,FrameHeight = love.graphics.getDimensions()
rand = love.math.random



function love.load()
  entities = {} --turn this and everything else into local scope!
  require("sky")
  require("obstacles")
  require("ground")
  require("player")
  sky_load()
  obstacle_load()
  player_load()
end



function love.update(dt)
  sky_update(dt)
  obstacle_update(dt)
  player_update(dt)
end  



function love.draw()
  sky_draw()
  obstacle_draw()
  ground_draw()
  player_draw()
end
