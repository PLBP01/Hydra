Set-Location C:\
Write-Host "Pobieranie plików konfiguracyjnych Hydra na podstawie numeru BM" -ForegroundColor Green
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
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

$exb = New-Object System.Windows.Forms.Button
$exb.Location = New-Object System.Drawing.Point(210,130)
$exb.Size = New-Object System.Drawing.Size(75,25)
$exb.Text = 'Zamknij'
$exb.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$testform.AcceptButton = $exb
$testform.Controls.Add($exb)

$lb = New-Object System.Windows.Forms.Label
$lb.Location = New-Object System.Drawing.Point(80,30)
$lb.Size = New-Object System.Drawing.Size(240,20)
$lb.Text = 'Proszę podać numer BM:'
$testform.Controls.Add($lb)

$tb = New-Object System.Windows.Forms.TextBox
$tb.Location = New-Object System.Drawing.Point(70,80)
$tb.Size = New-Object System.Drawing.Size(200,50)
$testform.Controls.Add($tb)

$testform.Topmost = $true
$testform.Add_Shown({$tb.Select()})
$rs = $testform.ShowDialog()
$y=''
if ($rs -eq [System.Windows.Forms.DialogResult]::OK)
  {
 #test2
 
    $y = $tb.Text
    Write-Host "Wpisany nr BM:" -ForegroundColor Green
    Write-Host $y -ForegroundColor Yellow

  }

  $wiersz = Select-String -path "c:\.IT\PowerShell\Nowe_terminale\Lista_BM.csv" $y | Select-Object LineNumber

  Write-host "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX $wiersz" -ForegroundColor Green


  #***************************************************************************************************
  $Lista_BM = Import-Csv "c:\.IT\PowerShell\Nowe_terminale\Lista_BM.csv" -delimiter ";" -Header 'Stanowisko', 'Terminal', 'Pozycja', 'Nazwa'
  
$Terminal =  $Lista_BM[$wiersz.LineNumber-1].Terminal
$Maszyna =  $Lista_BM[$wiersz.LineNumber-1].Stanowisko 

    Write-Host "Przypisany numer terminala: $Terminal" -ForegroundColor Green
    Write-Host $Terminal -ForegroundColor Yellow
    Write-Host "Przypisany numer BM: $Maszyna" -ForegroundColor Green
    Write-Host $Maszyna -ForegroundColor Yellow

    
#Obsługa błędu

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

        function Test-Trap{
        trap {"Niepoprawny wpis"}
        
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#to to coś???

        #if ($Maszyna -NotMatch $y -or($y::isEmpty))
        if ($y = $null -or($y::isEmpty) -or (Maszyna -notmatch $y))
           {
              
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            #Potwierdzenie wykonania
            Add-Type -AssemblyName System.Windows.Forms
            Add-Type -AssemblyName System.Drawing
            $testform5 = New-Object System.Windows.Forms.Form
            $testform5.Text = 'Konfigurator Hydra'
            $testform5.Size = New-Object System.Drawing.Size(350,160)
            $testform5.StartPosition = 'CenterScreen'

            $okb5 = New-Object System.Windows.Forms.Button
            $okb5.Location = New-Object System.Drawing.Point(130,80)
            $okb5.Size = New-Object System.Drawing.Size(75,25)
            $okb5.Text = 'OK'
            $okb5.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
            $testform5.AcceptButton = $okb5
            $testform5.Controls.Add($okb5)

            $lb5 = New-Object System.Windows.Forms.Label
            $lb5.Location = New-Object System.Drawing.Point(50,30)
            $lb5.Size = New-Object System.Drawing.Size(260,20)
            $lb5.Text = 'Wpis niepoprawny lub brak BM na liście.'
            $testform5.Controls.Add($lb5)
            $ts = $testform5.ShowDialog()
            if ($ts -ceq[System.Windows.Forms.DialogResult]::Cancel)
            {
              Write-Host "Wpis niepoprawny lub brak BM na liście." -ForegroundColor Green
                         
            
            
              $Form_Cleanup_FormClosed
              break
              
              
        }
      } 
      
          Test-Trap
    }

      #koniec obłsugi błędu  
      #xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


                #kopiowanie plików z folderu
              copy-item -Path a:\Baza_danych_terminali\$Terminal\* -Destination c:\.IT\PowerShell\Nowe_terminale\TEST_Kopiowania\ -force
              function Test-trap2 {
                trap{""}

                
              }

                Write-Host "Kopiowanie plików konfiguracyjnych Hydra zakończone" -ForegroundColor Green
    {
      $Form_Cleanup_FormClosed
    
    }

    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing
    $testform2 = New-Object System.Windows.Forms.Form
    $testform2.Text = 'Konfigurator Hydra'
    $testform2.Size = New-Object System.Drawing.Size(350,160)
    $testform2.StartPosition = 'CenterScreen'

    $okb2 = New-Object System.Windows.Forms.Button
    $okb2.Location = New-Object System.Drawing.Point(50,80)
    $okb2.Size = New-Object System.Drawing.Size(75,25)
    $okb2.Text = 'TAK'
    $okb2.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $testform2.AcceptButton = $okb2
    $testform2.Controls.Add($okb2)

    $test2 = New-Object System.Windows.Forms.Button
    $test2.Location = New-Object System.Drawing.Point(210,80)
    $test2.Size = New-Object System.Drawing.Size(75,25)
    $test2.Text = 'NIE'
    $test2.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
    $testform2.AcceptButton = $test2
    $testform2.Controls.Add($test2)

    $lb2 = New-Object System.Windows.Forms.Label
    $lb2.Location = New-Object System.Drawing.Point(50,30)
    $lb2.Size = New-Object System.Drawing.Size(260,20)
    $lb2.Text = 'Czy dodać zmienną środowiskową HYPORT?'
    $testform2.Controls.Add($lb2)

    $ts = $testform2.ShowDialog()

