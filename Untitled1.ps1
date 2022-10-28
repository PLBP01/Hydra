Write-Host "Pobieranie plików konfiguracyjnych Hydra na podstawie numeru BM" -ForegroundColor Green
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$testform = New-Object System.Windows.Forms.Form
$testform.Text = 'Data Entry Form'
$testform.Size = New-Object System.Drawing.Size(400,300)
$testform.StartPosition = 'CenterScreen'
$okb = New-Object System.Windows.Forms.Button
$okb.Location = New-Object System.Drawing.Point(85,130)
$okb.Size = New-Object System.Drawing.Size(75,25)
$okb.Text = 'Add'
$okb.DialogResult = [System.Windows.Forms.DialogResult]::OK
$testform.AcceptButton = $okb
$testform.Controls.Add($okb)
$cb = New-Object System.Windows.Forms.Button
$cb.Location = New-Object System.Drawing.Point(170,130)
$cb.Size = New-Object System.Drawing.Size(75,25)
$cb.Text = 'Remove'
$cb.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$testform.CancelButton = $cb
$testform.Controls.Add($cb)
$test = New-Object System.Windows.Forms.Button
$test.Location = New-Object System.Drawing.Point(270,130)
$test.Size = New-Object System.Drawing.Size(75,25)
$test.Text = 'close'
$test.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$testform.AcceptButton = $test
$testform.Controls.Add($test)
$lb = New-Object System.Windows.Forms.Label
$lb.Location = New-Object System.Drawing.Point(20,40)
$lb.Size = New-Object System.Drawing.Size(240,20)
$lb.Text = 'Proszę podać numer BM:'
$testform.Controls.Add($lb)
$tb = New-Object System.Windows.Forms.TextBox
$tb.Location = New-Object System.Drawing.Point(40,80)
$tb.Size = New-Object System.Drawing.Size(240,20)
$testform.Controls.Add($tb)
$testform.Topmost = $true
$testform.Add_Shown({$tb.Select()})
$rs = $testform.ShowDialog()
if ($rs -eq [System.Windows.Forms.DialogResult]::OK)
{
$y = $tb.Text
Write-Host "Wpisany nr BM:" -ForegroundColor Green
$y
}