# ⚔️ act-combat-design

**二次元 / 动作游戏（ACT）战斗设计专家** —— 一套可被任意 AI agent（Claude / GPT / Cursor…）使用的**战斗设计方法论 + 行业知识库**。

A **project-agnostic combat-design methodology + industry knowledge base** for anime / action games, usable by any AI agent (Claude, GPT, Cursor, …).

> 📖 **新手先看**：用浏览器打开 [`上手指南.html`](上手指南.html) —— 一份给人读的图文上手指南（是什么 / 优点 / 知识库 / 能做什么 / 怎么用）。
>
> 🆕 **每次更了啥** → [`CHANGELOG.md`](CHANGELOG.md)（渲染版 [`CHANGELOG.html`](CHANGELOG.html)）。

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
- **产出工具链**：审阅级 HTML 设计文档范式（含空白模板）、效果与养成设计范式、特效需求规范、资源需求 xlsx 生成脚本
- **填空模板 + 示例**：[`conventions/TEMPLATE.md`](conventions/TEMPLATE.md) + **两个虚构示例项目**（买断制《孤刃行》 + gacha《星澜纪》） + 完整示例「[苍岚](output/characters/cang-lan/md/苍岚-战斗设计.md)」（角色）和「[孤鸦](output/bosses/gu-ya/)」（Boss，含审阅 HTML + 落地资源需求）

> 📝 知识库正文为**中文**；入口文档（本 README / USAGE / SKILL）中英双语。
> The knowledge base is written in **Chinese**; entry docs (this README / USAGE / SKILL) are bilingual.

## 🎨 能产出什么 · What it produces

三类设计对象，都先出 markdown 草稿、确认后**默认配一份审阅级 HTML**（可评审 / 导出回传）：

- **🧍 玩家角色** —— 核心机制 + 逐招玩法（普攻 / 特殊技 / 闪避 / 大招…）、动作帧 / 特效 / 程序需求、推荐配队 + 养成方向。
- **👹 怪物 / Boss** —— 阶段化框架、技能详情表、AI 与连招策略、动作 / 特效 / 程序需求；含双场战范式。
- **📈 效果与养成** —— 给已有角色单独展开：技能附带效果、命座 / 养成物解锁、属性投放、数值建模验证（带图示 + 「怎么算 / 为什么 / 过程 / 结果」注解；gacha 适用）。

> 每类都走「设计稿（评审用）+ 资源需求（落地用）」两个产出方向，互不淹没。

## 🗂️ 目录结构 · Structure

```
act-combat-design/
├─ 上手指南.html            # 图文上手指南（浏览器打开先看这个）
├─ SKILL.md                 # 方法论入口（6 Phase 流程 + 引用索引）
├─ USAGE.md                 # 怎么喂给 Claude Code / GPT / Cursor / Claude.ai
├─ CHANGELOG.md / .html     # 更新记录（每次更了啥）
├─ conventions/
│  ├─ TEMPLATE.md                   # ★ 留空模板：定义你项目的战斗约定
│  ├─ example-conventions.md        # 买断制范例《孤刃行》
│  └─ example-conventions-gacha.md  # gacha 范例《星澜纪》
├─ references/              # 知识库（方法论 + 行业知识 + 工程基线 + 产出工具链）
├─ templates/               # 空白模板:审阅级 HTML + 落地资源需求(输入)
├─ scripts/                 # xlsx inspect / 生成脚本(Windows-only)
├─ output/                  # 产出区:characters/<单位> & bosses/<单位>；自带 cang-lan、gu-ya 示例(可删)
└─ knowledge-local/         # ★ 本地知识区:自我更新(🧪试验性·默认关闭)+ 项目指定知识；不进 git
```

## 🚀 快速开始 · Quick start

1. **读 [`USAGE.md`](USAGE.md)**，按你用的 AI 工具选加载方式。
2. **填 [`conventions/TEMPLATE.md`](conventions/TEMPLATE.md)**（或让 AI 帮你填）——定义你项目的战斗约定。
3. 跟 AI 说「**设计 XXX 角色**」或「**设计 XXX Boss**」，按 6 Phase 流程走。
4. 想看样板 → [`output/characters/cang-lan/md/苍岚-战斗设计.md`](output/characters/cang-lan/md/苍岚-战斗设计.md)（Boss 示例见 [`output/bosses/gu-ya/`](output/bosses/gu-ya/)）。

## 🤖 适配任意 AI agent · Works with any agent

- **Claude Code**：作为 skill 安装；说「设计 XXX 角色」/「设计 XXX Boss」/「做 XXX 战斗设计」/「设计 XXX 怪物」/「战斗策划专家」等关键词即**自动触发**（触发词定义在 `SKILL.md` 顶部 frontmatter，可自行增改）。
- **GPT / ChatGPT、Claude.ai、Cursor 等**：**无自动触发** —— 按 [`USAGE.md`](USAGE.md) 把 `SKILL.md` + 你的约定当 system prompt / 上传文件加载好，然后直接说「帮我设计一个 XX 角色 / Boss」即可，AI 按需读 `references/`。

## 🔄 自我更新（🧪 试验性）· Self-update

skill 可以在你使用过程中**自己积累知识**，沉淀到本地 [`knowledge-local/`](knowledge-local/)（**不进 git、留你本地**）：

- `self-update/` —— agent 用中**自动捕获**可复用洞察 / 避坑 / 数值结论（**默认关闭**，首次会问你要不要开，因为耗 token）。
- `project-knowledge/` —— 你**指定**要 agent 知道的项目资料（自家公式、角色名册、命名规范…），手动放或让 agent 放。

Phase 0 会回读这两处当扩展知识 —— 用得越久越懂你的项目。机制 + 归属判定详见 [`knowledge-local/README.md`](knowledge-local/README.md)。

## 🆕 最新更新 · Latest（2026-06-18）

> 只列最近一次；完整历史见 [`CHANGELOG.md`](CHANGELOG.md) / [`CHANGELOG.html`](CHANGELOG.html)。

- **新增**：自我更新机制（🧪 试验性）· 数值建模验证方法论（`numbers-and-progression.md` § 十）· 命座 / 养成梯度健康自检阈值 · gacha 示例项目《星澜纪》+ 苍岚效果养成演示稿 · 效果与养成设计范式（`effect-progression-design.md`）· 上手指南 conventions 概览图。
- **变更**：设计稿产出默认配审阅 HTML（Phase 6）· 加法增伤区稀释边际算法（§ 四）· § 五阈值按定位 / 品类取用。
- **修复**：上手指南目录树补 `knowledge-local/` · references 计数纠正（实为 22，现 23）· B 站嵌入 `//` → `https://`（file:// 本地打开也能放）。

## 📄 License

[MIT](LICENSE)。知识库中引用的数十款商业游戏均为**研究 / 评论性引用**，仅作设计参考。
The commercial games referenced throughout are cited for research / commentary purposes only.

## 🧑‍💻 维护 · Maintainer

- github：[koisama0411](https://github.com/koisama0411)
- 邮箱：[koisama0411@gmail.com](mailto:koisama0411@gmail.com)
- wechat：HeyKoi0411
