param ($Path = $NULL, $Extension = $NULL)

if ($Path -ne $NULL -and $Extension -ne $NULL)
{
    if (Test-Path $Path)
    {
        $Target = $Path + "\*." + $Extension

        Write-Host "Pruning " $Target

        Get-ChildItem -Path $Target -Recurse $Folder -Force -ea 0 | ? {!$_.PsIsContainer -and $_.LastWriteTime -lt (Get-Date).AddDays(-90)} | Remove-Item
    }
}

# Usage:

# PowerShell -ExecutionPolicy Bypass "C:\Prune.ps1" "C:\Path" "extension"
