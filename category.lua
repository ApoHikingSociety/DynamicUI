return function(Modules)
    local Category = {}
    Category.__index = Category

    function Category.new(name, parent)
        local self = setmetatable({}, Category)
        self.Name = name

        local frame = Instance.new("Frame")
        frame.Name = name
        frame.Size = UDim2.fromOffset(260, 180)
        frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        frame.BorderSizePixel = 0
        frame.Parent = parent

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 26)
        corner.Parent = frame

        self.Frame = frame
        return self
    end

    Modules.Category = Category
end