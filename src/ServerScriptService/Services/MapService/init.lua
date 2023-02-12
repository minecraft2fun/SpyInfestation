local Knit = require(game.ReplicatedStorage.Packages.Knit)

local MapService = Knit.CreateService({
	Name = "MapService",
	Client = {},
})

function MapService:KnitStart()
end

function MapService:KnitInit()
	print("Starting Knit Service " .. script.Name)
end

return MapService