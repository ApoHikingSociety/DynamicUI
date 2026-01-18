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

	local Category = require(script:LoadModule("Category.lua"))(name, self)
	self.Categories[name] = Category
	return Category
end

return UI.new()