if ($ts -ceq[System.Windows.Forms.DialogResult]::Cancel)
{
  Write-Host "Zmienna środowiskowa HYPORT nie została dodana." -ForegroundColor Green

  $Form_Cleanup_FormClosed

  #Potwierdzenie wykonania
  Add-Type -AssemblyName System.Windows.Forms
  Add-Type -AssemblyName System.Drawing
  $testform3 = New-Object System.Windows.Forms.Form
  $testform3.Text = 'Konfigurator Hydra'
  $testform3.Size = New-Object System.Drawing.Size(350,160)
  $testform3.StartPosition = 'CenterScreen'

  $okb3 = New-Object System.Windows.Forms.Button
  $okb3.Location = New-Object System.Drawing.Point(130,80)
  $okb3.Size = New-Object System.Drawing.Size(75,25)
  $okb3.Text = 'OK'
  $okb3.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
  $testform3.AcceptButton = $okb3
  $testform3.Controls.Add($okb3)

  $lb3 = New-Object System.Windows.Forms.Label
  $lb3.Location = New-Object System.Drawing.Point(40,30)
  $lb3.Size = New-Object System.Drawing.Size(280,20)
  $lb3.Text = 'Zmienna środowiskowa HYPORT nie została dodana.'
  $testform3.Controls.Add($lb3)
  $ts = $testform3.ShowDialog()

  $Form_Cleanup_FormClosed
}



  if ($ts -eq[System.Windows.Forms.DialogResult]::OK)
{
  setx HYPORT "11000" /M
  #Get-NetAdapter -InformationVariable
  Write-Host "Zmienna środowiskowa HYPORT została dodana." -ForegroundColor Green


  $Form_Cleanup_FormClosed

  #Potwierdzenie wykonania
  Add-Type -AssemblyName System.Windows.Forms
  Add-Type -AssemblyName System.Drawing
  $testform4 = New-Object System.Windows.Forms.Form
  $testform4.Text = 'Konfigurator Hydra'
  $testform4.Size = New-Object System.Drawing.Size(350,160)
  $testform4.StartPosition = 'CenterScreen'

  $okb4 = New-Object System.Windows.Forms.Button
  $okb4.Location = New-Object System.Drawing.Point(130,80)
  $okb4.Size = New-Object System.Drawing.Size(75,25)
  $okb4.Text = 'OK'
  $okb4.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
  $testform4.AcceptButton = $okb4
  $testform4.Controls.Add($okb4)

  $lb4 = New-Object System.Windows.Forms.Label
  $lb4.Location = New-Object System.Drawing.Point(50,30)
  $lb4.Size = New-Object System.Drawing.Size(260,20)
  $lb4.Text = 'Zmienna środowiskowa HYPORT została dodana.'
  $testform4.Controls.Add($lb4)
  $ts = $testform4.ShowDialog()

  $Form_Cleanup_FormClosed
}
