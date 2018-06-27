local grav = 9.81
local timer = require 'libs.hump.timer'
local anim8 = require 'libs.anim8.anim8'
local player_spritesheet = lg.newImage("player_spritesheet.png")
player_spritesheet:setFilter('nearest')
local grid = anim8.newGrid(32,32,player_spritesheet:getWidth(),player_spritesheet:getHeight(),0,0,0)


local Class = require("libs.hump.class")

Player = Class {
  init = function(self)
    self.img = anim8.newAnimation(grid('1-6',1),0.1)
    self.team = {}
  end
}



function Player:horseadd()
  local horse = {
    img = self.img, 
    x = FrameWidth/2+FrameWidth/3, 
    y = 340,
    w = 32,
    h = 32,
    vx = 0,
    xspeed = 1,
    yspeed = 0,
    jumpStrength = 350,
    onGround = true,
    jumpingUp = false,
    fallingDown = false,
    jumptimer = 0,
    offset = 45
  }
  if #self.team > 0 then
    local prevHorse = self.team[#self.team]
    horse.x = prevHorse.x + horse.offset
    horse.jumptimer = prevHorse.jumptimer + 0.1
  end
  table.insert(self.team,horse)
end



function Player:keypressed(key)
  if key == "z" then
    for i,v in ipairs(self.team) do
      timer.after(self.team[i].jumptimer,function()self:jump(self.team[i])end)
    end
  end
end


function Player:jump(horse)
  print("jump test")
  if horse.onGround then
    horse.yspeed = horse.yspeed - horse.jumpStrength
    horse.onGround = false
  end
end



function CheckCollisionBox(x1,y1,w1,h1,x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end




function Player:load()
  for i=1,3 do
    self:horseadd()
  end
end

function Player:update(dt)
  self.img:update(dt)
  timer.update(dt)
  
  for i,v in ipairs(self.team) do
    --v.x = v.x - v.vx
    --v.vx = v.vx * (1-math.min(dt*10,1)) 
    --v.vx = v.vx + v.xspeed * dt

    v.y = v.y + v.yspeed * dt
    if not v.onGround then
      v.yspeed = v.yspeed + grav
    end
    --[[
    if CheckCollisionBox(
      v.x,v.y,v.w,v.h,
      entities.ground.x,entities.ground.y,entities.ground.w,entities.ground.h) 
    then
      v.yspeed = 0
      v.y = entities.ground.y - v.h
      v.onGround = true
    end]]--
    
    --animation states (to add: walking, 'dying', idle, idle>riding)
    --sprite batches perhaps?
    if v.yspeed < 0 then 
      v.jumpingUp = true 
      v.fallingDown = false
    elseif v.yspeed > 0 then 
      v.jumpingUp = false
      v.fallingDown = true
    else
      v.jumpingUp = false
      v.fallingDown = false
    end    
  end
end



function Player:draw()
  lg.setColor(1,1,1,1)
  for i,v in ipairs(self.team) do
    --lg.rectangle('fill',v.x,v.y,player.w,player.h)
    --lg.draw(v.img,v.x,v.y)
    self.img:draw(player_spritesheet,v.x,v.y)
  end
end



player = Player(100,100)



return

