#!/bin/bash
# DRG Web应用启动脚本 (Linux/Mac)

set -e

echo "🏥 启动DRG分组器Web应用..."

# 检查uv是否安装
if ! command -v uv &> /dev/null; then
    echo "❌ 错误: uv工具未安装"
    echo "请先安装uv: curl -LsSf https://astral.sh/uv/install.sh | sh"
    exit 1
fi

# 检查Python版本
if ! command -v python3 &> /dev/null; then
    echo "❌ 错误: Python3未安装"
    echo "请先安装Python 3.9+"
    exit 1
fi

# 创建虚拟环境（如果不存在）
if [ ! -d ".venv" ]; then
    echo "📦 创建虚拟环境..."
    uv venv
fi

# 安装依赖
echo "📥 安装依赖包..."
uv sync

# 设置默认端口
export PORT=${PORT:-8080}

echo "🚀 启动Web服务器..."
echo "📱 访问地址: http://localhost:$PORT"
echo "⏹️  按 Ctrl+C 停止服务"
echo ""

# 启动应用
uv run python app.py
