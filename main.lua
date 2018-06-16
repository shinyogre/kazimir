--[[*****Old main code
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
]]--

lg = love.graphics
FrameWidth,FrameHeight = love.graphics.getDimensions()
local grav = 9.81
Timer = require 'libs.hump.timer'

local ground = {
  x = 0, 
  y = 440, 
  w = FrameWidth, 
  h = 280, 
  color = {1,0,1,1}
}

local player = {
  w = 40, 
  h = 40, 
  img = lg.newImage("player.png"),
}



function horseadd()
  local horse = {
    img = player.img, 
    x = FrameWidth/2+FrameWidth/3.5, 
    y = ground.y, 
    yspeed = 0,
    jumpStrength = 350,
    onGround = true,
    jumptimer = 0,
    offset = 45
    }
  if #player > 0 then
    local prevHorse = player[#player]
    horse.x = prevHorse.x + horse.offset
    horse.jumptimer = prevHorse.jumptimer + 0.3
  end
  table.insert(player,horse)
end



function CheckCollisionBox(x1,y1,w1,h1,x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end



function love.load()
  for i=1,5 do
    horseadd()
  end
end


function love.update(dt)
  for i,v in ipairs(player) do
    Timer.update(dt)
    v.y = v.y + v.yspeed * dt
    v.yspeed = v.yspeed + grav
    if CheckCollisionBox(
      v.x,v.y,player.w,player.h,
      ground.x,ground.y,ground.w,ground.h) 
    then
      v.yspeed = 0
      v.y = ground.y - player.h
      v.onGround = true
    end
    
    if love.keyboard.isDown("left") then
      v.x = v.x - 1
    end
    
  end
end



function love.keypressed(key)
  if key == "z" then
    --player[1].yspeed = player[1].yspeed - player[1].jumpStrength
    for i,v in ipairs(player) do
      Timer.after(player[i].jumptimer,function()jump(player[i])end)
    end
  end
end



function jump(horse)
  if horse.onGround then
    horse.yspeed = horse.yspeed - horse.jumpStrength
    horse.onGround = false
  end
end

  



function love.draw()
  lg.setColor(ground.color)
  lg.rectangle('fill',ground.x,ground.y,ground.w,ground.h)
  lg.setColor(1,1,1,1)
  for i,v in ipairs(player) do
    lg.rectangle('fill',v.x,v.y,player.w,player.h)
    lg.draw(v.img,v.x,v.y)
  end
end
