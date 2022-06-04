# ps-buffs

### Dependencies
***
- PS-Hud: https://github.com/Project-Sloth/ps-hud
### General Information
***
- Buffs are new effects that a player can get. Example: Stamina Buff makes a player run faster.
  - They show up as a new icon

- Enhancements are making statuses you already have better. Example: Health Buff heals a player periodically
  - They show up as yellow on the status they are affecting. Example: Armor buffs makes the armor icon yellow

- By default adding buffs to a player will just have the buff icon show
  - You need to add logic to give the player buff effects (below you can see examples)

- Avaliable buffs you can pick from are in the config file (shared/config.lua)

### Add a buff to a player
```lua
-- Function signature - buffName: string, time: int (1 second = 1000)
exports['ps-buffs']:AddBuff(buffName, time)

-- Example -- Adds a hacking buff for 15 seconds, which the player would see a hacking buff icon on their screen
exports['ps-buffs']:AddBuff("hacking", 15000)
```

### Check if player has a buff
```lua
-- Function signature - buffName: string
exports['ps-buffs']:HasBuff(buffName)

-- Example -- Check if a player has the hacking buff and make it easier to hack something
if exports['ps-buffs']:HasBuff("hacking") then
    -- give player more time or less complicated puzzle
end
```

### Buff Effects
***

- We currently have the following buff effects implemented that you can call:
  - Stamina Buff - Makes a player run faster and generate a random partial amount of stamina
    ```lua
      -- Function signature - time: int (1 second = 1000), value: double (float)
      exports['ps-buffs']:StaminaBuffEffect(time, value)

      -- Example -- Adds a stamina buff for 15 seconds and a player runs 1.4 faster.
      exports['ps-buffs']:StaminaBuffEffect(15000, 1.4)
      ```
  - Swimming Buff - Makes a player swim faster and generate a random partial amount of stamina
    ```lua
    -- Function signature - time: int (1 second = 1000), value: double (float)
    exports['ps-buffs']:SwimmingBuffEffect(time, value)
    
    -- Example -- Adds a swimming buff for 20 seconds and a player swims 1.4 faster.
    exports['ps-buffs']:SwimmingBuffEffect(20000, 1.4)
    ```
  - Health Buff - Makes a player's health partially regenerate periodically
    ```lua
    -- Function signature - time: int (1 second = 1000), value: int
    exports['ps-buffs']:AddHealthBuff(time, value)
    
    -- Example -- Adds a health buff for 10 seconds and a player periodically gains 10 health.
    exports['ps-buffs']:AddHealthBuff(10000, 10)
    ```
  - Armor Buff - Makes a player's armor partially regenerate periodically
    ```lua
    -- Function signature - time: int (1 second = 1000), value: int
    exports['ps-buffs']:AddArmorBuff(time, value)
    
    -- Example -- Adds a armor buff for 30 seconds and a player periodically gains 10 armor.
    exports['ps-buffs']:AddArmorBuff(30000, 10)
    ```
  - Stress Buff - Makes a player's stress partially decrease periodically
    ```lua
    -- Function signature - time: int (1 second = 1000), value: int
    exports['ps-buffs']:AddStressBuff(time, value)
    
    -- Example -- Removes stress for 30 seconds and removes 10 units every 5 seconds
    exports['ps-buffs']:AddStressBuff(30000, 10)
    ```

## Credits
- The majority of the lua code comes from [qb-enhancements](https://github.com/IdrisDose/qb-enhancements) by [IdrisDose](https://github.com/IdrisDose)
- Credits to my boys Silent, Snipe and fjamzoo for help with getting things in place for this to all be possible
