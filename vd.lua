local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.V then
		local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		local Humanoid = Character:WaitForChild("Humanoid") 
		if Humanoid.WalkSpeed ~= 32 then -- Скорость
			Humanoid.WalkSpeed = 32
		else
			Humanoid.WalkSpeed = 16
		end
	end
end)

while true do
	--[[
	if game.Workspace.Camera.FieldOfView ~= 110 then -- FOV
		game.Workspace.Camera.FieldOfView = 110
	end
	--]]
	
	for _, v in Players:GetPlayers() do -- Игроки
		local character = v.Character

		if v == LocalPlayer then
			continue
		end

		if character and v.Team and v.Team.Name == "Survivors" and not character:FindFirstChild("Highlight") then -- Создает вх выжевшего
			local Highlight = Instance.new("Highlight")
			Highlight.FillColor = Color3.new(1, 1, 1)
			Highlight.Adornee = character
			Highlight.Parent = character
		elseif character and v.Team and v.Team.Name == "Killer" and not character:FindFirstChild("Highlight") then -- Создает вх мана
			local Highlight = Instance.new("Highlight")
			Highlight.FillColor = Color3.new(1, 0, 0)
			Highlight.OutlineColor = Color3.new(1, 0, 0)
			Highlight.Adornee = character
			Highlight.Parent = character
		elseif character and v.Team and v.Team.Name == "Spectator" and character:FindFirstChild("Highlight") then -- Удаляет вх
			for _, v in character:GetChildren() do
				if v.Name == "Highlight" then
					v:Destroy()
				end
			end
		end
	end
	for _, v in game.Workspace.Map:GetChildren() do 
		if v.Name == "Palletwrong" and not v:FindFirstChild("Highlight") then --Паллеты
			local Highlight = Instance.new("Highlight")
			Highlight.FillColor = Color3.new(1, 0.54902, 0)
			Highlight.OutlineColor = Color3.new(1, 0.54902, 0)
			Highlight.OutlineTransparency = 0.3
			Highlight.Adornee = v
			Highlight.Parent = v
		elseif v.Name == "Gate" then -- Ворота
			for _, v in v:GetChildren() do
				if v.Name == "ExitLever" and not v:FindFirstChild("Highlight") then
					local Highlight = Instance.new("Highlight")
					Highlight.FillColor = Color3.new(0, 0.764706, 1)
					Highlight.OutlineColor = Color3.new(0, 0.764706, 1)
					Highlight.OutlineTransparency = 0.3
					Highlight.Adornee = v
					Highlight.Parent = v
				end
			end
		elseif v.Name == "Generators" then -- Генераторы
			for _, v in v:GetChildren() do
				if v.Name == "Generator" and not v:FindFirstChild("Highlight") then
					local Highlight = Instance.new("Highlight")
					Highlight.FillColor = Color3.new(1, 0.564706, 0.0431373)
					Highlight.OutlineColor = Color3.new(1, 0.564706, 0.0431373)
					Highlight.OutlineTransparency = 0.3
					Highlight.Adornee = v
					Highlight.Parent = v
				end
			end
		elseif v.Name == "Window" and not v:FindFirstChild("Highlight") then -- Окна
			local Highlight = Instance.new("Highlight")
			Highlight.FillColor = Color3.new(1, 1, 1)
			Highlight.OutlineColor = Color3.new(1, 1, 1)
			Highlight.OutlineTransparency = 0.3
			Highlight.Adornee = v
			Highlight.Parent = v
		end
	end
	wait(0.2)
end
