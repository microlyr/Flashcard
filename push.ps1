$ErrorActionPreference = "Stop"
$repoDir = "E:\CodeBase\Personal Work\claude_deepseek\Flashcard"
$env:Path = "D:\download\Git\bin;$env:Path"

Write-Host "=== 📇 推送到 GitHub ==="

Set-Location $repoDir

# Init
if (-not (Test-Path ".git")) {
    Write-Host "[1/5] git init..."
    git init
} else {
    Write-Host "[1/5] git repo already exists"
}

# Config (if not set)
$email = git config user.email
if (-not $email) {
    Write-Host "Git user.email not configured."
    $name = Read-Host "Enter your name (for git commits)"
    $mail = Read-Host "Enter your email (for git commits)"
    git config user.name $name
    git config user.email $mail
}

# Add
Write-Host "[2/5] git add..."
git add -A

# Commit
Write-Host "[3/5] git commit..."
$msg = "v1.0: AI 智能闪卡 — 网页版 + Android APK 自动打包"
git commit -m $msg

# Remote & Push
Write-Host "[4/5] git push..."
git remote remove origin 2>$null
git remote add origin https://github.com/microlyr/Flashcard.git
git branch -M main
git push -u origin main

# Tag
Write-Host "[5/5] git tag v1.0..."
git tag -d v1.0 2>$null
git tag v1.0
git push origin v1.0

Write-Host ""
Write-Host "=== ✅ 推送完成 ==="
Write-Host "APK 构建: https://github.com/microlyr/Flashcard/actions"
