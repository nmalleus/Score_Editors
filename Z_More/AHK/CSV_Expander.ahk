#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

FileRead, ExpanderDictionaryContents, *P65001, *t Expander_Dictionary.csv     ;*P65001 to UTF-8, *t to ignore carriage return
start   := InStr(ExpanderDictionaryContents, "`n") + 1
pattern := "ms)(*ANYCRLF)(?<Hot>[^,\n]+),(?<Rep>[^,""\n]+|""(?<RepInner>([^""]|(?<=\\)"")+)"")"

While ( pos := RegExMatch(ExpanderDictionaryContents, pattern, m, start) )
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