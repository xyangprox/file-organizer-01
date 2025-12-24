$folders = @(
    "C:\Users\xyang\Documents\Audacity",
    "C:\Users\xyang\Documents\FormatFactory",
    "C:\Users\xyang\Documents\笔记备份",
    "C:\Users\xyang\Documents\自定义 Office 模板"
)

Write-Host "=== Delete Empty Folders in Documents ===" -ForegroundColor Cyan
Write-Host ""

foreach ($folder in $folders) {
    if (Test-Path $folder) {
        $items = Get-ChildItem -Path $folder -Recurse
        if ($items.Count -eq 0) {
            Write-Host "[DELETE] $folder" -ForegroundColor Yellow
            Remove-Item -Path $folder -Force -Recurse
            Write-Host "  OK - Deleted" -ForegroundColor Green
        } else {
            Write-Host "[SKIP] $folder - Not empty" -ForegroundColor Gray
        }
    } else {
        Write-Host "[SKIP] $folder - Not found" -ForegroundColor Gray
    }
}

Write-Host ""
Write-Host "=== Done ===" -ForegroundColor Cyan
Write-Host "Press Enter to exit..."
Read-Host
