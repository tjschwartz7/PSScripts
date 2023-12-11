#Retrieve all files in Downloads dir
$files = Get-ChildItem ~/Downloads
 
#Foreach file in directory
foreach ($file in $files)
{
    #Delete file
    "Deleting $file"
    Remove-Item "~\Downloads\$file"
}

