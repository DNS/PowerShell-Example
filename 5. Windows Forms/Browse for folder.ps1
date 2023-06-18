$shell = New-Object -ComObject Shell.Application

$selectedfolder = $shell.BrowseForFolder( 0, 'Select a folder to proceed', 16, $shell.NameSpace( 17 ).Self.Path ).Self.Path