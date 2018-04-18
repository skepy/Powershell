Get-ChildItem -Path dir -Recurse |`
foreach{
$Item = $_
$Age = $_.CreationTime
$Path = $_.FullName
$Type = $_.Extension
$Folder = $_.PSIsContainer


$Path | Select-Object `
    @{n="Name";e={$Item}},`
    @{n="Created";e={$Age}},`
    @{n="filePath";e={$Path}},`
    @{n='Permissions';e={$Access.FileSystemRights}},`
    @{n='Inherited';e={$Access.IsInherited}},`
    @{n="Extension";e={if($Folder){"Folder"}else{$Type}}}`
}| Export-Csv dir -NoTypeInformation 