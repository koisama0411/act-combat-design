# 评审反馈迭代标记套件(配套 review-html-doc / review-html-components)

设计稿走**第二轮 / 第三轮评审**时,**直接在原稿上标「旧 vs 新」** —— 不删旧内容(留作历史对照),让评审人 / 美术 / 策划一眼看清「为什么改 / 改成什么」。本套件从双场战稿走第二轮评审反馈的实战中沉淀,**可移植到任何 audit-grade HTML 设计稿**。

**什么时候看本文**:
- 设计稿走第二 / 三轮评审反馈,要在原稿上标「旧 vs 新」对照
- 复用 changeset 标记 CSS 套件

**什么时候不用看**:
- 首次出设计稿(没有「旧 vs 新」对照需求)→ 看 [范式文档](review-html-doc.md) + [组件实现](review-html-components.md),交互层从模板复制不动

> 📎 本文从 [组件实现 § 六](review-html-components.md) 拆出——「首次出稿组件实现」(组件实现) 与「评审迭代标记」(本文) 是两个关注点,分开维护。

---

## 一、套件:4 个 CSS 类 + 1 个摘要框

| 类 | 用途 | 适用场景 |
|---|---|---|
| `.changeset-old` (block) | 整段 / 整卡 / 整表 标「已移除」 — 灰底 + 划线 + 角标徽章 | 整 skill 卡 / 整 table 行 / 整 section 删除时 |
| `.changeset-new` (block) | 整段 / 整卡 标「新增 / 调整」 — 浅黄底 + 左竖条 + 角标徽章 | 整个新区块加入时 |
| `.cs-old-inline` (inline) | 段落 / 单元格内 短语标旧 — 灰底划线 | 句子里某个词替换、表格单元格内某个 chip 标旧 |
| `.cs-new-inline` (inline) | 段落 / 单元格内 短语标新 — 浅黄底 | 同上,新内容 |
| `.changeset-summary` (block) | 影响章节顶部的整体说明 + 标记图例 | 评审反馈影响多章节时,在 § 肆(或被改最多的章节)顶部放一个 |

---

## 二、CSS 完整代码(挂到 style 块尾部)

```css
/* ===== 评审反馈调整标记 ===== */

/* 顶部整体摘要框 */
.changeset-summary {
  background: linear-gradient(to right, #fff8d6, #fefce8);
  border-left: 4px solid #d4a85a;
  padding: 14px 18px 12px;
  margin: 16px 0 24px;
  border-radius: 6px;
  font-size: 13px;
}
.changeset-summary .cs-title {
  font-weight: 700;
  font-size: 14px;
  color: #8a6a1f;
  margin-bottom: 6px;
  letter-spacing: 0.3px;
}
.changeset-summary .cs-body { color: #5a4d23; line-height: 1.7; }
.changeset-summary code { background: rgba(212,168,90,0.18); padding: 1px 5px; border-radius: 3px; }

/* 块级 已移除 */
.changeset-old {
  background: #f0f0f0 !important;
  color: #999 !important;
  position: relative;
  opacity: 0.7;
  margin-top: 14px !important;
}
.changeset-old::before {
  content: "✗ 已移除";
  position: absolute;
  top: -10px;
  left: 10px;
  font-size: 10px;
  background: #999;
  color: white;
  padding: 1px 7px;
  border-radius: 3px;
  letter-spacing: 0.6px;
  font-weight: 600;
  z-index: 2;
}
.changeset-old, .changeset-old * {
  text-decoration: line-through !important;
  text-decoration-color: #999 !important;
  color: #999 !important;
}
.changeset-old strong, .changeset-old em, .changeset-old .skill-name,
.changeset-old .skill-id, .changeset-old .skill-tag, .changeset-old .chip,
.changeset-old .skill-mech, .changeset-old .num, .changeset-old .name,
.changeset-old th, .changeset-old td.phase, .changeset-old .stage-tag,
.changeset-old .combo-section-title, .changeset-old .trigger-name,
.changeset-old .branch-target {
  background: transparent !important;
  color: #999 !important;
  border-color: #ccc !important;
}
.changeset-old::before { text-decoration: none !important; }

/* 块级 新增/调整 */
.changeset-new {
  background: #fff8d6;
  border-left: 3px solid #d4a85a;
  padding: 10px 14px 12px;
  position: relative;
  margin-top: 14px;
  border-radius: 4px;
}
.changeset-new::before {
  content: "✦ 新增 / 调整";
  position: absolute;
  top: -10px;
  left: 10px;
  font-size: 10px;
  background: #d4a85a;
  color: white;
  padding: 1px 7px;
  border-radius: 3px;
  letter-spacing: 0.6px;
  font-weight: 600;
}

/* ⚠️ TR 行(table-row)的 changeset 徽章必须挂 td:first-child::before,不能挂 tr::before(会漂位)
   —— 完整 TR 徽章 CSS + 原理见 组件实现 § 五 陷阱 4,复制套件时把那段一并带上 */

/* 内联标记(用于段落 / 表格单元格里的关键短语,不破坏行级排版) */
.cs-old-inline {
  background: #f0f0f0;
  color: #999 !important;
  text-decoration: line-through;
  text-decoration-color: #999;
  padding: 0 5px;
  border-radius: 2px;
  margin: 0 1px;
}
.cs-new-inline {
  background: #fff8d6;
  color: #5a4d23 !important;
  border-left: 2px solid #d4a85a;
  padding: 0 6px;
  border-radius: 0 2px 2px 0;
  margin: 0 1px;
}
```

