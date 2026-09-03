local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

while true do
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
	wait(0.2)
end
