local Class = require("libs.hump.class")

Button = Class {
  init = function(self,x,y)
    self.x = 0
    self.y = 0
  end
}

button = Button(100,100)
  
return