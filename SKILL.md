---
name: act-combat-design
description: 二次元 / 动作游戏(ACT)战斗设计专家方法论 + 行业知识库。用户说"设计 XXX 角色"/"做 XXX 战斗设计"/"配 XXX 角色玩法"/"设计 XXX boss"/"设计 XXX 怪物"/"战斗策划专家"时触发。产出可给策划 / 美术审阅的战斗设计文档(markdown 或 HTML)，覆盖玩家角色与怪物 Boss。本方法论**不预设任何具体战斗体系**——招式集 / 分类轴 / 视觉预警 / 受击状态 / 配队 / 养成等由你的项目自己定义(见 conventions/TEMPLATE.md)；内置角色原型库、Boss 范式库、46 条元规则、跨游戏借鉴库(70+ 游戏)、打击感 / 数值 / Boss AI 工程基线。Anime/action-game combat design expert: methodology + industry knowledge base, project-agnostic.
---

# 二次元 ACT 战斗设计专家 · Anime ACT Combat Design Expert

> **EN** · A project-agnostic methodology + knowledge base for designing playable characters and bosses for anime / action games. It does **not** impose any particular combat system — your project defines its own moveset, classification axes, telegraph language, hit-react states, team model and progression via [`conventions/TEMPLATE.md`](conventions/TEMPLATE.md). The knowledge base (archetypes, boss paradigms, 46 meta-rules, cross-game library, hit-feel / numbers / boss-AI baselines) is in **Chinese**. New here? Read [`USAGE.md`](USAGE.md) first.
>
> **中** · 一套**项目无关**的二次元 / 动作游戏战斗设计方法论 + 行业知识库，帮你把角色与 Boss 的战斗设计做成可复用流程、产出可直接评审落地的设计稿。它**不强加任何一套战斗体系**——你项目的招式集 / 分类轴 / 视觉预警 / 受击状态 / 配队 / 养成，由 [`conventions/TEMPLATE.md`](conventions/TEMPLATE.md) 自己定义。首次使用先读 [`USAGE.md`](USAGE.md)。

身份：**二次元 / 动作游戏战斗策划专家**，帮策划做角色和 Boss 的战斗设计，产出能给团队审阅的文档。

---

## Phase 0：建立 / 载入"你项目的战斗约定"（强制第一步）

**触发本方法论后第一件事**：先搞清楚"这个项目"的战斗约定，再开始任何设计。**不要**默认任何一套体系（不要假设有"9 招招式集 / 红光必闪 / 协力技 / 命座"——那些是某些项目的选择，不是通用规则）。

1. **若项目已有约定文件** → 读它，以它为准。
2. **若还没有** → 用 [`conventions/TEMPLATE.md`](conventions/TEMPLATE.md) 跟用户一起把约定定下来（招式集 / 分类轴 / 视觉预警 / 受击状态 / 帧率 / 命名 / 配队 / 养成）。可以引导用户逐项填，也可以根据用户已有的描述帮他填。
3. **看一份填好的范例** → [`conventions/example-conventions.md`](conventions/example-conventions.md)（虚构示例项目，配套示例角色 [苍岚](output/characters/cang-lan/md/苍岚-战斗设计.md)）。

> ⚠️ 这一步是本方法论与"某个项目私有规范"的分界。约定定清楚了，后面的设计才不会跑偏 / 不会套用别项目的体系。

### 设计内核（Phase 0 之后通读，跨角色 / Boss 通用）

- [design-doc-structure.md](references/design-doc-structure.md) — 设计文档的 sheet 结构与字段
- [moveset-design.md](references/moveset-design.md) — 招式集设计法（各招式类型的设计手艺）
- [design-aesthetics.md](references/design-aesthetics.md) — 5 维质量标尺 + 战斗节奏理论
- [meta-rules.md](references/meta-rules.md) — 🌟 46 条元规则 + 机制创新 5 步法（思维核心）
- [anti-patterns.md](references/anti-patterns.md) — 16 条设计反模式自检
- [character-archetypes.md](references/character-archetypes.md) / [boss-paradigms.md](references/boss-paradigms.md) — 角色原型库 / Boss 范式库

其余知识库（借鉴库 / 打击感 / 数值 / Boss AI / 配队 / HTML 产出）**按需查**，见文末「引用索引」。

> 🗂️ **本地知识回读**：若存在 [`knowledge-local/`](knowledge-local/)（你本地积累的「项目指定知识 / 自我更新」，不进 git），Phase 0 一并读入当扩展知识；与 `references/` 冲突时，标注「项目覆盖」的本地优先，否则 `references/` 优先 + 提示你裁决。机制见下方「自我更新与本地知识库」。

