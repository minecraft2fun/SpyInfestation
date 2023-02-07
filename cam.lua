local rayOrigin = Vector3.new(-29.148, 20.691, -60.725)
local rayDirection = Vector3.new(0, -100, 0)

local raycastResult = workspace:Raycast(rayOrigin, rayDirection)
--print(raycastResult)

--[[if raycastResult then
	print("Instance:", raycastResult.Instance)
	print("Position:", raycastResult.Position)
	print("Distance:", raycastResult.Distance)
	print("Material:", raycastResult.Material)
	print("Normal:", raycastResult.Normal)
else
	warn("No raycast result!")
end]]

game.Players.PlayerAdded:Connect(function(player)
	local func 

	local function a()
		func = player.CharacterAdded:Connect(function(character)
			warn("RUNNING")
			wait(5)
			while character ~= nil do
				local eyeBall = script.Parent:WaitForChild("EyeBall")
				local main = script.Parent:WaitForChild("Main")
				local Start = eyeBall.Position
				local End = character.HumanoidRootPart.Position
				local Distance = (End-Start).Magnitude
				local Frame = CFrame.new(Start,End) * CFrame.new(0, 0,- Distance/ 2)
				local raycastResult = workspace:Raycast(Start, (End-Start).Unit * 100)
				if (game.Players:GetPlayerFromCharacter(raycastResult.Instance.Parent)) or (game.Players:GetPlayerFromCharacter(raycastResult.Instance.Parent.Parent)) then
					warn("FOUND YOU")
					local dir = (End - Start).unit
					local spawnPos = Start
					local pos = spawnPos + (dir * 1)					
					main.BodyGyro.CFrame = CFrame.new(pos,  pos + dir)
				else
					print("hidden")
				end
				wait()
			end
		end)
	end
	a()
	player.CharacterRemoving:Connect(function()
		func:Disconnect()
		a()
	end)
end)