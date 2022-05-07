# TNJ-Buffs


## Setup Guide
### General Information
***
<br/>

- Buffs are new effects that a player can get. Example: Stamina Buff makes a player run faster.
  - They show up as a new icon

- Enhancements are making statuses you already have better. Example: Health Buff heals a player periodically
  - They show up as yellow on the status they are affecting. Example: Armor buffs makes the armor icon yellow

- By default adding buffs to a player will just have the buff icon show
  - You need to add logic to give the player buff effects (below you can see examples)

- Avaliable buffs you can pick from are in the config file (shared/config.lua)

<br/>

### Add a buff to a player
```lua
-- Function signature - buffName: string, time: int (1 second = 1000)
exports['tnj-buffs']:AddBuff(buffName, time)

-- Example -- Adds a hacking buff for 15 seconds, which the player would see a hacking buff icon on their screen
exports['tnj-buffs']:AddBuff("hacking", 15000)
```

<br/>

### Check if player has a buff
```lua
-- Function signature - buffName: string
exports['tnj-buffs']:HasBuff(buffName)

-- Example -- Check if a player has the hacking buff and make it easier to hack something
if exports['tnj-buffs']:HasBuff("hacking") then
    -- give player more time or less complicated puzzle
end
```
<br/>

### Buff Effects
***
<br/>

- We currently have the following buff effects implemented that you can call:
  - Stamina Buff - Makes a player run faster and generate a random partial amount of stamina
    ```lua
      -- Function signature - time: int (1 second = 1000), value: double (float)
      exports['tnj-buffs']:StaminaBuffEffect(time, value)

      -- Example -- Adds a stamina buff for 15 seconds and a player runs 1.4 faster.
      exports['tnj-buffs']:StaminaBuffEffect(15000, 1.4)
      ```
  - Swimming Buff - Makes a player swim faster and generate a random partial amount of stamina
    ```lua
    -- Function signature - time: int (1 second = 1000), value: double (float)
    exports['tnj-buffs']:SwimmingBuffEffect(time, value)
    
    -- Example -- Adds a swimming buff for 20 seconds and a player swims 1.4 faster.
    exports['tnj-buffs']:SwimmingBuffEffect(20000, 1.4)
    ```
  - Health Buff - Makes a player's health partially regenerate periodically
    ```lua
    -- Function signature - time: int (1 second = 1000), value: int
    exports['tnj-buffs']:AddHealthBuff(time, value)
    
    -- Example -- Adds a health buff for 10 seconds and a player periodically gains 10 health.
    exports['tnj-buffs']:AddHealthBuff(10000, 10)
    ```
  - Armor Buff - Makes a player's armor partially regenerate periodically
    ```lua
    -- Function signature - time: int (1 second = 1000), value: int
    exports['tnj-buffs']:AddArmorBuff(time, value)
    
    -- Example -- Adds a armor buff for 30 seconds and a player periodically gains 10 armor.
    exports['tnj-buffs']:AddArmorBuff(30000, 10)
    ```

<br>

## Credits
- The majority of the lua code comes from [qb-enhancements](https://github.com/IdrisDose/qb-enhancements) by [IdrisDose](https://github.com/IdrisDose)
- Credits to my boys Silent, Snipe OP Gaming and fjamzoo for help with getting things in place for this to all be possible
