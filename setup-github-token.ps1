# Script thiet lap GitHub Personal Access Token (PAT) an toan cho Thien Son Epoxy
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  THIET LAP GITHUB TOKEN CHO THIEN SON EPOXY AI AGENTIC   " -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Neu chua co Token, Boss vao link sau de tao (tich chon quyen 'repo'):" -ForegroundColor Gray
Write-Host "https://github.com/settings/tokens/new" -ForegroundColor Green
Write-Host ""

$secureToken = Read-Host "Dan GitHub Token cua Boss vao day (ky tu se duoc che giau)" -AsSecureString
$bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureToken)
$token = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr)
[System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($bstr)

if ([string]::IsNullOrWhiteSpace($token)) {
    Write-Host "Loi: Token khong duoc de trong!" -ForegroundColor Red
    exit 1
}

# Cap nhat Git Remote URL voi Token
$remoteUrl = "https://$($token)@github.com/thienson-epoxy/AI-Agentic.git"
git remote set-url origin $remoteUrl

# Ghi vao file .env de he thong agent dung lai ve sau
$envPath = Join-Path $PSScriptRoot ".env"
$envLine = "GITHUB_TOKEN=$token"

if (Test-Path $envPath) {
    $lines = Get-Content $envPath | Where-Object { $_ -notmatch "^GITHUB_TOKEN=" }
    $lines += $envLine
    Set-Content -Path $envPath -Value $lines -Encoding UTF8
} else {
    Set-Content -Path $envPath -Value $envLine -Encoding UTF8
}

Write-Host ""
Write-Host "-> Da luu Token vao .env va cau hinh Git Remote thanh cong!" -ForegroundColor Green
Write-Host ""

$confirmPush = Read-Host "Boss co muon day (push) toan bo code hien tai len GitHub ngay khong? (Y/N)"
if ($confirmPush -eq "Y" -or $confirmPush -eq "y") {
    Write-Host "Dang day du lieu len GitHub (origin main)..." -ForegroundColor Cyan
    git push -u origin main
    if ($LASTEXITCODE -eq 0) {
        Write-Host "CHUC MUNG: Du lieu AI Agentic da duoc day len GitHub thanh cong!" -ForegroundColor Green
    } else {
        Write-Host "Khong the push len GitHub. Vui long kiem tra lai quyen han cua Token tren repo." -ForegroundColor Red
    }
} else {
    Write-Host "Da bo qua buoc push. Boss co the chay 'git push origin main' bat ky luc nao." -ForegroundColor Yellow
}
