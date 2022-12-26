#SingleInstance Force
#Persistent
#NoEnv

#Hotstring, If, WinActive("ahk_exe notepad.exe")

FileRead, fileContents, *P65001 hotstrings.csv

start   := InStr(fileContents, "`n") + 1
pattern := "ms)(*ANYCRLF)(?<Hot>[^,\n]+),(?<Rep>[^,""\n]+|""(?<RepInner>([^""]|(?<=\\)"")+)"")"

While ( pos := RegExMatch(fileContents, pattern, m, start) )
{
	start := pos + StrLen(m) + 1
	
	hot := "::" . mHot
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
}

#If WinActive("ahk_exe notepad.exe")
