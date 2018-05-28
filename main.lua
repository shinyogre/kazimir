FrameWidth = love.graphics.getWidth()
FrameHeight = love.graphics.getHeight()

local ground = {
  img = love.graphics.newImage('ground.png'),
  x = 0,
  y = 383,
  w = 1280,
  h = 383
}

local bg = {
  img = love.graphics.newImage('bg.png'),
  x = 0,
  y = 0
}


function love.update(dt)
  ground.x = ground.x - 200 * dt
  ground.x = math.floor(ground.x)
  if ground.x < -ground.w then
    ground.x = ground.x + FrameWidth
  end
  --print(ground.x)
end


function love.draw()
  love.graphics.draw(bg.img,bg.x,bg.y)
  love.graphics.draw(ground.img,ground.x,ground.y)
  love.graphics.draw(ground.img,ground.x + FrameWidth,ground.y)
  love.graphics.print("FPS: "..tostring(love.timer:getFPS()))
end
