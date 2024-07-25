/*
Nelson MALLEUS AHK assistant for Sibelius
Works with Nelson's custom keycommands
!!! indicates passages that need to be optimized, updated, corrected or created.
- Initialization
- Global commands
- Going back to F7 after...
- Auto completion
*/


; ----- INITIALIZATION ----- ;

; REMOVED: #NoEnv
#SingleInstance Force
Persistent
#HotIf WinActive("ahk_exe sibelius.exe")

SendMode("Input")
; REMOVED: SetBatchLines, -1
SetWorkingDir(A_ScriptDir)

KeypadState := 7
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
} ; V1toV2: Added Bracket before hotkey or Hotstring

F7::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    SendInput("{F7}")
    KeypadState := 7
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
F8::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    SendInput("{F8}")
    KeypadState := 8
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
F9::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    SendInput("{F9}")
    KeypadState := 9
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
+r::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    SendInput("R")
    KeypadState := 9
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
F10::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    SendInput("{F10}")
    KeypadState := 10
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
F11::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    SendInput("{F11}")
    KeypadState := 11
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
F12::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    SendInput("{F12}")
    KeypadState := 12
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
^F8::   ; faking Keypad state to stay on this panel
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    SendInput("{F8}")
    KeypadState := 7
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
^F9::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    SendInput("{F9}")
    KeypadState := 7
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
^+r::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    SendInput("R")
    KeypadState := 7
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
^F10::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    SendInput("{F10}")
    KeypadState := 7
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
^F11::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    SendInput("{F11}")
    KeypadState := 7
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
^F12::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    SendInput("{F12}")
    KeypadState := 7
Return


; ----- GOING BACK TO F7 AFTER... ----- ;
/* - writting tremolos
- !!! think about more usefull Keypad resets
Use Ctrl+F8/F9/F10/F11/F12 or Ctrl+Shift+R to stay longer in this keypad
*/
} ; V1toV2: Added Bracket before hotkey or Hotstring

Numpad1::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    Send("{Numpad1}")
    If (KeypadState = 9)
        SendInput("{F7}")
        KeypadState := "7"
    Return
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
Numpad2::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    Send("{Numpad2}")
    If (KeypadState = 9)
        SendInput("{F7}")
        KeypadState := "7"
    Return
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
Numpad3::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    Send("{Numpad3}")
    If (KeypadState = 9)
        SendInput("{F7}")
        KeypadState := "7"
    Return
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
Numpad4::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    Send("{Numpad4}")
    If (KeypadState = 8 or KeypadState = 9)
        SendInput("{F7}")
        KeypadState := "7"
    Return
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
Numpad5::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    Send("{Numpad5}")
    If (KeypadState = 8 or KeypadState = 9)
        SendInput("{F7}")
        KeypadState := "7"
    Return
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
Numpad6::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    Send("{Numpad6}")
    If (KeypadState = 8)
        SendInput("{F7}")
        KeypadState := "7"
    Return
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
Numpad7::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    Send("{Numpad7}")
    If (KeypadState = 8)
        SendInput("{F7}")
        KeypadState := "7"
    Return
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
Numpad8::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    Send("{Numpad8}")
    If (KeypadState = 8)
        SendInput("{F7}")
        KeypadState := "7"
    Return
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
Numpad9::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    Send("{Numpad9}")
    If (KeypadState = 8)
        SendInput("{F7}")
        KeypadState := "7"
    Return
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
NumpadDiv::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    Send("{NumpadDiv}")
    If (KeypadState = 8)
        SendInput("{F7}")
        KeypadState := "7"
    Return
Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
NumpadMult::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
    Send("{NumpadMult}")
    If (KeypadState = 8)
        SendInput("{F7}")
        KeypadState := "7"
    Return
Return
} ; V1toV2: Added Bracket before label
NumpadSub:
    Send("{NumpadSub}")
    If (KeypadState = 8)
        SendInput("{F7}")
        KeypadState := "7"
    Return
Return
/*NumpadAdd:
    Send {NumpadAdd}
Return
NumpadEnter:
    Send {NumpadEnter}
Return
*/

; ----- AUTO COMPLETION ----- ;

; Access the auto completion from these shortcuts
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
        Sleep(5)
        AutocompletionDyn := 1
        Run("ExpandDyn.ahk", , , &CSVDynPID)
    Return

; Sibelius only auto completion    NOT WORKING !!!
} ; V1toV2: Added Bracket before hotkey or Hotstring
    ^Numpad0::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
        SendInput("Numpad0")
        SendInput("b")
} ; V1toV2: Added bracket in the end