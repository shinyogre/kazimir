entities.sky = {}
local maxtime = 7
local currenttime = 0
local speed = 300
local sky_elements = {
  lg.newImage("malevich-2.png"),
}




function element_create()
  element = {
    img = sky_elements[rand(#sky_elements)],
    x = -FrameWidth,
    y = -50,
    rot = rand()
  }
  table.insert(sky, element)
end



function sky_load()
  sky = {}
end



function sky_update(dt)
  local kill_queue = {}
  
  currenttime = currenttime + dt
  if currenttime > maxtime then
    currenttime = currenttime - maxtime
    element_create()
  end
  
  for e, element in ipairs(sky) do
    element.x = element.x + speed * dt
    element.rot = element.rot + 0.001
    if element.x > FrameWidth*2 then
      table.insert(kill_queue,e,1)
    end
  end
  
  for _, e in ipairs(kill_queue) do
    table.remove(sky, e)
  end
      
end



function sky_draw()
   lg.setBackgroundColor(1,1,0)
  lg.setColor(1,1,1,1)
  for _, e in ipairs(sky) do
    lg.draw(e.img,e.x,e.y,0)
  end
end


