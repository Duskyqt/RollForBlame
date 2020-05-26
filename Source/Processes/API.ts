 // Content //



 export namespace API {
    const DebugAllowed = false;

    export function Debug(this: void, arg1: any, arg2?: any, arg3?: any, arg4?: any, arg5?: any, arg6?: any, arg7?: any): void {
        if (DebugAllowed) {
            print(arg1, arg2, arg3, arg4, arg5, arg6, arg7);
        }
    }

}
