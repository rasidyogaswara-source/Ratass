--[[ Fly & Infinite Jump Script by Copilot for DASH ]]
-- UI Toggle + Modular Function
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local LP = Players.LocalPlayer
local Char = LP.Character or LP.CharacterAdded:Wait()
local Hum = Char:WaitForChild("Humanoid")
local Root = Char:WaitForChild("HumanoidRootPart")

-- UI Toggle
local flyEnabled = false
local jumpEnabled = false

-- Fly Function
local function startFly()
    local bv = Instance.new("BodyVelocity")
    bv.Velocity = Vector3.new(0, 0, 0)
    bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
    bv.Parent = Root

    game:GetService("RunService").RenderStepped:Connect(function()
        if flyEnabled then
            bv.Velocity = Vector3.new(0, 50, 0) -- kecepatan naik
        else
            bv.Velocity = Vector3.new(0, 0, 0)
        end
    end)
end

-- Infinite Jump Function
UIS.JumpRequest:Connect(function()
    if jumpEnabled then
        Hum:ChangeState("Jumping")
    end
end)

-- Toggle Keybinds
UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.F then
        flyEnabled = not flyEnabled
        if flyEnabled then startFly() end
    elseif input.KeyCode == Enum.KeyCode.J then
        jumpEnabled = not jumpEnabled
    end
end)

-- Info
print("Tekan [F] untuk toggle Fly, [J] untuk toggle Infinite Jump")