/*
Nelson MALLEUS AHK assistant for Sibelius
Works with Nelson's custom keycommands
!!! indicates passages that need to be optimized, updated, corrected or created.
 - Initialization
 - Global commands
 - Going back to F7 after...
 - Auto completion
*/

/*
Initialization
*/

#SingleInstance, Force
#Persistent
#NoEnv
;#If WinActive("ahk_exe sibelius.exe")
KeypadState := 7
AutoCompletion := 0

/*
Global commands
*/

Esc::
    SendInput, {Esc}
    AutoCompletion := 0
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

/*
Going back to F7 after:
 - writting tremolos
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
    If (KeypadState = 9)
        SendInput, {F7}
        KeypadState = 7
    Return
Return
Numpad5::
    Send {Numpad5}
    If (KeypadState = 9)
        SendInput, {F7}
        KeypadState = 7
    Return
Return

/*
Auto completion
*/

; Access the auto completion from these shortcuts
    :*c:X::
        SendInput, X{Left}{Right}
        AutoCompletion := 1
    Return
    :*c:W::
        SendInput, W{Left}{Right}
        AutoCompletion := 1
    Return
    :*c:D::
        SendInput, D{Left}{Right}
        AutoCompletion := 1
    Return
    
; !!! link the auto completion to a dictionnary ?
; global vocaulary
    :*:sem::
        If (Autocompletion = 1)
            SendInput, sempre
        Else
            SendInput, sem
    Return 


; playing techniques
    :*:bar::
        If (Autocompletion = 1)
            SendInput, bartók pizz.
        Else
            SendInput, bar
    Return 
    :*:sts::
        If (Autocompletion = 1)
            SendInput, staccatissimo
        Else
            SendInput, sts
    Return 

; expressions
    :*:esp::
        If (Autocompletion = 1)
            SendInput, espressivo
        Else
            SendInput, esp
    Return 