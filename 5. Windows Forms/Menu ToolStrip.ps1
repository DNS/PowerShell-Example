Add-Type -assembly System.Windows.Forms

Clear-Host

$main_form = [System.Windows.Forms.Form]::new()

$menuMain         = New-Object System.Windows.Forms.MenuStrip
$mainToolStrip    = New-Object System.Windows.Forms.ToolStrip
$menuFile         = New-Object System.Windows.Forms.ToolStripMenuItem
$menuOpen         = New-Object System.Windows.Forms.ToolStripMenuItem
$menuSave         = New-Object System.Windows.Forms.ToolStripMenuItem
$menuExit = New-Object System.Windows.Forms.ToolStripMenuItem
$menuHelp         = New-Object System.Windows.Forms.ToolStripMenuItem
$menuAbout        = New-Object System.Windows.Forms.ToolStripMenuItem
$toolStripOpen    = New-Object System.Windows.Forms.ToolStripButton
$toolStripSave    = New-Object System.Windows.Forms.ToolStripButton
$toolStripExit = New-Object System.Windows.Forms.ToolStripButton
$toolStripAbout = New-Object System.Windows.Forms.ToolStripButton

$main_form.MainMenuStrip = $menuMain
$main_form.Controls.Add($menuMain)
[void]$main_form.Controls.Add($mainToolStrip)

# Show Menu Bar
[void]$main_form.Controls.Add($menuMain)

# Menu: File
$menuFile.Text = "&File"
[void]$menuMain.Items.Add($menuFile)

# Menu: File -> Open
$menuOpen.Text         = "&Open"
$menuOpen.Add_Click({OpenFile})
[void]$menuFile.DropDownItems.Add($menuOpen)
$menuOpen.ShortcutKeyDisplayString = "Ctrl+O"
$menuOpen.ShortcutKeys = [System.Windows.Forms.Keys]::Control + [System.Windows.Forms.Keys]::O

# Menu: File -> Save
$menuSave.Text         = "&Save"
#$menuSave.Add_Click({SaveFile})
$menuSave.Checked = $true
[void]$menuFile.DropDownItems.Add($menuSave)
$menuSave.ShortcutKeyDisplayString = "Ctrl+S"
$menuSave.ShortcutKeys = [System.Windows.Forms.Keys]::Control + [System.Windows.Forms.Keys]::S


# Menu: File -> Exit
$menuExit.Text         = "E&xit"
$menuExit.Add_Click({$main_Form.Close()})
[void]$menuFile.DropDownItems.Add($menuExit)

# Menu: Help
$menuHelp.Text      = "Hel&p"
[void]$menuMain.Items.Add($menuHelp)

# Menu: Help -> About
$menuAbout.Text      = "About"
$menuAbout.Add_Click({ShowAbout})
[void]$menuHelp.DropDownItems.Add($menuAbout)

function ShowAbout {
    [void] [System.Windows.MessageBox]::Show( "My simple PowerShell GUI script with dialog elements and menus v1.0", "About script", "OK", "Information" )
}

function OpenFile {
    $initialDirectory = [Environment]::GetFolderPath('Desktop')
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.InitialDirectory = $initialDirectory
    $OpenFileDialog.Filter = 'Text Files (*.ps1;*.cmd;*.bat;*.txt)|*.ps1;*.bat;*.cmd;*.txt'
    $OpenFileDialog.Multiselect = $false
    $response = $OpenFileDialog.ShowDialog( ) # $response can return OK or Cancel
    if ( $response -eq 'OK' ) { Write-Host 'You selected the file:' $OpenFileDialog.FileName }

}


$main_form.ShowDialog() > $null
