entities.obstacles = {}
local maxtime = 7
local currenttime = 0
local speed = 500
local obstacle_sprites = {
  lg.newImage("burning-horn.png")
}




function obstacle_create()
  obstacle = {
    img = obstacle_sprites[rand(#obstacle_sprites)],
    x = -FrameWidth,
    y = entities.ground.y,
    rot = 0
  }
  table.insert(obstacles, obstacle)
end



function obstacle_load()
  obstacles = {}
end



function obstacle_update(dt)
  local kill_queue = {}
  
  currenttime = currenttime + dt
  if currenttime > maxtime then
    currenttime = currenttime - maxtime
    obstacle_create()
  end
  
  for o, obstacle in ipairs(obstacles) do
    obstacle.x = obstacle.x + speed * dt
    if obstacle.x > FrameWidth*2 then
      table.insert(kill_queue,o,1)
    end
  end
  
  for _, o in ipairs(kill_queue) do
    table.remove(obstacles, o)
  end
      
end



function obstacle_draw()
  lg.setColor(1,1,1,1)
  for _, o in ipairs(obstacles) do
    lg.draw(o.img,o.x,o.y,o.rot,0.5,0.5,o.img:getWidth()/2,o.img:getHeight())
  end
end


