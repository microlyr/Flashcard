# Find Git installation
$ErrorActionPreference = "Stop"

Write-Host "=== 查找 Git 安装位置 ==="

# Method 1: Check common paths
$paths = @(
    "C:\Program Files\Git\bin\git.exe",
    "C:\Program Files (x86)\Git\bin\git.exe",
    "$env:LOCALAPPDATA\Programs\Git\bin\git.exe"
)
foreach ($p in $paths) {
    if (Test-Path $p) {
        Write-Host "FOUND at: $p"
        & $p --version
        $gitPath = (Get-Item $p).DirectoryName
        Write-Host "Git bin dir: $gitPath"
    }
}

# Method 2: Resolve Start Menu shortcut
Write-Host "--- Checking Start Menu shortcuts ---"
$startMenu = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Git"
if (Test-Path $startMenu) {
    $wsh = New-Object -ComObject WScript.Shell
    Get-ChildItem $startMenu -Filter "*.lnk" | ForEach-Object {
        $lnk = $wsh.CreateShortcut($_.FullName)
        Write-Host "Shortcut: $($_.Name) -> $($lnk.TargetPath)"
    }
}

# Method 3: Search entire C:\Program Files for git.exe (depth 4)
Write-Host "--- Deep search C:\Program Files ---"
Get-ChildItem "C:\Program Files" -Recurse -Filter "git.exe" -Depth 4 -ErrorAction SilentlyContinue | ForEach-Object {
    Write-Host "FOUND: $($_.FullName)"
}

# Method 4: Check if git is available via where.exe
Write-Host "--- where.exe git ---"
$result = cmd /c "where git 2>&1"
Write-Host $result

Write-Host "=== Done ==="
