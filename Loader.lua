local BASE = "https://raw.githubusercontent.com/ApoHikingSociety/DynamicUI/main/"

local function Load(path)
	return loadstring(game:HttpGet(BASE .. path))()
end

return Load("Main.lua")