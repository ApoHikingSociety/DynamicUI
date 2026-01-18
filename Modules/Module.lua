local Module = {}
Module.__index = Module

function Module.new(name, parent)
	local self = setmetatable({}, Module)
	self.Name = name
	self.Parent = parent
	self.Toggles = {}
	return self
end

function Module:AddToggle(name, default, callback)
	local toggle = {
		Name = name,
		Value = default,
		Callback = callback
	}
	table.insert(self.Toggles, toggle)
	return toggle
end

return Module
