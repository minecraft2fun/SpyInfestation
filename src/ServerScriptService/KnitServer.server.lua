local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Packages.Knit)
local TableUtil = require("ReplicatedStorage.Packages.TableUtil")

local CameraService = Knit.CreateService{
    Name = "CameraService",
    Client = {},
    RunningCameras = {}
}

function CameraService:GetMoney(player : Player)
    return 0
end
function CameraService:StartCamera(camera:Folder)
    
end

function CameraService:KillCamera(camera)
local function run(fold)
    
end


    if camera:IsA("Folder") then
        run(camera)
        --singluar
    elseif camera:IsA("Table") then
        --loop through, Kill
        for _,v in pairs(camera) do
            run(v)
        end
    end
end

function CameraService:KnitStart()
    
end

function CameraService:KnitInit()
    print("Starting Knit Service "..script.Name)
end

Knit.Start():andThen(function()
    print("Knit started")
end):catch(warn)