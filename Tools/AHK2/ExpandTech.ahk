; REMOVED: #NoEnv
#SingleInstance Force
#NoTrayIcon
SendMode("Input")
; REMOVED: SetBatchLines, -1
SetWorkingDir(A_ScriptDir)

TechExpanderDictionaryContents := Fileread("ExpandTech.csv", "P65001, `n")     ;*P65001 to UTF-8, *t to ignore carriage return
start   := InStr(TechExpanderDictionaryContents, "`n") + 1
pattern := "ms)(*ANYCRLF)(?<Hot>[^,\n]+),(?<Rep>[^,`"\n]+|`"(?<RepInner>([^`"]|(?<=\\)`")+)`")"

While ( pos := RegExMatch(TechExpanderDictionaryContents, pattern, &m, (start)<1 ? (start)-1 : (start)) )
{
	start := pos + StrLen((m&&m[0])) + 1
	
	hot := ":*:" . mHot
	rep := mRep
	
	If ( SubStr(rep, 1, 1) == """" and mRepInner != "" )
		rep := mRepInner
	
	rep := StrReplace(rep, "\`"", "`"")
	fn  := ReplaceText.Bind(rep)
	
	Hotstring(hot, fn)
}

Return

ReplaceText(replacement)
{
	oldClip := A_Clipboard
	
	A_Clipboard := ""
	A_Clipboard := replacement
	Errorlevel := !ClipWait()

	Sleep(5) ; New, testing to avoid too fast pasting with outdated content

	SendInput("^v")
	
	; We have to wait for the app to paste, as in my test, Notepad was too slow and pasted this oldClip contents
	Sleep(100)
	A_Clipboard := oldClip
	oldClip := ""
}

Return