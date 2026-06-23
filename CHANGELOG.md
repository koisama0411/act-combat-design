# 更新记录 · Changelog

本仓每次有功能 / 内容更新都记在这里，方便使用者一眼知道更了啥。
格式参考 [Keep a Changelog](https://keepachangelog.com)；日期 YYYY-MM-DD。渲染版 → [`CHANGELOG.html`](CHANGELOG.html)。

> **EN** · What changed in each update, so users can see new features / content at a glance.

---

## v1.2 · 2026-06-23

> **本次主要**：新增**完整角色稿模板** + **完整稿满配样板「烬羽」**，并把「角色设计稿」明确成**分稿 / 完整稿两种规格** + **文件命名规范** + **数值建模硬标准**；元规则 42 → 46 条、角色原型库去项目脱敏、只保留业界 F–Q 12 种。
>
> **对使用者**：pull 后**无需操作** —— 新增模板 / 样板 / 范式细化，既有「分稿」流程不变；想出一份到底的完整稿时多一套模板可用。无破坏性变更。

### 新增 Added
- **完整角色稿模板** —— [`templates/blank-character-design-doc.html`](templates/blank-character-design-doc.html)：通用 9 章（设计定位哲学 / 核心机制 / 招式详解 / 🟡 资源系统（深入，按角色）/ 养成命座 / 🟡 配队协力（按项目）/ 数值建模 / 资源清单 / 自检）+ **三类图骨架**（贰 操作循环示意图、肆 资源流转示意图、柒 数值建模 5 图）+ 完整协作交互层 + 图表 lightbox。
- **完整稿满配样板「烬羽」** —— [`output/characters/jin-yu/`](output/characters/jin-yu/)（延迟引爆型火术者，挂《星澜纪》gacha）：9 章全 + 10 图（操作循环 / 资源流转 / 数值建模 5 图）。作「完整稿」满配样板，区别于苍岚的「分稿」样板。
- **角色原型库 project-agnostic 化** —— [`character-archetypes.md`](references/character-archetypes.md)：移除项目脱敏的基础 5 种（A–E）+ R 延迟引爆，**只保留业界调研 F–Q 12 种**；各项目自家原型放本地 [知识区](knowledge-local/)。延迟引爆机制仍由完整稿样板「烬羽」演示。
- **4 条新元规则（K 组）** —— [`meta-rules.md`](references/meta-rules.md)：操作核心方向先对齐 / 消极动作不触发爆发 / 资源返现易空转（走限时窗）/ 异格不换皮三轴分流（元规则 42 → 46 条）。

### 变更 Changed
- **角色完整稿范式细化** —— [`design-doc-structure.md`](references/design-doc-structure.md) 明确**两种规格**：分稿（战斗设计稿 + 养成稿分开）/ 完整稿（一份 9 章），并给**判断逻辑**（用户明示按明示、没明示就问）。
- **文件命名规范** —— 同上：`角色名-战斗设计` / `角色名-养成与效果` / `角色名-战斗设计及养成效果` / `角色名-资源需求`；「审阅稿」是协作形态、不进文件名。
- **数值建模硬标准** —— 同上：无论完整稿还是分稿养成稿，数值建模必配 **5 图 + 三段注解 + 平衡自检表**，只写表不配图 = 不合格。
- **图表 lightbox 按界面 fit 完整显示** —— [`review-html-components.md`](references/review-html-components.md)：`width:94vw` + `max-height:88vh` + `height:auto`，宽图撑满、高图触顶自动等比缩到完整居中，都不被裁（废弃旧的固定 `width:min(1180px,…)`）。
- **苍岚分稿按命名规范重命名** —— `苍岚-战斗设计.html` + `苍岚-养成与效果.html`（原「审阅稿 / 效果与养成-gacha 演示」）。

### 修复 Fixed
- 无破坏性修复；本次以内容 / 范式补全为主。

### 📁 本次涉及文件
- **新增（3）**：`templates/blank-character-design-doc.html` · `output/characters/jin-yu/烬羽-战斗设计及养成效果.html` + `md/烬羽-战斗设计及养成效果.md`
- **修改（7）**：`SKILL.md` · `README.md` · `上手指南.html` · `CHANGELOG.md` + `CHANGELOG.html` · `references/design-doc-structure.md` · `references/review-html-components.md`（元规则 / 原型 计数随 `meta-rules.md` / `character-archetypes.md` 同步）
- **重命名（2）**：`output/characters/cang-lan/` 下 `苍岚-战斗设计` + `苍岚-养成与效果`（html + md/）
- **删除（0）**：无

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
- **gacha 示例项目《星澜纪》** —— [`conventions/example-conventions-gacha.md`](conventions/example-conventions-gacha.md)（3D 三人队 + 命座 + 养成物 + PVP）+ 配套 [苍岚 gacha 移植效果稿](output/characters/cang-lan/md/苍岚-养成与效果.md)（技能附带 / 命座 / 养成物效果 + § 十 数值验证演示）。
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
- **新增（9）**：`knowledge-local/`（README + 2 占位）· `conventions/example-conventions-gacha.md` · `references/effect-progression-design.md` · `output/characters/cang-lan/md/苍岚-养成与效果.md` + 同名 `.html` · `CHANGELOG.md` + `CHANGELOG.html`
- **修改（7）**：`SKILL.md` · `README.md` · `USAGE.md` · `conventions/TEMPLATE.md` · `references/numbers-and-progression.md` · `上手指南.html` · `.gitignore`
- **删除（0）**：无

---

## v1.0 · 初始版本 · Initial

- **项目无关的 ACT 战斗设计方法论 + 行业知识库**：6 Phase 流程（角色 / Boss）、`conventions/TEMPLATE.md` 项目约定模板、22 份 references 知识库（角色原型 / Boss 范式 / 42 元规则 / 70+ 跨游戏借鉴 / 打击感 · 数值 · Boss AI 工程基线 / 审阅 HTML + 资源 xlsx 产出工具链）。
- **示例**：买断制示例项目《孤刃行》+ 示例角色「苍岚」+ 示例 Boss「孤鸦」（含审阅 HTML + 资源 xlsx）。
- **多 agent 可用**：纯 markdown，Claude Code / GPT / Claude.ai / Cursor 均可加载（见 [`USAGE.md`](USAGE.md)）。
