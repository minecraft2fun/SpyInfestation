local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Packages.Knit)

for _,v in pairs(game.ServerScriptService.Source.Services:GetChildren()) do
    require(v)
end

Knit.Start()
	:andThen(function()
		print("Knit started")
	end)
	:catch(warn)
print("hi")