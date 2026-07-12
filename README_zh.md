<!--
  ╔══════════════════════════════════════════════════════════╗
  ║  这是模板文件。所有 {{PLACEHOLDER}} 占位符将在你       ║
  ║  编辑 config.json 后由 scripts/init.ps1 自动替换。      ║
  ║  见下方「快速开始」。                                    ║
  ╚══════════════════════════════════════════════════════════╝
-->

# AI Learning Workspace Template

<p align="center">
  <b>配置驱动、AI 加持的自学工作区模板。</b><br>
  克隆 → 配置 → 开始学习。适用于任何编程语言、框架或技术领域。
</p>

<p align="center">
  <a href="#license"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT"></a>
  <a href="#前置要求"><img src="https://img.shields.io/badge/powershell-5.1%2B-blue.svg" alt="PowerShell 5.1+"></a>
  <a href="#前置要求"><img src="https://img.shields.io/badge/vscode-1.80%2B-blue.svg" alt="VS Code 1.80+"></a>
</p>

> 运行 `init.ps1` 后，本页面将变为你项目的 README，包含以下标题、目标和目录结构。

---

## 你的项目

*运行 `init.ps1` 后，下方占位符将替换为你自己的项目信息。在 GitHub 上此处展示模板默认值 —— 克隆、配置、即可使用。*

> **{{WORKSPACE_TITLE}}**
>
> *{{GOAL}}*
>
> {{AUTHOR}} · 开始于 {{START_DATE}} · {{DURATION}} · 每日 ~{{DAILY_HOURS}} 小时

---

## 为什么你需要这个模板？

自学最难的不是学，而是**组织**。

没有结构 → 在教程之间漂流。没有反思 → 学完就忘。没有规划 → 不知道下一步学什么。没有反馈 → 在错误的路上走太远。

