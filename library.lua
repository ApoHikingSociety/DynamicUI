return function(Modules)
    local Category = Modules.Category

    local Library = {}
    Library.__index = Library

    function Library.new()
        local self = setmetatable({}, Library)
        self.Categories = {}

        function self:AddCategory(name)
            assert(type(name) == "string", "Category name must be a string")

            if self.Categories[name] then
                error("Category already exists: " .. name)
            end

            local category = Category.new(name)
            self.Categories[name] = category
            print("Created category:", name)

            return category
        end

        return self
    end

    Modules.Library = Library
end
