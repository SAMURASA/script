require "lib.moonloader" -- подключение библиотеки
local keys = require "vkeys"
local sampev = require 'lib.samp.events'
local white_color = 0xFFFFFF

function main ()
if not isSampLoaded() or not isSampfuncsLoaded() then return end
 while not isSampAvailable() do wait(100) end
  
  while true do
  wait(0)
 
  if isKeyJustPressed (VK_F9) then
  sampAddChatMessage ('             ',white_color)
  sampAddChatMessage ('             ',white_color)
  sampAddChatMessage ('             ',white_color)
  sampAddChatMessage ('             ',white_color)
  sampAddChatMessage ('             ',white_color)
  sampAddChatMessage ('             ',white_color)
  sampAddChatMessage ('             ',white_color)
  sampAddChatMessage ('             ',white_color)
  sampAddChatMessage ('             ',white_color)
  sampAddChatMessage ('             ',white_color)
end



end
end

--function sampev.onSendPickedUpPickup (pickupId)
--sampAddChatMessage('Вы долбаеб ' .. pickupId,white_color)
--return false
--end