<#
.SYNOPSIS
A random cat fact generator utilizing the Cat Fact API at https://catfact.ninja/
 
.DESCRIPTION
Promptes user for a simple input, Y for more facts, N to exit the program

.NOTES
Author: Christian Belarde 
Version 1.0+
Production Began Dec 4, 2023 
#>

$url = "https://catfact.ninja/fact?max_length=140"
Clear-Host
Write-Host "Welcome to Cat Facts!"
function generateFact() {
    Write-Host ""
    Start-Sleep -Seconds 1
    $q1 = Read-Host "Generate Cat Fact? [Y/N]"
        if ($q1 -eq "Y" -or $q1 -eq "y" ) {
            Clear-Host
            Invoke-RestMethod -Uri $url -Method Get
            Start-Sleep -Seconds 1
            Write-Host ""
            generateFact 
        } else {
            Write-Host "Thanks you for using Cat Facts! Goodbye"
            Start-Sleep -Seconds 1
            exit
        }   
}
generateFact

