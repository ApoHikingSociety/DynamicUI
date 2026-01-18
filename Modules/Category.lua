local BASE = "https://raw.githubusercontent.com/ApoHikingSociety/DynamicUI/main/Modules/"

local function Load(path)
	return loadstring(game:HttpGet(BASE .. path))()
end

local ModuleFactory = Load("Module.lua")

local Category = {}
Category.__index = Category

function Category.new(name, parent)
	local self = setmetatable({}, Category)
	self.Name = name
	self.Parent = parent
	self.Modules = {}
	return self
end

function Category:AddModule(name)
	if self.Modules[name] then
		return self.Modules[name]
	end

	local Module = ModuleFactory.new(name, self)
	self.Modules[name] = Module
	return Module
end

return Category
