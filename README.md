# DRG分组器Web应用

🏥 **现代化的DRG诊断相关分组Web界面**

基于OpenDRG项目开发的Web应用，为DRG分组器提供友好的用户界面，让用户可以通过网页直接输入诊断信息进行DRG分组。

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Python](https://img.shields.io/badge/Python-3.9%2B-green.svg)](https://python.org)
[![Flask](https://img.shields.io/badge/Flask-2.3%2B-red.svg)](https://flask.palletsprojects.com)

## ✨ 主要特性

- 🎨 **现代化界面**：采用Bootstrap 5设计，响应式布局，支持移动端
- ⚡ **实时分组**：输入数据后即时进行DRG分组计算
- 🔍 **数据验证**：前端和后端双重数据验证，确保输入准确性
- 📊 **详细结果**：显示完整的分组过程和结果信息
- 🚀 **易于部署**：使用uv工具管理依赖，一键启动
- 🌍 **多版本支持**：支持多个地区的DRG分组方案

## 🛠️ 技术栈

- **后端**：Flask 2.3+
- **前端**：HTML5 + CSS3 + JavaScript + Bootstrap 5
- **Python版本**：3.9+
- **包管理**：uv工具
- **核心算法**：基于OpenDRG项目

## 🚀 快速开始

### 环境要求

- Python 3.9+
- uv工具

### 安装uv工具

```bash
# macOS/Linux
curl -LsSf https://astral.sh/uv/install.sh | sh

# Windows (PowerShell)
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

### 启动应用

```bash
# Linux/Mac
./start_web.sh

# Windows
start_web.cmd
```

### 访问应用

在浏览器中打开：**http://localhost:8080**（默认端口 8080，可通过环境变量 `PORT` 覆盖）

> 注：当前仓库内置分组器为“北京2022版”。README 中提及的其他地区/版本属于规划项，尚未在本仓库实现切换。

## 📱 界面预览

![DRG Web界面](https://via.placeholder.com/800x600/667eea/ffffff?text=DRG分组器Web界面)

## 📋 使用说明

### 输入字段

- **病案号** *（必填）*：病案的唯一标识符
- **性别** *（必填）*：1=男，2=女
- **年龄** *（必填）*：患者年龄（岁）
- **住院天数** *（必填）*：患者住院的总天数
- **离院方式** *（必填）*：1-医嘱离院，2-医嘱转院，3-转社区，4-非医嘱离院，5-死亡，9-其他
- **诊断列表** *（必填）*：使用ICD-10标准编码，多个诊断用"|"分隔
- **手术操作列表**：使用ICD-9-CM-3标准编码，多个手术用"|"分隔

### 示例数据

```
病案号：22058878
性别：2（女）
年龄：88
住院天数：94
离院方式：1（医嘱离院）
诊断列表：K22.301|K11.901|E11.900|I10.x05
手术操作列表：96.0800x005
```

**预期结果：**
- MDC：MDCG（肝胆胰疾病）
- ADRG：GZ1
- DRG：GZ13（伴并发症或合并症）

## 🔧 API接口

### POST /api/group
DRG分组接口

**请求示例：**
```json
{
  "index": "22058878",
  "gender": "2",
  "age": "88",
  "inHospitalTime": "94",
  "leavingType": "1",
  "zdList": "K22.301|K11.901|E11.900|I10.x05",
  "ssList": "96.0800x005"
}
```

**响应示例：**
```json
{
  "success": true,
  "data": {
    "index": "22058878",
    "status": "分组成功",
    "mdc": "MDCG",
    "adrg": "GZ1",
    "drg": "GZ13",
    "messages": ["K22.301 食管破裂", "分组过程详情..."]
  }
}
```

## 🧪 测试

运行测试脚本：
```bash
uv run python tests/test_app.py
```

预期输出：
```
🎉 所有测试通过！Web应用运行正常
```

## 🧑‍💻 开发指南

- 使用 uv 管理环境与依赖（以 `pyproject.toml` 为唯一依赖来源；`requirements.txt` 仅作参考或导出用途）：

```bash
# 创建并激活虚拟环境
uv venv && source .venv/bin/activate

# 同步依赖
uv sync

# 代码格式化
uv run black .

# 代码静态检查
uv run flake8

# 类型检查（示例）
uv run mypy drg_group app.py

# 运行测试（支持根目录与 tests/）
uv run pytest -q
```

## 📁 项目结构

```
drg-web-app/
├── app.py                 # Flask主应用
├── templates/
│   └── index.html        # 前端页面模板
├── drg_group/            # DRG分组器核心模块
│   └── beijing_2022/     # 北京2022版分组器
├── tests/               # 测试目录
│   └── test_app.py      # 测试脚本
├── start_web.sh          # Linux/Mac启动脚本
├── start_web.cmd         # Windows启动脚本
├── pyproject.toml        # 项目配置
├── requirements.txt      # 依赖参考
├── .gitignore           # Git忽略文件
└── README.md            # 项目说明
```

## 🎯 分组结果说明

### MDC分类（主要诊断大类）
- **MDCA**：神经系统疾病
- **MDCB**：眼部疾病
- **MDCC**：耳鼻咽喉口腔疾病
- **MDCD**：呼吸系统疾病
- **MDCE**：循环系统疾病
- **MDCF**：消化系统疾病
- **MDCG**：肝胆胰疾病
- **...更多MDC分类**

### DRG组编号规则
- **第1位**：MDC字母（A-Z）
- **第2-3位**：ADRG组号（A1-Z9）
- **第4位**：严重程度
  - **1**: 伴严重并发症或合并症（MCC）
  - **3**: 伴并发症或合并症（CC）
  - **5**: 不伴并发症或合并症
  - **9**: 特殊情况

## ⚠️ 故障排除

### 端口占用问题
如果遇到"Address already in use"错误：

1. **macOS用户**：关闭系统偏好设置中的AirPlay接收器
2. **更换端口**：设置环境变量 `export PORT=9000`
3. **查看占用**：使用 `lsof -i :8080` 查看端口占用

### 模块导入失败
确保项目目录结构完整，特别是 `drg_group` 目录包含必要的文件。

## 🤝 贡献

欢迎提交Issue和Pull Request！

1. Fork本项目
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开Pull Request

## 🚀 开发路线图

### v1.1.0（计划中）
- [ ] 批量文件处理功能
- [ ] 历史记录查询
- [ ] 数据导出功能
- [ ] 多版本DRG分组器切换

### v1.2.0（计划中）
- [ ] 用户管理系统
- [ ] 数据可视化图表
- [ ] 移动端优化
- [ ] 数据库集成

### v2.0.0（长期规划）
- [ ] 企业级功能
- [ ] 多租户支持
- [ ] HIS系统集成
- [ ] 商业化版本

## 📄 许可证

本项目基于Apache 2.0许可证开源 - 详见 [LICENSE](LICENSE) 文件

## 🙏 致谢

- 感谢OpenDRG项目提供的核心算法
- 感谢国家医保局CHS-DRG标准
- 感谢所有贡献者和用户反馈

## 📞 联系方式

- 项目地址：`https://github.com/Joe-rq/drg-web-app`
- 问题反馈：`https://github.com/Joe-rq/drg-web-app/issues`
- 邮箱：`qrq-hit@foxmail.com`

---

*基于OpenDRG项目开发，为医院信息系统提供现代化的DRG分组界面。*
