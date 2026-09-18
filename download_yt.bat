@echo off
chcp 65001 > nul
cd /d "%~dp0"

:LOOP
cls
echo =========================================
echo       🏃 YouTube MP3 自動下載工具 (無限模式)
echo =========================================
echo (提醒：直接關閉此視窗即可結束程式)
echo.

set /p YT_URL=請貼上 YouTube 單曲或播放清單網址: 

if "%YT_URL%"=="" (
    echo.
    echo [警告] 網址不能為空白，請重新輸入！
    timeout /t 2 > nul
    goto LOOP
)

echo.
echo 開始下載並轉檔中，請稍候...
echo.

yt-dlp -x --audio-format mp3 -o "songs/%%(title)s.%%(ext)s" "%YT_URL%"

echo.
echo =========================================
echo 下載完成！檔案已存入 songs 資料夾。
echo =========================================
echo.

echo 正在自動更新網頁播放清單 (playlist.js)...
call generate_playlist.bat

echo.
echo -----------------------------------------
echo 3 秒後自動準備下一首下載...
timeout /t 3 > nul
goto LOOP