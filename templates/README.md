# templates/ — 空白模板（输入）

这里放**空白起始模板**。设计产出请落到 [`../output/`](../output/)，别写进这里。

## 为什么一个 HTML、一个 MD？（两种产出方向，格式不同）

战斗设计的产出天然分**两个方向、两种受众、两种媒介**，所以是两个模板：

| 模板 | 方向 | 给谁 | 为什么是这个格式 |
|---|---|---|---|
| **`blank-design-doc.html`** | **审阅向 + 落地配置** | 策划 / 主策 / 美术评审；以及配置人员 / AI 读落地细节 | 设计稿需要**叙事 + 富交互**（技能卡 / 阶段 Tab / 评审批注 / 改动留痕 / 贴图贴视频 / 导出回传），HTML 是最贴合的载体 |
| **`blank-resource-requirements.md`** | **落地 · 资源生产** | 美术 / 程序照着产出资产 | 资源需求本质是**结构化表格**（逐资产 / 逐帧 / 逐特效）。markdown 表格**任何平台 / 任何 agent 都能读**；团队要 xlsx 时用 [`../scripts/`](../scripts/) 一键转（Windows + Excel） |

> 简单说：**HTML 是"给人看、评审、迭代"的设计稿；md 表是"给人 / 程序照着做"的资源清单**。两者一叙事一表格，配合使用，不重复。

## blank-design-doc.html 的结构（关键：内部区分审阅 / 落地）

这份 HTML 模板沿用一套实战打磨过的「审阅级」结构，**内部把审阅和落地分章**，所以既好评审、又能直接落地：

- **审阅向章**（核心机制 + 招式一览）—— 看这一章就掌握"这个单位是什么、怎么打"，供快速评审。
- **落地向章**（落地配置细节）—— 行为 / 数值 / 几何 / 收益曲线 / 时间线，供配置人员 / AI **照着落地**。
- **资源清单**（概览级）—— 估成本用；逐资产逐帧的明细走 `blank-resource-requirements.md` → xlsx。
- **Tab 系统** —— 既可做多形态 / 多阶段，也可做**双场战**（中段战 / 末段战各一个 Tab）。

> 这套结构解决了"审阅稿和落地细节混在一起、评审费劲"的老问题——审阅的人看审阅章，落地的人看落地章 + 资源 xlsx。

## 换主题色（注意！）

模板默认**冷蓝**基底。换主题色时颜色分两类：`:root` 变量（好改）+ **散落各处的 hard-coded 颜色**（易漏——本模板当初从米黄换蓝，就漏过未选中 Tab 底、阶段条底两处暖色）。**务必按 [`review-html-components.md` § 七 换肤 checklist](../references/review-html-components.md) 逐区域核对渲染**，别只改 `:root` 就以为完事；并**保留功能语义色**（金/紫预警、删除红、恢复绿等，靠跟主题色对比传意）。

## 怎么用

1. 复制对应模板到 [`../output/characters/<单位>/`](../output/) 或 `../output/bosses/<单位>/`。
2. HTML：改顶部 `LS_PREFIX`、`<title>`、各 `<section>` 内容、Tab 标签。
3. 资源 md：删示例行、按你的设计填；要 xlsx 用 `../scripts/`。
4. 想看填好的样子 → [`../output/characters/cang-lan/`](../output/characters/cang-lan/)（苍岚分稿）、[`../output/characters/jin-yu/`](../output/characters/jin-yu/)（烬羽完整稿）、[`../output/bosses/gu-ya/`](../output/bosses/gu-ya/)（孤鸦，含 HTML + md + xlsx）。
