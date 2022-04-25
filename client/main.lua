local QBCore = exports['qb-core']:GetCoreObject()

local function GetEnhancements()
    local p = Promise.new()
    QBCore.Functions.TriggerCallback('enhancements:server:fetchEnhancements', function(result)
        p:resolve(result)
    end)
    return Citizen.Await(p)
end

--- Method to fetch if player has enhancement with name and is not nil
--- @param enhancementName string - Name of the enhancement
--- @return bool
local function HasEnhancement(enhancementName)
    local enhancements = GetEnhancements()
    return enhancements[enhancementName] ~= nil
end
exports('HasEnhancement', HasEnhancement)

--- Method to fetch enhancment details if player has enhancement active
--- @param enhancementName string - Name of the enhancement
--- @return table
local function GetEnhancement(enhancementName)
    local enhancements = GetEnhancements()
    local time = enhancements[enhancementName]

    if time ~= nil then
        return nil
    end

    return {
        time = time,
        icon = Config.Enhancements[enhancementName].icon
    }
end
exports('GetEnhancement',GetEnhancement)