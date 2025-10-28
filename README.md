# 🎯 OVH Phantom Sniper - 服务器自动抢购系统

一个强大的 OVH 服务器监控和自动抢购工具，帮助您快速抢购稀缺的服务器资源。

---

## ✨ 功能特性

- 🔍 **实时监控** - 自动检测服务器可用性
- ⚡ **自动抢购** - 发现库存立即下单
- 📊 **数据统计** - 实时查看抢购成功率
- 🔔 **Telegram 通知** - 及时通知抢购结果
- 💾 **缓存优化** - 减少 API 调用，提升速度
- 🎨 **现代化 UI** - 美观的赛博朋克风格界面

---

## 🚀 快速部署（5分钟）

### 环境要求

- **Python** 3.8 或更高版本
- **Node.js** 16 或更高版本
- **浏览器** Chrome/Firefox/Edge 最新版本

---

### 步骤 1：安装后端依赖

```bash
cd backend
pip install -r requirements.txt
```

**依赖包：**
- Flask（Web 框架）
- Flask-CORS（跨域支持）
- python-dotenv（环境变量）
- ovh（OVH API 客户端）
- requests（HTTP 请求）

---

### 步骤 2：配置后端

#### 方式一：使用默认配置（快速开始）

`backend/.env` 文件已包含在项目中，包含默认配置：

```env
API_SECRET_KEY=ovh-phantom-sniper-2024-secret-key
PORT=5000
DEBUG=false
ENABLE_API_KEY_AUTH=true
```

**可以直接使用！** 但建议修改密钥（见下方）

#### 方式二：生成强密钥（推荐生产环境）

```bash
# 生成随机密钥
python -c "import secrets; print(secrets.token_urlsafe(32))"
```

输出示例：
```
xK9mP2vN_8dQ4rT6wY1zA3bC5eF7gH9jL0mN2pR4sT6v
```

编辑 `backend/.env`，将 `API_SECRET_KEY` 改为生成的密钥：

```env
API_SECRET_KEY=xK9mP2vN_8dQ4rT6wY1zA3bC5eF7gH9jL0mN2pR4sT6v
```

---

### 步骤 3：启动后端

```bash
cd backend
python app.py
```

**成功输出：**
```
 * Running on http://0.0.0.0:5000
 * Running on http://127.0.0.1:5000
```

✅ **后端已启动在 5000 端口**

---

### 步骤 4：安装前端依赖

**打开新终端：**

```bash
cd OVH项目根目录
npm install
```

---

### 步骤 5：启动前端

```bash
npm run dev
```

**成功输出：**
```
  VITE v5.x.x  ready in xxx ms

  ➜  Local:   http://localhost:8080/
  ➜  Network: http://192.168.x.x:8080/
```

✅ **前端已启动在 8080 端口**

---

### 步骤 6：浏览器配置

#### 访问应用

浏览器打开：`http://localhost:8080`

#### 进入设置页面

访问：`http://localhost:8080/settings`

#### 配置两项内容

**1. 网站安全密钥**

- 打开 `backend/.env` 文件
- 复制 `API_SECRET_KEY` 的值
- 粘贴到设置页面的 **"🔐 网站安全密钥"** 输入框

**2. OVH API 凭据**

访问 https://api.ovh.com/createToken/ 获取：

- **APP_KEY** - 应用密钥
- **APP_SECRET** - 应用密钥  
- **CONSUMER_KEY** - 消费者密钥

在设置页面填写：

- **应用密钥 (APP KEY)**：从 OVH 获取的 APP_KEY
- **应用密钥 (APP SECRET)**：从 OVH 获取的 APP_SECRET
- **消费者密钥 (CONSUMER KEY)**：从 OVH 获取的 CONSUMER_KEY
- **API 节点 (ENDPOINT)**：选择 ovh-eu（欧洲）/ ovh-ca（加拿大）/ ovh-us（美国）
- **OVH 子公司 (ZONE)**：选择 IE（爱尔兰）/ CA（加拿大）/ US（美国）等

**所需权限：**
- `/dedicated/server/*` - 读写服务器信息
- `/order/*` - 创建订单
- `/me/*` - 读取账户信息

#### 保存配置

点击 **"保存设置"** 按钮

✅ **配置完成！**

