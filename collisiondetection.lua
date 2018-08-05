local Class = require("libs.hump.class")
local player = require "player"

local CollisionDetection = Class {
  init = function(self)
  end
}

function CollisionDetection:update(dt)
  print(player.team[1].x,player.team[1].y)
end


collision = CollisionDetection()


return collision