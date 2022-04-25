local QBCore = exports['qb-core']:GetCoreObject()

local function GetEnhancements()
    local p = Promise.new()
    QBCore.Functions.TriggerCallback('enhancements:server:fetchEnhancements', function(result)
        p:resolve(result)
    end)
    return Citizen.Await(p)
end

local function HasEnhancement(enhancementName)
    local enhancements = GetEnhancements()
    return enhancements[enhancementName] ~= nil
end
exports('HasEnhancement', HasEnhancement)