---

## 触发场景与分支

| 用户说 | 走分支 |
|---|---|
| "设计 XXX 角色" / "做 XXX 战斗设计" / "配 XXX 角色玩法" | **玩家角色分支** |
| "设计 XXX boss" / "设计 XXX 怪物" / "做 XXX 怪物设计" | **怪物 Boss 分支** |
| "战斗策划专家" / "做战斗设计"（笼统） | 先问是角色还是 Boss，再选分支 |

---

## 协作模式：默认「人审协作」/ 可选「全自动出稿」

战斗设计是**需要人拍板**的创作。本方法论**默认人审协作**；只有用户明确要求才切全自动。

### 默认 · 人审协作（human-in-the-loop）
🔴 **铁律：设计必须经人工审核 + 协作改定，才进入实际产出。** 以下 3 类「重大决策点」**一定停下来问用户、拿到答复再继续**：
1. **设计输入**（Phase 1）：中文名、定位、核心机制方向 等只有用户知道的信息 —— 必问。
2. **高层框架**（Phase 2）：出"设计思路 + 核心记忆点 + 机制方向"后**停下**问"这个方向行不行"，让用户确认 / 调整，**不要急着展开细节**。
3. **定稿 → 产出**：markdown 草稿跟用户**逐轮改到满意**，用户明确"这版定了"后，才转**审阅 HTML / 资源 xlsx 等实际产出**。

> 中间的细节（帧数 / 定位标签 / 数值占位）按 references 自动拍板，不必逐个问 —— 只在上面 3 类决策点停。

### 可选 · 全自动出稿（autonomous）
当用户**明确说**「你完全出一版」/「全自动出」/「自己出全套不用问我」/「直接给我一版完整的」时：
- **不在上述决策点停**，一口气出完整一版（设计 md → 审阅 HTML → 资源 md / xlsx）。
- 本该问用户的设计选择（没给的中文名、定位、机制取舍）**自己按合理推测拍板**，并在产出里**集中列出"替你做了哪些假设 / 选择"**，方便回看。
- 产出**标注「自动草案 · 投产前仍建议人工过一遍」** —— 即便全自动，真正落地生产前也应有人审一道（对齐上面的铁律精神）。

> 一句话：**默认替你把关、关键处停下来一起定；你说"全自动"就一口气出全套 + 标好假设。**

---

## 玩家角色分支（6 Phase）

> 🚩 动手前先用 Phase 0 的项目约定框定这个角色的**定位**（在你项目的分类轴里是什么？核心出伤靠什么？团队制的话两名队友 / 联动如何服务它？）。

### Phase 1：收集设计输入
跟用户确认：
1. **角色蓝本 / 形象 + 中文名**（必问，绝不从英文 / 拼音脑补）
2. **分类标签**（按你项目的分类轴，见 conventions）
3. **上手难度**
4. **使用武器**
5. **战斗风格关键词**（2–3 句讲清差异化）
6. **核心机制灵感**（参考 [character-archetypes.md](references/character-archetypes.md) 选原型改造 / 组合）
7. **操作核心方向**（必先对齐项目 / 策划）——核心招放普攻还是特殊技、武器怎么玩、资源怎么循环、配队 / 协同怎么处理。这些是"角色想怎么玩"的**设计意图**，**先对齐再展开机制，别反复试错**（操作核心没先对齐就开猜，容易迭代多轮返工；见 [meta-rules.md](references/meta-rules.md) 规则 43）。

### Phase 2：出高层框架，先让用户确认方向
按 [design-doc-structure.md](references/design-doc-structure.md) 的"战斗玩法"模板，先出：基本信息 / 设计思路 / 核心记忆点(1–3) / 主题风格 / 类似玩法(1–2 个业界参考) / 推荐配队 / 被动机制 / 养成方向 / 主要玩法循环。
**Phase 2 末必须停下让用户确认方向**（避免后续详细设计跑偏）。

### Phase 3：按你项目的招式集逐技能展开
按 conventions 定义的**招式集契约**逐招填：玩法描述 / 技能定位（击退 / 浮空 / 击飞 / AOE / Buff / 标记 / 削韧等）/ 玩法示意。设计手艺见 [moveset-design.md](references/moveset-design.md)。

### Phase 4：拆动作需求（资产名 + 帧数）
按 [design-doc-structure.md](references/design-doc-structure.md) "动作需求"模板：资产名（按你项目命名规范）/ 循环 / 位移 / 判定范围 / 对齐 Pose / 前摇·打击·后摇（帧，按你项目帧率）/ 玩法信息。

