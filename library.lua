return function(Modules)
    local Services = {
        CoreGui = game:GetService("CoreGui")
    }

    local Environments = {
        Category = Modules.Category
    }

    local Library = {}
    Library.__index = Library

    local UiState = {
        ScreenGui = nil,
        Container = nil
    }

    local Functions = {}

    function Functions.CreateUi()
        local Existing = CoreGui:FindFirstChild("DynamicUI")
        if Existing then
            return Existing, Existing:FindFirstChild("ClickGui")
        end

        local Instances = {
            ScreenGui = Instance.new("ScreenGui"),
            ClickGui = Instance.new("Frame"),
            Corner = Instance.new("UICorner"),
            Layout = Instance.new("UIListLayout"),
            Padding = Instance.new("UIPadding")
        }

        Instances.ScreenGui.Name = "DynamicUI"
        Instances.ScreenGui.IgnoreGuiInset = true
        Instances.ScreenGui.ResetOnSpawn = false
        Instances.ScreenGui.Parent = Players.Gui

        Instance.ClickGui.Name = "Main"
        Instance.ClickGui.Size = UDim2.fromScale(0.35, 0.5)
        Instance.ClickGui.Position = UDim2.fromScale(0.5, 0.5)
        Instance.ClickGui.AnchorPoint = Vector2.new(0.5, 0.5)
        Instance.ClickGui.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        Instance.ClickGui.BorderSizePixel = 0
        Instance.ClickGui.Parent = Instances.ScreenGui

        Instances.Corner.CornerRadius = UDim.new(0, 12)
        Instances.Corner.Parent = Instance.ClickGui

        Instances.Layout.Padding = UDim.new(0, 8)
        Instances.Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        Instances.Layout.SortOrder = Enum.SortOrder.LayoutOrder
        Instances.Layout.Parent = Instance.ClickGui

        Instances.Padding.PaddingTop = UDim.new(0, 10)
        Instances.Padding.PaddingBottom = UDim.new(0, 10)
        Instances.Padding.PaddingLeft = UDim.new(0, 10)
        Instances.Padding.PaddingRight = UDim.new(0, 10)
        Instances.Padding.Parent = Instance.ClickGui

        return Instances.ScreenGui, Instance.ClickGui
    end

    function Library.new()
        local Self = setmetatable({}, Library)
        Self.Categories = {}

        if not UiState.ScreenGui or not UiState.ScreenGui.Parent then
            UiState.ScreenGui, UiState.Container = Functions.CreateUi()
        end

        Self.ScreenGui = UiState.ScreenGui
        Self.Container = UiState.Container

        return Self
    end

    function Library:AddCategory(Name)
        local Self = self

        assert(type(Name) == "string", "Category name must be a string")

        if Self.Categories[Name] then
            error("Category already exists: " .. Name)
        end

        local Instances = {
            Canvas = Instance.new("CanvasGroup")
        }

        Instances.Canvas.Name = Name
        Instances.Canvas.Size = UDim2.new(1, 0, 0, 60)
        Instances.Canvas.BackgroundTransparency = 1
        Instances.Canvas.Parent = Self.Container

        local Category = Environments.Category.new(Name, Instances.Canvas)

        Self.Categories[Name] = Category

        return Category
    end

    Modules.Library = Library
end
