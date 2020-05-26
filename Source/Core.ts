import { API } from "./Processes/API";

// Content //


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




