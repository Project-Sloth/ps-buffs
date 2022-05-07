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
    local time = nil
    
    if buffs == nil then
        return nil
    end

    return buffs[buffName]
end
exports('GetBuff', GetBuff)

--- Method to fetch nui details of all buffs, used when a player that had buffs
--- logged out and back in to the server
--- @return table | nil
local function GetBuffNUIData()
    local buffs = GetBuffs()

    if buffs == nil then
        return nil
    end

    local nuiData = {}

    for buffName, buffTime in pairs(buffs) do
        local buffData = Config.Buffs[buffName]

        if buffData.type == 'buff' then
            nuiData[buffName] = {
                buffName = buffName,
                display = true,
                iconName = buffData.iconName,
                iconColor = buffData.iconColor,
                progressColor = buffData.progressColor,
                progressValue = (buffTime * 100) / buffData.maxTime,
            }
        else
            nuiData[buffName] = {
                display = true,    
                enhancementName = buffName,
                iconColor = buffData.iconColor
            }
        end
    end

    return nuiData
end
exports('GetBuffNUIData', GetBuffNUIData)

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