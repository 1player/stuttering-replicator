SPEED = 1000
RECT_WIDTH = 100

offset = 0

fullscreen = true
vsync = true
love.window.setMode(1024, 768, {vsync=vsync, resizable=true})
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
   if vsync then
      vsync_state = "on"
   else
      vsync_state = "off"
   end
   love.graphics.setColor(1, 0, 0)
   love.graphics.print("FPS: " .. tostring(fps) .. ", vsync " .. vsync_state, 10, 10, 0, 3, 3)
   love.graphics.print("F - toggle fullscreen", 10, 50, 0, 3, 3)
   love.graphics.print("V - toggle vsync", 10, 90, 0, 3, 3)
end

function love.update(dt)
   offset = offset + SPEED*dt
   if offset > (RECT_WIDTH*2) then
      offset = offset - (RECT_WIDTH*2)
   end
end

function love.keypressed(key, isrepeat)
   if key == 'f' then
      fullscreen = not fullscreen
      love.window.setFullscreen(fullscreen)
   end

   if key == 'v' then
      vsync = not vsync
      love.window.setVSync(vsync)
   end
end
