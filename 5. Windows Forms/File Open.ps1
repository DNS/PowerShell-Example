Add-Type -assembly System.Windows.Forms

$initialDirectory = [Environment]::GetFolderPath('Desktop')
$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.InitialDirectory = $initialDirectory
$OpenFileDialog.Filter = 'Script files (*.ps1;*.cmd;*.bat)|*.ps1;*.bat;*.cmd'
$OpenFileDialog.Multiselect = $false
$response = $OpenFileDialog.ShowDialog( ) # $response can return OK or Cancel
if ( $response -eq 'OK' ) { Write-Host 'You selected the file:' $OpenFileDialog.FileName }