---

## 🎮 开始使用

### 访问应用

**前端地址：** http://localhost:8080  
**后端地址：** http://localhost:5000

### 主要功能

| 页面 | 地址 | 功能 |
|------|------|------|
| 仪表盘 | http://localhost:8080/ | 查看统计数据 |
| 服务器列表 | http://localhost:8080/servers | 浏览 OVH 服务器 |
| 库存监控 | http://localhost:8080/monitor | 监控服务器库存 |
| 任务队列 | http://localhost:8080/queue | 管理抢购任务 |
| 历史记录 | http://localhost:8080/history | 查看购买历史 |
| 设置 | http://localhost:8080/settings | 配置 API 密钥 |

---

## 🔧 配置详解

### backend/.env 配置文件

**位置：** `backend/.env`

**内容：**
```env
# API 安全密钥（前后端通信验证）
# ⚠️ 必须在前端设置页面输入相同的值
API_SECRET_KEY=ovh-phantom-sniper-2024-secret-key

# 后端端口
PORT=5000

# 调试模式（生产环境设为 false）
DEBUG=false

# 启用 API 密钥验证
ENABLE_API_KEY_AUTH=true
```

**说明：**
- ✅ 文件已包含在项目中
- ✅ 可以直接使用默认配置
- ⚠️ 生产环境建议修改 API_SECRET_KEY

---

### 端口说明

| 服务 | 端口 | 地址 | 说明 |
|------|------|------|------|
| **前端** | **8080** | http://localhost:8080 | Vite 开发服务器 |
| **后端** | **5000** | http://localhost:5000 | Flask API 服务器 |

**前端通过 8080 端口访问，后端 API 在 5000 端口运行**

---

## 🔐 安全密钥配置流程

### 完整流程

```
1. 查看 backend/.env 文件
   ↓
2. 复制 API_SECRET_KEY 的值
   ↓
3. 访问 http://localhost:8080/settings
   ↓
4. 在"网站安全密钥"处粘贴
   ↓
5. 密钥存储到 localStorage
   ↓
6. 所有 API 请求自动带上密钥
   ↓
7. 后端验证密钥是否匹配
```

### 关键点

⚠️ **前后端密钥必须完全一致！**

- 后端读取：`backend/.env` 文件的 `API_SECRET_KEY`
- 前端存储：浏览器 localStorage（从设置页面输入）
- 验证：每次 API 请求时后端验证密钥

---

## 📝 配置检查清单

部署前确认：

- [ ] 后端已安装依赖：`pip install -r requirements.txt`
- [ ] 前端已安装依赖：`npm install`
- [ ] `backend/.env` 文件存在
- [ ] 后端能启动（端口 5000）
- [ ] 前端能启动（端口 8080）
- [ ] 能访问 http://localhost:8080
- [ ] 在设置页面配置了 API 密钥
- [ ] 在设置页面配置了 OVH API 凭据
- [ ] API 请求正常（无 401 错误）

---

## 🐛 常见问题

### Q: 访问 http://localhost:8080 显示"无法访问"？

**原因：** 前端未启动或端口被占用

**解决：**
```bash
# 检查前端是否启动
npm run dev

# 如果端口被占用，修改端口
# 编辑 vite.config.ts，修改 server.port
```

---

### Q: API 请求失败，提示 401 "认证失败"？

**原因：** 前后端密钥不一致

**解决：**
```bash
# 1. 查看后端密钥
cat backend/.env | grep API_SECRET_KEY

# 2. 在前端设置页面输入相同的密钥
# 访问 http://localhost:8080/settings

# 3. 检查浏览器控制台，确认密钥已保存
localStorage.getItem('api_secret_key')
```

---

### Q: 后端启动失败？

**原因：** 缺少依赖或端口被占用

**解决：**
```bash
# 1. 检查依赖
pip install -r requirements.txt

# 2. 检查端口 5000 是否被占用
# Windows:
netstat -ano | findstr :5000

# Linux/Mac:
lsof -i :5000

# 3. 查看错误日志
python app.py
```

---

### Q: 服务器列表加载慢？

**正常现象！** 首次从 OVH API 获取数据需要 1-2 分钟。

**说明：**
- 首次加载：1-2 分钟（从 OVH API 获取）
- 后续访问：1-3 秒（使用缓存）
- 缓存有效期：2 小时

