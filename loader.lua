local BaseUrl = "https://raw.githubusercontent.com/ApoHikingSociety/DynamicUI/main/"

local function LoadFile(name)
    local source = game:HttpGet(BaseUrl .. name)
    return loadstring(source)()
end

local Modules = {}

LoadFile("category.lua")(Modules)
LoadFile("library.lua")(Modules)

local Main = LoadFile("main.lua")(Modules)

return Main
