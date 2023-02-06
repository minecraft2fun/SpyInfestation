local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Packages.Knit)

local MoneyService = Knit.CreateService{
    Name = "MoneyService",
    Client = {}
}

function MoneyService:GetMoney(player : Player)
    return 0
end

function MoneyService:KnitStart()
    
end

function MoneyService:KnitInit()
    
end

Knit.Start():andThen(function()
    print("Knit started")
end):catch(warn)