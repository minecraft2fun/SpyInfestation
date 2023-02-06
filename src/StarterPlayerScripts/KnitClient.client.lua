local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Packages.Knit)

local MoneyController = Knit.CreateController{
    Name="MoneyController"
}

function MoneyController:run()
    
end

function MoneyController:KnitStart()
    
end

function MoneyController:KnitInit()
    
end

Knit.Start():andThen(function()
    print("Knit started")
end):catch(warn)