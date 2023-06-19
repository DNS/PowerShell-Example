Add-Type -assembly System.Windows.Forms

cls

#$main_form = New-Object System.Windows.Forms.Form
$main_form = [System.Windows.Forms.Form]::new()

$main_form.Text ='GUI for my PoSh script'
$main_form.Width = 600
$main_form.Height = 400
$main_form.AutoSize = $true

$Label = New-Object System.Windows.Forms.Label
$Label.Text = "AD users"
$Label.Location  = New-Object System.Drawing.Point(0,10)
$Label.AutoSize = $true
$main_form.Controls.Add($Label)

$ComboBox = New-Object System.Windows.Forms.ComboBox
$ComboBox.Width = 300
#$ComboBox.Location  = New-Object System.Drawing.Point(60,10)
$ComboBox.Left = 60
$ComboBox.Top = 10
$ComboBox.Items.AddRange(@('zz','yy'))
$ComboBox.Items.Add('aaa') > $null
$ComboBox.Items.Add('bbb') > $null
$ComboBox.Items.Add('ccc') > $null
$main_form.Controls.Add($ComboBox)

$Label2 = New-Object System.Windows.Forms.Label
$Label2.Text = "Last Password Set:"
$Label2.Location  = New-Object System.Drawing.Point(0,40)
$Label2.AutoSize = $true
$main_form.Controls.Add($Label2)

$Label3 = New-Object System.Windows.Forms.Label
$Label3.Text = "Label3"
$Label3.Location  = New-Object System.Drawing.Point(110,40)
$Label3.AutoSize = $true
$main_form.Controls.Add($Label3)

$Button = New-Object System.Windows.Forms.Button
#$Button = [System.Windows.Forms.Button]::new()
$Button.Location = New-Object System.Drawing.Size(400,10)
$Button.Size = New-Object System.Drawing.Size(120,23)
$Button.Text = "Check"
$main_form.Controls.Add($Button)

$Button.Add_Click({
    $Label3.Text = 'CLICKED !!!'
    $Label3.Visible = $true
    [void] [System.Windows.MessageBox]::Show( "All changes have been implemented successfully ", "Script completed", "OK", "Information" )
    $answer = [System.Windows.MessageBox]::Show( "Dou you want to remove this user?", " Removal Confirmation", "YesNoCancel", "Warning" )


})


$main_form.ShowDialog() > $null

#$main_form.Hide()
#$main_form.Show()  # not working?


#Start-Sleep 2
