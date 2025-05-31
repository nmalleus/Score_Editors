local app=DoApp.DoApp()
app:doCommand([[Window.ShowWriteModePanel?SectionedPanelType=kKeySignaturesPanel]])
app:doCommand([[NoteInput.CreateKeySignature]])
app:doCommand([[NoteInput.CreateKeySignature?Definition=atonal&UseLocalOverride=0]])
