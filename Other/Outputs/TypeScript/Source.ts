//Source/Processes/API.ts//




 export namespace API {
    const DebugAllowed = false;

    export function Debug(this: void, arg1: any, arg2?: any, arg3?: any, arg4?: any, arg5?: any, arg6?: any, arg7?: any): void {
        if (DebugAllowed) {
            print(arg1, arg2, arg3, arg4, arg5, arg6, arg7);
        }
    }

}
//Source/Processes/Commands.ts//


export namespace Commands {
    function RegisterCommand(this: void, Command: string) {
        _G["SLASH_" + Command.toUpperCase() + "1"] = "/" + Command.toLowerCase();
        _G.SlashCmdList[Command.toUpperCase()] = Parse;
    }

    RegisterCommand("blame");

    /** Register a custom macro */
    function RegisterMacro(macroName: string, macroFunction: (this: void, params: any) => void, macroDescription: string): void {
        Macros[macroName] = { MacroName: macroName, MacroFunction: macroFunction, MacroDescription: macroDescription };
    }

    RegisterMacro("roll", (PartsArray: string[]) => { Core.RollForBlame(); }, "Find out who is to blame, then print it to the chat.");


    function Parse(this: void, Parts: string) {
        const PartsArray: string[] = Parts.split(" ");
        const Command: string = PartsArray[0];
        // Toggle
        if (Macros[Command] != undefined) {
            // print("Custom Macro", PartsArray[0], Macros[Command].MacroName);
            Macros[Command].MacroFunction(PartsArray);
        } else {
            print("Invalid Command:", Parts, " could not be found.");
        }
    }

    interface IMacro {
        MacroName: string;
        MacroFunction: (this: void, params: any) => void;
        MacroDescription: string;
    }
    interface IMacroNameToMacro {
        [MacroName: string]: IMacro;
    }
    const Macros: IMacroNameToMacro = {};
}

//Source/Core.ts//



export namespace Core {
    export function RollForBlame(): void {
        if (IsInGroup()) {
            API.Debug("Trying Party!");
            const RandomNumber = DoMathRan(1, GetNumGroupMembers());
            API.Debug(RandomNumber);
            const name = PartyMembers[RandomNumber - 1];
            API.Debug(name);
            const Blame = UnitName(name);
            API.Debug(Blame);
            if (Blame) {
                API.Debug("Here we go!");
                SendChatMessage("Blame goes to...", "PARTY");
                SendChatMessage("Party" + RandomNumber + ": " + Blame + "!!", "PARTY");
            }
        } else if (IsInRaid()) {
            API.Debug("Trying Raid!!");
            const RandomNumber = DoMathRan(1, GetNumGroupMembers());
            API.Debug(RandomNumber);
            const name = RaidMembers[RandomNumber - 1];
            API.Debug(name);
            const Blame = UnitName(name);
            API.Debug(Blame);
            if (Blame) {
                API.Debug("Here we go!");
                SendChatMessage("Blame goes to...", "PARTY");
                SendChatMessage("Raid" + RandomNumber + ": " + Blame + "!!", "PARTY");
            }
        }
    }
    const PartyMembers: string[] = [
        "player",
        "party1",
        "party2",
        "party3",
        "party4",
    ];
    const RaidMembers: string[] = [
        "player",
        "raid1",
        "raid2",
        "raid3",
        "raid4",
        "raid5",
        "raid6",
        "raid7",
        "raid8",
        "raid9",
        "raid10",
        "raid11",
        "raid12",
        "raid13",
        "raid14",
        "raid15",
        "raid16",
        "raid17",
        "raid18",
        "raid19",
        "raid20",
        "raid21",
        "raid22",
        "raid23",
        "raid24",
        "raid25",
        "raid26",
        "raid27",
        "raid28",
        "raid29",
        "raid30",
        "raid31",
        "raid32",
        "raid33",
        "raid34",
        "raid35",
        "raid36",
        "raid37",
        "raid38",
        "raid39",
        "raid40",
    ];
}




