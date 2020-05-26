import { Core } from "../Core";

// Content //

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

