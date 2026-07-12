# {{WORKSPACE_TITLE}}

> **{{GOAL}}**
>
> **作者：** {{AUTHOR}} | **开始：** {{START_DATE}} | **周期：** {{DURATION}} | **每日：** ~{{DAILY_HOURS}} 小时

---

## 快速开始

```bash
# 1. 克隆或复制此模板
git clone <repo-url> {{WORKSPACE_NAME}}
cd {{WORKSPACE_NAME}}

# 2. 编辑 config.json（填入你的名字、学习语言、目标）
# 3. 运行初始化脚本
.\{{DIR_SCRIPTS}}\init.ps1

# 4. 在 VS Code 中打开
code Learning.code-workspace
```

详细配置说明见 [{{DIR_DOCS}}/workspace-guide.md]({{DIR_DOCS}}/workspace-guide.md)。

---

## 工作区地图

| 目录 | 用途 | 使用时机 |
|------|------|----------|
| [{{DIR_NOTES}}/]({{DIR_NOTES}}/) | 知识笔记 | 学习一个概念后 — 用自己的话写下来 |
| [{{DIR_JOURNAL}}/]({{DIR_JOURNAL}}/) | 学习日志 | 每次学习结束 — 反思并记录 |
| [{{DIR_EXERCISES}}/]({{DIR_EXERCISES}}/) | 练习题 | 学习过程中 — 立即应用所学 |
| [{{DIR_PROJECTS}}/]({{DIR_PROJECTS}}/) | 项目实践 | 掌握基础后 — 构建实际项目 |
| [{{DIR_REVIEW}}/]({{DIR_REVIEW}}/) | 复盘记录 | 每周 — 评估进度，调整计划 |
| [{{DIR_SNIPPETS}}/]({{DIR_SNIPPETS}}/) | 代码片段 | 随时 — 保存可复用的模式 |
| [{{DIR_RESOURCES}}/]({{DIR_RESOURCES}}/) | 参考资料 | 随时 — 收藏有价值的链接和教程 |
| [{{DIR_PROMPTS}}/]({{DIR_PROMPTS}}/) | Prompt 目录 | 参考 — 浏览 AI Prompt 及用法 |
| [{{DIR_DOCS}}/]({{DIR_DOCS}}/) | 文档 | 配置和参考 — 理解工作区 |
| [{{DIR_SCRIPTS}}/]({{DIR_SCRIPTS}}/) | 自动化脚本 | 仅初始化时 — 配置工作区 |

---

## 学习闭环

```
规划  →  学习  →  练习  →  审查  →  记录  →  测试
  ↑                                                    │
  └────────────────────────────────────────────────────┘
```

| 阶段 | 工具 | 命令 |
|------|------|------|
| 规划 | Planner | `/planner "接下来学什么？"` |
| 学习 | Teacher | `/teacher "解释 [概念]"` |
| 练习 | Coach | `/coach "我卡在了..."` |
| 审查 | Reviewer | `/reviewer "审查这段代码"` |
| 记录 | Journal | `/journal` |
| 测试 | Quiz | `/quiz "主题：[我刚学的内容]"` |

---

## 开始学习

1. **确定方向：** `/planner "为 {{GOAL}} 创建学习路线图"`
2. **学习第一个概念：** `/teacher "解释 [{{LANGUAGE}} 的基础概念]"`
3. **写代码：** 在 `{{DIR_EXERCISES}}/` 中练习所学内容
4. **反思记录：** `/journal` 记录第一篇学习日志

---

## 前置要求

- [Git](https://git-scm.com/) 2.30+
- [VS Code](https://code.visualstudio.com/) 1.80+
- [Claude Code](https://code.visualstudio.com/)（VS Code 扩展）
- [PowerShell](https://learn.microsoft.com/powershell/) 5.1+

---

## 设计原则

本模板遵循以下原则：

- **高内聚** — 同一目录内的文件具有强主题关联
- **低耦合** — 一个目录的变更很少影响其他目录
- **配置驱动** — `config.json` 是唯一的配置来源，零硬编码
- **易维护** — 每个文件职责单一，无巨型文档
- **易扩展** — 新增 Prompt、目录或配置项不破坏现有结构
- **保持简单** — 一个自动化脚本、六种 Prompt、七份文档

---

*基于 [AI Learning Workspace Template](https://github.com/) 构建。设计理念见 [{{DIR_DOCS}}/architecture.md]({{DIR_DOCS}}/architecture.md)。*
