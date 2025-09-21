@echo off
REM DRG Web应用启动脚本 (Windows)

echo 🏥 启动DRG分组器Web应用...

REM 检查uv是否安装
where uv >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ 错误: uv工具未安装
    echo 请先安装uv: powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
    pause
    exit /b 1
)

REM 检查Python版本
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ 错误: Python未安装
    echo 请先安装Python 3.9+
    pause
    exit /b 1
)

REM 创建虚拟环境（如果不存在）
if not exist ".venv" (
    echo 📦 创建虚拟环境...
    uv venv
)

REM 安装依赖
echo 📥 安装依赖包...
uv sync

REM 设置默认端口
if "%PORT%"=="" set PORT=8080

echo 🚀 启动Web服务器...
echo 📱 访问地址: http://localhost:%PORT%
echo ⏹️  按 Ctrl+C 停止服务
echo.

REM 启动应用
uv run python app.py

pause
