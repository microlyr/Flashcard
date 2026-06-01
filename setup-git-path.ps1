Write-Host "=== 配置 Git 到系统 PATH ==="

# Find git.exe
$found = $null
$searchPaths = @(
    "D:\download\Git\bin\git.exe",
    "D:\download\Git\cmd\git.exe"
)
foreach ($p in $searchPaths) {
    if (Test-Path $p) {
        $found = $p
        Write-Host "FOUND: $p"
        & $p --version
        break
    }
}

if (-not $found) {
    Write-Host "ERROR: git.exe not found in expected locations"
    # Broader search as fallback
    Get-ChildItem "D:\download\Git" -Recurse -Filter "git.exe" -Depth 2 -ErrorAction SilentlyContinue | ForEach-Object {
        Write-Host "FOUND: " $_.FullName
    }
    exit 1
}

$gitBinDir = Split-Path $found -Parent
Write-Host ""
Write-Host "Git binary directory: $gitBinDir"

# Check if already in PATH
$currentUserPath = [Environment]::GetEnvironmentVariable("Path", "User")
$currentMachinePath = [Environment]::GetEnvironmentVariable("Path", "Machine")

if ($currentUserPath -like "*$gitBinDir*") {
    Write-Host "Already in User PATH"
} elseif ($currentMachinePath -like "*$gitBinDir*") {
    Write-Host "Already in Machine PATH"
} else {
    Write-Host "Adding to User PATH..."
    $newPath = "$gitBinDir;$currentUserPath"
    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
    Write-Host "DONE - Git added to User PATH"
    Write-Host "IMPORTANT: Restart your terminal for changes to take effect"
}

# Also update current session PATH
$env:Path = "$gitBinDir;$env:Path"
Write-Host ""
Write-Host "Testing git in current session..."
git --version
Write-Host ""
Write-Host "=== Configuration complete ==="
