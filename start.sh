#!/bin/bash

echo "===================================="
echo "스케줄 생성기 시작 중..."
echo "===================================="
echo ""

# Python 설치 확인
if ! command -v python3 &> /dev/null; then
    echo "[오류] Python3가 설치되지 않았습니다."
    echo "Python 3.11 이상을 설치해주세요."
    echo "https://www.python.org/downloads/"
    echo ""
    exit 1
fi

# Node.js 설치 확인
if ! command -v node &> /dev/null; then
    echo "[오류] Node.js가 설치되지 않았습니다."
    echo "Node.js 18 이상을 설치해주세요."
    echo "https://nodejs.org/"
    echo ""
    exit 1
fi

echo "[1/3] Python 알고리즘 서버 시작 중... (포트 5000)"
cd ../schdule-generator-algorithm
python3 main.py server > /dev/null 2>&1 &
PYTHON_PID=$!
echo "  → PID: $PYTHON_PID"
cd ../schedule-generator-script

echo ""
echo "[대기] Python 서버 준비 중... (3초)"
sleep 3

echo ""
echo "[2/3] Node.js 백엔드 서버 시작 중... (포트 8000)"
cd ../schedule-generator
node app.js > /dev/null 2>&1 &
NODE_PID=$!
echo "  → PID: $NODE_PID"
cd ../schedule-generator-script

echo ""
echo "[대기] Node.js 서버 준비 중... (3초)"
sleep 3

echo ""
echo "[3/3] React 프론트엔드 시작 중... (포트 3000)"
cd ../schedule-generator-front/schedule-generator
BROWSER=none npm start > /dev/null 2>&1 &
REACT_PID=$!
echo "  → PID: $REACT_PID"
cd ../../schedule-generator-script

echo ""
echo "[대기] React 서버 준비 중... (10초)"
sleep 10

echo ""
echo "[브라우저] 자동으로 열기..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    open http://localhost:3000
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    if command -v xdg-open &> /dev/null; then
        xdg-open http://localhost:3000
    elif command -v gnome-open &> /dev/null; then
        gnome-open http://localhost:3000
    fi
fi

echo ""
echo "===================================="
echo "스케줄 생성기가 실행되었습니다!"
echo ""
echo "- Python 알고리즘: http://localhost:5000"
echo "- Node.js 백엔드: http://localhost:8000"
echo "- React 프론트엔드: http://localhost:3000"
echo ""
echo "종료하려면 stop.sh를 실행하세요."
echo "===================================="
echo ""