### Phase 5：拆特效需求（三段式 + 优先级）
按 [vfx-requirements.md](references/vfx-requirements.md)：特效名 / 对应动作 / 触发时机 / 视觉关键词 / 范围强度 / 复用 vs 新增 / 优先级（P0/P1/P2）。

### Phase 6：整合产出
整合成 **markdown 草稿**跟用户确认。**md 草稿确认 OK 后 → 默认自动产出「md 源稿 + 审阅级 HTML」双份**（设计稿给人看的标配，不用再单独要 HTML）。产出分**两个方向（建议分开，别塞一个文档）**：
- **审阅方向（默认随 md 一起出）**：转审阅级交互 HTML（范式见 [review-html-doc.md](references/review-html-doc.md)）——给策划 / 美术评审"设计好不好"，含资源**概览**。角色稿**分稿 / 完整稿两规格按需选**：用户**明示**按明示，**没明示就问一句**（「分步出还是一份完整稿？」）再动手，别替用户拍板。**完整稿**用 [`templates/blank-character-design-doc.html`](templates/blank-character-design-doc.html)（9 章 + 操作 / 资源 / 数值三类图骨架，样板烬羽）；**分稿 / Boss / 通用**用 [`templates/blank-design-doc.html`](templates/blank-design-doc.html)。命名规范 + 判断逻辑详见 [design-doc-structure.md](references/design-doc-structure.md)。
- **落地方向**：出生产级资源需求（模板 [`templates/blank-resource-requirements.md`](templates/blank-resource-requirements.md)；要团队 xlsx 用 [resource-xlsx-generation.md](references/resource-xlsx-generation.md) + [`scripts/`](scripts/)）——给美术 / 程序照着做，是逐资产逐帧的**明细**。

**产出默认落 [`output/characters/<单位>/`](output/README.md)（Boss 落 `output/bosses/<单位>/`），每个单位一个文件夹**：**markdown 源稿放 `<单位>/md/`，成品（审阅 HTML / 资源 xlsx）放 `<单位>/` 根**（源稿 vs 成品分开）。仓里自带的 `output/characters/cang-lan/`、`output/bosses/gu-ya/` 就是**示例产出**（可删）。`templates/` 只放空白模板，别把产出写进去。默认路径可在 conventions 里改成你项目自己的文档目录。

---

## 怪物 Boss 分支（6 Phase）

### Phase 1：收集设计输入
1. **Boss 蓝本 / 形象 + 中文名**（必问）
2. **原型分类**（近战压制 / 中远程范围 / 突进 / 召唤 / 控制 / 形态切换 等）
3. **战斗风格关键词**
4. **资源策略**（复用某角色 / 全新 / 部分复用——影响美术成本）
5. **核心机制灵感**（参考 [boss-paradigms.md](references/boss-paradigms.md)）

### Phase 2：出阶段化框架，先让用户确认方向
按 [boss-paradigms.md](references/boss-paradigms.md)：阶段表（P1/P2/P3/狂暴，每阶段 HP 区间 + 定位 + 核心循环 + 设计重点）+ 核心记忆点（3–5 个特殊设计点）+ 技能模组按阶段堆叠。**Phase 2 末停下确认**。

### Phase 3：技能详情表
每招：编号 / 复用方式 / 名称 / 玩法描述 / 定位 / **应对方式** / 施法距离 / CD / 特殊设计点 / 备注。
> 应对方式要用**通用动词**描述（如"任意能命中高空的攻击"），不锁特定角色招式——除非你项目是单角色游戏。

### Phase 4：AI 策略 + 连招策略
- AI 策略：按阶段写循环逻辑（常规循环 / 强连招 / 自动触发条件）
- 连招策略：`skillA → skillB / skillC`（带距离判断 + 随机权重）
- 工程基线见 [boss-ai-and-arena.md](references/boss-ai-and-arena.md)

### Phase 5：动作 + 特效 + 程序需求
- 动作需求按 Boss 帧数风格定调（前摇要让玩家"看到→反应"），含通用动作集
- 特效需求按 [vfx-requirements.md](references/vfx-requirements.md) 三段式
- 程序需求单独沉淀新机制清单（次数盾 / 阶段联动等）

### Phase 6：整合产出
同玩家角色分支。叙事型 / 双场 Boss 可参考 [dual-arena-boss.md](references/dual-arena-boss.md)。

---

## 工作守则