这个模板给你一个**完整的学习工作区**——目录结构、六种 AI Prompt、日记系统、自动化脚本——你只需要专注于学习本身。它专为 [Claude Code](https://code.visualstudio.com/) 设计，将 Claude 变成你的私人规划师、讲师、教练、代码审查员、日记助手和测验官。

**适用于任何技术领域：** C++、Python、Rust、Go、Linux、Docker、Kubernetes、OpenGL、Vulkan、Unreal Engine、操作系统、计算机网络、算法、AI —— 无论你想学什么。

---

## 功能亮点

- **六种 AI 斜杠命令** —— `/planner`（规划）、`/teacher`（教学）、`/coach`（指导）、`/reviewer`（审查）、`/journal`（日记）、`/quiz`（测验）——每种对应学习闭环的一个阶段
- **配置驱动** —— 编辑一个 `config.json`，运行一条命令，所有文件自动个性化
- **目录名可自定义** —— 把 `notes` 改为 `knowledge`，`projects` 改为 `labs`，或任何你喜欢的名字。所有引用自动更新
- **内置日记系统** —— 每日反思，结构化 Markdown 模板。Claude 提问引导反思，然后生成日记
- **学习路线追踪** —— 里程碑、周复盘、进度日志全部在一个文件中
- **零硬编码** —— 每个目录引用、工作区名称、个人设置都使用 `{{PLACEHOLDER}}` 占位符，由单个 PowerShell 脚本统一替换
- **语言无关** —— 适用于编程语言、DevOps、游戏引擎、计算机理论——任何你想学的领域
- **双语支持** —— 提供中英文文档

---

## 快速开始

### 1. 复制模板

```bash
git clone https://github.com/cw-peng/self-learning.git my-learning
cd my-learning
rm -rf .git && git init    # 全新开始——这是你的学习仓库
```

### 2. 编辑 config.json

打开 `config.json`，最少修改以下字段：

```jsonc
{
  "workspace": {
    "name": "cpp-learning",
    "title": "C++ 深度学习之旅",
    "author": "你的名字",
    "language": "C++",
    "goal": "精通 C++20 并从零构建游戏引擎",
    "startDate": "2026-07-12",
    "estimatedDuration": "90 天"
  }
}
```

### 3. 运行初始化脚本

```powershell
# 建议先预览变更
.\scripts\init.ps1 -DryRun

# 确认无误后正式执行
.\scripts\init.ps1
```

### 4. 打开并开始学习

```bash
code Learning.code-workspace
```

然后调用你的第一个 AI 命令：

```
/planner "为我的学习目标创建路线图"
```

---

## 工作原理

```
                   ┌─────────────────┐
                   │   config.json   │  ← 你编辑这个文件
                   └───────┬─────────┘
                           │
                           ▼
                   ┌─────────────────┐
                   │   init.ps1      │  ← 一个脚本，一次运行
                   │                 │
                   │ 1. 读取配置     │
                   │ 2. 重命名目录   │
                   │ 3. 替换所有     │
                   │    {{X}} 占位符 │
                   └───────┬─────────┘
                           │
                           ▼
              ┌─────────────────────────┐
              │  个性化工作区            │  ← 开箱即用
              │  - README 署名          │
              │  - CLAUDE.md 含语言     │
              │    和专业领域           │
              │  - 所有 Prompt 注入     │
              │    你的学习上下文       │
              │  - 自定义目录名         │
              └─────────────────────────┘
```

所有含 `{{PLACEHOLDER}}` 的文件——README、CLAUDE.md、六种 Prompt、日记模板、文档——会在一次运行中被替换为你在 `config.json` 中填入的值。上下文占位符（如 `{{DATE}}`、`{{TODAY_SUMMARY}}`）会保留，供日常手动或 AI 填充。

---

## 工作区结构

```
{{WORKSPACE_NAME}}/
├── README.md                  ← 项目说明（初始化后：已个性化）
├── README_zh.md               ← 中文说明
├── roadmap.md                 ← 你的学习路线（用 /planner 维护）
├── Learning.code-workspace    ← VS Code 多根工作区
├── config.json                ← 唯一配置来源（先编辑这个）
├── .gitignore
│
├── .claude/
│   ├── CLAUDE.md              ← AI 长期规则（稳定，不含每日计划）
│   ├── commands/              ← 六个斜杠命令（/planner 等）
│   │   ├── planner.md
│   │   ├── teacher.md
│   │   ├── coach.md
│   │   ├── reviewer.md
│   │   ├── journal.md
│   │   └── quiz.md
│   └── templates/             ← 内容模板（日记、复盘、笔记）
│
├── .vscode/                   ← 共享编辑器设置与扩展推荐
│
├── {{DIR_DOCS}}/              ← 7 份文档
├── {{DIR_NOTES}}/             ← 你的知识库（一个概念一个文件）
├── {{DIR_JOURNAL}}/           ← 每日学习日记
├── {{DIR_EXERCISES}}/         ← 练习题
├── {{DIR_PROJECTS}}/          ← 项目实践
├── {{DIR_REVIEW}}/            ← 每周与里程碑复盘
├── {{DIR_SNIPPETS}}/          ← 可复用代码片段
├── {{DIR_RESOURCES}}/         ← 精选参考资料
├── {{DIR_PROMPTS}}/           ← Prompt 目录（人类可读）
└── {{DIR_SCRIPTS}}/           ← 自动化脚本
```

所有目录名均可在 `config.json` 中自定义。把 `notes` 改为 `knowledge`，所有文件中的引用同步更新。

---

## 六种 AI Prompt

每种 Prompt 都是一个 Claude Code 斜杠命令。它们共同构成完整的学习闭环：

```
规划  →  学习  →  练习  →  审查  →  记录  →  测试
  ↑                                                    │
  └────────────────────────────────────────────────────┘
```

| 命令 | 角色 | 功能 |
|------|------|------|
| `/planner` | 战略规划师 | 路线图、里程碑、进度复盘、周计划 |
| `/teacher` | 概念讲师 | 一次一个概念：概念 → 示例 → 练习 → 总结 |
| `/coach` | 编码教练 | 四级递进提示（提问→方向→片段→答案），不直接给答案 |
| `/reviewer` | 代码审查员 | 审查优先级：正确性 > 可读性 > 性能 > 可维护性 |
| `/journal` | 日记助手 | 逐个提问引导反思，生成 `YYYY-MM-DD.md` 日记 |
| `/quiz` | 测验官 | 3-5 题，涵盖概念理解、代码阅读、排错、编程 |

**常见场景的 Prompt 组合：**

| 场景 | 调用顺序 |
|------|----------|
| 开始新主题 | `/planner` → `/teacher` → `/coach` → `/journal` |
| 卡在代码上 | `/coach` → `/reviewer` → `/journal` |
| 项目完成 | `/reviewer` → `/journal` → `/quiz` |
| 每周复盘 | `/journal`（回顾日记）→ `/planner "周复盘"` |

完整 Prompt 指南：[{{DIR_DOCS}}/prompt-guide.md]({{DIR_DOCS}}/prompt-guide.md)

---

## 前置要求

| 工具 | 版本 | 验证方式 |
|------|------|----------|
| [Git](https://git-scm.com/) | 2.30+ | `git --version` |
| [VS Code](https://code.visualstudio.com/) | 1.80+ | `code --version` |
| [Claude Code](https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code) | 最新版 | VS Code 扩展 |
| [PowerShell](https://learn.microsoft.com/powershell/) | 5.1+ | `$PSVersionTable.PSVersion` |

---

## 文档

| 文档 | 主题 |
|------|------|
| [工作区指南]({{DIR_DOCS}}/workspace-guide.md) | 配置、config.json 详解、故障排除 |
| [学习方法论]({{DIR_DOCS}}/learning-methodology.md) | 学习闭环、每日流程、日记使用 |
| [Prompt 指南]({{DIR_DOCS}}/prompt-guide.md) | 六种 Prompt 的深入用法 |
| [审查清单]({{DIR_DOCS}}/review-checklist.md) | 代码审查与学习复审标准 |
| [编码风格]({{DIR_DOCS}}/coding-style.md) | 语言无关规范 + 语言特定模板 |
| [架构说明]({{DIR_DOCS}}/architecture.md) | 设计理念与扩展指南 |

---

## 参与贡献

本模板设计为持续演进。如果你有想法：

1. 提交 Issue 讨论变更
2. 保持简单——模板的优势在于精简
3. 结构变更请参考[架构说明]({{DIR_DOCS}}/architecture.md)

---

## License

[MIT](LICENSE) —— 自由用于个人或商业学习项目。

---

<p align="center">
  <sub>为好奇的学习者构建。由 Claude Code 驱动。</sub>
</p>
