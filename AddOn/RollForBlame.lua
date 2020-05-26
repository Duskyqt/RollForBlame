local AddonName = "RollForBlame"



-- Other/Outputs/Lua/Header.lua --
-- This header is used to feed the inner scope of the addon with links to the global environment.
-- If you need additional API from wow you need to start by adding it here and then you can update the types to reflect this change.

local function Load()
    local Environment = {
        AddonName = AddonName,
        -- Lua API
        _G = _G,
        bit = bit,
        cos = math.cos,
        debugstack = debugstack,
        error = error,
        geterrorhandler = geterrorhandler,
        getmetatable = getmetatable,
        ipairs = ipairs,
        loadstring = loadstring,
        math = math,
        DoAtan2 = function (...) return math.atan2(...) end,
        DoMathRan = function (...) return math.random(...) end,
        next = next,
        pairs = pairs,
        pcall = pcall,
        -- If you lost track of where the prints come from or another dev forgot to remove one switch print with debugstack
        -- print = function (...) return print(debugstack(print("|cffFFFFFF[|cffff8000" + AddonName + "|cffFFFFFF] |r", ...))) end,
        print = function (...) return print("|cffFFFFFF[|cffff8000" .. AddonName .. "|cffFFFFFF] |r", ...) end,
        rad = math.rad,
        require = require,
        rawget = rawget,
        rawset = rawset,
        select = select,
        setmetatable = setmetatable,
        sin = math.sin,
        string = string,
        table = table,
        tinsert = table.insert,
        tonumber = tonumber,
        tostring = tostring,
        tremove = table.remove,
        type = type,
        unpack = unpack,
        strsplit = strsplit,
        xpcall = xpcall,
        DuckCasinoSettings = DuckCasinoSettings,
        -- Flight Masters
        CloseTaxiMap = CloseTaxiMap,
        NumTaxiNodes = NumTaxiNodes,
        TaxiNodeCost = TaxiNodeCost,
        TakeTaxiNode = TakeTaxiNode,
        TaxiNodeGetType = TaxiNodeGetType,
        TaxiNodeName = TaxiNodeName,
        TaxiNodePosition = TaxiNodePosition,
        UnitOnTaxi = UnitOnTaxi,
    
        -- Wow API
        CameraOrSelectOrMoveStart = CameraOrSelectOrMoveStart,
        CameraOrSelectOrMoveStop = CameraOrSelectOrMoveStop,
        CancelShapeshiftForm = CancelShapeshiftForm,
        CloseLoot = CloseLoot,
        CreateVector2D = CreateVector2D,
        GetAddOnMemoryUsage = GetAddOnMemoryUsage,
        GetInventoryItemDurability = GetInventoryItemDurability,
        GetNumGroupMembers = GetNumGroupMembers,
        GetNumLootItems = GetNumLootItems,
        GetNumSpellTabs = GetNumSpellTabs,
        GetSpellTabInfo = GetSpellTabInfo,
        GetSpellBookItemName = GetSpellBookItemName,
        IsInGroup = IsInGroup,
        IsInRaid = IsInRaid,
        LootSlot = LootSlot,
        GetProfessionInfos = GetProfessionInfos,
        GetLatestThreeSenders = GetLatestThreeSenders,
        GetInboxNumItems = GetInboxNumItems,
        GetProfessions = GetProfessions,
        LootSlotHasItem = LootSlotHasItem,
        PetAssistMode = PetAssistMode,
        PetPassiveMode = PetPassiveMode,
        SlashCmdList = SlashCmdList,
        SpellIsTargeting = SpellIsTargeting,
        SpellStopCasting = SpellStopCasting,
        SpellStopTargeting = SpellStopTargeting,
        UnitInVehicle = UnitInVehicle,
        UnitIsAFK = UnitIsAFK,
        UpdateAddOnMemoryUsage = UpdateAddOnMemoryUsage,
        WorldMapFrame = WorldMapFrame,
        MailFrame = MailFrame,
        
        RealMobHealth = RealMobHealth,
        -- Units API
        GetRaidRosterInfo = GetRaidRosterInfo,
        GetRaidTargetIndex = GetRaidTargetIndex,
        GetUnitSpeed = GetUnitSpeed,
        UnitAffectingCombat = UnitAffectingCombat,
        UnitCanAttack = UnitCanAttack,
        UnitCastingInfo = UnitCastingInfo,
        UnitChannelInfo = UnitChannelInfo,
        UnitClass = UnitClass,
        UnitClassification = UnitClassification,
        UnitCreatureType = UnitCreatureType,
        UnitDetailedThreatSituation = UnitDetailedThreatSituation,
        UnitExists = UnitExists,
        UnitGetIncomingHeals = UnitGetIncomingHeals,
        UnitGetTotalHealAbsorbs = UnitGetTotalHealAbsorbs,
        UnitGroupRolesAssigned = UnitGroupRolesAssigned,
        UnitGUID = UnitGUID,
        UnitHealth = UnitHealth,
        UnitHealthMax = UnitHealthMax,
        UnitInRaid = UnitInRaid,
        UnitInParty = UnitInParty,
        UnitIsDead = UnitIsDead,
        UnitIsDeadOrGhost = UnitIsDeadOrGhost,
        UnitIsGhost = UnitIsGhost,
        UnitIsPlayer = UnitIsPlayer,
        UnitIsPVP = UnitIsPVP,
        UnitIsUnit = UnitIsUnit,
        UnitIsVisible = UnitIsVisible,
        UnitIsTapDenied = UnitIsTapDenied,
        UnitLevel = UnitLevel,
        UnitName = UnitName,
        UnitPlayerOrPetInParty = UnitPlayerOrPetInParty,
        UnitPlayerOrPetInRaid = UnitPlayerOrPetInRaid,
        UnitThreatSituation = UnitThreatSituation,
        
        -- Buffs API
        UnitBuff = UnitBuff,
        UnitDebuff = UnitDebuff,
        UnitAura = UnitAura,
    
        -- Player API
        GetHaste = GetHaste,
        GetInstanceInfo = GetInstanceInfo,
        GetPVPDesired = GetPVPDesired,
        GetSpecialization = GetSpecialization,
        GetSpecializationInfo = GetSpecializationInfo,
        GetUnitMaxHealthModifier = GetUnitMaxHealthModifier,
        HasFullControl = HasFullControl,
        IsAutoRepeatSpell = IsAutoRepeatSpell,
        IsCurrentSpell = IsCurrentSpell,
        IsFalling = IsFalling,
        IsFlying = IsFlying,
        IsInInstance = IsInInstance,
        IsMounted = IsMounted,
        IsPetActive = IsPetActive,
        UnitAttackSpeed = UnitAttackSpeed,
        UnitInBattleground = UnitInBattleground,
        UnitIsWarModeDesired = UnitIsWarModeDesired,
        UnitOnTaxi = UnitOnTaxi,
        
        -- PlayerPet API
        DisableSpellAutocast = DisableSpellAutocast,
        EnableSpellAutocast = EnableSpellAutocast,
        GetPetActionInfo = GetPetActionInfo,
        IsPetAttackActive = IsPetAttackActive,
        PetAttack = PetAttack,
    
        -- Power API
        GetPowerRegen = GetPowerRegen,
        GetRuneCooldown = GetRuneCooldown,
        UnitPower = UnitPower,
        UnitPowerMax = UnitPowerMax,
        UnitStagger = UnitStagger,
        
        -- Spells API
        GetSpellCharges = GetSpellCharges,
        GetSpellCooldown = GetSpellCooldown,
        GetSpellCount = GetSpellCount,
        GetSpellDescription = GetSpellDescription,
        GetSpellInfo = GetSpellInfo,
        GetTotemInfo = GetTotemInfo,
        GetTotemTimeLeft = GetTotemTimeLeft,
        IsUsableSpell = IsUsableSpell,
        IsPlayerSpell = IsPlayerSpell,
        IsSpellInRange = IsSpellInRange,
        IsSpellKnown = IsSpellKnown,
    
        -- Stats API
        CR_VERSATILITY_DAMAGE_DONE = CR_VERSATILITY_DAMAGE_DONE,
        GetCombatRating = GetCombatRating,
        GetCombatRatingBonus = GetCombatRatingBonus,
        GetVersatilityBonus = GetVersatilityBonus,
        GetMasteryEffect = GetMasteryEffect,
        GetCritChance = GetCritChance,
        GetHaste = GetHaste,
        UnitAttackPower = UnitAttackPower,
        UnitDamage = UnitDamage,
        UnitSpellHaste = UnitSpellHaste,
    
        -- Keybinds
        AscendStop = AscendStop,
        JumpOrAscendStart = JumpOrAscendStart,
        JumpOrAscendStop = JumpOrAscendStop,
        MoveBackwardStart = MoveBackwardStart,
        MoveBackwardStop = MoveBackwardStop,
        MoveForwardStart = MoveForwardStart,
        MoveForwardStop = MoveForwardStop,
        StrafeLeftStart = StrafeLeftStart,
        StrafeLeftStop = StrafeLeftStop,
        StrafeRightStart = StrafeRightStart,
        StrafeRightStop = StrafeRightStop,
        TurnLeftStart = TurnLeftStart,
        TurnLeftStop = TurnLeftStop,
        TurnRightStart = TurnRightStart,
        TurnRightStop = TurnRightStop,
        PitchUpStart = PitchUpStart,
        PitchDownStart = PitchDownStart,
        PitchDownStop = PitchDownStop,
        PitchUpStop = PitchUpStop,
        IsMouselooking = IsMouselooking,
        IsShiftKeyDown = IsShiftKeyDown,
        IsSwimming = IsSwimming,
        IsControlKeyDown = IsControlKeyDown,
        MouselookStart = MouselookStart,
    
        -- General API
        ClearTarget = ClearTarget,
        CombatLogGetCurrentEventInfo = CombatLogGetCurrentEventInfo,
        C_AzeriteEmpoweredItem = C_AzeriteEmpoweredItem,
        C_ChatInfo = C_ChatInfo,	
        C_Map = C_Map,
        C_MountJournal = C_MountJournal,
        C_Timer = C_Timer,
        C_Item = C_Item,
        Enum = Enum,
        
        Dismount = Dismount,
        ItemLocation = ItemLocation,
        GetAddOnMetadata = GetAddOnMetadata,
        GetBuildInfo = GetBuildInfo,
        GetCursorPosition = GetCursorPosition,
        GetGossipOptions = GetGossipOptions,
        GetNumGossipOptions = GetNumGossipOptions,
        GetSkillLevel = GetSkillLevel,
        GetSkillLineInfo = GetSkillLineInfo,
        GetNumSkillLines = GetNumSkillLines,
        SelectGossipOption = SelectGossipOption,
        GetNumQuestLogEntries = GetNumQuestLogEntries,
        GetQuestLogQuestText = GetQuestLogQuestText,
        GetQuestIDFromLogIndex = GetQuestIDFromLogIndex,
        GetLocale = GetLocale,
        GetTime = GetTime,
        GetNetStats = GetNetStats,
        GetInventorySlotInfo = GetInventorySlotInfo,
        GetWeaponEnchantInfo = GetWeaponEnchantInfo,
        InterfaceOptions_AddCategory = InterfaceOptions_AddCategory,
        IsIndoors = IsIndoors,
        IsOutdoors = IsOutdoors,
        PowerType = Enum.PowerType,
        UnitIsWildBattlePet = UnitIsWildBattlePet,
        AcceptProposal = AcceptProposal,
        GetCVar = GetCVar,
        SetCVar = SetCVar,
        UIErrorsFrame = UIErrorsFrame,
        mod = mod,
        CanLootUnit = CanLootUnit,
        ResetInstances = ResetInstances,
        SendChatMessage = SendChatMessage,
    
        -- Equipment API
        ContainerIDToInventoryID = ContainerIDToInventoryID,
        EquipCursorItem = EquipCursorItem,
        EquipItemByName = EquipItemByName,
        GetContainerItemInfo = GetContainerItemInfo,
        GetContainerItemLink = GetContainerItemLink,
        GetContainerFreeSlots = GetContainerFreeSlots,
        GetContainerNumFreeSlots = GetContainerNumFreeSlots,
        GetContainerNumSlots = GetContainerNumSlots,
        GetInventoryItemCooldown = GetInventoryItemCooldown,
        GetInventoryItemID = GetInventoryItemID,
        GetItemCooldown = GetItemCooldown,
        GetItemCount = GetItemCount,
        GetItemInfo = GetItemInfo,
        IsUsableInventory = IsUsableInventory,
        NUM_BAG_SLOTS = NUM_BAG_SLOTS,
        PickupContainerItem = PickupContainerItem,
        PickupInventoryItem = PickupInventoryItem,
        PickupMerchantItem = PickupMerchantItem,
        PutItemInBackpack = PutItemInBackpack,
        PutItemInBag = PutItemInBag,
        UseContainerItem = UseContainerItem,
    
        -- Talents API
        LearnTalent = LearnTalent,
        RemoveTalent = RemoveTalent,
        GetTalentInfo = GetTalentInfo,
        RAID_CLASS_COLORS = RAID_CLASS_COLORS,
        ITEM_QUALITY_COLORS = ITEM_QUALITY_COLORS,
    
        -- Pet Battles / Critters
        BATTLE_PET_NAME_5 = BATTLE_PET_NAME_5,
        PETTAME_NOTDEAD = PETTAME_NOTDEAD,
        SPELL_FAILED_NO_PET = SPELL_FAILED_NO_PET,
        ERR_ATTACK_DEAD = ERR_ATTACK_DEAD,
        PETTAME_DEAD = PETTAME_DEAD,
        -- Constants
        SPELL_FAILED_NOT_BEHIND = SPELL_FAILED_NOT_BEHIND,
        SPELL_FAILED_NO_MOUNTS_ALLOWED = SPELL_FAILED_NO_MOUNTS_ALLOWED,
        MINIMAP_TRACKING_MAILBOX = MINIMAP_TRACKING_MAILBOX,
        -- WoW UI API
        CreateFrame = CreateFrame,
        GameTooltip = GameTooltip,
        CreateMacro = CreateMacro,
        message = message,
        UIParent = UIParent,
        Enum = Enum,
        WorldFrame = WorldFrame,
        -- RealMobHealth
        assert = assert,
        GameTooltipStatusBar = GameTooltipStatusBar,
        hooksecurefunc = hooksecurefunc,
        IsInGuild = IsInGuild,
        NamePlateDriverFrame = NamePlateDriverFrame,
        TargetFrameHealthBar = TargetFrameHealthBar,
        TargetFrameTextureFrame = TargetFrameTextureFrame,
        TargetFrameManaBar = TargetFrameManaBar,
        TextStatusBar_Initialize = TextStatusBar_Initialize,
        TextStatusBar_OnValueChanged = TextStatusBar_OnValueChanged,
        TextStatusBar_UpdateTextString = TextStatusBar_UpdateTextString,
        TextStatusBar_UpdateTextStringWithValues = TextStatusBar_UpdateTextStringWithValues,
    }
    if setfenv == nil then return end
    setfenv(1, Environment)

