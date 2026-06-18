# knowledge-local/ · 本地知识区（不进 git）

> **EN** · Per-user local knowledge area. Two subfolders: `self-update/` (the agent's auto-captured
> learnings — **opt-in, OFF by default**) and `project-knowledge/` (knowledge you designate about your
> own project). **Nothing here is committed** — it stays on your machine (the repo only tracks this
> README and two `.gitkeep` placeholders). The agent asks before enabling self-update because it costs
> tokens.
>
> **中** · 给**你这台机器 / 你这个项目**用的本地知识区。两个子目录,内容**全部留在本地、不进版本控制**
> (仓库只追踪本 README + 两个 `.gitkeep`)。自我更新**默认关闭**,首次触发时 agent 会先问你要不要开。

> 🧪 **试验性功能 · 实战时间尚短 / Experimental, lightly tested** —— 机制本身低风险(只读写本地 markdown、不碰你的设计产出),但「该不该沉淀 / 归属判得准不准」还在打磨中。**有疑虑就保持默认关闭**,正常设计流程完全不依赖它。

---

## 两个子目录

| 目录 | 谁写 | 放什么 |
|---|---|---|
| **`self-update/`** | agent **自动**(默认关闭,需开启) | 对话 / 实操中沉淀的可复用洞察、避坑、数值结论 —— agent 的「无意识自我升级」产物 |
| **`project-knowledge/`** | 用户手动 / 或一句话让 agent 直接放 | 你**指定**要 agent 知道的项目资料(自家数值公式、角色名册、命名规范、过往设计稿摘要等) |

> **跟 `conventions/` 区分**:`conventions/` 是**事前**填的「战斗体系结构化契约」(招式 / 分类轴 / 数值架构);
> 本目录是**用中**逐步积累的**开放式**知识。一个是模板,一个是参考库。

> **跟官方 `references/` 区分**:`references/` 是随仓分发的**官方知识库**(进 git);本目录是**你本地私有**的积累,
> **绝不回流进 `references/`**(除非你作为作者显式把某条「确定通用」的知识脱敏后写进 references —— 那是有意识的作者行为)。

---

## 自我更新（self-update/）· 默认关闭

- 🔴 **默认 OFF**。token 有限的用户可以一直不开,不影响正常设计流程。
- **首次询问**:一次会话中**首次**遇到「值得沉淀」的时机,agent 先看 `self-update/_status.md`:
  - **无记录** → **明确问你是否开启自我更新**(说明:开启=对话中持续判定 + 写入,**消耗额外 token**),把你的选择写进 `_status.md`(本地,gitignore)。
  - **已记录** → 按记录直接执行(开 / 关),不再追问。
- **实时捕获**:开启后,对话 / 实操**进行中**一旦识别到该沉淀的点,**立即判定归属并写入**,**不等对话结束**;对话末尾再给一份「本轮沉淀清单」汇总(写到哪、为什么、有无冲突 / upstream 候选)作为你的**否决窗口**。
- **启 / 停指令**:跟 agent 说「开启自我更新」/「关闭自我更新」即可,状态记在 `_status.md`。

---

## 归属判定（写之前先跑 triage）

捕获到一条知识,**先判去哪、要不要写**,再落盘:

| | **无意识自动捕获**(用中) | **显式指令**(用户开口) |
|---|---|---|
| **拿不准 / 项目专属** | → `self-update/`(默认池) | 用户说「算我项目的」→ `project-knowledge/` |
| **明确通用** | → `self-update/` + 标 `upstream-candidate` | 用户说「加进官方库 / 去搜集行业 X」→ `references/`(仅显式 + 确定通用) |

**查重 / 冲突(vs `references/`)**:
- 已覆盖**且一致** → **不写**(防重复),末尾只提一句「确认了已有规则 §X」。
- 部分覆盖 / **细化** → 写 `self-update/`,**交叉引用** §X(不复制原文)。
- 与 references **冲突** → **不静默写** → 末尾**高亮**让你裁决:是「你项目的特例(项目覆盖)」还是「references 该更新了」。

**两条安全默认**:
- **拿不准一律进 `self-update/`**(本地、不泄露、不污染官方库)。
- **`references/` 只接「显式 + 确定通用」** —— 它进 git,通用知识无泄露顾虑,但属于**有意识**行为,不走无意识自动。

---

## 条目格式（self-update/ 每条一个 md）

文件名 `YYYY-MM-DD-<短标题>.md`,顶部带元数据 frontmatter:

```markdown
---
date: 2026-06-18
source: 设计「苍岚」第 3 轮 — 讨论「势」蓄力节奏
scope: 通用                       # 通用 | 项目专属
vs-references: 细化               # 新增 | 细化 | 冲突
extends: design-aesthetics.md 战斗节奏   # 仅 细化/冲突 时填,指向被扩展/冲突的章节
upstream-candidate: true          # 通用 且 references 未覆盖 → true
---

蓄力型核心机制,蓄满后若没有「立即可用的强力释放窗口」,玩家会觉得蓄力是惩罚而非奖励。
设计校验:蓄满那一刻起,至少留 0.3–0.5s 的「确定能打出去」窗口,再进入收招。
(通用节奏经验,references 的节奏理论可补一句,故标 upstream-candidate。)
```

> 这是一条**虚构示例**(用本仓示例角色苍岚 / 示例项目),只为演示格式。真实捕获内容由 agent 用中写入。

---

## 跨 agent 说明

- **文件系统 agent**(Claude Code / Cursor):可直接读写本目录,机制完整可用。
- **纯聊天端**(GPT / Claude.ai Projects):无法写盘 → 降级为「agent 在对话末尾列出『建议沉淀的条目』,你手动存进本目录」。

---

## Phase 0 回读

设计开始前,agent 会把本目录(`project-knowledge/` 与 `self-update/`)**非空内容一并读入**当扩展知识 —— 用得越久越懂你的项目。
- `project-knowledge/` **始终回读**(它是你交付的项目上下文,与自我更新开关无关)。
- 与 `references/` 冲突时:标注为「项目覆盖」的本地优先,否则 `references/` 优先 + 提示你裁决。

> 注:自我更新的**开关只管「写 / 捕获」**(持续消耗 token 的部分);**读已有内容**是 Phase 0 一次性成本,不受开关影响。
