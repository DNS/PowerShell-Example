#$w = [System.Windows.Forms.Form]::new()

$w = [System.Windows.Forms.Form] @{
    Text = 'Window Title'
    Width = 500
    Height = 500
}



$b = [System.Windows.Forms.WebBrowser]::new()
$b.IsWebBrowserContextMenuEnabled = $true
$b.ScriptErrorsSuppressed = $true
$b.Dock = 'Fill'

# relative paths don't work in the WebBrowser.
# use $PSCommandPath  or  $Script:MyInvocation.InvocationName
$b.URL = 'https://whatmyuseragent.com/'



$w.Controls.Add($b)
$w.ShowDialog()

