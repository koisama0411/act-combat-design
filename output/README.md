# output/ — 生成的设计稿落这里 · Where generated docs go

本方法论产出的**战斗设计稿**（markdown 草稿 / 审阅级 HTML / 资源需求 xlsx）默认输出到这里：

| 子目录 | 放什么 |
|---|---|
| `output/characters/<单位>/` | 每个玩家角色一个文件夹 |
| `output/bosses/<单位>/` | 每个怪物 / Boss 一个文件夹 |

> Generated combat-design docs (markdown drafts / review-grade HTML / resource xlsx) default here:
> `output/characters/` for playable characters, `output/bosses/` for monsters & bosses.

## 单位文件夹结构（规约）· Per-unit layout

每个单位一个文件夹；文件夹内**按"源稿 vs 成品"分**：

```
output/bosses/gu-ya/                  # 一个单位
├─ md/                                # ← markdown 源稿（原数据）
│  ├─ 孤鸦-Boss设计.md                #   设计 / 审阅源稿
│  └─ 孤鸦-资源需求.md                #   落地资源源稿
├─ 孤鸦-审阅稿.html                   # ← 成品:审阅级交互文档（由 Boss设计.md 渲染）
└─ 孤鸦-资源需求.xlsx                 # ← 成品:团队资源表（由 资源需求.md 生成）
```

- **`md/` 子文件夹放所有 markdown 源稿（原数据）**;HTML / xlsx 等**成品**放单位根目录。
- 这样"可编辑的源"和"交付的成品"一眼分清;改设计先改 `md/` 里的源,再重新渲染成品。
- **所有单位（角色 / Boss）一律照此结构。**

> Per unit = one folder. Markdown **source** drafts go in `md/`; rendered **deliverables** (HTML / xlsx) sit at the unit root. Edit source in `md/`, then re-render.

## 约定 · Convention

- **这是"产出"区**。空白模板（输入）在 [`../templates/`](../templates/)——别把产出写进 templates。
- 本 `output/` 下自带三份**示例产出**：`characters/cang-lan/`（苍岚分稿）、`characters/jin-yu/`（烬羽完整稿）、`bosses/gu-ya/`（孤鸦）——act-combat-design 用来演示输出长什么样，**不需要可整个删除**。
- `output/` 下的内容**默认被 `.gitignore` 忽略**（除本 README 与 `.gitkeep`），这样你的 WIP 设计稿不会污染仓库。需要把某份稿子纳入版本控制时，自行 `git add -f`。
- **路径可改**：这只是默认推荐。你也可以让 AI 输出到你项目自己的文档目录（例如你团队的 `docs/战斗设计/`）。把你的偏好写进 [`../conventions/`](../conventions/TEMPLATE.md) 或直接告诉 AI 即可。
- 命名建议：`<对象中文名>-战斗设计.md`（玩家角色）/ `<对象中文名>-Boss设计.md`（Boss）。

> Path is just a recommended default — you can point the AI at your own project's docs folder instead. `output/` contents are gitignored (except this README) so WIP drafts don't clutter the repo.
