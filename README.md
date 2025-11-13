# 스케줄 생성기 - 직접 실행 스크립트

이 폴더는 Docker 없이 스케줄 생성기를 직접 실행하기 위한 스크립트를 포함합니다.

## 📋 사전 요구사항

실행하기 전에 다음 프로그램들이 설치되어 있어야 합니다:

### 필수 설치 항목
- **Python 3.11 이상**: https://www.python.org/downloads/
- **Node.js 18 이상**: https://nodejs.org/

### 설치 확인 방법

#### Windows (cmd 또는 PowerShell)
```cmd
python --version
node --version
npm --version
```

#### Mac/Linux (Terminal)
```bash
python3 --version
node --version
npm --version
```

## 🚀 사용 방법

### Windows

#### 시작하기
```cmd
start.bat
```
또는 `start.bat` 파일을 더블클릭

#### 종료하기
```cmd
stop.bat
```
또는 `stop.bat` 파일을 더블클릭

### Mac/Linux

먼저 실행 권한을 부여합니다 (최초 1회만):
```bash
chmod +x start.sh stop.sh
```

#### 시작하기
```bash
./start.sh
```

#### 종료하기
```bash
./stop.sh
```

## 📦 최초 실행 시 설정

최초 실행 전에 각 프로젝트의 의존성을 설치해야 합니다:

### 1. Python 알고리즘 서버 설정
```bash
cd ../schdule-generator-algorithm
pip install -r requirements.txt
```

### 2. Node.js 백엔드 설정
```bash
cd ../schedule-generator
npm install
```

### 3. React 프론트엔드 설정
```bash
cd ../schedule-generator-front/schedule-generator
npm install
```

## 🌐 서비스 포트

스크립트를 실행하면 다음 포트에서 각 서비스가 시작됩니다:

- **React 프론트엔드**: http://localhost:3000
- **Node.js 백엔드**: http://localhost:8000
- **Python 알고리즘**: http://localhost:5000

브라우저는 자동으로 http://localhost:3000 으로 열립니다.

## ⚠️ 문제 해결

### "포트가 이미 사용 중입니다" 오류

먼저 `stop` 스크립트를 실행하여 기존 프로세스를 종료하세요:
- Windows: `stop.bat`
- Mac/Linux: `./stop.sh`

### Python 또는 Node.js를 찾을 수 없음

1. 위의 사전 요구사항 섹션에서 프로그램들을 설치하세요
2. 설치 후 터미널/명령 프롬프트를 다시 시작하세요
3. 환경 변수 PATH에 Python과 Node.js가 추가되어 있는지 확인하세요

### 서버가 시작되지 않음

1. 각 프로젝트 폴더에서 의존성이 설치되었는지 확인하세요
2. 로그를 확인하여 오류 메시지를 확인하세요
3. 방화벽이 포트 3000, 8000, 5000을 차단하지 않는지 확인하세요

## 📂 프로젝트 구조

```
C:\01.Project\2025\
├── schedule-generator-script/      (현재 폴더)
│   ├── start.bat                    (Windows 시작 스크립트)
│   ├── stop.bat                     (Windows 종료 스크립트)
│   ├── start.sh                     (Mac/Linux 시작 스크립트)
│   ├── stop.sh                      (Mac/Linux 종료 스크립트)
│   └── README.md                    (이 파일)
├── schdule-generator-algorithm/    (Python 알고리즘 서버)
├── schedule-generator/              (Node.js 백엔드)
└── schedule-generator-front/
    └── schedule-generator/          (React 프론트엔드)
```

## 🐳 Docker 사용 방법

Docker를 사용하고 싶다면 `schedule-generator-docker` 폴더를 참조하세요.

## 💡 참고사항

- 스크립트는 백그라운드에서 서버를 실행합니다
- 각 서비스는 별도의 프로세스로 실행됩니다
- `stop` 스크립트는 포트 번호를 기준으로 프로세스를 종료합니다
- 변경사항이 자동으로 반영되지 않으면 서버를 재시작하세요
