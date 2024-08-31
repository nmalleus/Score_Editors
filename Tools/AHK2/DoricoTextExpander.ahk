#Requires AutoHotkey v2.0
#SingleInstance Force

#HotIf WinActive("ahk_exe dorico5.exe")

+d::Expand("Dyn") SendInput("D")
+x::Expand("Tech") SendInput("X")
+t::Expand("Sign") SendInput("T")
#HotIf

Expand(WhichText)
{	Static IH := InputHook("V L0 I", "{Esc}")
	If (IH.InProgress)
		IH.Stop()
	IH.OnChar := OnChar
	IH.Start()
	Hotkey "~LButton", MouseEnd, "On"

	OnChar(IH, Char)
	{	Static InputBuffer := ""
		; Circular buffer with a max length
		InputBuffer := (StrLen(InputBuffer) > 64 ? SubStr(InputBuffer, 2) : InputBuffer) . Char
		For Definition in LoadDefinitions("Expand" WhichText ".csv")
		{
			If InStr(InputBuffer, Definition[1])
			{
				; Arrange the text send
				SetTimer SendHS.Bind(Definition*), -1
				; Clear the input buffer
				InputBuffer := ""
				Break
			}
		}
	}
	LoadDefinitions(File) {
		Static sCache := Map(), aCache := Map()
		sDefinitions := FileRead(File, "`n UTF-8")
		; Cache system which compares the string first
		If !(sCache.Has(File) && sCache.Get(File) == sDefinitions)
		{
			sCache.Set(File, sDefinitions)
			aDefinitions := StrSplit(sDefinitions, "`n")
			aDefinitions.RemoveAt(1) ; Skip header
			Definitions := []
			For Definition in aDefinitions
				Definitions.Push(StrSplit(Definition, ","))
			aCache[File] := Definitions
		}
		Return aCache[File]
	}
	SendHS(String, Replacement) {
		SendInput("{BackSpace " StrLen(String) "}")
		SendText(Replacement)
	}
	MouseEnd(*) {
		IH.Stop()
		Hotkey "LButton", %A_ThisFunc%, "Off"
	}
}
