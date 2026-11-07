param(
    [int]$IntervalSeconds = 300, # Mặc định 5 phút (300 giây)
    [switch]$Once
)

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $ScriptDir

$logFile = Join-Path $ScriptDir "auto-sync.log"

function Write-SyncLog {
    param([string]$message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] $message"
    Write-Output $logEntry
    try {
        Add-Content -Path $logFile -Value $logEntry -Encoding UTF8 -ErrorAction SilentlyContinue
    } catch {}
}

function Rotate-Log {
    if (Test-Path $logFile) {
        try {
            $fileItem = Get-Item $logFile -ErrorAction SilentlyContinue
            if ($fileItem -and $fileItem.Length -gt 5MB) {
                $oldLog = Join-Path $ScriptDir "auto-sync.old.log"
                Move-Item -Path $logFile -Destination $oldLog -Force -ErrorAction SilentlyContinue
            }
        } catch {}
    }
}

function Sync-Git {
    Rotate-Log
    Write-SyncLog ">>> Bat dau chu ky dong bo 2 chieu..."

    # 1. Keo thay doi moi tu GitHub ve (Pull)
    try {
        Write-SyncLog "Dang kiem tra va keo du lieu tu GitHub (git pull origin main)..."
        $pullOutput = & git pull --autostash origin main 2>&1
        $pullStr = ($pullOutput | Out-String).Trim()
        Write-SyncLog "Ket qua pull: $pullStr"
    } catch {
        Write-SyncLog "Loi khi pull tu GitHub: $_"
    }

    # 2. Kiem tra thay doi noi bo tai may (Local changes)
    try {
        $status = & git status --porcelain
        if ($status) {
            Write-SyncLog "Phat hien file thay doi tai may Windows:"
            $statusStr = ($status | Out-String).Trim()
            Write-SyncLog $statusStr

            & git add -A
            $dateStr = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
            $commitMsg = "auto-sync: dong bo tu dong ($dateStr)"
            & git commit -m $commitMsg

            Write-SyncLog "Dang day du lieu len GitHub (git push origin main)..."
            $pushOutput = & git push origin main 2>&1
            $pushStr = ($pushOutput | Out-String).Trim()
            Write-SyncLog "Ket qua push: $pushStr"
        } else {
            # Kiem tra xem co commit nao chua push khong
            $ahead = & git log origin/main..HEAD --oneline 2>&1
            if ($ahead) {
                Write-SyncLog "Co commit chua push, tien hanh day len GitHub..."
                $pushOutput = & git push origin main 2>&1
                $pushStr = ($pushOutput | Out-String).Trim()
                Write-SyncLog "Ket qua push: $pushStr"
            } else {
                Write-SyncLog "Local va GitHub dong nhat, khong co thay doi can day."
            }
        }
    } catch {
        Write-SyncLog "Loi khi kiem tra hoac push: $_"
    }

    Write-SyncLog ">>> Hoan thanh chu ky dong bo.`n"
}

if ($Once) {
    Sync-Git
    exit 0
}

Write-SyncLog "=== DICH VU DONG BO TU DONG THIEN SON EPOXY DA KHOI DONG (Chu ky: ${IntervalSeconds}s) ==="

while ($true) {
    try {
        Sync-Git
    } catch {
        Write-SyncLog "Ngoai le xay ra trong vong lap: $_"
    }
    Start-Sleep -Seconds $IntervalSeconds
}
