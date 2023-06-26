Add-Type -AssemblyName System.Windows.Forms;

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
#$b.URL = 'http://localhost/'
#$b.URL = 'file:///D:\SANDBOX\PowerShell\PowerShell Example\5. Windows Forms\test.html'

$filepath = Split-Path $PSCommandPath -Parent
$b.URL = "file:///$filepath\click button.html"
$filepath


$w.Controls.Add($b)
$w.ShowDialog()

