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

#NoEnv
#SingleInstance, Force
#Persistent
#If WinActive("ahk_exe sibelius.exe")

SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

KeypadState := 7
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

LButton::
    SendInput, {LButton}
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

F7::
    SendInput, {F7}
    KeypadState := 7
Return
F8::
    SendInput, {F8}
    KeypadState := 8
Return
F9::
    SendInput, {F9}
    KeypadState := 9
Return
+r::
    SendInput, R
    KeypadState := 9
Return
F10::
    SendInput, {F10}
    KeypadState := 10
Return
F11::
    SendInput, {F11}
    KeypadState := 11
Return
F12::
    SendInput, {F12}
    KeypadState := 12
Return
^F8::   ; faking Keypad state to stay on this panel
    SendInput, {F8}
    KeypadState := 7
Return
^F9::
    SendInput, {F9}
    KeypadState := 7
Return
^+r::
    SendInput, R
    KeypadState := 7
Return
^F10::
    SendInput, {F10}
    KeypadState := 7
Return
^F11::
    SendInput, {F11}
    KeypadState := 7
Return
^F12::
    SendInput, {F12}
    KeypadState := 7
Return


; ----- GOING BACK TO F7 AFTER... ----- ;
/* - writting tremolos
- !!! think about more usefull Keypad resets
Use Ctrl+F8/F9/F10/F11/F12 or Ctrl+Shift+R to stay longer in this keypad
*/

Numpad1::
    Send {Numpad1}
    If (KeypadState = 9)
        SendInput, {F7}
        KeypadState = 7
    Return
Return
Numpad2::
    Send {Numpad2}
    If (KeypadState = 9)
        SendInput, {F7}
        KeypadState = 7
    Return
Return
Numpad3::
    Send {Numpad3}
    If (KeypadState = 9)
        SendInput, {F7}
        KeypadState = 7
    Return
Return
Numpad4::
    Send {Numpad4}
    If (KeypadState = 8 or KeypadState = 9)
        SendInput, {F7}
        KeypadState = 7
    Return
Return
Numpad5::
    Send {Numpad5}
    If (KeypadState = 8 or KeypadState = 9)
        SendInput, {F7}
        KeypadState = 7
    Return
Return
Numpad6::
    Send {Numpad6}
    If (KeypadState = 8)
        SendInput, {F7}
        KeypadState = 7
    Return
Return
Numpad7::
    Send {Numpad7}
    If (KeypadState = 8)
        SendInput, {F7}
        KeypadState = 7
    Return
Return
Numpad8::
    Send {Numpad8}
    If (KeypadState = 8)
        SendInput, {F7}
        KeypadState = 7
    Return
Return
Numpad9::
    Send {Numpad9}
    If (KeypadState = 8)
        SendInput, {F7}
        KeypadState = 7
    Return
Return
NumpadDiv::
    Send {NumpadDiv}
    If (KeypadState = 8)
        SendInput, {F7}
        KeypadState = 7
    Return
Return
NumpadMult::
    Send {NumpadMult}
    If (KeypadState = 8)
        SendInput, {F7}
        KeypadState = 7
    Return
Return
NumpadSub:
    Send {NumpadSub}
    If (KeypadState = 8)
        SendInput, {F7}
        KeypadState = 7
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