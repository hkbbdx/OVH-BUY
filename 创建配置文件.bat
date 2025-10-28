@echo off
chcp 65001 >nul
echo ============================================================
echo 创建 backend\.env 配置文件
echo ============================================================
echo.

cd backend

(
echo # ==============================================
echo # OVH Phantom Sniper - 后端配置文件
echo # ==============================================
echo.
echo # ==================== 必须配置 ====================
echo.
echo # API 安全密钥（用于验证前后端通信）
echo # ⚠️ 首次使用请修改为强随机密钥！
echo # 生成方法: python -c "import secrets; print(secrets.token_urlsafe(32))"
echo # 📌 这个密钥需要在前端设置页面中输入相同的值
echo API_SECRET_KEY=ovh-phantom-sniper-2024-secret-key
echo.
echo # ==================== 应用配置 ====================
echo.
echo # 后端端口（默认 5000）
echo PORT=5000
echo.
echo # 调试模式（开发: true, 生产: false）
echo DEBUG=false
echo.
echo # 是否启用API密钥验证（建议保持 true）
echo ENABLE_API_KEY_AUTH=true
echo.
echo # ==================== 说明 ====================
echo # 
echo # 首次使用步骤：
echo # 1. 修改上面的 API_SECRET_KEY 为随机生成的密钥
echo # 2. 启动后端: python app.py
echo # 3. 启动前端: npm run dev
echo # 4. 访问设置页面: http://localhost:5173/settings
echo # 5. 在"网站安全密钥"处输入相同的密钥
echo # 6. 填写 OVH API 凭据并保存
echo # 
echo # 其他配置（OVH API、Telegram等）在前端设置页面配置
echo #
echo # ==============================================
) > .env

echo ✅ backend\.env 文件已创建！
echo.
echo 📄 文件位置: backend\.env
echo.
echo 📋 默认配置内容：
echo    API_SECRET_KEY=ovh-phantom-sniper-2024-secret-key
echo    PORT=5000
echo    DEBUG=false
echo    ENABLE_API_KEY_AUTH=true
echo.
echo ⚠️  建议：修改 API_SECRET_KEY 为强随机密钥
echo 生成密钥: python -c "import secrets; print(secrets.token_urlsafe(32))"
echo.

cd ..
pause

