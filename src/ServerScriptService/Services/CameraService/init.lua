local Knit = require(game.ReplicatedStorage.Packages.Knit)
local TableUtil = require(game.ReplicatedStorage.Packages.TableUtil)

local CameraService = Knit.CreateService({
	Name = "CameraService",
	Client = {},
	_RunningCameras = {},
})

function CameraService:StartCamera(camera: Folder)
	print("starting camera")
	self._RunningCameras[camera] = "Hello"
	--  print(table.insert(self._RunningCameras, "hello"))
	print(self._RunningCameras)
	self._RunningCameras[camera] = function()
		while self._RunningCameras[camera] ~= nil do
			wait()
			print("1")
			for _, player in pairs(game.Players:GetChildren()) do
				spawn(function()
					if player.Character ~= nil then
						local eyeBall = camera:WaitForChild("EyeBall")
						local main = camera:WaitForChild("Main")
						local Start = eyeBall.Position
						local End = player.Character.HumanoidRootPart.Position
						local raycastResult = workspace:Raycast(Start, (End - Start).Unit * 100)
						if
							(game.Players:GetPlayerFromCharacter(raycastResult.Instance.Parent))
							or (game.Players:GetPlayerFromCharacter(raycastResult.Instance.Parent.Parent))
						then
							warn("FOUND YOU")
							local dir = (End - Start).unit
							local spawnPos = Start
							local pos = spawnPos + (dir * 1)
							main.BodyGyro.CFrame = CFrame.new(pos, pos + dir)
						else
							print("hidden")
						end
					end
				end)
			end
		end
	end
	spawn(function()
		self._RunningCameras[camera]()
	end)
end

function CameraService:KillCamera(camera:DataModel)
	print("kill func 1")
	local function run(fold)
		print("kill")
		self._RunningCameras[fold] = nil
	end

	if type(camera) == "table" then
		--loop through, Kill
		print("table")
		for _, v in pairs(camera) do
			run(v)
		end
	elseif camera:IsA("Folder") then
		--singular
		run(camera)
	else
		print("killFunc - nothing found to classify")
	end
end

function CameraService:KnitStart()
	self:StartCamera(game.Workspace.Cameras.Camera1)
	print("out")
	--wait(5)
	--self:KillCamera(game.Workspace.Cameras:GetChildren())
	--print("after kill")
end

function CameraService:KnitInit()
	print("Starting Knit Service " .. script.Name)
end

return CameraService
