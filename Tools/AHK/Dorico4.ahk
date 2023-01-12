/*
Nelson MALLEUS AHK assistant for Sibelius
Works with Nelson's custom keycommands
!!! indicates passages that need to be optimized, updated, corrected or created.
- Initialization
- Global commands
- Auto completion
*/


; ----- INITIALIZATION ----- ;

#NoEnv
#SingleInstance, Force
#Persistent
#If WinActive("ahk_exe dorico4.exe")

SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

AutoCompletion := 0

; ----- GLOBAL COMMANDS ----- ;

Esc::
    SendInput, {Esc}
    If (AutocompletionTech = 1)
    {
        Process, Close, % CSVExpPID
        AutocompletionTech := 0
    }
    If (AutocompletionDyn = 1)
    {
        Process, Close, % CSVDynPID
        AutocompletionDyn := 0
    }
Return

Enter::
    SendInput, {Enter}
    If (AutocompletionTech = 1)
    {
        Process, Close, % CSVExpPID
        AutocompletionTech := 0
    }
    If (AutocompletionDyn = 1)
    {
        Process, Close, % CSVDynPID
        AutocompletionDyn := 0
    }
Return

; ----- AUTO COMPLETION ----- ;

; Access the auto completion from these shortcuts
    :*c:X::
        SendInput, X{Left}{Right}
        AutocompletionTech := 1
        Run, ExpandTech.ahk, , , CSVExpPID
    Return
    :*c:W::
        SendInput, W{Left}{Right}
        AutocompletionTech := 1
        Run, ExpandTech.ahk, , , CSVExpPID
    Return
    :*c:D::
        SendInput, D{Left}{Right}
        AutocompletionDyn := 1
        Run, ExpandDyn.ahk, , , CSVDynPID
    Return