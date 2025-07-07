@echo off
setlocal

:: Your directory containing MP4s
set "source_dir=C:\Users\apt20\OneDrive\Desktop\1 take\static"
set "output_dir=%source_dir%\compressed"

:: Create output folder if it doesn't exist
if not exist "%output_dir%" mkdir "%output_dir%"

echo Compressing all MP4 files in %source_dir%...

for %%F in ("%source_dir%\*.mp4") do (
    echo Processing: %%~nxF
    ffmpeg -i "%%F" -vf "scale=-2:720" -c:v libx264 -preset slow -crf 28 -c:a aac -movflags +faststart "%output_dir%\%%~nxF"
)

echo Done! Compressed files saved in: %output_dir%
pause
