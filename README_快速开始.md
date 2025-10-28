# 🚀 快速开始

## ✅ backend/.env 已创建

文件位置：`backend/.env`

---

## 📝 默认配置内容

```env
API_SECRET_KEY=ovh-phantom-sniper-2024-secret-key
PORT=5000
DEBUG=false
ENABLE_API_KEY_AUTH=true
```

---

## ⚠️ 必须修改的配置

### API_SECRET_KEY（必须修改）

**生成新密钥：**
```bash
python -c "import secrets; print(secrets.token_urlsafe(32))"
```

**修改步骤：**
1. 运行上面命令生成密钥
2. 复制输出（例如：`xK9mP2vN_8dQ4rT6wY1zA3bC5eF7gH9jL0mN2pR4sT6v`）
3. 用记事本打开 `backend/.env`
4. 将 `API_SECRET_KEY=` 后面改为新密钥
5. 保存文件

---

## 🚀 启动服务

### 1. 启动后端

```bash
cd backend
pip install -r requirements.txt
python app.py
```

### 2. 启动前端（新终端）

```bash
npm install
npm run dev
```

### 3. 配置密钥

1. 访问 `http://localhost:5173/settings`
2. 在 **"🔐 网站安全密钥"** 输入与 `.env` 相同的密钥
3. 填写 OVH API 凭据
4. 保存

---

## 📋 配置检查清单

- [x] `backend/.env` 文件已创建 ✅
- [ ] 修改了 `API_SECRET_KEY`（建议）
- [ ] 后端能启动
- [ ] 前端能访问
- [ ] 在设置页面配置了密钥
- [ ] 在设置页面配置了 OVH API

---

## ❓ 常见问题

### Q: 如果不修改 API_SECRET_KEY 会怎样？

A: 可以正常使用，但安全性较低。建议生产环境修改。

### Q: 如何知道密钥配置正确？

A: 
1. 在设置页面输入密钥后保存
2. 访问其他页面（如服务器列表）
3. 如果能正常获取数据，说明配置正确
4. 如果提示"认证失败"，说明前后端密钥不一致

### Q: 可以提交 .env 到 Git 吗？

A: 可以！这个 .env 包含的是默认配置，不包含真实的敏感数据。`.gitignore` 已配置允许提交 `backend/.env`。

---

## 🎯 .env 文件内容说明

### 必须配置（1项）

| 配置项 | 说明 | 默认值 | 是否必须修改 |
|--------|------|--------|-------------|
| `API_SECRET_KEY` | 前后端通信密钥 | 默认密钥 | ⚠️ 生产环境必须 |

### 可选配置（3项）

| 配置项 | 说明 | 默认值 | 是否必须修改 |
|--------|------|--------|-------------|
| `PORT` | 后端端口 | 5000 | 否 |
| `DEBUG` | 调试模式 | false | 否 |
| `ENABLE_API_KEY_AUTH` | 启用密钥验证 | true | 否 |

---

## 📄 完整的 .env 文件

```env
# API 安全密钥（必须修改）
API_SECRET_KEY=ovh-phantom-sniper-2024-secret-key

# 应用配置
PORT=5000
DEBUG=false
ENABLE_API_KEY_AUTH=true
```

**就这 4 行配置！** 其他都在前端设置页面配置 ✨

---

## 🔑 生成强密钥示例

```bash
python -c "import secrets; print(secrets.token_urlsafe(32))"
```

**示例输出：**
```
xK9mP2vN_8dQ4rT6wY1zA3bC5eF7gH9jL0mN2pR4sT6v
```

将这个复制到 `API_SECRET_KEY=` 后面即可！

---

**配置就是这么简单！** 🎉

