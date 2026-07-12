# AI Learning Workspace Template

## 项目目标

你将作为本项目的架构师、技术负责人和长期协作者，与我共同设计并开发一个 **AI Learning Workspace Template**。

本项目不是一次性的脚本，而是一个可长期维护、持续迭代、适用于任何技术领域自学的模板仓库。

适用范围包括但不限于：

* C++
* Python
* Rust
* Go
* Linux
* Docker
* Kubernetes
* OpenGL
* Vulkan
* Unreal Engine
* 操作系统
* 计算机网络
* 算法
* AI

最终目标：

> **复制模板 → 修改少量配置 → 即可开始新的学习项目。**

---

# 设计原则

整个模板应遵循以下原则：

* 高内聚
* 低耦合
* 配置驱动
* 易维护
* 易扩展
* 易迁移
* 保持简单

避免过度设计。

如果发现比我提出的方案更合理的设计，请主动提出，并说明原因、优缺点及影响，而不是机械执行。

---

# 开发方式

采用迭代开发。

不要一次生成整个仓库。

按照以下流程进行：

```text
Architecture
    ↓
Specification
    ↓
Implementation
    ↓
Review
    ↓
Refactor
```

每完成一个阶段后暂停，等待确认再继续。

---

# 仓库目标

模板应包含完整的 AI 自学工作区，包括：

* 学习路线（Roadmap）
* 学习日志（Journal）
* 知识笔记（Notes）
* 项目实践（Projects）
* Prompt Library
* Claude Code 配置
* VS Code 配置
* 自动化脚本
* 通用文档

所有设计均应面向长期学习，而非某一种编程语言。

---

# 推荐目录结构

```text
{{WORKSPACE_NAME}}/
│
├── README.md
├── roadmap.md
├── Learning.code-workspace
├── config.json
├── .gitignore
│
├── .claude/
│   ├── CLAUDE.md
│   ├── commands/
│   └── templates/
│
├── .vscode/
│
├── docs/
│
├── notes/
│
├── journal/
│
├── exercises/
│
├── projects/
│
├── review/
│
├── snippets/
│
├── resources/
│
├── prompts/
│
└── scripts/
```

所有目录均应保持职责单一。

不同目录之间避免功能重叠。

---

# 目录设计

目录名称不得写死。

应允许用户根据不同学习场景自定义。

例如：

```text
notes
↓
knowledge

projects
↓
labs

journal
↓
learning-log

resources
↓
references
```

最终统一由 PowerShell 脚本完成目录重命名及引用更新。

---

# 占位符规范

整个模板统一使用占位符。

例如：

```text
{{WORKSPACE_NAME}}
{{LANGUAGE}}
{{GOAL}}
{{AUTHOR}}
{{PROJECT_NAME}}
{{DATE}}
{{LEARNING_DAYS}}
```

模板中不要直接写具体内容。

所有占位符均应支持 PowerShell 自动替换。

---

# CLAUDE.md

CLAUDE.md 仅保存长期有效的项目规则。

例如：

* Agent 角色
* 教学原则
* Code Review 原则
* 项目原则
* 沟通风格

不要写：

* 每日学习计划
* 临时 Prompt
* 当前项目状态

这些内容应由 Prompt 或学习日志维护。

---

# Prompt Library

Prompt Library 保持轻量、模块化，仅保留六种核心模式。

## Planner

负责：

* 学习路线规划
* 项目拆分
* 阶段目标制定
* 学习复盘
* 下一阶段建议

---

## Teacher

负责：

* 知识讲解
* 示例说明
* 练习设计
* 概念答疑

遵循：

> 概念 → 示例 → 练习 → 总结

每次只推进一个知识点。

---

## Coach

负责：

* 编码指导
* Debug 提示
* 思路引导

原则：

优先提示，不直接给完整答案。

只有我明确要求时，才提供完整实现。

---

## Reviewer

负责：

* Code Review
* Bug 分析
* 可读性
* 可维护性
* 性能建议
* 最佳实践

先解释问题，再提出修改建议。

不要直接重写整个项目。

---

## Journal

负责生成学习记录。

包括：

* 今日总结
* 今日重点
* 今日问题
* 知识漏洞
* 明日建议

统一输出 Markdown。

---

## Quiz

负责生成学习测试。

包括：

* 概念理解
* 代码阅读
* Debug
* 编程练习

默认不直接提供答案。

完成后负责讲解与评分。

---

# VS Code

模板应支持：

* Multi-root Workspace
* Claude Code
* Git
* 多项目学习

IDE 聚焦当前项目。

Agent 能访问整个学习仓库。

---

# 自动化脚本

提供一个轻量级 PowerShell 脚本。

负责：

* Workspace 重命名
* 自定义目录名称
* 占位符替换

保持简单，不设计复杂模块。

---

# 文档

模板应包含统一风格的文档，例如：

* Learning Methodology
* Workspace Guide
* Prompt Guide
* Review Checklist
* Coding Style
* Architecture

文档之间避免重复。

---

# 输出要求

每完成一个文件或模块时，请：

1. 说明设计目标。
2. 解释关键设计决策。
3. 给出未来扩展方向。

完成后暂停，等待确认，再继续下一部分。

---

# 协作原则

你不仅是执行者，也是项目设计者。

当发现更好的实现方式时，应主动提出方案，对比优缺点，并说明推荐理由。

如果我的设计存在明显问题，应直接指出，并给出更合理的替代方案。

我们的目标不是最快完成，而是共同构建一个真正优秀、长期可维护、可复用、适用于任何技术领域的 **AI Learning Workspace Template**。
