@echo off
chcp 65001 >nul
echo ====================================
echo 스케줄 생성기 시작 중...
echo ====================================
echo.

REM Python 설치 확인
python --version >nul 2>&1
if errorlevel 1 (
    echo [오류] Python이 설치되지 않았습니다.
    echo Python 3.11 이상을 설치해주세요.
    echo https://www.python.org/downloads/
    echo.
    pause
    exit /b 1
)

REM Node.js 설치 확인
node --version >nul 2>&1
if errorlevel 1 (
    echo [오류] Node.js가 설치되지 않았습니다.
    echo Node.js 18 이상을 설치해주세요.
    echo https://nodejs.org/
    echo.
    pause
    exit /b 1
)

echo [1/3] Python 알고리즘 서버 시작 중... (포트 5000)
start "Python 알고리즘 서버" cmd /k "cd ..\schdule-generator-algorithm && python main.py server"

echo.
echo [대기] Python 서버 준비 중... (3초)
timeout /t 3 /nobreak >nul

echo.
echo [2/3] Node.js 백엔드 서버 시작 중... (포트 8000)
start "Node.js 백엔드" cmd /k "cd ..\schedule-generator && node app.js"

echo.
echo [대기] Node.js 서버 준비 중... (3초)
timeout /t 3 /nobreak >nul

echo.
echo [3/3] React 프론트엔드 시작 중... (포트 3000)
start "React 프론트엔드" cmd /k "cd ..\schedule-generator-front\schedule-generator && npm start"

echo.
echo [대기] React 서버 준비 중... (10초)
timeout /t 10 /nobreak >nul

echo.
echo [브라우저] 자동으로 열기...
start http://localhost:3000

echo.
echo ====================================
echo 스케줄 생성기가 실행되었습니다!
echo.
echo - Python 알고리즘: http://localhost:5000
echo - Node.js 백엔드: http://localhost:8000
echo - React 프론트엔드: http://localhost:3000
echo.
echo 종료하려면 stop.bat을 실행하세요.
echo ====================================
echo.
pause
