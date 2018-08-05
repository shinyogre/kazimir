lg = love.graphics
FrameWidth,FrameHeight = love.graphics.getDimensions()
rand = love.math.random

--require("sky")
--require("obstacles")
--require("ground")
--local player = require("player")
--local pause = require("pause")
local riding = require("riding")

local Gamestate = require "libs.hump.gamestate"


function love.load()
  --entities = {} --turn this and everything else into local scope!
  --sky_load()
  --obstacle_load()
  Gamestate.registerEvents()
  Gamestate.switch(riding)
end



function love.update(dt)
  --player:update(dt)
  --player:update()
  --sky_update(dt)
  --obstacle_update(dt)
  --player_update(dt)
end  



function love.draw()
  --player:draw()
  --sky_draw()
  --obstacle_draw()
  --ground_draw()
  --player_draw()
end
