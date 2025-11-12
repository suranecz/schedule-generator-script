@echo off
chcp 65001 >nul
echo ====================================
echo 스케줄 생성기 종료 중...
echo ====================================
echo.

REM 포트를 사용하는 프로세스 종료
echo [1/3] Python 알고리즘 서버 종료 중... (포트 5000)
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :5000 ^| findstr LISTENING') do (
    taskkill /F /PID %%a >nul 2>&1
)

echo [2/3] Node.js 백엔드 종료 중... (포트 8000)
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :8000 ^| findstr LISTENING') do (
    taskkill /F /PID %%a >nul 2>&1
)

echo [3/3] React 프론트엔드 종료 중... (포트 3000)
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :3000 ^| findstr LISTENING') do (
    taskkill /F /PID %%a >nul 2>&1
)

echo.
echo ====================================
echo 모든 서버가 종료되었습니다.
echo ====================================
echo.
pause
