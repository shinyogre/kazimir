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
  y = 0,
  w = 1280,
  h = 400
}

local player = {
  img = love.graphics.newImage('player.png'),
  x = FrameWidth/2,
  y = 383,
  w = 64,
  h = 64
}


function love.update(dt)
  ground.x = ground.x + 200 * dt
  ground.x = math.floor(ground.x)
  if ground.x > FrameWidth then
    ground.x = 0
  end
  if bg.x < -bg.w then
    bg.x = bg.x + FrameWidth
  end
end


function love.draw()
  love.graphics.draw(bg.img,bg.x,bg.y)
  love.graphics.draw(ground.img,ground.x,ground.y)
  love.graphics.draw(ground.img,ground.x - FrameWidth,ground.y)
  love.graphics.draw(player.img,player.x,player.y,0,1,1,player.img:getWidth()/2,player.img:getWidth()-5)
  love.graphics.print("FPS: "..tostring(love.timer:getFPS()))
end
