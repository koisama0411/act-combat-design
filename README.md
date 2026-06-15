# ⚔️ act-combat-design

**二次元 / 动作游戏（ACT）战斗设计专家** —— 一套可被任意 AI agent（Claude / GPT / Cursor…）使用的**战斗设计方法论 + 行业知识库**。

A **project-agnostic combat-design methodology + industry knowledge base** for anime / action games, usable by any AI agent (Claude, GPT, Cursor, …).

> 📖 **新手先看**：用浏览器打开 [`上手指南.html`](上手指南.html) —— 一份给人读的图文上手指南（是什么 / 优点 / 知识库 / 能做什么 / 怎么用）。

---

## 这是什么 · What is this

把"设计一个动作游戏角色 / Boss"这件事，沉淀成一套可复用的方法论：**收集设计输入 → 出高层框架 → 逐招展开 → 拆动作 / 特效 / 程序需求 → 整合成可审阅文档**。背后配一座行业知识库（角色原型、Boss 范式、42 条元规则、70+ 游戏借鉴库、打击感 / 数值 / Boss AI 工程基线）。

It turns "designing an action-game character or boss" into a repeatable workflow, backed by an industry knowledge base (character archetypes, boss paradigms, 42 meta-rules, a 70+ game cross-reference library, and engineering baselines for hit-feel, numbers and boss AI).

## 🔑 为什么"项目无关" · Why project-agnostic

> 这是本仓和"某个公司私有规范"的关键区别。

本方法论**不预设任何一套战斗体系**。招式集要有几类招、用什么视觉预警、受击状态怎么分、帧率多少、有没有配队 / 抽卡养成——**全部由你的项目自己定义**，写在 [`conventions/TEMPLATE.md`](conventions/TEMPLATE.md) 里。AI 会按你填的约定来设计，而不是套用别项目的体系。

This methodology imposes **no fixed combat system**. Your moveset, telegraph language, hit-react states, frame rate, team model and progression are all **defined by your project** in [`conventions/TEMPLATE.md`](conventions/TEMPLATE.md). The AI designs to *your* conventions, not someone else's.

## 📦 包含什么 · What's inside

- **方法论核心**：设计文档结构 / 招式集设计法 / 5 维质量标尺 / 42 条元规则 + 机制创新 5 步法 / 16 条反模式自检
- **设计库**：角色机制原型库、Boss 设计范式库（各含业界 30+ 游戏抽象）
- **横向知识**：跨游戏借鉴库（70+ 游戏，按主题索引）、配队设计方法论 + 案例库 + 2024–2026 二游趋势调研
- **工程基线**：打击感技术参数、数值与养成公式、Boss AI 与场地参战
- **产出工具链**：审阅级 HTML 设计文档范式（含空白模板）、特效需求规范、资源需求 xlsx 生成脚本
- **填空模板 + 示例**：[`conventions/TEMPLATE.md`](conventions/TEMPLATE.md) + 一个虚构示例项目 + 完整示例「[苍岚](output/characters/cang-lan/md/苍岚-战斗设计.md)」（角色）和「[孤鸦](output/bosses/gu-ya/)」（Boss，含审阅 HTML + 落地资源需求）

> 📝 知识库正文为**中文**；入口文档（本 README / USAGE / SKILL）中英双语。
> The knowledge base is written in **Chinese**; entry docs (this README / USAGE / SKILL) are bilingual.

## 🗂️ 目录结构 · Structure

```
act-combat-design/
├─ SKILL.md                 # 方法论入口（6 Phase 流程 + 引用索引）
├─ USAGE.md                 # 怎么喂给 Claude Code / GPT / Cursor / Claude.ai
├─ conventions/
│  ├─ TEMPLATE.md           # ★ 留空模板：定义你项目的战斗约定
│  └─ example-conventions.md# 填好的范例（虚构示例项目）
├─ references/              # 知识库（方法论 + 行业知识 + 工程基线 + 产出工具链）
├─ templates/               # 空白模板:审阅级 HTML + 落地资源需求(输入)
├─ scripts/                 # xlsx inspect / 生成脚本(Windows-only)
└─ output/                  # 产出区:characters/<单位> & bosses/<单位>；自带 cang-lan、gu-ya 示例(可删)
```

## 🚀 快速开始 · Quick start

1. **读 [`USAGE.md`](USAGE.md)**，按你用的 AI 工具选加载方式。
2. **填 [`conventions/TEMPLATE.md`](conventions/TEMPLATE.md)**（或让 AI 帮你填）——定义你项目的战斗约定。
3. 跟 AI 说「**设计 XXX 角色**」或「**设计 XXX Boss**」，按 6 Phase 流程走。
4. 想看样板 → [`output/characters/cang-lan/md/苍岚-战斗设计.md`](output/characters/cang-lan/md/苍岚-战斗设计.md)（Boss 示例见 [`output/bosses/gu-ya/`](output/bosses/gu-ya/)）。

## 🤖 适配任意 AI agent · Works with any agent

- **Claude Code**：作为 skill 安装；说「设计 XXX 角色」/「设计 XXX Boss」/「做 XXX 战斗设计」/「设计 XXX 怪物」/「战斗策划专家」等关键词即**自动触发**（触发词定义在 `SKILL.md` 顶部 frontmatter，可自行增改）。
- **GPT / ChatGPT、Claude.ai、Cursor 等**：**无自动触发** —— 按 [`USAGE.md`](USAGE.md) 把 `SKILL.md` + 你的约定当 system prompt / 上传文件加载好，然后直接说「帮我设计一个 XX 角色 / Boss」即可，AI 按需读 `references/`。

## 📄 License

[MIT](LICENSE)。知识库中引用的数十款商业游戏均为**研究 / 评论性引用**，仅作设计参考。
The commercial games referenced throughout are cited for research / commentary purposes only.
