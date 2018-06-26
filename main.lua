lg = love.graphics
FrameWidth,FrameHeight = love.graphics.getDimensions()
rand = love.math.random

--require("sky")
--require("obstacles")
--require("ground")
--require("player")
--local pause = require("pause")
local riding = require("riding")

local Gamestate = require "libs.hump.gamestate"


function love.load()
  --entities = {} --turn this and everything else into local scope!
  --sky_load()
  --obstacle_load()
  --player_load()
  --Gamestate.registerEvents()
  --Gamestate.switch(pause)
end



function love.update(dt)
  --sky_update(dt)
  --obstacle_update(dt)
  --player_update(dt)
end  



function love.draw()
  --sky_draw()
  --obstacle_draw()
  --ground_draw()
  --player_draw()
end
