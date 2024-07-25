#Requires AutoHotkey v2.0

#Include <File>
#Include <Array>

; Load the CSV file (adjust the path as needed)
csvFile := "path/to/your/csv/file.csv"
FileRead, csvContent, %csvFile%

; Split the CSV content into an array of lines
StringSplit, csvLines, csvContent, `n

; Create an associative array to store shortcuts and expansions
shortcuts := {}

; Parse each line of the CSV
for index, line in csvLines
{
    ; Split the line into columns (assuming comma-separated values)
    StringSplit, columns, line, `,
    
    ; Assuming the CSV has two columns: shortcut and expansion
    if (columns.Length() >= 2)
    {
        shortcut := Trim(columns[1])
        expansion := Trim(columns[2])
        shortcuts[shortcut] := expansion
    }
}

; Define a hotkey to trigger the text expansion
::btw:: ; Replace "btw" with your desired shortcut
{
    SendInput % shortcuts["btw"]
}

; Repeat the above block for other shortcuts as needed

return