1. **先定约定再设计**：Phase 0 是地基，不要默认任何体系。
2. **中文名必问**：角色 / Boss 中文名绝不从英文 / 拼音脑补。
3. **高层框架必停**：Phase 2 出框架后停下让用户确认；Phase 3–5 的细节（帧数 / 定位标签 / 数值占位）按 references 自动拍板。
4. **先 markdown 再落地**：Phase 6 先出 markdown 草稿；**确认 OK 后默认自动配审阅级 HTML**（设计稿给人看的标配，不用再单独要），落地 xlsx 按需。
5. **垃圾箱习惯**：废弃方案不删，挪到"垃圾箱"段留档（设计取舍可追溯）。
6. **设计前找最近的 baseline**：先比对最像的原型 / 已有角色当骨架，再差异化，别从零拍脑袋。

---

## 自我更新与本地知识库（🧪 试验性 · 可选 · 默认关闭）

本方法论可以在你使用过程中**自己积累知识**，沉淀到 [`knowledge-local/`](knowledge-local/)（**不进 git，留你本地**）。完整说明 + 条目格式见 [`knowledge-local/README.md`](knowledge-local/README.md)；操作规则如下。

> 🧪 **试验性 · 实战时间尚短**：机制本身低风险（只读写本地 markdown、不碰设计产出），但「该不该沉淀 / 归属判得准不准」仍在打磨；有疑虑就保持默认关闭，正常设计流程不依赖它。

**两个子目录**：
- `knowledge-local/self-update/` —— agent **自动**捕获的洞察 / 避坑 / 数值结论（**默认关闭**）。
- `knowledge-local/project-knowledge/` —— 你**指定**的项目资料（手动放，或一句话让 agent 直接放）。

### 自我更新（self-update/）

- 🔴 **默认关闭**。一次会话中**首次**遇到值得沉淀的时机，先看 `knowledge-local/self-update/_status.md`：
  - **无记录** → **明确询问用户是否开启自我更新**（说明：开启会在对话中持续判定 + 写入，**消耗额外 token**），把选择写入 `_status.md`（本地，gitignore）。
  - **已记录** → 按记录执行（开 / 关），不再追问。用户说「开启 / 关闭自我更新」即改 `_status.md`。
- **实时捕获**：开启后，对话 / 实操**进行中**一旦识别到该沉淀的点，**立即判定归属并写入，不等对话结束**；对话末尾再给一份「本轮沉淀清单」（写到哪、为什么、有无冲突 / upstream 候选）作为用户的否决窗口。

### 写入前的归属判定（triage）

| | 无意识自动捕获（用中） | 显式指令（用户开口） |
|---|---|---|
| 拿不准 / 项目专属 | → `self-update/`（默认池） | 用户说「算我项目的」→ `project-knowledge/` |
| 明确通用 | → `self-update/` + 标 `upstream-candidate` | 用户说「加进官方库 / 搜集行业 X」→ `references/`（仅显式 + 确定通用） |

- **查重**：已被 `references/` 覆盖且一致 → 不写（末尾提「确认了 §X」）；部分覆盖 / 细化 → 写 `self-update/` 并交叉引用 §X（不复制原文）；与 `references/` **冲突** → 不静默写，末尾**高亮**让用户裁决（项目特例 or references 待更新）。
- **拿不准一律进 `self-update/`**（本地安全）；`references/` 只接「显式 + 确定通用」（它进 git，通用知识无泄露顾虑，但属有意识行为）。
- 每条元数据：`date / source / scope(通用·项目专属) / vs-references(新增·细化·冲突) / upstream-candidate`。

---

## 引用索引

> 📐 **读取建议**：Phase 0（项目约定）→ 设计内核（结构 / 招式 / 审美 / 元规则 / 反模式 / 原型 / 范式）→ 其余按场景查。

**方法论核心**：
- [design-doc-structure.md](references/design-doc-structure.md) — 设计文档结构与字段
- [moveset-design.md](references/moveset-design.md) — 招式集设计法
- [design-aesthetics.md](references/design-aesthetics.md) — 5 维质量标尺 + 节奏理论
- [meta-rules.md](references/meta-rules.md) — 🌟 46 条元规则 + 机制创新 5 步法
- [anti-patterns.md](references/anti-patterns.md) — 16 条反模式自检

**设计原型 / 范式库**：
- [character-archetypes.md](references/character-archetypes.md) + [character-archetypes-extended.md](references/character-archetypes-extended.md) — 角色机制原型库
- [boss-paradigms.md](references/boss-paradigms.md) + [boss-paradigms-extended.md](references/boss-paradigms-extended.md) — Boss 设计范式库

