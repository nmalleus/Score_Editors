/*
Nelson MALLEUS AHK assistant for Dorico & Sibelius
Works with Nelson's custom keycommands
*/
#NoEnv
#SingleInstance, Force

/*
Going back to F7 after writting tremolos
*/

If A_PriorKey = "R"
    Numpad1::
        Send {Numpad1}
    If WinActive("ahk_exe sibelius.exe")
        Send {F7}
Return
#If, A_PriorKey = "R"
    Numpad2::
        Send {Numpad2}
    If WinActive("ahk_exe sibelius.exe")
        Send {F7}
Return
#If, A_PriorKey = "R"
    Numpad3::
        Send {Numpad3}
    If WinActive("ahk_exe sibelius.exe")
        Send {F7}
Return
#If, A_PriorKey = "R"
    Numpad4::
        Send {Numpad4}
    If WinActive("ahk_exe sibelius.exe")
        Send {F7}
Return
#If, A_PriorKey = "R"
    Numpad5::
        Send {Numpad5}
    If WinActive("ahk_exe sibelius.exe")
        Send {F7}
Return

#If, A_PriorKey = "F9"
    Numpad1::
        Send {Numpad1}
    If WinActive("ahk_exe sibelius.exe")
        Send {F7}
Return
#If, A_PriorKey = "F9"
    Numpad2::
        Send {Numpad2}
    If WinActive("ahk_exe sibelius.exe")
        Send {F7}
Return
#If, A_PriorKey = "F9"
    Numpad3::
        Send {Numpad3}
    If WinActive("ahk_exe sibelius.exe")
        Send {F7}
Return
#If, A_PriorKey = "F9"
    Numpad4::
        Send {Numpad4}
    If WinActive("ahk_exe sibelius.exe")
        Send {F7}
Return
#If, A_PriorKey = "F9"
    Numpad5::
        Send {Numpad5}
    If WinActive("ahk_exe sibelius.exe")
        Send {F7}
Return


/*
If F9 or Shift+R (no Shift+X no Shift+D, better not text at all)
Shift + R : +R
Numpad0
    Leave F7, F8, F10, F11, F12
    Case num1, 2, 3, 4, 5
*/


/*
Auto completion
!!! Add condition with Shift + X or Shift + D before completion and leave after escape or clic
*/

; global vocaulary
    :*:sem::
        Send % "sempre "
    return


; playing techniques
    :*:bar::bartók pizz.
    :*:sts::staccatissimo

; expressions
    :*:esp::espressivo

