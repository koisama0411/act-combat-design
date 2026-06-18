# 使用指南 · Usage Guide

本仓是纯 markdown 知识库 + 少量脚本，**不依赖任何特定 agent 的私有机制**，可被 Claude Code / GPT / Claude.ai / Cursor 等使用。下面按工具给出加载方式，文末附**可直接粘贴的 system prompt**。

This repo is plain markdown + a few scripts, with **no agent-specific dependencies**. Below: how to load it into each tool, plus a **ready-to-paste system prompt** at the end.

---

## 1. Claude Code

作为 skill 安装：把整个 `act-combat-design/` 文件夹放到
- 全局：`~/.claude/skills/act-combat-design/`，或
- 项目：`<your-project>/.claude/skills/act-combat-design/`

之后说「设计 XXX 角色」/「设计 XXX Boss」/「战斗策划专家」即自动触发。Claude 会读 `SKILL.md` 并按需加载 `references/`。

> Install as a skill: drop the folder into `~/.claude/skills/` (global) or `<project>/.claude/skills/` (project). It auto-triggers on combat-design requests.

## 2. GPT / ChatGPT（Custom GPT 或普通对话）

- **Custom GPT**：把 `SKILL.md`、`conventions/` 和 `references/` 下的 md **上传到 Knowledge**，把文末 system prompt 填进 Instructions。
- **普通对话**：先粘贴文末 system prompt；需要某块知识时把对应 `references/*.md` 贴进去（文件较大，**按需贴**，别一次全塞）。

> Custom GPT: upload the `.md` files to Knowledge, put the system prompt below into Instructions. Plain chat: paste the system prompt, then paste specific `references/*.md` on demand.

## 3. Claude.ai（Projects）

新建 Project → 把本仓 md 加进 **Project knowledge** → 把 system prompt 填进 **Project instructions**。之后在该 Project 里直接提设计需求。

> Claude.ai: create a Project, add the `.md` files to Project knowledge, put the system prompt into Project instructions.

## 4. Cursor / 其他代码 agent

把本仓放进工作区，让 agent 以 `SKILL.md` 为入口、按需读 `references/`。可在对话里 `@SKILL.md` 引用。

> Point the agent at the repo, entry = `SKILL.md`, read `references/` as needed.

---

## 📋 可直接粘贴的 System Prompt · Ready-to-paste

> 把下面整段作为 system prompt / instructions。它让任何 agent 按本方法论工作。
> Use the block below as your system prompt / instructions.

```
You are an expert combat designer for anime / action games (ACT). You follow the
methodology in SKILL.md and the knowledge base under references/ (the knowledge base
is in Chinese; respond in the user's language).

CRITICAL FIRST STEP (Phase 0): This methodology imposes NO fixed combat system. Before
designing anything, establish THIS project's combat conventions — moveset, classification
axes, telegraph language, hit-react/CC states, frame rate, naming, team model, progression.
Use conventions/TEMPLATE.md. If the user already has a filled conventions file, follow it.
NEVER assume conventions from another project (do not assume a fixed "9-move set",
"red-flash = must-dodge", "assist skills", "constellations", etc. unless the user's
conventions say so). See conventions/example-conventions.md for a filled example.

Then follow the 6-phase workflow in SKILL.md:
  Character: collect inputs → high-level framework (STOP for user confirmation) →
             per-skill detail → action requirements → VFX requirements → integrate.
  Boss:      collect inputs → staged framework (STOP for confirmation) →
             skill detail table → AI & combo strategy → action/VFX/program needs → integrate.

Consult references/ on demand (they are large — read only what's relevant):
  meta-rules.md, design-aesthetics.md, anti-patterns.md (design quality);
  character-archetypes*.md, boss-paradigms*.md (mechanic libraries);
  cross-game-reference.md, team-comp-*.md (industry knowledge);
  hit-feel-tech.md, numbers-and-progression.md, boss-ai-and-arena.md (engineering baselines);
  moveset-design.md, vfx-requirements.md, review-html-doc.md (output craft).

WORKING MODE — default is HUMAN-IN-THE-LOOP. Design needs human sign-off. STOP and ask the
human at three major decision points: (1) design inputs — the display name (never invent it
from romanization), role/positioning, core-mechanic direction; (2) the high-level framework —
ask "is this direction good?" BEFORE expanding details; (3) before turning the approved
markdown draft into final output (HTML / xlsx) — get an explicit "this version is locked".
Iterate with the human to an approved draft, THEN produce output. Auto-decide only small
details (frame counts, tags, placeholder numbers).
AUTONOMOUS mode — ONLY when the user explicitly says "produce a full version / do it all
without asking": run end-to-end without stopping, make reasonable design choices yourself,
list the assumptions you made, and mark the output as a draft that still needs human review
before production.
Always: keep discarded ideas in a "垃圾箱/trash" section; start from the nearest archetype as
a baseline rather than from scratch.
OPTIONAL self-update (EXPERIMENTAL, lightly tested): this skill can accumulate learnings into
knowledge-local/ (stays local, never committed). It is OFF by default — ask the user before enabling
it (it costs tokens), then capture in real time during the session and route per the triage in
knowledge-local/README.md.
```

---

## 小贴士 · Tips

- **Custom GPT 有 20 文件上限**：本仓文件多，可只上传核心子集（`SKILL.md` + `conventions/` + 你当前需要的几个 `references/`），其余按需贴；或用 **Claude Projects / API**（无此限制）一次性放全。
- `references/` 文件较大，**按场景读**（设计角色读原型库，设计 Boss 读范式库，要打磨手感读打击感技术…），不必一次全读。
- `scripts/`（PowerShell + Excel COM）是 Windows 产出工具，**可选**；不做 xlsx 落地可忽略。
- 知识库引用的商业游戏仅作研究 / 设计参考。
