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


<# Broken Block
Clear-Host
Write-Host "Welcome to Cat Facts!"
function generateFact() {
    Write-Host ""
    Start-Sleep -Seconds 1
    $q1 = Read-Host "Generate Cat Fact? [Y/N]"
        if ($q1 -eq "Y" -or $q1 -eq "y" ) {
            Clear-Host
            $factList = @(Invoke-RestMethod -Uri $url -Method Get)
            Write-Host $factList[0]
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
Write-Host $factList
#>
$url = "https://catfact.ninja/fact"
Write-Host "Welcome to Cat Facts!"
Start-sleep -Seconds 1

function generateFact() {
    Write-Host ""
    $q = Read-Host "Generate Cat Fact? [Y / N]".ToLower()
    if ($q -eq "y") {
        Clear-Host
        Start-Sleep -Milliseconds 500
        $newFact = Invoke-RestMethod -Uri $url -Method Get
        $newFactClean = $newFact | Out-String
        Write-Host `n $newFactClean
        Write-Host ""
    } else {
        Write-Host "Thanks for using Cat Facts! Goodbye"
        Start-Sleep -Seconds 1
        exit
    }
     generateFact
}
generateFact