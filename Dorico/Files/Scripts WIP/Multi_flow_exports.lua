local app=DoApp.DoApp()

-- the choice between "Printer" and "Graphics" does not seem possible through macro, we goth these same two lines in any cases:

-- app:doCommand([[Print.RemovePrintLayoutRendererInternal]])
-- app:doCommand([[Print.AddPrintLayoutRendererInternal]])

-- exact same issue clicking on All / Pages / Flows
-- exact same issue clicking in flow selection with "Select None" then "Flow 1"

-- it looks like all properties are set while clicking the export button