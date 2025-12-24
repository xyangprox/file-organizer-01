$source = "C:\Users\xyang\Downloads\02_Images"

Write-Host "Starting file organization..." -ForegroundColor Green

cd $source

# Create subdirectories
$folders = @("00001-00148_webp", "001-237_jpg", "001-231_png", "001-240_webp", "Other_Files")
foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder | Out-Null
        Write-Host "Created folder: $folder" -ForegroundColor Cyan
    }
}

# Move 5-digit numbered webp files (00001-00148.webp)
Write-Host "`nMoving 5-digit webp files..." -ForegroundColor Yellow
for ($i = 1; $i -le 148; $i++) {
    $num = $i.ToString("00000")
    $file = "$num.webp"
    if (Test-Path $file) {
        Move-Item $file -Destination "00001-00148_webp\" -Force
    }
}

# Move 3-digit numbered jpg files (001-237.jpg)
Write-Host "Moving 3-digit jpg files..." -ForegroundColor Yellow
for ($i = 1; $i -le 237; $i++) {
    $num = $i.ToString("000")
    $file = "$num.jpg"
    if (Test-Path $file) {
        Move-Item $file -Destination "001-237_jpg\" -Force
    }
}

# Move 3-digit numbered png files (001-231.png)
Write-Host "Moving 3-digit png files..." -ForegroundColor Yellow
for ($i = 1; $i -le 231; $i++) {
    $num = $i.ToString("000")
    $file = "$num.png"
    if (Test-Path $file) {
        Move-Item $file -Destination "001-231_png\" -Force
    }
}

# Move 3-digit numbered webp files (001-240.webp)
Write-Host "Moving 3-digit webp files..." -ForegroundColor Yellow
for ($i = 1; $i -le 240; $i++) {
    $num = $i.ToString("000")
    $file = "$num.webp"
    if (Test-Path $file) {
        Move-Item $file -Destination "001-240_webp\" -Force
    }
}

# Move other files
Write-Host "Moving other files..." -ForegroundColor Yellow
$otherFiles = @("13_19_2.png", "250924-Portfolio-02.psd", "Grid.jpg", "36f70f3a2076899dc33e0d094b5ce3bac6025435629fa21e43fe5ee2653cf15e.png")
foreach ($file in $otherFiles) {
    if (Test-Path $file) {
        Move-Item $file -Destination "Other_Files\" -Force
        Write-Host "Moved: $file" -ForegroundColor Cyan
    }
}

# Show summary
Write-Host "`n=== Organization Summary ===" -ForegroundColor Green
foreach ($folder in $folders) {
    $count = (Get-ChildItem $folder -ErrorAction SilentlyContinue | Measure-Object).Count
    Write-Host "$folder`: $count files" -ForegroundColor White
}

Write-Host "`nFile organization completed!" -ForegroundColor Green
