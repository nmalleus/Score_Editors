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
    If (Autocompletion = 1)
    {
        Process, Close, % CSVExpTechPID
        Process, Close, % CSVExpDynPID
        AutoCompletion := 0
    }
Return

; ----- AUTO COMPLETION ----- ;

; Access the auto completion from these shortcuts
    :*c:X::
        SendInput, X{Left}{Right}
        AutoCompletion := 1
        Run, ExpandTech.ahk, , , CSVExpTechPID
    Return
    :*c:W::
        SendInput, W{Left}{Right}
        AutoCompletion := 1
        Run, ExpandTech.ahk, , , CSVExpTechPID
    Return
    :*c:D::
        SendInput, D{Left}{Right}
        Run, ExpandDyn.ahk, , , CSVExpDynPID
    Return