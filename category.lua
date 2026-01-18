return function(Modules)
    local Category = {}
    Category.__index = Category

    function Category.new(name)
        local self = setmetatable({}, Category)
        self.Name = name
        return self
    end

    Modules.Category = Category
end
