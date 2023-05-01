local app=DoApp.DoApp()
app:doCommand([[Window.SwitchMode?WindowMode=kEngraveMode]])
app:doCommand([[UI.InvokePropertyChangeValue?Type=kTextErasure&Value=null: ]])
app:doCommand([[Window.SwitchMode?WindowMode=kWriteMode]])