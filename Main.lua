local BASE = "https://raw.githubusercontent.com/ApoHikingSociety/DynamicUI/main/Modules/"

local function Load(path)
	return loadstring(game:HttpGet(BASE .. path))()
end

local CategoryFactory = Load("Category.lua")

local UI = {}
UI.__index = UI

function UI.new()
	local self = setmetatable({}, UI)
	self.Categories = {}
	return self
end

function UI:AddCategory(name)
	if self.Categories[name] then
		return self.Categories[name]
	end

	local Category = CategoryFactory.new(name, self)
	self.Categories[name] = Category
	return Category
end

return UI.new(