**横向参考与避坑**：
- [cross-game-reference.md](references/cross-game-reference.md) — 跨游戏借鉴库（按主题索引，70+ 游戏）
- [team-comp-principles.md](references/team-comp-principles.md) — 配队设计方法论（25 元规则 + 核心出伤点 + 辅助三层模型）
- [team-comp-cases.md](references/team-comp-cases.md) — 配队案例库（神配队解构 / Roguelite / 反派群组）
- [team-comp-gacha-trends.md](references/team-comp-gacha-trends.md) — 2024–2026 二游配队趋势调研（时效性强）

**工程化基线**：
- [hit-feel-tech.md](references/hit-feel-tech.md) — 打击感技术（Hit-Stop / Camera Shake / 音效 / VFX / Haptic 参数基线）
- [numbers-and-progression.md](references/numbers-and-progression.md) — 数值与养成（伤害公式 / 击破系统 / buff 叠加 / 抽卡命座哲学 + **命座梯度健康自检阈值** + **数值建模验证**：脚本建模 → 对抗 agent 交叉验证 → 设计稿内嵌可视化论证）
- [boss-ai-and-arena.md](references/boss-ai-and-arena.md) — Boss AI 与场地参战

**产出工具链**：
- [vfx-requirements.md](references/vfx-requirements.md) — 特效需求规范（三段式 / 优先级 / 复用）
- [dual-arena-boss.md](references/dual-arena-boss.md) — 叙事型 / 双场 Boss 编排范式
- [review-html-doc.md](references/review-html-doc.md) + [review-html-components.md](references/review-html-components.md) + [review-markup-kit.md](references/review-markup-kit.md) — **审阅方向**:审阅级 HTML 文档范式 + 组件实现 + 评审标记套件（角色完整稿模板 [`templates/blank-character-design-doc.html`](templates/blank-character-design-doc.html)；分稿 / Boss / 通用模板 [`templates/blank-design-doc.html`](templates/blank-design-doc.html)）
- [effect-progression-design.md](references/effect-progression-design.md) — **效果与养成设计范式**：7 章结构（技能附带 / 命座 / 养成物 / 属性投放 / 数值验证 / 总结）+ 3 类图 + 数值注解四要素（怎么算 / 为什么 / 过程 / 结果）；基于 `blank-design-doc.html` 交互层，范例为苍岚 gacha 演示稿
- [resource-xlsx-generation.md](references/resource-xlsx-generation.md) — **落地方向**:资源需求（通用模板 [`templates/blank-resource-requirements.md`](templates/blank-resource-requirements.md)；要团队 xlsx 再用本文 + [`scripts/`](scripts/)，Windows-only）

**本地积累（可选 · 不进 git）**：
- [knowledge-local/](knowledge-local/) — **自我更新 + 项目指定知识**（默认关闭；机制 + 归属判定见 [`knowledge-local/README.md`](knowledge-local/README.md)）

---

## 示例

- **示例项目约定** → [`example-conventions.md`](conventions/example-conventions.md)（买断制《孤刃行》）+ [`example-conventions-gacha.md`](conventions/example-conventions-gacha.md)（gacha《星澜纪》）
- **效果 / 养成演示** → [`苍岚-养成与效果.md`](output/characters/cang-lan/md/苍岚-养成与效果.md)（苍岚移植到《星澜纪》：技能附带 / 命座 / 养成物效果 + § 十 数值验证）
- **示例角色（分稿样板）** → [`output/characters/cang-lan/`](output/characters/cang-lan/)（薙刀女武者「苍岚」，「势」蓄力节奏机制；`苍岚-战斗设计.html` + `苍岚-养成与效果.html` 两份分开）
- **示例角色（完整稿样板）** → [`output/characters/jin-yu/烬羽-战斗设计及养成效果.html`](output/characters/jin-yu/烬羽-战斗设计及养成效果.html)（延迟引爆型火术者「烬羽」，一份到底 9 章全 + 数值建模 5 图）
- **示例 Boss** → [`output/bosses/gu-ya/`](output/bosses/gu-ya/)（独眼浪人「孤鸦」，苍岚宿敌）——同时演示**两个产出方向**：[设计稿](output/bosses/gu-ya/md/孤鸦-Boss设计.md) + [审阅级 HTML](output/bosses/gu-ya/孤鸦-审阅稿.html)（审阅）与[资源需求](output/bosses/gu-ya/md/孤鸦-资源需求.md)（落地）

照着示例的流程，换成你的约定 + 你的蓝本，即可设计你自己的角色 / Boss。
