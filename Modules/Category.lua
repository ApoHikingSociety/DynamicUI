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

	local Module = {}
	Module.__index = Module
	Module.Name = name
	Module.Toggles = {}

	function Module:AddToggle(text, default, callback)
		local togg = {
			Text = text,
			Value = default,
			Callback = callback
		}
		table.insert(self.Toggles, togg)
		return togg
	end

	self.Modules[name] = setmetatable(Module, Module)
	return self.Modules[name]
end

return Category
