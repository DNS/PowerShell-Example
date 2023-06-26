Add-Type -AssemblyName System.Windows.Forms;

<#
$w = [System.Windows.Forms.Form]::new()
$w.Text = 'Window Title'
$w.Width = 500
$w.Height = 500
#>


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
$filepath
$b.URL = "file:///$filepath/test.html"
#$b.URL = "file:///$filepath/browsers.html"



$w.Controls.Add($b)
$w.ShowDialog()

