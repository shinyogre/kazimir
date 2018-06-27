local riding = {
  player = require "player",
  timer = require "libs.hump.timer"
}


function riding:enter()
  player:load()
end


function riding:update(dt)
  player:update(dt)
end


function riding:draw()
  player:draw()
end


function riding:keypressed(key)
  if key == "z" then
    for i,v in ipairs(player.team) do
      self.timer.after(player.team[i].jumptimer,function()player:jump(player.team[i])end)
    end
  end
end



return riding