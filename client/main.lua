local QBCore = exports['qb-core']:GetCoreObject()

local function GetBuffs()
    local p = promise.new()
    QBCore.Functions.TriggerCallback('buffs:server:fetchBuffs', function(result)
        p:resolve(result)
    end)
    return Citizen.Await(p)
end

--- Method to fetch if player has buff with name and is not nil
--- @param buffName string - Name of the buff
--- @return bool
local function HasBuff(buffName)
    local buffs = GetBuffs()
    if buffs then
        return buffs[buffName] ~= nil
    end
    return false
end
exports('HasBuff', HasBuff)

--- Method to fetch buff details if player has buff active
--- @param buffName string - Name of the buff
--- @return table
local function GetBuff(buffName)
    local buffs = GetBuffs()
    local time = buffs[buffName]

    if time == nil then
        return nil
    end

    return {
        time = time,
        icon = Config.Buffs[buffName].icon
    }
end
exports('GetBuff', GetBuff)

--- Method to add buff to player
--- @param playerID string - Player identifier
--- @param buffName string - Name of the buff
--- @return bool - Success of removing the player buff
local function AddBuff(buffName, time)
    local p = promise.new()
    QBCore.Functions.TriggerCallback('buffs:server:addBuff', function(result)
        p:resolve(result)
    end, buffName, time)
    return Citizen.Await(p)
end
exports('AddBuff', AddBuff)