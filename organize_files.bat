@echo off
set "source=C:\Users\xyang\Downloads\02_Images"

echo Starting file organization...

cd /d "%source%"

rem Create subdirectories
if not exist "00001-00148_webp" mkdir "00001-00148_webp"
if not exist "001-237_jpg" mkdir "001-237_jpg"
if not exist "001-231_png" mkdir "001-231_png"
if not exist "001-240_webp" mkdir "001-240_webp"
if not exist "Other_Files" mkdir "Other_Files"

rem Move 5-digit numbered webp files (00001-00148.webp)
for /L %%i in (1,1,148) do (
    set "num=00000%%i"
    set "num=!num:~-5!"
    if exist "!num!.webp" move "!num!.webp" "00001-00148_webp\" >nul 2>&1
)

rem Move 3-digit numbered jpg files (001-237.jpg)
for /L %%i in (1,1,237) do (
    set "num=000%%i"
    set "num=!num:~-3!"
    if exist "!num!.jpg" move "!num!.jpg" "001-237_jpg\" >nul 2>&1
)

rem Move 3-digit numbered png files (001-231.png)
for /L %%i in (1,1,231) do (
    set "num=000%%i"
    set "num=!num:~-3!"
    if exist "!num!.png" move "!num!.png" "001-231_png\" >nul 2>&1
)

rem Move 3-digit numbered webp files (001-240.webp)
for /L %%i in (1,1,240) do (
    set "num=000%%i"
    set "num=!num:~-3!"
    if exist "!num!.webp" move "!num!.webp" "001-240_webp\" >nul 2>&1
)

rem Move other files
if exist "13_19_2.png" move "13_19_2.png" "Other_Files\" >nul 2>&1
if exist "250924-Portfolio-02.psd" move "250924-Portfolio-02.psd" "Other_Files\" >nul 2>&1
if exist "Grid.jpg" move "Grid.jpg" "Other_Files\" >nul 2>&1
if exist "36f70f3a2076899dc33e0d094b5ce3bac6025435629fa21e43fe5ee2653cf15e.png" move "36f70f3a2076899dc33e0d094b5ce3bac6025435629fa21e43fe5ee2653cf15e.png" "Other_Files\" >nul 2>&1

echo File organization completed!
pause
