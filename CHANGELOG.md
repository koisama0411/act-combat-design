# 更新记录 · Changelog

本仓每次有功能 / 内容更新都记在这里，方便使用者一眼知道更了啥。
格式参考 [Keep a Changelog](https://keepachangelog.com)；日期 YYYY-MM-DD。渲染版 → [`CHANGELOG.html`](CHANGELOG.html)。

> **EN** · What changed in each update, so users can see new features / content at a glance.

---

## v1.1 · 2026-06-18

> **本次主要**：新增自我更新机制（🧪 试验性）+ 数值建模验证方法论 + gacha 示例项目，并让设计稿默认产出审阅 HTML。
>
> ⚠️ **行为变更**：设计稿产出 —— md 草稿确认后**默认随之产出审阅级 HTML**（原先需单独要）。
> **对使用者**：pull 后**无需操作** —— 自我更新默认关闭；设计稿产出默认多出 HTML 孪生；无破坏性变更。

### 新增 Added
- **自我更新机制（🧪 试验性）** —— 新增 [`knowledge-local/`](knowledge-local/)：下游 agent 在使用中**自动捕获**可复用洞察（`self-update/`）+ 用户**指定**的项目知识（`project-knowledge/`）。全留本地、**不进 git**、**默认关闭**（首次触发会问，因为耗 token）。带「写入前归属判定」triage。
- **数值建模验证方法论** —— [`numbers-and-progression.md`](references/numbers-and-progression.md) § 十：脚本化建模 → 独立 agent 对抗性交叉验证 → 设计稿内嵌可视化论证（每图「怎么算 / 为什么 / 结果」三问注解）。
- **命座 / 养成梯度健康自检阈值** —— § 五：满命总梯度 +80~120% 等 8 项经验基线，含养成物 / 套装阈值。
- **效果与养成设计范式** —— 新增 reference `effect-progression-design.md`：7 章结构 + 3 类图 + 数值注解四要素（怎么算 / 为什么 / 过程 / 结果）；以苍岚 gacha 演示稿为范例（references 22 → 23 份）。
- **gacha 示例项目《星澜纪》** —— [`conventions/example-conventions-gacha.md`](conventions/example-conventions-gacha.md)（3D 三人队 + 命座 + 养成物 + PVP）+ 配套 [苍岚 gacha 移植效果稿](output/characters/cang-lan/md/苍岚-效果与养成-gacha演示.md)（技能附带 / 命座 / 养成物效果 + § 十 数值验证演示）。
- **上手指南 conventions 概览图** —— [`上手指南.html`](上手指南.html) 第 ⑤ 节加「10 维度一图看全 + 买断 / gacha 双范例对比」。
- **本更新记录** —— `CHANGELOG.md` + 渲染版 `CHANGELOG.html`。

### 变更 Changed
- **设计稿产出默认配审阅 HTML** —— Phase 6：md 草稿确认 OK 后，**默认自动产出审阅级 HTML 孪生**（不用再单独要）。
- **加法增伤区稀释** —— § 四 增补「自拐被面板增伤稀释」边际算法 `S ÷ (1+P)`。
- **§ 五阈值取用说明** —— 明确「场景梯度 / PVP / 养成物」按定位 / 品类取用，单体 / 单机 / 无 PVP 角色对应项判 N/A。

### 修复 Fixed
- 上手指南「目录结构」树补上 `knowledge-local/`。
- references 份数纠正：文档原称「21 份」实为 22（漏数 `dual-arena-boss.md`），现按实际标注（初始 22 → 现 23）。
- 审阅 HTML 里 B 站嵌入由协议相对 `//player.bilibili.com` 改为 `https://`，file:// 本地打开也能放（与 YouTube 对齐）。

### 📁 本次涉及文件
- **新增（9）**：`knowledge-local/`（README + 2 占位）· `conventions/example-conventions-gacha.md` · `references/effect-progression-design.md` · `output/characters/cang-lan/md/苍岚-效果与养成-gacha演示.md` + 同名 `.html` · `CHANGELOG.md` + `CHANGELOG.html`
- **修改（7）**：`SKILL.md` · `README.md` · `USAGE.md` · `conventions/TEMPLATE.md` · `references/numbers-and-progression.md` · `上手指南.html` · `.gitignore`
- **删除（0）**：无

---

## v1.0 · 初始版本 · Initial

- **项目无关的 ACT 战斗设计方法论 + 行业知识库**：6 Phase 流程（角色 / Boss）、`conventions/TEMPLATE.md` 项目约定模板、22 份 references 知识库（角色原型 / Boss 范式 / 42 元规则 / 70+ 跨游戏借鉴 / 打击感 · 数值 · Boss AI 工程基线 / 审阅 HTML + 资源 xlsx 产出工具链）。
- **示例**：买断制示例项目《孤刃行》+ 示例角色「苍岚」+ 示例 Boss「孤鸦」（含审阅 HTML + 资源 xlsx）。
- **多 agent 可用**：纯 markdown，Claude Code / GPT / Claude.ai / Cursor 均可加载（见 [`USAGE.md`](USAGE.md)）。
