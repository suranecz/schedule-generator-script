#!/bin/bash

echo "===================================="
echo "스케줄 생성기 종료 중..."
echo "===================================="
echo ""

# 포트 5000을 사용하는 프로세스 종료
echo "[1/3] Python 알고리즘 서버 종료 중... (포트 5000)"
if lsof -Pi :5000 -sTCP:LISTEN -t >/dev/null 2>&1; then
    kill -9 $(lsof -Pi :5000 -sTCP:LISTEN -t) 2>/dev/null
    echo "  → 종료됨"
else
    echo "  → 실행 중인 프로세스 없음"
fi

# 포트 8000을 사용하는 프로세스 종료
echo "[2/3] Node.js 백엔드 종료 중... (포트 8000)"
if lsof -Pi :8000 -sTCP:LISTEN -t >/dev/null 2>&1; then
    kill -9 $(lsof -Pi :8000 -sTCP:LISTEN -t) 2>/dev/null
    echo "  → 종료됨"
else
    echo "  → 실행 중인 프로세스 없음"
fi

# 포트 3000을 사용하는 프로세스 종료
echo "[3/3] React 프론트엔드 종료 중... (포트 3000)"
if lsof -Pi :3000 -sTCP:LISTEN -t >/dev/null 2>&1; then
    kill -9 $(lsof -Pi :3000 -sTCP:LISTEN -t) 2>/dev/null
    echo "  → 종료됨"
else
    echo "  → 실행 중인 프로세스 없음"
fi

echo ""
echo "===================================="
echo "모든 서버가 종료되었습니다."
echo "===================================="
echo ""
