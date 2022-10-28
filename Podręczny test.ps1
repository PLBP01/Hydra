#Add-Type -AssemblyName System.Windows.Forms
#Add-Type -AssemblyName System.Drawing
$testform = New-Object System.Windows.Forms.Form
$testform.Text = 'Konfigurator Hydra'
$testform.Size = New-Object System.Drawing.Size(350,250)
$testform.StartPosition = 'CenterScreen'

$okb = New-Object System.Windows.Forms.Button
$okb.Location = New-Object System.Drawing.Point(50,130)
$okb.Size = New-Object System.Drawing.Size(75,25)
$okb.Text = 'Dodaj'
$okb.DialogResult = [System.Windows.Forms.DialogResult]::OK
$testform.AcceptButton = $okb
$testform.Controls.Add($okb)

$test = New-Object System.Windows.Forms.Button
$test.Location = New-Object System.Drawing.Point(210,130)
$test.Size = New-Object System.Drawing.Size(75,25)
$test.Text = 'Zamknij'
$test.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$testform.AcceptButton = $test
$testform.Controls.Add($test)

$lb = New-Object System.Windows.Forms.Label
$lb.Location = New-Object System.Drawing.Point(80,30)
$lb.Size = New-Object System.Drawing.Size(200,40)
$lb.Text = 'Czy dodać HYPORT do zmiennych środowiskowych?'
$testform.Controls.Add($lb)

Write-Host "Czy dodać HYPORT do zmiennych środowiskowych?" -ForegroundColor Green

#Dodanie Hyport do zmiennych srodowiskowych

setx HYPORT "11000" /M
Get-NetAdapter -InformationVariable





Write-Host "Hyport dodany do zmiennych srodowiskowych. -ForegroundColor Green




$okb = New-Object System.Windows.Forms.Button
$okb.Location = New-Object System.Drawing.Point(50,130)
$okb.Size = New-Object System.Drawing.Size(75,25)
$okb.Text = 'Dodaj'
$okb.DialogResult = [System.Windows.Forms.DialogResult]::OK
$testform.AcceptButton = $okb
$testform.Controls.Add($okb)

$test = New-Object System.Windows.Forms.Button
$test.Location = New-Object System.Drawing.Point(210,130)
$test.Size = New-Object System.Drawing.Size(75,25)
$test.Text = 'Zamknij'
$test.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$testform.AcceptButton = $test
$testform.Controls.Add($test)

$lb = New-Object System.Windows.Forms.Label
$lb.Location = New-Object System.Drawing.Point(80,30)
$lb.Size = New-Object System.Drawing.Size(200,40)
$lb.Text = 'Czy dodać HYPORT2 do zmiennych środowiskowych?'
$testform.Controls.Add($lb)

Write-Host "Czy dodać HYPORT2 do zmiennych środowiskowych?" -ForegroundColor Green