---

### Q: 如何修改端口？

**前端端口（默认 8080）：**

编辑 `vite.config.ts`：
```typescript
export default defineConfig({
  server: {
    port: 8080  // 修改这里
  }
})
```

**后端端口（默认 5000）：**

编辑 `backend/.env`：
```env
PORT=5000  # 修改这里
```

或编辑 `backend/app.py` 最后一行：
```python
app.run(host='0.0.0.0', port=5000, debug=False)  # 修改 port
```

---

### Q: 如何更换 API 密钥？

**步骤：**

1. 生成新密钥
```bash
python -c "import secrets; print(secrets.token_urlsafe(32))"
```

2. 更新后端配置
```bash
# 编辑 backend/.env
nano backend/.env
# 将 API_SECRET_KEY 改为新密钥
```

3. 重启后端
```bash
cd backend
python app.py
```

4. 更新前端配置
- 访问 http://localhost:8080/settings
- 在"网站安全密钥"输入新密钥
- 保存

---

## 📁 项目结构

```
OVH/
├── backend/                    # 后端（Flask - 5000端口）
│   ├── .env                   # ✅ 配置文件（已包含）
│   ├── app.py                 # Flask 主程序
│   ├── api_key_config.py      # API 密钥验证
│   ├── api_auth_middleware.py # 认证中间件
│   ├── server_monitor.py      # 服务器监控
│   ├── ovh_api_helper.py      # OVH API 工具
│   ├── requirements.txt       # Python 依赖
│   ├── data/                  # 数据存储
│   │   ├── config.json       # OVH API 配置
│   │   ├── queue.json        # 任务队列
│   │   └── ...
│   └── logs/                  # 日志文件
│
├── src/                        # 前端（React + Vite - 8080端口）
│   ├── pages/                 # 页面组件
│   │   ├── Dashboard.tsx     # 仪表盘
│   │   ├── ServersPage.tsx   # 服务器列表
│   │   ├── SettingsPage.tsx  # 设置页面
│   │   └── ...
│   ├── components/            # UI 组件
│   ├── config/                # 配置文件
│   │   └── constants.ts      # 前端常量
│   └── utils/                 # 工具函数
│       └── apiClient.ts      # API 客户端
│
├── package.json                # Node.js 配置
├── vite.config.ts             # Vite 配置
└── README.md                  # 本文档
```

---

## 🔐 配置说明

### 必须配置的内容

#### 1. API 安全密钥

**后端配置：** `backend/.env`

```env
API_SECRET_KEY=ovh-phantom-sniper-2024-secret-key
```

**前端配置：** http://localhost:8080/settings

- 复制 `backend/.env` 中的 `API_SECRET_KEY` 值
- 粘贴到设置页面的 **"🔐 网站安全密钥"** 输入框
- 保存

⚠️ **重要：前后端密钥必须完全一致！**

---

#### 2. 前后端连接配置

**前端连接后端的地址配置**

**文件位置：** `src/config/constants.ts`（第 68 行）

```typescript
/**
 * 后端API地址
 */
export const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000/api';
```

**默认配置（本地开发，无需修改）：**
- ✅ 前端运行在：http://localhost:8080（端口 8080）
- ✅ 后端运行在：http://localhost:5000（端口 5000）
- ✅ 前端通过 `http://localhost:5000/api` 连接后端

**如果后端在其他地址，需要修改此配置！**

**常见场景配置：**

| 场景 | 修改后的 API_URL | 说明 |
|------|-----------------|------|
| **本地开发** | `http://localhost:5000/api` | 默认，无需修改 |
| **后端在局域网** | `http://192.168.1.100:5000/api` | 替换为服务器IP |
| **后端在公网** | `http://123.45.67.89:5000/api` | 替换为公网IP |
| **使用域名** | `https://api.yourdomain.com/api` | 使用域名（推荐生产环境） |
| **同服务器部署** | `/api` | 使用相对路径，通过 Nginx 反向代理 |

**修改示例：**

假设后端部署在 `192.168.1.100` 服务器：

```typescript
// 找到 src/config/constants.ts 第 68 行
// 将：
export const API_URL = 'http://localhost:5000/api';

// 改为：
export const API_URL = 'http://192.168.1.100:5000/api';
```

