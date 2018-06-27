local spritesheet = lg.newImage("player_spritesheet.png")
local Class = require("libs.hump.class")

Animator = Class {
  init = function(self)
    self.spritesheet =