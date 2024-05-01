local app=DoApp.DoApp()
app:doCommand([[Window.SwitchMode?WindowMode=kEngraveMode]])
app:doCommand([[UI.InvokePropertyChangeValue?Type=kDynamicErasure&Value=null: ]])
app:doCommand([[Window.SwitchMode?WindowMode=kWriteMode]])