**端口配置位置：**

| 服务 | 配置文件 | 具体位置 | 默认端口 |
|------|---------|---------|----------|
| **前端** | `vite.config.ts` | 第 10 行 `port: 8080` | **8080** |
| **后端** | `backend/.env` | `PORT=5000` | **5000** |
| **前端→后端** | `src/config/constants.ts` | 第 68 行 `API_URL` | 指向后端地址 |

**配置关系图：**

```
┌──────────────────────────────────────┐
│  浏览器访问                          │
│  http://localhost:8080              │
│  (vite.config.ts - port: 8080)     │
└──────────────────────────────────────┘
              ↓
┌──────────────────────────────────────┐
│  前端配置                            │
│  src/config/constants.ts (第68行)    │
│  API_URL = 'http://localhost:5000/api' │
└──────────────────────────────────────┘
              ↓
┌──────────────────────────────────────┐
│  后端运行                            │
│  http://localhost:5000              │
│  (backend/.env - PORT=5000)         │
└──────────────────────────────────────┘
```

⚠️ **重要提示：**
- 前端默认在 **8080** 端口
- 后端默认在 **5000** 端口  
- 如果后端地址改变，必须修改 `src/config/constants.ts` 的 `API_URL`

---

#### 3. OVH API 凭据

在设置页面（http://localhost:8080/settings）配置：

| 配置项 | 说明 | 获取方式 |
|--------|------|----------|
| APP_KEY | 应用密钥 | https://api.ovh.com/createToken/ |
| APP_SECRET | 应用密钥 | https://api.ovh.com/createToken/ |
| CONSUMER_KEY | 消费者密钥 | https://api.ovh.com/createToken/ |
| Endpoint | API 端点 | ovh-eu / ovh-ca / ovh-us |
| Zone | 区域代码 | IE / CA / US 等 |

**区域选择：**
- 欧洲用户 → ovh-eu + IE/FR/GB/DE 等
- 加拿大用户 → ovh-ca + CA
- 美国用户 → ovh-us + US

---

## ⚡ 完整启动流程

### 1. 启动后端（5000端口）

```bash
cd backend
python app.py
```

**验证后端启动成功：**
```bash
curl http://localhost:5000/api/health
```

应返回：
```json
{"status":"ok"}
```

---

### 2. 启动前端（8080端口）

**新开一个终端：**

```bash
npm run dev
```

**验证前端启动成功：**

浏览器访问：`http://localhost:8080`

应显示应用界面

---

### 3. 完成配置

访问：`http://localhost:8080/settings`

**配置清单：**

1. ✅ 网站安全密钥
   - 复制 `backend/.env` 中的 `API_SECRET_KEY`
   - 粘贴到设置页面

2. ✅ OVH API 凭据
   - 填写 APP_KEY
   - 填写 APP_SECRET
   - 填写 CONSUMER_KEY
   - 选择 Endpoint
   - 选择 Zone

3. ✅ 点击"保存设置"

---

### 4. 验证配置

访问服务器列表：`http://localhost:8080/servers`

- 如果能看到服务器列表 → ✅ 配置成功
- 如果显示 401 错误 → ❌ 密钥不一致，检查配置
- 如果加载失败 → ❌ OVH API 配置错误

---

## 🔑 配置文件详解

### backend/.env

```env
# API 安全密钥（用于验证前后端通信）
# 这个密钥需要在前端设置页面输入相同的值
API_SECRET_KEY=ovh-phantom-sniper-2024-secret-key

# 后端端口（Flask 运行在此端口）
PORT=5000

# 调试模式（开发：true，生产：false）
DEBUG=false

# 启用 API 密钥验证（建议保持 true）
ENABLE_API_KEY_AUTH=true
```

**配置项说明：**

| 配置项 | 默认值 | 说明 | 是否必须修改 |
|--------|--------|------|-------------|
| `API_SECRET_KEY` | 默认密钥 | 前后端通信验证密钥 | ⚠️ 生产环境建议修改 |
| `PORT` | 5000 | 后端运行端口 | 否 |
| `DEBUG` | false | 是否开启调试模式 | 否 |
| `ENABLE_API_KEY_AUTH` | true | 是否启用密钥验证 | 否 |