> ⚠️ **TR 行徽章去重说明**:表格行的 `tr.changeset-old/new` 徽章 CSS(`tr.changeset-* ::before { content: none }` + `tr.changeset-old > td:first-child::before {...}`)统一放在 [组件实现 § 五 陷阱 4](review-html-components.md),那里连原理(TR 是 `display: table-row`,不能做 `position: absolute` 锚点)一起讲。**复制本套件时,务必把组件实现陷阱 4 的那段 TR CSS 一并复制进 style 块**,否则表格行标记会漂位。

---

## 三、标准工作流(评审反馈到位后的处理)

```
反馈到达
   ↓
① 通读评审备注(note-detail 等)+ 资源清单的 deleted-rows / added-rows / static-edits
   归纳出反馈核心(往往就 2-3 条机制级改动)
   ↓
② 在影响最大的章节(通常是 § 肆 详细设计)顶部放 .changeset-summary 摘要框
   摘要框包含:反馈核心简述 + 标记图例(旧底色样 + 新底色样)
   ↓
③ 跨章节扫描所有跟反馈相关的引用(用 grep 关键词:被删的机制名 / 招式名 / 概念名)
   常见涉及章节:壹 设计哲学 / 贰 剧本时序 / 叁 双场对比 / 肆 详细设计 / 伍 双绑定 / 陆 资源清单 / 柒 元规则
   ↓
④ 用合适粒度标记:
   - 整 skill 卡 / 整 table 行 / 整 section 删除  → 块级 .changeset-old(单 class 加在元素本身)
   - 整个新加的区块                                → 块级 .changeset-new + 紧跟 .changeset-old 之后
   - 句子里某个词替换 / 单元格内 chip 替换         → 内联 .cs-old-inline + 紧跟 .cs-new-inline
   ↓
⑤ 终扫:再 grep 一遍确认所有「裸」引用都已包好(扣掉 .changeset-old / cs-old-inline / 新内容里的合理引用)
   ↓
⑥ 用户 F5 验收
```

---

## 四、关键约定

- **TR 行不能用块级 `.changeset-old::before` 徽章** —— 见 [组件实现 § 五 陷阱 4](review-html-components.md)。要徽章必须挂 `td:first-child::before`。复制套件时一并带上那段 CSS。
- **chip 内不要塞 cs-inline** —— `<span class="chip"><s class="cs-old-inline">旧</s> <span class="cs-new-inline">新</span></span>` 会让 chip 撑变形。改写成**两个独立 chip**(旧 chip 自带 strike 样式 + 新 chip 自带高亮样式),空格分隔。
- **保留旧内容是 feature 不是 bug** —— 评审反馈走多轮时,留底让所有人能追溯「为什么改」。**不要「清理」旧 changeset-old 块**,除非用户明确说「重新出干净稿了」。
- **资源清单不要重复标** —— 资源行已经被网页运行时通过 `deleted-rows` 划除(见 [组件实现 § 四 存储架构](review-html-components.md)),不要再加 `.changeset-old`(会双重标记)。`.changeset-old` 只用在那些**没被 deleted-rows 划掉、但因设计反馈而逻辑移除**的位置(比如某个 vfx 资源跟被砍的机制绑定)。
- **顶部 .changeset-summary 摘要框** 写法示例:

  ```html
  <div class="changeset-summary">
    <div class="cs-title">📌 基于 YYYY-MM-DD 评审反馈调整</div>
    <div class="cs-body">
      <strong>模块 A</strong>:砍掉<code>X</code> + <code>Y</code>,改为...<br>
      <strong>模块 B</strong>:核心收敛到<strong>Z</strong>,可派生多个分支...<br>
      <span style="color: #999;">— 旧内容用</span><span style="background: #f0f0f0; color: #888; padding: 0 5px; text-decoration: line-through;">灰底划线</span><span style="color: #999;">保留,新增/调整用</span><span style="background: #fff8d6; padding: 0 5px; border-left: 3px solid #d4a85a;">浅黄底</span><span style="color: #999;">标注。</span>
    </div>
  </div>
  ```

---

## 五、反模式

- ❌ 评审反馈直接删旧内容,不留痕迹 — 评审人 / 美术 / 策划下次打开找不到「为什么改」,一切从零讨论
- ❌ 用浏览器自带 review tool(`.review`)做标记 — 那个挂在 sessionStorage,跨标签 / 关 tab 丢失,且不带「旧 vs 新」对照语义
- ❌ 单 chip 内塞 cs-inline 嵌套 — chip 撑变形,排版破裂(改两个独立 chip)
- ❌ 跨章节标记不一致 — § 肆 改了,§ 叁 / § 伍 / § 柒 没跟着改,评审人看到不同章节描述不一致就开始怀疑设计是否真改了。**Phase 0 必须 grep 关键词扫所有章节**
- ❌ 资源清单已 deleted-row 划线的行再加 .changeset-old — 视觉上双重标记
