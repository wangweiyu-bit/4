@echo off
echo ========================================
echo    后端服务启动脚本
echo ========================================
echo.

echo 检查 Node.js 是否已安装...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ 错误: 未检测到 Node.js
    echo.
    echo 📋 请按照以下步骤安装 Node.js:
    echo 1. 访问 https://nodejs.org
    echo 2. 下载 LTS 版本 (推荐)
    echo 3. 运行安装程序，确保勾选 "Add to PATH"
    echo 4. 安装完成后重启命令行
    echo.
    echo 📖 详细安装指南请查看: 安装指南.md
    echo.
    pause
    exit /b 1
)

echo ✅ Node.js 已安装
echo.

echo 进入后端目录...
cd backend

echo 检查依赖是否已安装...
if not exist "node_modules" (
    echo 📦 正在安装依赖...
    npm install
    if %errorlevel% neq 0 (
        echo ❌ 依赖安装失败
        pause
        exit /b 1
    )
    echo ✅ 依赖安装完成
) else (
    echo ✅ 依赖已安装
)

echo.
echo 🚀 启动后端服务...
echo 服务地址: http://localhost:8080
echo 按 Ctrl+C 停止服务
echo.

set PORT=8080
set JWT_SECRET=your-secret-key-here
set ALLOW_ORIGIN=*

node src/server.js

pause
