return function(Modules)
    local Library = {}
    Library.__index = Library

    local Category = Modules.Category

    function Library.new(parent)
        local self = setmetatable({}, Library)
        self.Parent = parent or game.CoreGui
        self.Categories = {}
        return self
    end

    function Library:AddCategory(name)
        assert(type(name) == "string", "Category name must be string")

        if self.Categories[name] then
            return self.Categories[name]
        end

        local category = Category.new(name, self.Parent)
        self.Categories[name] = category
        return category
    end

    Modules.Library = Library
end