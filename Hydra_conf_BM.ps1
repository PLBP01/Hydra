#Get-Content "c:\.IT\PowerShell\Nowe terminale\Lista_BM.txt"
Write-host "Pobieranie plików konfiguracyjnych Hydra na podstawie numeru BM" -ForegroundColor Green
$BM= Read-host -Prompt "Wpisz numer BM maszyny"
