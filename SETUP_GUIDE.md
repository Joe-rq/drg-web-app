# 项目设置指南

## 🚀 GitHub仓库发布指南

### 1. 在GitHub上创建新仓库

1. 访问 [GitHub](https://github.com)
2. 点击右上角的 "+" → "New repository"
3. 填写仓库信息：
   - **Repository name**: `drg-web-app`
   - **Description**: `现代化的DRG诊断相关分组Web应用 - 基于OpenDRG项目开发`
   - **Public/Private**: 选择Public（开源项目）
   - **不要勾选** "Add a README file"（我们已经有了）
   - **不要勾选** "Add .gitignore"（我们已经有了）
   - **License**: 选择Apache License 2.0

### 2. 推送到GitHub

在项目目录中运行以下命令：

```bash
cd /Users/qrq/Documents/code/02-projects/drg-web-app

# 添加远程仓库（替换为你的GitHub用户名）
git remote add origin https://github.com/你的用户名/drg-web-app.git

# 推送代码到GitHub
git branch -M main
git push -u origin main
```

### 3. 设置仓库描述和标签

在GitHub仓库页面：
1. 点击仓库名称下方的 "Edit" 按钮
2. 添加描述：`现代化的DRG诊断相关分组Web应用 - 基于OpenDRG项目开发`
3. 添加标签：`drg`, `healthcare`, `medical`, `web-app`, `flask`, `python`
4. 设置网站：如果你有部署的话

## 📦 发布版本

### 创建第一个Release

1. 在GitHub仓库页面，点击右侧的 "Releases"
2. 点击 "Create a new release"
3. 填写信息：
   - **Tag version**: `v1.0.0`
   - **Release title**: `🎉 DRG Web应用 v1.0.0 - 首次发布`
   - **Description**: 
     ```markdown
     ## 🎉 首次发布

     ### ✨ 主要功能
     - 现代化Web界面，基于Bootstrap 5
     - 实时DRG分组功能（北京2022版）
     - 前端和后端双重数据验证
     - RESTful API接口
     - 响应式设计，支持移动端

     ### 🛠️ 技术栈
     - Flask 3.1.2后端框架
     - Bootstrap 5 + JavaScript前端
     - uv工具依赖管理
     - Apache 2.0许可证

     ### 🚀 快速开始
     1. 下载并解压源码
     2. 运行 `./start_web.sh` (Linux/Mac) 或 `start_web.cmd` (Windows)
     3. 在浏览器中访问 http://localhost:8080

     基于OpenDRG项目开发，为医院信息系统提供现代化的DRG分组界面。
     ```

## 🌟 项目推广

### README优化

确保README包含：
- [x] 项目徽章（License、Python版本等）
- [x] 清晰的功能描述
- [x] 安装和使用说明
- [x] 截图或演示GIF
- [x] API文档
- [x] 贡献指南
- [x] 许可证信息

### 社区推广

1. **提交到awesome列表**：
   - [awesome-python](https://github.com/vinta/awesome-python)
   - [awesome-flask](https://github.com/humiaozuzu/awesome-flask)
   - [awesome-healthcare](https://github.com/kakoni/awesome-healthcare)

2. **发布到社区**：
   - Python中文社区
   - 医疗信息化论坛
   - 开源中国
   - 掘金技术社区

3. **创建演示站点**：
   - 部署到Heroku/Railway/Vercel
   - 提供在线演示链接

## 📈 项目维护

### 定期更新

1. **代码维护**：
   - 定期更新依赖包
   - 修复已知问题
   - 添加新功能

2. **文档维护**：
   - 更新README
   - 维护CHANGELOG
   - 完善API文档

3. **社区互动**：
   - 回复Issues
   - 审核Pull Requests
   - 发布新版本

### 监控指标

- ⭐ Star数量
- 🍴 Fork数量
- 📊 下载量
- 🐛 Issue数量
- 👥 贡献者数量

## 💰 商业化准备

### 开源版本功能

- ✅ 基础DRG分组功能
- ✅ Web界面操作
- ✅ API接口
- ✅ 单机部署

### 商业版本规划

- 🔒 用户管理系统
- 🔒 批量处理功能
- 🔒 数据库集成
- 🔒 云端部署
- 🔒 技术支持

### 许可证策略

- **开源版本**：Apache 2.0许可证
- **商业版本**：商业许可证
- **企业版本**：定制许可证

## 📞 联系方式

在项目推广时，记得更新：
- GitHub个人资料
- 项目联系邮箱
- 技术支持方式
- 商务合作联系

---

## 🧑‍💻 本地开发与端口说明（uv）

建议使用 uv 进行本地开发与依赖管理，依赖以 `pyproject.toml` 为准。

```bash
# 在项目根目录创建虚拟环境
uv venv

# 激活虚拟环境（macOS/Linux）
source .venv/bin/activate

# 安装/同步依赖
uv sync

# 启动应用（默认端口 8080）
./start_web.sh

# 如需修改端口
export PORT=9000 && ./start_web.sh
```

> 访问地址：`http://localhost:8080`（或你指定的端口）

**祝你的开源项目成功！** 🎉
