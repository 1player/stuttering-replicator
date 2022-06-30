SPEED = 1000
RECT_WIDTH = 100

offset = 0

fullscreen = true
love.window.setMode(1024, 768, {vsync=1, resizable=true})
love.window.setFullscreen(fullscreen)

function love.draw()
   screen_width = love.graphics.getWidth()
   screen_height = love.graphics.getHeight()

   i = 0
   for x=-RECT_WIDTH*2,screen_width+(RECT_WIDTH*2),RECT_WIDTH do
      if i % 2 == 0 then
         love.graphics.setColor(1, 1, 1)
      else
         love.graphics.setColor(0, 0, 0)
      end
      love.graphics.rectangle("fill", x+offset, 0, RECT_WIDTH, screen_height)
      i = i + 1
   end

   fps = love.timer.getFPS()
   love.graphics.setColor(1, 0, 0)
   love.graphics.print("FPS: " .. tostring(fps), 10, 10, 0, 3, 3)
   love.graphics.print("F - toggle fullscreen", 10, 50, 0, 3, 3)
end

function love.update(dt)
   offset = offset + SPEED*dt
   if offset > (RECT_WIDTH*2) then
      offset = 0
   end
end

function love.keypressed(key, isrepeat)
   if key == 'f' then
      fullscreen = not fullscreen
      love.window.setFullscreen(fullscreen)
   end
end
