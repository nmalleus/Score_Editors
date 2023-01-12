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

; Auto completion initialization

FileRead, DynExpanderDictionaryContents, *P65001, *t ExpandDyn.csv     ;*P65001 to UTF-8, *t to ignore carriage return
start   := InStr(DynExpanderDictionaryContents, "`n") + 1
pattern := "ms)(*ANYCRLF)(?<Hot>[^,\n]+),(?<Rep>[^,""\n]+|""(?<RepInner>([^""]|(?<=\\)"")+)"")"

While ( pos := RegExMatch(DynExpanderDictionaryContents, pattern, m, start) )
{
	start := pos + StrLen(m) + 1
	
	hot := ":*:" . mHot
	rep := mRep
	
	If ( SubStr(rep, 1, 1) == """" and mRepInner != "" )
		rep := mRepInner
	
    rep := StrReplace(rep, "\""", """")
	fn  := Func("ReplaceText").Bind(rep)
	
    Hotstring(hot, fn)
}
Return
ReplaceText(replacement)
{
    oldClip := Clipboard
	
	Clipboard := ""
	Clipboard := replacement
	ClipWait
	
	SendInput, ^v
	
	; We have to wait for the app to paste, as in my test, Notepad was too slow and pasted this oldClip contents
	Sleep, 100
	Clipboard := oldClip
	oldClip := ""
}
Return


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
    Return
    :*c:W::
        SendInput, W{Left}{Right}
        AutoCompletion := 1
    Return
    :*c:D::
        SendInput, D{Left}{Right}
    Return


