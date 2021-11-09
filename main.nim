import pixie/demo

const SCREEN_SIZE = 600

start("Carpet",SCREEN_SIZE,SCREEN_SIZE)
screen.fill(rgba(255, 255, 255, 255))

let ctx = newContext(screen)
ctx.fillStyle = rgba(255, 0, 0, 255)

proc sierpinski(depth: var int, size: float, pos: var Vec2) =
  if depth == 0:
    return

  let new_size: Vec2 = vec2(size / 3, size / 3)
  var new_depth = depth - 1 
  let initial_pos = vec2(pos)
  var x = pos[0]
  var y = pos[1]

  for i in 1..9:
    if i == 5:
      ctx.fillRect(rect(pos,new_size))
    else:
      var copy = pos
      sierpinski(new_depth, new_size[0],copy)

    if i mod 3 == 0:
      x = initial_pos[0]
      y = pos[1] + new_size[1]
    else:
      x = pos[0] + new_size[0]
    pos = vec2(x, y)

  tick()
  
var depth = 5
var start_pos = vec2(0,0)
sierpinski(depth, SCREEN_SIZE, start_pos)

while true:
  continue