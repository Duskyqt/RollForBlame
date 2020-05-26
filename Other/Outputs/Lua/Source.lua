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
Macros = {}
function RegisterCommand(Command)
    _G[("SLASH_" .. tostring(
        string.upper(Command)
    )) .. "1"] = "/" .. tostring(
        string.lower(Command)
    )
    _G.SlashCmdList[string.upper(Command)] = Parse
end
RegisterCommand("blame")
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
