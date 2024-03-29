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
#If WinActive("ahk_exe dorico5.exe")

SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

AutocompletionTech := 0
AutocompletionDyn := 0

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
    If (AutocompletionDyn = 1)
    {
        Process, Close, % CSVDynPID
        AutocompletionDyn := 0
    }
Return

NumpadEnter::
    SendInput, {NumpadEnter}
    If (AutocompletionDyn = 1)
    {
        Process, Close, % CSVDynPID
        AutocompletionDyn := 0
    }
Return

;LButton::
;    SendInput, {LButton}
;    If (AutocompletionTech = 1)
;    {
;        Process, Close, % CSVExpPID
;        AutocompletionTech := 0
;    }
;    If (AutocompletionDyn = 1)
;    {
;        Process, Close, % CSVDynPID
;        AutocompletionDyn := 0
;    }
;Return

; ----- AUTO COMPLETION ----- ;

; Access the auto completion from these shortcuts
    :*c:X::
        SendInput, X
        Sleep, 5
        AutocompletionTech := 1
        Run, ExpandTech.ahk, , , CSVExpPID
    Return
    :*c:W::
        SendInput, W
        Sleep, 5
        AutocompletionTech := 1
        Run, ExpandTech.ahk, , , CSVExpPID
    Return
    :*c:D::
        SendInput, D
        Sleep, 3
        AutocompletionDyn := 1
        Run, ExpandDyn.ahk, , , CSVDynPID
    Return