---

## 🎯 端口说明

### 默认端口配置

```
┌──────────────────────────────────────┐
│  浏览器访问                          │
│  http://localhost:8080              │
│         ↓                            │
│  前端 (Vite)                         │
│  端口：8080                          │
└──────────────────────────────────────┘
         ↓ API 请求
         ↓ http://localhost:5000/api
┌──────────────────────────────────────┐
│  后端 (Flask)                        │
│  端口：5000                          │
│         ↓                            │
│  验证 API_SECRET_KEY                 │
│         ↓                            │
│  处理请求                            │
└──────────────────────────────────────┘
```

### 修改端口

**如果需要修改端口：**

**前端（8080）：**
- 编辑 `vite.config.ts`
- 修改 `server.port` 的值

**后端（5000）：**
- 编辑 `backend/.env`
- 修改 `PORT` 的值

---

## 🔒 安全最佳实践

### 1. 修改默认密钥

**生成强密钥：**
```bash
python -c "import secrets; print(secrets.token_urlsafe(32))"
```

**修改位置：**
- `backend/.env` 的 `API_SECRET_KEY`
- 前端设置页面的"网站安全密钥"

### 2. 生产环境配置

```env
# backend/.env
API_SECRET_KEY=<64字符的超强随机密钥>
PORT=5000
DEBUG=false                    # ⚠️ 生产环境必须 false
ENABLE_API_KEY_AUTH=true       # ⚠️ 生产环境必须 true
```

### 3. 使用 HTTPS

生产环境建议配置 SSL 证书，使用 HTTPS 访问

### 4. 定期更换密钥

建议每 3-6 个月更换一次 API_SECRET_KEY

---

## 🛠️ 管理命令

### 查看后端日志

```bash
# 实时查看
tail -f backend/logs/app.log

# 查看最后 100 行
tail -n 100 backend/logs/app.log
```

### 重启服务

```bash
# 停止当前运行的服务（Ctrl+C）
# 然后重新启动

cd backend
python app.py
```

### 清理缓存

访问：http://localhost:8080/settings

点击 **"清理所有缓存"** 按钮

---

## 📊 数据文件说明

### backend/data/ 目录

| 文件 | 说明 |
|------|------|
| `config.json` | OVH API 配置（从设置页面保存） |
| `queue.json` | 任务队列数据 |
| `history.json` | 购买历史记录 |
| `logs.json` | 操作日志 |
| `servers.json` | 服务器列表缓存 |
| `subscriptions.json` | 监控订阅配置 |

---

## 🎉 快速启动命令

### 一键启动（Windows）

```bash
# 终端 1：启动后端
cd backend && python app.py

# 终端 2：启动前端
npm run dev
```

### 一键启动（Linux/Mac）

```bash
# 终端 1：启动后端
cd backend && python3 app.py

# 终端 2：启动前端
npm run dev
```

**然后访问：** http://localhost:8080

---

## 📚 文档说明

| 文档 | 说明 |
|------|------|
| `README.md` | 本文档（部署和使用指南） |
| `配置说明_一页纸.md` | 最简配置说明 |
| `README_快速开始.md` | 快速开始指南 |
| `SETUP_GUIDE.md` | 详细设置指南 |
| `ENV配置说明.md` | .env 文件详细说明 |

---

## 🎯 总结

### 部署只需 4 步

```bash
# 1. 安装依赖
cd backend && pip install -r requirements.txt
cd .. && npm install

# 2. 启动后端（5000端口）
cd backend && python app.py

# 3. 启动前端（8080端口）
npm run dev

# 4. 浏览器配置
# 访问 http://localhost:8080/settings 完成配置
```

### 关键配置点

1. ✅ **API_SECRET_KEY** - 后端 .env 和前端设置页面必须一致
2. ✅ **OVH API** - 在前端设置页面配置
3. ✅ **端口** - 前端 8080，后端 5000

---

**就这么简单！开始您的抢购之旅吧！** 🚀🎯

---

## 📞 获取帮助

- 查看日志：`backend/logs/app.log`
- 浏览器控制台：按 F12 查看错误
- 检查配置：访问 http://localhost:8080/settings

---

*最后更新：2024-10-28*  
*版本：v2.1.0*
