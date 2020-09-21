require "lib.moonloader"
local keys = require "vkeys"
local sampev = require 'lib.samp.events'
local memory = require 'memory'
local white_color = 0xFFFFFF
local imgui = require 'imgui'
local isPressed = imgui.ImBool(false)
local sw, sh = getScreenResolution()
local image
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
local bass = require "lib.bass"
local main_windown_state = imgui.ImBool(false)
local radio = bass.BASS_StreamCreateURL("http://air.radiorecord.ru:8102/trap_320", 0, 0, nil, nil)
local radio2 = bass.BASS_StreamCreateURL("http://air2.radiorecord.ru:9003/russianhits_320", 0, 0, nil, nil)
local radio3 = bass.BASS_StreamCreateURL("http://nashe1.hostingradio.ru/jazz-256", 0, 0, nil, nil)
local radio4 = bass.BASS_StreamCreateURL("http://ic6.101.ru:8000/stream/trust/mp3/128/20?678f", 0, 0, nil, nil)

function main()
if not isSampLoaded() or not isSampfuncsLoaded() then return end
while not isSampAvailable() do wait(100) end


image = imgui.CreateTextureFromFile("moonloader/lua.png")


imgui.Process = false

while true do
wait(0)
	
if main_windown_state.v == false then
imgui.Process = false
end

if isKeyJustPressed(VK_R) and isKeyJustPressed (VK_A) then
main_windown_state.v = not main_windown_state.v
end

imgui.Process = main_windown_state.v
end
end



function imgui.OnDrawFrame()
    if main_windown_state.v then
	    
		imgui.SetNextWindowSize(imgui.ImVec2(217, 400), imgui.Cond.FirstUseEver)
		imgui.SetNextWindowPos(imgui.ImVec2((sw / 2), sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.6))
        imgui.Begin(u8"MP3 Player", main_windown_state,imgui.WindowFlags.NoResize)
		imgui.Image(image, imgui.ImVec2(200,180))
		
	imgui.Separator()
	 
     imgui.PushItemWidth(120)
	 imgui.SetCursorPosY(250)
	 imgui.SetCursorPosX(200)
	 
	imgui.Separator()
	if imgui.Button('TRAP') then
	bass.BASS_ChannelStop(radio)
	bass.BASS_ChannelStop(radio2)
	bass.BASS_ChannelStop(radio3)
	bass.BASS_ChannelStop(radio4)
    bass.BASS_ChannelSetAttribute(radio, BASS_ATTRIB_VOL, 1.1)
    bass.BASS_ChannelPlay(radio, true) end
	
	if imgui.Button('RUSSIAN') then
	bass.BASS_ChannelStop(radio)
	bass.BASS_ChannelStop(radio2)
	bass.BASS_ChannelStop(radio3)
	bass.BASS_ChannelStop(radio4)
    bass.BASS_ChannelSetAttribute(radio2, BASS_ATTRIB_VOL, 1.1)
    bass.BASS_ChannelPlay(radio2, false) end
	
	if imgui.Button('JAZZ') then
	bass.BASS_ChannelStop(radio)
	bass.BASS_ChannelStop(radio2)
	bass.BASS_ChannelStop(radio3)
	bass.BASS_ChannelStop(radio4)
    bass.BASS_ChannelSetAttribute(radio3, BASS_ATTRIB_VOL, 1.1)
    bass.BASS_ChannelPlay(radio3, false) end
	
	if imgui.Button('ANEKTOD') then
	bass.BASS_ChannelStop(radio)
	bass.BASS_ChannelStop(radio2)
	bass.BASS_ChannelStop(radio3)
	bass.BASS_ChannelStop(radio4)
    bass.BASS_ChannelSetAttribute(radio4, BASS_ATTRIB_VOL, 1.1)
    bass.BASS_ChannelPlay(radio4, false) end
	
	if imgui.Button('Radio OFF') then
	bass.BASS_ChannelStop(radio)
	bass.BASS_ChannelStop(radio2)
	bass.BASS_ChannelStop(radio3)
	bass.BASS_ChannelStop(radio4) end
    	
	imgui.End()
	end
	end
	