/*
Nelson MALLEUS AHK assistant for Sibelius
Works with Nelson's custom keycommands
!!! indicates passages that need to be optimized, updated, corrected or created.
- Initialization
- Global commands
- Auto completion
*/


; ----- INITIALIZATION ----- ;

; REMOVED: #NoEnv
#SingleInstance Force
Persistent
#HotIf WinActive("ahk_exe dorico5.exe")

SendMode("Input")
; REMOVED: SetBatchLines, -1
SetWorkingDir(A_ScriptDir)

AutocompletionTech := 0
AutocompletionDyn := 0

; ----- GLOBAL COMMANDS ----- ;

Esc::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    SendInput("{Esc}")
    If (AutocompletionTech = 1)
    {
        ProcessClose(CSVExpPID)
        AutocompletionTech := 0
    }
    If (AutocompletionDyn = 1)
    {
        ProcessClose(CSVDynPID)
        AutocompletionDyn := 0
    }
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring

Enter::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    SendInput("{Enter}")
    If (AutocompletionDyn = 1)
    {
        ProcessClose(CSVDynPID)
        AutocompletionDyn := 0
    }
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring

NumpadEnter::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    SendInput("{NumpadEnter}")
    If (AutocompletionDyn = 1)
    {
        ProcessClose(CSVDynPID)
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
} ; V1toV2: Added Bracket before hotkey or Hotstring
    :*c:X::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
        SendInput("X")
        Sleep(5)
        AutocompletionTech := 1
        Run("ExpandTech.ahk", , , &CSVExpPID)
    Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
    :*c:W::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
        SendInput("W")
        Sleep(5)
        AutocompletionTech := 1
        Run("ExpandTech.ahk", , , &CSVExpPID)
    Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
    :*c:D::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
        SendInput("D")
        Sleep(3)
        AutocompletionDyn := 1
        Run("ExpandDyn.ahk", , , &CSVDynPID)
    Return
} ; V1toV2: Added bracket in the end