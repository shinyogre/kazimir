FrameWidth = love.graphics.getWidth()
FrameHeight = love.graphics.getHeight()
gravity = 19.8

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
  y = 100,
  w = 64,
  h = 64,
  yspeed = 0
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
  
  player.y = player.y + player.yspeed * dt
  player.yspeed = player.yspeed + gravity
  
  if CheckCollisionBox(player.x,player.y,player.w,player.h/1.5,0,383,FrameWidth,ground.h) then
    player.yspeed = 0
    player.y = 383 - player.h/1.5
  end
  print(player.yspeed)
end



function love.draw()
  love.graphics.draw(bg.img,bg.x,bg.y)
  love.graphics.draw(ground.img,ground.x,ground.y)
  love.graphics.draw(ground.img,ground.x - FrameWidth,ground.y)
  love.graphics.draw(player.img,player.x,player.y,0,1,1)
  love.graphics.print("FPS: "..tostring(love.timer:getFPS()))
end



function love.keypressed(key)
  if key == "space" and player.y == 383 - player.h/1.5 then
    player.yspeed = player.yspeed - 500
  end
end




function CheckCollisionBox(x1,y1,w1,h1,x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