-- Other/Outputs/Lua/Source.lua --
-- Lua Library inline imports
function __TS__StringSplit(source, separator, limit)
    if limit == nil then
        limit = 4294967295
    end
    if limit == 0 then
        return {}
    end
    local out = {}
    local index = 0
    local count = 0
    if (separator == nil) or (separator == "") then
        while (index < (#source - 1)) and (count < limit) do
            out[count + 1] = string.sub(source, index + 1, index + 1)
            count = count + 1
            index = index + 1
        end
    else
        local separatorLength = #separator
        local nextIndex = (string.find(source, separator, nil, true) or 0) - 1
        while (nextIndex >= 0) and (count < limit) do
            out[count + 1] = string.sub(source, index + 1, nextIndex)
            count = count + 1
            index = nextIndex + separatorLength
            nextIndex = (string.find(source, separator, index + 1, true) or 0) - 1
        end
    end
    if count < limit then
        out[count + 1] = string.sub(source, index + 1)
    end
    return out
end

function Debug(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    if DebugAllowed then
        print(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    end
end
function Parse(Parts)
    local PartsArray = __TS__StringSplit(Parts, " ")
    local Command = PartsArray[1]
    if Macros[Command] ~= nil then
        Macros[Command].MacroFunction(PartsArray)
    elseif ((string.find(
        string.lower(Parts),
        "roll",
        nil,
        true
    ) or 0) - 1) ~= -1 then
        if IsInGroup() then
            Debug("Trying Party!")
            local RandomNumber = DoMathRan(
                1,
                GetNumGroupMembers()
            )
            Debug(RandomNumber)
            local name = PartyMembers[RandomNumber]
            Debug(name)
            local Blame = UnitName(name)
            Debug(Blame)
            if Blame then
                Debug("Here we go!")
                SendChatMessage("Blame goes to...", "PARTY")
                SendChatMessage(
                    ((("Party" .. tostring(RandomNumber)) .. ": ") .. tostring(Blame)) .. "!!",
                    "PARTY"
                )
            end
        elseif IsInRaid() then
            Debug("Trying Raid!!")
            local RandomNumber = DoMathRan(
                1,
                GetNumGroupMembers()
            )
            Debug(RandomNumber)
            local name = RaidMembers[RandomNumber]
            Debug(name)
            local Blame = UnitName(name)
            Debug(Blame)
            if Blame then
                Debug("Here we go!")
                SendChatMessage("Blame goes to...", "PARTY")
                SendChatMessage(
                    ((("Raid" .. tostring(RandomNumber)) .. ": ") .. tostring(Blame)) .. "!!",
                    "PARTY"
                )
            end
        end
    else
        print("Invalid Command:", Parts, " could not be found.")
    end
end
DebugAllowed = true
function RegisterCommand(Command)
    _G[("SLASH_" .. tostring(
        string.upper(Command)
    )) .. "1"] = "/" .. tostring(
        string.lower(Command)
    )
    _G.SlashCmdList[string.upper(Command)] = Parse
end
RegisterCommand("rfb")
Macros = {}
function RegisterMacro(self, macroName, macroFunction, macroDescription)
    Macros[macroName] = {MacroName = macroName, MacroFunction = macroFunction, MacroDescription = macroDescription}
end
RegisterMacro(
    nil,
    "hello",
    function(PartsArray)
        print("Hello", PartsArray[2])
    end,
    "Print Hello World to chat."
)
PartyMembers = {"player", "party1", "party2", "party3", "party4"}
RaidMembers = {"player", "raid1", "raid2", "raid3", "raid4", "raid5", "raid6", "raid7", "raid8", "raid9", "raid10", "raid11", "raid12", "raid13", "raid14", "raid15", "raid16", "raid17", "raid18", "raid19", "raid20", "raid21", "raid22", "raid23", "raid24", "raid25", "raid26", "raid27", "raid28", "raid29", "raid30", "raid31", "raid32", "raid33", "raid34", "raid35", "raid36", "raid37", "raid38", "raid39", "raid40"}


-- Other/Outputs/Lua/Footer.lua --
-- This file will be the bottom of the addon file and the setfenv scope finishes here, after the end, is back to file scope

end

local function TryLoading()
    C_Timer.After(1, function () 
        if setfenv ~= nil then
            Load()
        else
            TryLoading()
        end
    end)
end

TryLoading()