local grav = 9.81
local timer = require 'libs.hump.timer'
local anim8 = require 'libs.anim8.anim8'
local player_spritesheet = lg.newImage("player_spritesheet.png")
player_spritesheet:setFilter('nearest')
local grid = anim8.newGrid(32,32,player_spritesheet:getWidth(),player_spritesheet:getHeight(),0,0,0)
local img = anim8.newAnimation(grid('1-6',1),0.1)

entities.player = {}



function horseadd()
  local horse = {
    img = player.img, 
    x = FrameWidth/2+FrameWidth/3, 
    y = entities.ground.y,
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
  if #player > 0 then
    local prevHorse = player[#player]
    horse.x = prevHorse.x + horse.offset
    horse.jumptimer = prevHorse.jumptimer + 0.1
  end
  table.insert(player,horse)
end



function love.keypressed(key)
  if key == "z" then
    for i,v in ipairs(player) do
      timer.after(player[i].jumptimer,function()jump(player[i])end)
    end
  end
end



function jump(horse)
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




function player_load()
  player = {}
  for i=1,3 do
    horseadd()
  end
end

function player_update(dt)
  img:update(dt)
  timer.update(dt)
  
  for i,v in ipairs(player) do
    --v.x = v.x - v.vx
    --v.vx = v.vx * (1-math.min(dt*10,1)) 
    --v.vx = v.vx + v.xspeed * dt

    v.y = v.y + v.yspeed * dt
    if not v.onGround then
      v.yspeed = v.yspeed + grav
    end
    
    if CheckCollisionBox(
      v.x,v.y,v.w,v.h,
      entities.ground.x,entities.ground.y,entities.ground.w,entities.ground.h) 
    then
      v.yspeed = 0
      v.y = entities.ground.y - v.h
      v.onGround = true
    end
    
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

function player_draw()
  lg.setColor(1,1,1,1)
  for i,v in ipairs(player) do
    --lg.rectangle('fill',v.x,v.y,player.w,player.h)
    --lg.draw(v.img,v.x,v.y)
    img:draw(player_spritesheet,v.x,v.y)
  end

end

