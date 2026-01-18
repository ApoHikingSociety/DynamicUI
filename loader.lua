local BaseUrl = "https://github.com/ApoHikingSociety/DynamicUI/main/"

local function LoadFile(name)
    local source = game:HttpGet(BaseUrl .. name)
    return loadstring(source)()
end

local Modules = {}

-- Load internal modules
LoadFile("category.lua")(Modules)
LoadFile("library.lua")(Modules)

-- Load main API
local Main = LoadFile("main.lua")(Modules)

return Main