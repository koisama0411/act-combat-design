# 审阅级 HTML 组件实现(配套 review-html-doc)

[审阅级 HTML 设计文档范式](review-html-doc.md) 是**范式 + 用法**(平时阅读),本文是**组件实现细节 + 技术陷阱**(只在重写 HTML 交互层时查)。

**什么时候看本文**:
- 从零重写 HTML 交互层
- 修复模板组件的 bug
- 在新组件里复用既有交互模式

**什么时候不用看**:
- 出新设计稿(直接复制空白模板,改文案,**交互层全部不动**)
- 设计稿评审 / 填资源清单

> 本文所有代码片段抽取自一份完整成稿的交互层。本仓的 [`templates/blank-design-doc.html`](../templates/blank-design-doc.html) **就是从同源实战稿提取的完整版**——这些富媒体协作层(IndexedDB / B站YT iframe / 改动历史富交互 等)都已内置;本文解释它们的实现,供你**改模板 / 复用组件 / 排查 bug 时**查阅。

---

## 一、呈现层组件(肆节,把 pre 文本流升级成可视化)

技能模组 / AI 策略 / 连招 / 剧情杀过场 别堆在 `<pre>` 里,用这套组件:

| 组件 | 用途 | 类名 |
|---|---|---|
| **技能卡片网格** | 技能模组 — 每个 skill 一张卡,★ 重点招金边,复用/新增 chip 标签,机制类别标签,子结构 skill-sub | `.skill-grid .skill-card(.star)` |
| **审阅卡片描述·双标签** | 审阅向卡片描述拆「表现」(长啥样)+「玩法」(怎么打)两行,胶囊标签领头,详见 § 一(a) | `.star-card .desc` / `.skill-desc` 内 `<p><span class="dl">` |
| **距离权重条** | AI 距离权重 — 横向 stacked bar,段宽=权重% | `.ai-distance .dist-row .dist-bars .dist-seg` |
| **HP 阶段时间轴** | HP 阶段调节 — 顶部彩色 bar + 阶段卡列表 | `.hp-axis .hp-axis-bar .hp-stage .hp-stage-item` |
| **流程图** | 剧情杀过场 / 凶意爆发 / 狂暴态 — 步骤卡 + 箭头,圆形编号徽章(kill 红 / end 灰) | `.flow-chart .flow-step .flow-arrow` |
| **连招卡片** | 连招策略 — 分组标题 + 起手卡 + 概率分支 / 链式 chain-step | `.combo-section .combo-card .combo-branches .combo-chain` |
| **玩家行为响应规则表** | AI 策略 — 玩家做 X → boss 优先级响应 Y(优先级高于距离权重)。<br>3 列普通 `<table>`:玩家行为(触发条件) / boss AI 响应(带概率) / 设计意图。详见 § 一(b) | 朴素 `<table>` 用 inline style 染色(行隔行变色 + 双场调色) |

**保留 `<pre>` 的场景**:无 —— 全部改卡片化。
连招树状分支用 `.combo-chain` 的 chain-step。

**内容选型 ·「是什么」vs「为什么」**:机制概览 / 核心记忆点这类「N 条并列、每条小标题 + 一句话」的**「是什么」**用 `.stars` 星卡(`.star-card` 的 num + name + desc);设计意图 / 因果解释 / 权衡论述这类连贯推理的**「为什么」**保留散文 / `.philosophy`,**不可拆成并列卡片**(拆了因果链就断)。判据看这段回答「是什么」(并列清单 → 卡)还是「为什么」(因果论述 → 散文);概览归概览、论述归论述、分层共存(范本:烬羽 贰·机制概览卡 + 肆·因果 `.philosophy`)。

### 一(a) 审阅卡片描述「表现 / 玩法」双标签

审阅向卡片(机制 `.star-card` / 招式 `.skill-card`)描述默认一行浅灰小字,密度低又易被忽略。升级成两行带胶囊标签:「表现」(长啥样/演出) + 「玩法」(怎么打/反制),关键词 `<strong>` 标红。

结构:`<div class="skill-desc"><p><span class="dl">表现</span>…</p><p><span class="dl">玩法</span>…</p></div>`

```css
.star-card .desc, .skill-desc { font-size: 14px; color: #2b3444; line-height: 1.75; }
.star-card .desc p, .skill-desc p { margin: 5px 0 0; }
.star-card .desc p:first-child, .skill-desc p:first-child { margin-top: 0; }
.dl { display: inline-block; font-size: 11px; font-weight: 700; color: var(--accent);
      background: var(--hl); border-radius: 3px; padding: 1px 7px; margin-right: 7px;
      letter-spacing: 1px; vertical-align: 1px; white-space: nowrap; }
```

- 标签按内容换(表现/玩法、表现/定位);`.dl`(红字黄底·描述维度)别跟 `.skill-mech`(蓝边金字·机制类别)混。
- 常配合「双章拆分」(见 [范式文档 § 一](review-html-doc.md))用:审阅向卡片讲玩法,精确数值留落地向。

### 一(b) AI 策略段三件套结构

战斗设计稿肆节里的「AI 策略」段稳定下来用三件套覆盖完整 AI 表达:

```
┌──────────────────────────────────────────────────────────────┐
│  距离权重横向条     近 / 中 / 远 距离 × 各招式概率分布          │
│  HP 阶段时间轴       boss HP 区间内 招池 / 属性 / 解锁 的变化   │
│  玩家行为响应规则表   玩家做 X → boss 优先级响应 Y(优先级高于  │
│                       距离权重),含具体百分比 + 设计意图列      │
└──────────────────────────────────────────────────────────────┘
```

**为什么三件套缺一不可:**

| 维度 | 解答的问题 |
|---|---|
| 距离权重 | 「无玩家输入时 / boss 主动出招时,boss 出什么招?」 — 静态行为基线 |
| HP 阶段时间轴 | 「boss 血量进展时招池 / 属性 / 强度 怎么变?」 — 时间维度的动态 |
| 玩家行为响应规则 | 「玩家做了具体动作时 boss 如何反应?」 — 交互维度的响应,**优先级压过距离权重** |

只有距离权重 → boss 像无脑随机机;只有 HP 阶段 → 像数值跑表;只有响应规则 → 找不到 baseline。三件套拼起来覆盖**静态 baseline + 时间演进 + 交互反应**,boss 表现才完整。

**玩家行为响应规则表标准列:**

| 列 | 内容 | 示例 |
|---|---|---|
| 玩家行为(触发条件) | 距离 / 状态 / 招式前摇 / 上次见切结果 / 韧性条状态 等明确触发条件 | 「贴脸长按攻击(≤ 1 格,持续 1s+)」 / 「玩家蓄招 / 大招前摇」 / 「boss 韧性条破」 |
| boss AI 响应 | 具体招式 + 概率(多选时)+ 派生分支名(如有) | 「70% 后撤步拉距 / 30% skill5 重劈反压」 |
| 设计意图 | 一句话讲清为什么这样响应 | 「怕输性格 — 贴脸先躲不正面打」 |

**关键触发条件清单**(可按需选用):
- 距离梯度:贴脸 ≤ 1 格 / 中距 2-4 格 / 远距 > 4 格(格 = 你项目的距离单位,自行定义)
- 玩家攻击状态:无攻击意图 / 蓄招长前摇 / 大招前摇 / 连段中
- 玩家位移状态:走位躲招 / 横移 / 跳跃 / 浮空中 / 倒地起身
- 见切反馈:上次见切失败 / 连续见切成功 ≥ 3 次 / 闪过必闪预警招
- boss 自身状态:HP 阶段(50% / 30% / 10%)/ 韧性条破 / 觉醒态触发
- 元规则补丁:玩家 HP 满血连续闪反(「被气到」频次 +30%) / boss 长时间未命中(焦躁)

**配色约定:**
- 普通行:行隔行交替底色(原色 / 浅染色)增强可读性
- 高亮行(关键 / 高优先级响应,如「韧性破触发狂暴」):染该场强调色 + `font-weight: 600`
- 双场各自用 p1-card / p2-card 作表头底色,跟该场调性一致

**反模式:**
- ❌ 只写距离权重,不写响应规则 → AI 看起来「机械」 / 玩家无法预判 boss 反应
- ❌ 响应规则不写设计意图 → 数值组改概率时把设计原意改没了
- ❌ 把响应规则塞进距离权重表的注释 → 优先级关系丢失,看起来响应只是距离的特例

### 一(c) 图表 lightbox(正文 SVG 点击放大)

数值建模章的曲线图 / 梯度图直接画进正文 SVG,在文档流里尺寸受限、细节看不清。给**正文图表**加一层点击放大的 lightbox:点图弹出米黄底大图,支持**滚轮缩放 + 拖动平移 + 复位 + Esc 关闭**。

**关键设计:**
- **选择器只命中图表** —— 用 `svg[role="img"]`(语义化图表 SVG),**不命中**装饰性 / 图标类 SVG;给数值建模图表 SVG 统一加 `role="img"` 即自动接入。
- **代码完全独立** —— 一个 `<style>` + 一个 IIFE `<script>`,挂在 `</body>` 之前;**不碰协作交互层**(不读写 sessionStorage / IndexedDB,不参与导出),复制 / 删除都不影响审阅协作闭环。
- **弹层用 `cloneNode(true)`** 克隆原图,缩放 / 平移作用在克隆体的 `transform` 上,不动正文里的原 SVG。
- **图按界面 fit 完整显示**:`width:94vw` 撑满宽 + `max-height:88vh` 封顶高 + `height:auto` 等比 —— 宽图撑满宽、高图触顶时自动等比缩到完整居中(两侧留边),都**完整可见、不被裁**;滚轮可再放大看细节、拖动平移。(早期用固定 `width:min(1180px,…)` 会让大屏只占六成、且高图超屏被裁,已废弃。)
- ⚠️ **`!important` + `max-width:none` 不能省** —— 图表 svg 常自带 inline `style="max-width:…"`(补图时为控正文内显示宽度加的),inline 优先级压过外部 CSS;不强制覆盖,放大态会被 inline 的 max-width 卡死(只占该宽、不 fit、看着像"没生效")。只要有一张图带了 inline 宽度限制就会被卡,故 fit CSS 一律用 `width:94vw!important;max-width:none!important` 兜底。
- 关闭三入口:点弹层空白处 / Esc / 复位按钮(复位只归零缩放平移,不关弹层)。

**完整代码(原样复制,挂 `</body>` 前):**

```html
<style>
/* 图表点击放大 lightbox(独立功能,不影响协作交互层)· 支持滚轮缩放 + 拖动平移 */
svg[role="img"]{cursor:zoom-in;transition:opacity .15s;}
svg[role="img"]:hover{opacity:.85;}
.fig-lb{position:fixed;inset:0;background:rgba(20,28,42,.82);z-index:99999;display:none;align-items:center;justify-content:center;padding:28px;cursor:zoom-out;}
.fig-lb.open{display:flex;}
.fig-lb-inner{background:var(--paper);border-radius:10px;padding:22px 24px;max-width:96vw;max-height:92vh;overflow:hidden;cursor:grab;box-shadow:0 10px 50px rgba(0,0,0,.45);}
.fig-lb-inner svg{width:94vw!important;max-width:none!important;height:auto;max-height:88vh!important;transition:transform .06s ease-out;}
.fig-lb-hint{position:fixed;top:16px;right:22px;color:#fff;font-size:13px;opacity:.9;background:rgba(0,0,0,.3);padding:4px 13px;border-radius:14px;}
.fig-lb-reset{position:fixed;top:16px;left:22px;color:#fff;font-size:12px;opacity:.9;background:rgba(0,0,0,.3);padding:4px 13px;border-radius:14px;cursor:pointer;}
.fig-lb-reset:hover{opacity:1;background:rgba(0,0,0,.5);}
</style>
<script>
(function(){
  var lb=document.createElement('div');lb.className='fig-lb';
  lb.innerHTML='<div class="fig-lb-reset">↺ 复位</div><div class="fig-lb-hint">滚轮缩放 · 拖动平移 · 点空白 / Esc 关闭</div><div class="fig-lb-inner"></div>';
  document.body.appendChild(lb);
  var inner=lb.querySelector('.fig-lb-inner');
  var scale=1,tx=0,ty=0,drag=false,lx=0,ly=0,cur=null;
  function applyT(){if(cur)cur.style.transform='translate('+tx+'px,'+ty+'px) scale('+scale+')';}
  function reset(){scale=1;tx=0;ty=0;applyT();}
  function openLB(svg){inner.innerHTML='';cur=svg.cloneNode(true);cur.style.transformOrigin='center center';inner.appendChild(cur);reset();lb.classList.add('open');}
  function closeLB(){lb.classList.remove('open');inner.innerHTML='';cur=null;}
  document.querySelectorAll('svg[role="img"]').forEach(function(svg){
    svg.style.cursor='zoom-in';
    svg.addEventListener('click',function(e){e.stopPropagation();openLB(svg);});
  });
  lb.addEventListener('click',function(e){if(!inner.contains(e.target)&&!e.target.classList.contains('fig-lb-reset'))closeLB();});
  lb.querySelector('.fig-lb-reset').addEventListener('click',function(e){e.stopPropagation();reset();});
  document.addEventListener('keydown',function(e){if(e.key==='Escape'&&lb.classList.contains('open'))closeLB();});
  inner.addEventListener('wheel',function(e){if(!cur)return;e.preventDefault();scale*=(e.deltaY<0?1.15:1/1.15);scale=Math.max(0.4,Math.min(6,scale));applyT();},{passive:false});
  inner.addEventListener('mousedown',function(e){if(!cur)return;drag=true;lx=e.clientX;ly=e.clientY;inner.style.cursor='grabbing';e.preventDefault();});
  window.addEventListener('mousemove',function(e){if(!drag)return;tx+=e.clientX-lx;ty+=e.clientY-ly;lx=e.clientX;ly=e.clientY;applyT();});
  window.addEventListener('mouseup',function(){if(drag){drag=false;inner.style.cursor='grab';}});
})();
</script>
```

> 样本:本仓 `output/characters/jin-yu/烬羽-战斗设计及养成效果.html` 的数值建模 5 图就靠这套 lightbox 点击放大(搜 `fig-lb`)。

---

## 二、审阅交互组件

### 操作列(每行)

- **默认态**:`[编辑] [划除/恢复]` 两个按钮(明确入口,不靠「点空白处」隐藏交互)
- **点编辑** → 进编辑态:数据列变可编辑(浅黄底 + 虚线框),操作列变 `[确定] [划除]`
- **点确定** → 保存 + 锁定回默认态;**新增行全空则丢弃**
- **点划除** → toggle `is-deleted`(整行划线灰化,可恢复)
- 点行任意空白处也能 toggle 划除(保留为快捷方式)

### + 新增资源

每个 `.res-table` 底部一个按钮 → 追加 `is-editing` 草稿行,直接可编辑。rid 用 `n0/n1...`。**复用表也注入**(评审中常需追加「漏归类的复用资源」)。

### 章节数字动态统计

`<h4>` 里的「X 个/项」 + 顶部汇总卡片大数字,实时反映可见行数(排除 `is-deleted` + `is-editing`)。
- h4 数字包成 `.dyn-count`(浅蓝底 + 蓝边 + accent 粗字),**常驻高亮**
- 汇总卡片 `.n` 常驻浅蓝底 + 蓝边,变化时 `.pulse`(高亮蓝底 + 放大 0.6s)
- 实现:`updateAllRowCounts()` + MutationObserver 监听 `#assets` + `saveDeleted/exitEditMode` 内同步调用(双保险,不只靠 observer)
- ⚠️ **汇总卡片副标(`.sub`)别写死数字** —— 大数字 `.n` 是 JS 动态统计的(随增删行自动同步),但 `.sub` 副标是**静态文字**,写死的数字(如「招式 6 + 通用集」)**不在统计范围、不会同步** → 用户增删资源行后副标数字过时、跟大数字对不上。**副标只写构成描述(如「招式 + 通用集」),不写数字**。(某 Boss 稿实战中踩出:加 1 个动作,大数字 7→8 自动同步,但副标还停在「招式 6」)
- ⚠️ **复用段(`.reuse-h4`,h4 含「复用」)不计入卡片大数字** —— `updateAllRowCounts()` 只统计「非复用」`res-table` 的行数(看紧邻前一个 h4 是否含「复用」)。所以**复用反转落版时**把可复用资源放进「含复用」的 h4 段 → 卡片大数字自动只剩「新增」数,无需手算。
- ⚠️ **`catH3s` 章节过滤别把「无表章节」算进卡片映射** —— 卡片按「资源章节 h3 顺序」逐一对应 `.res-summary` 卡片(idx 映射)。若某资源章节(如「五、场景/演出」)**只有说明没有 `res-table`**,却被算进 `catH3s`,会让它后面的卡片(如「程序需求」)**整体错位、被统计成 0**。修法:过滤正则排除无表章节(`/^[一二三四六]、/` 跳过「五」)。(某 Boss 稿复用落版时踩出并修)

### 评审备注

`.note-aside` 每 section 末尾,黄虚线框,contenteditable + 富媒体(图/动图/视频/B站YT),右上「清空」键。窄屏 `< 2000px` 折叠到章节底部。

### 改动历史区(头部固定模块,`.history-block`)

紧接 cover + 协作说明,在 TOC 之前。**给收件人扫一眼就能看到本次回传都动了什么**(谁 · 何时 · 改了哪 · 改成什么)。

**结构**:`<table class="history-table">` —— 用**真表格**而非 grid 模拟,核心是要靠 `rowspan` 让浏览器原生处理「同 (日期 + 编辑者) 组的垂直居中」
- 6 列:时间 / 编辑者 / 内容 / 操作 / 摘要 / ✕
- sticky 表头 + `border-right: 1px solid rgba(217, 210, 197, 0.45)` 淡列分隔 + `vertical-align: middle`
- 翻页:每页 **10 条**,最新在前;≤ 10 条时翻页器自动隐藏;新条目落记时 currentPage 重置 1
- 行 hover → 整行金黄底 + scope 列尾出现 `↗ 点击跳转`
- `.h-del` 按钮 hover 整行才显形(默认透明避免视觉噪音)

**自动记录的事件**(全部走 `document.addEventListener('input'/'click', ..., true)` 委托,跟基础交互层解耦):
- 评审备注 / 资源单元格 input → `debounce 1800ms` → log `edit`
- 评审备注 clear-btn → log `clear`
- 资源行 add-row-btn → log `add-row`
- 行划除 / 恢复(按钮 + 行空白点击两种入口) → log `delete-row` / `restore-row`

**条目结构**:`{ ts, who, scope, action, summary, count?, target? }`
- `target`:跳转所需元数据 —— `{ type: 'note', key }` / `{ type: 'cell', tid, rid, cellClass, colIdx }` / `{ type: 'row', tid, rid }`
- `targetKey(target)`:生成稳定 key(如 `note:note-philosophy` / `cell:t0/r3/contrib-cell`),用于「同内容块」匹配

**只留最终状态**(三层去重,**不留过程中间记录**):
1. **note/cell 的 edit/clear 折叠**:同 `targetKey` × 同编辑者 → 永远合并为一条,`arr.splice(i, 1)` 出来重 `push` 到末尾(保持最新事件在最后),`count` 仅对「同 action 连续重复」累加,action 切换(edit↔clear)时重置 1
2. **行 toggle 对消**:`logRowToggle` 找最近一条同 `(tid, rid)` row 记录,若为反向 action → 直接 `splice` 删除,不新增(净结果归零不留痕)
3. **基线对比**(关键陷阱):`elementSignature(el) = textContent + 媒体源列表`,**不用 innerHTML**(contenteditable 删空后 `<br>` 残留会误判);`debouncedLog` 触发时若 `isAtBaseline(el)` → 调 `removeMatchingEntry(target)` 清除该 内容块×编辑者 的已有记录
   ```js
   function elementSignature(el) {
     const text = (el.textContent || '').replace(/\s+/g, ' ').trim();
     const mediaSigs = [];
     el.querySelectorAll('img, video, iframe').forEach(m => {
       mediaSigs.push(m.tagName + ':' + (m.getAttribute('src') || '').slice(0, 200));
     });
     return text + '||' + mediaSigs.join('|');
   }
   ```

**基线快照时机**(两路兜底):
- 初始化后 600ms 批量快照所有 `[contenteditable="true"]`(等 IDB 异步恢复完)
- `focusin` 拦截,首次 focus 进编辑区时快照(覆盖动态编辑模式 / 新增行 / 后期才出现的可编辑元素)

**视觉合并(rowspan 分组)**:
- 渲染前按 `(fmtDate(ts) + who)` 把 page 内连续条目分组
- 组首行的时间 + 编辑者两个 `<td>` 加 `rowspan="N"`,后续行不渲染这两个 td
- `vertical-align: middle` → 浏览器原生让 rowspan 单元格内容垂直居中
- 时间用 `fmtDate(iso)` 只到年月日(`YYYY-MM-DD`),不带小时分钟 —— 同一天的事件合并到同一组才有意义

**点击跳转 + 高亮**:
- 行点击 → 读 `data-target` JSON → `findTargetEl(target)` → `scrollIntoView({ block: 'center' })` + `applyFlash(el)`
- 高亮 2s 金黄脉冲(`@keyframes history-jump-flash-kf`):`background-color` + `box-shadow` 同时动画;**TR 目标逐 td 应用**(避免表格 `<tr>` 背景在某些浏览器不显)
- 找不到目标(本地已重置 / 行被永删)→ `.history-toast` 提示 2.2s 后淡出

**单条删除(✕)**:每行末尾 `<button class="h-del" data-idx="N">✕</button>`,hover 整行才显形;点击 stopPropagation + preventDefault(阻止触发跳转)→ `arr.splice(idx, 1)` → 重渲染 + toast「已删除该条历史」

**当前编辑者输入框**:头部 head bar 右侧,值存 `__editor__` key,所有记录自动署名;**点导出时 prompt 默认填这个值**(`window.__getEditorName()` 暴露)

### 左侧坞 + 两级章节导航(`.left-dock`,替代旧右下角 collab-actions + 右侧 float-toc)

**`.left-dock` 容器**:`position: fixed; right: calc(50% + 716px); top: 56%; transform: translateY(-50%); width: 210px; display: flex; flex-direction: column; gap: 14px;`

—— 把章节导航 + 协作工具 + 置顶按钮三块**所有左侧交互**收拢到一处,垂直居中稍偏下,扫一眼就知道哪里能点。

从上到下三块:
1. **`.float-toc` 浮动章节导航**(滚过 cover 才淡入)
2. **`.collab-actions` 协作工具栏**:`[📤 导出修改版] [♻️ 重置本地]`
3. **`.back-to-top` 置顶按钮**(滚 > 240px 才淡入,跟 `.collab-btn` 同款外观)

**极窄屏 fallback**(viewport < 1500px):`.left-dock` 退化 `position: static`,`.float-toc` `display: none`,`.collab-actions` fix 到 `bottom: 22px; right: 22px`,`.back-to-top` fix 到 `bottom: 96px; right: 22px`(导出按钮上方),不丢入口。

**两级章节导航**(浮动 + 顶部 共用 `buildTree(listEl, getMainLabel)` builder):
- **主章节行**:`<button class="toc-chevron">▸</button> <a>章节名</a>`
- **chevron 样式**:24×22 加粗 13-14px 字号 + 圆角 + 透明描边;rest = 金色 `var(--gold)`;hover/expanded = 红 accent + 暖底 `#fdf3e0` + 显形描边;`.expanded` 时 chevron `transform: rotate(90deg)`
- **子项注入**:自动扫每个 `<section>` 的所有 `<h3>` 作为子项(包括 `.tab-panel` 内的;h3 无 id 时自动赋 `<section-id>-h3-N`)
- **P1/P2 分组**:`tab-panel` 内 h3 → 在 `<ol class="toc-sub">` 里插一条 `<li class="toc-group-label" data-panel="panel-pX">第一场/第二场</li>` 作为分组标签,按场次取 `--p1-accent` / `--p2-accent` 着色 + 上方实线分隔;**子项 `<a>` 不重复「第X场 · 」前缀**(组标签已说明)
- **子项点击 tab-panel 联动**:若目标 h3 在非激活 panel → `preventDefault` + 手动切 tab class(不调原 tab handler 的 scrollTo `#detail`)+ `setTimeout 50ms` scrollIntoView 直达 h3
- **展开动画**:`max-height: 0 → 1000px` + `transition: max-height 0.3s ease`

**浮动目录额外有的(顶部目录没有)**:
- **滚动联动**:`update()` 高亮当前主章节 + 当前 h3 子项;**只统计激活 tab-panel 内的** h3 位置(非激活的 h3 在 DOM 但视觉不可见,不算当前位置)
- **自动展开当前章节**:进入新主章节 + 用户没主动折叠过 → 加 `.expanded` class;用 `_userToggled` set 记住用户手动点过 chevron 的章节,**自动展开不覆盖用户意图**(避免「我折叠你又给我展开」的拉锯)

**顶部目录差异**:
- 保留 2-column 布局(`.toc > ol { columns: 2 }`),用 `.toc-main { break-inside: avoid }` 保证主项 + 子树整体不被拆栏
- `.toc-sub` 撤销 `columns: 2` 继承(`columns: auto`)
- **不做 scroll-active**(内联 TOC 不锚屏,active 闪烁意义不大)
- 共享 `bindClick(listEl)` —— chevron 切收起展开 + tab-panel 子项自动切 tab

### 复用资源视觉降权(沙青调,自动识别)

资源清单的「全复用」段(零美术成本)跟「新增」段视觉上要明显区分,否则美术认领时容易把复用项误以为是要做的产出 → 工作量估算错乱。

**自动识别**:JS 扫 `#assets` 内 h4,**含「复用」且不含「新增」**(避免混合段误标)→ 加 `.reuse-h4` + 插入 `<span class="reuse-badge">✓ 零成本</span>` 徽章 + 给紧跟的 `<table class="res-table">` 加 `.reuse-table` / 给紧跟的 `<ul>` 加 `.reuse-list`
- 命中规则:`text.includes('复用') && !text.includes('新增')`
- 典型命中:角色版全复用 / boss 自有招复用 / 双场全复用 段

**沙青色调**(冷色,跟暖纸暖红主色对冲。**踩过的坑**:绿色 `#5e7a3a` 太晃眼;沙褐 `#8b7a5a` 跟纸面融太深、跟新增段又区分不开;沙青正好):
| 元素 | 色值 |
|---|---|
| h4 标题 / 表头文字 / 徽章文字 | `#4a6e6e` |
| 徽章底色 / 表头底色 | `#dbe5e5` |
| 表 / 列表底色 | `rgba(95, 130, 130, 0.05)` |
| 左侧色条 / 徽章描边 | `#9bb3b3` |
| 正文文字 | `#6e7575` |
| 占位符文字 | `#9aa8a8` 冷灰 |

**📚 参考 / 📎 产出 列**降 `opacity: 0.5`(hover 恢复 1.0 — 仍可填),占位文字 override 成 「— 复用 · 无需新产出」 / 「📚 选填 · 留底参考」,明示美术不必认领。

---

## 三、协作列富媒体 + 媒体弹窗

参考列 / 产出列 / 评审备注区都接 `bindRichMedia()`,支持:

| 内容 | 操作 |
|---|---|
| 文本 / 链接 | 直接打字 / 粘贴 URL |
| 截图 / 动图 GIF | Ctrl+V 粘贴 / 拖拽,自动 base64 内嵌 |
| 本地视频(mp4/webm/mov) | 粘贴/拖拽,≤200MB;>50MB 二次确认;超 5MB 自动走 IndexedDB |
| 视频直链(.mp4/.webm) | 粘贴自动转 `<video>` |
| B站 / YouTube 链接 | 粘贴自动转 `<iframe>` 播放器 |
| 一格多个 | 反复粘贴/拖入,媒体依次排列 |

每个媒体被 `.media-wrap` 包裹(`draggable=false` 防原生拖拽误复制),hover 显示:
- **⛶ 放大** → `.media-popup` 弹窗预览(可拖标题移动 + 拖右下角 resize + Esc 关)
- **✕ 删除** → 移除该媒体;也支持光标紧邻时 Backspace/Delete 删

`window.wrapLooseMedia(cell)` 在加载已存内容后扫描裸 img/video/iframe 自动补 wrap。

---

## 四、存储架构:sessionStorage + IndexedDB

**核心原则:不点导出就不算保存。**

```js
const __LS = window.sessionStorage;  // 关标签页自动清空 / F5 保留 / 导出才永久
```

| 层 | 存什么 | 容量 | 生命周期 |
|---|---|---|---|
| sessionStorage | 划除/编辑/备注/新增 等文本数据 | ~5MB | 关 tab 清空,F5 保留 |
| IndexedDB | 大文件(>5MB 视频等),sessionStorage 满时兜底 | GB 级 | 用 session 标记模拟「关 tab 清」 |

### session 标记机制

`initEmbeddedData()` 启动检查 `LS_PREFIX + '__session_init__'`:
- **不存在 = 新 session**(首次打开 / 关 tab 重开)→ 清空 sessionStorage + IDB,从 HTML 内嵌数据重建,设标记
- **存在 = F5 刷新** → 啥都不做,保留本 session 编辑

### 键约定(全部 `LS_PREFIX` 前缀)

| key | 内容 |
|---|---|
| `deleted-rows` | 划线行 `tid\|rid` 列表 |
| `added-rows` | 用户新增行 `{tid:[{cells,confirmed}]}` |
| `static-edits` | 静态行编辑覆盖 `{tid\|rid:[cells]}` |
| `note-<section-id>` | 各节评审备注 |
| `ref-<tid>-<rid>` / `contrib-<tid>-<rid>` | 参考列 / 产出列内容(满了存 `'__IDB__'` 占位,实际进 IndexedDB) |
| `__history__` | 改动历史 JSON 数组,**最多 300 条**(超过会从头裁,配额异常时裁掉一半重存) |
| `__editor__` | 当前编辑者名字字符串(头部输入框值,所有 history 记录自动署名,导出 prompt 默认填这个值) |
| `__session_init__` | session 标记 |

**rid 规则**:静态行 `r0/r1...`(按 HTML 顺序,永不变);新增行 `n0/n1...`(递增,不复用)。

---

## 五、⚠️ 协作闭环四个致命实现陷阱(交互层抄写时务必保留正确写法)

实战踩出来的四个坑,完整成稿已修复;**从零重写交互层时极易重新踩**,前三个会让导出/协作整套静默失效,第四个会让评审反馈标记的「已移除徽章」漂到莫名其妙的位置:

**1. `__getAllContribFromIDB()` 读 IndexedDB 必须用 `tx.oncomplete` 收口**
一个事务里 `getAllKeys()` 一定先于 `getAll()` 完成。若把 `reqKeys.onsuccess` 嵌套赋值在 `reqVals.onsuccess` 里,等代码进到 `reqVals.onsuccess` 再给 `reqKeys.onsuccess` 赋值时,reqKeys 的 success 事件早已错过 → Promise 永久挂起 → **导出 / 重置按钮点了没反应、也不报错**(两个按钮 handler 开头都 `await` 这个函数)。正确写法:

```js
const reqKeys = store.getAllKeys();
const reqVals = store.getAll();
tx.oncomplete = () => {            // 两个请求都完成后才触发,此时 result 都就绪
  const out = {};
  (reqKeys.result || []).forEach((k, i) => { out[k] = reqVals.result[i]; });
  resolve(out);
};
tx.onerror = () => reject(tx.error);
```

**2. 「移除旧 embed 脚本」的正则 + 内嵌脚本开标签,都必须用字符串拼接构造**
导出时 `html` 装的是整份文档。「移除旧 embed 脚本」用的正则 `/<script id="__embed_state__">.../` 和构造 `dataScript` 用的开标签字面量,**其源码本身就含连续字面量 `<script id=…__embed_state__…>`** —— 它会被 `__ORIGINAL_HTML__` 快照进去,于是正则从这行源码处开始误匹配,非贪婪一路吃到主脚本真正的 `</script>`,把文档尾部(initCollab 后半 + initNotes + initFloatToc + 收尾标签)整段删掉 → **导出文件被截断、主脚本语法错误 → 重新打开后 initResources 不执行、资源列注入不上**。正确:开标签和正则都用拼接构造,让源码里永不出现连续的开标签字面量:

```js
const embedOpenTag = '<scr' + 'ipt id="__embed_state__">';
html = html.replace(new RegExp('<scr' + 'ipt id="__embed_state__">[\\s\\S]*?<\\/script>', 'g'), '');
const dataScript = embedOpenTag + 'window.__EMBED_STATE__ = ' + JSON.stringify(data) + ';' + /* … */ + '<\/script>';
```

**3. `initEmbeddedData` 异步 IIFE 里,LS 恢复必须放在所有 `await` 之前**
新 session 路径下 IIFE 同时干两件事:① 把 `window.__EMBED_STATE__` 写回 sessionStorage,② `await window.__clearContribIDB()` 清旧 IDB。**如果把 LS 恢复放在 await 之后**,await 让出控制权时主线程会立刻跑后面所有同步的 `(function initResources)()` / `(function initCollab)()` 等 IIFE —— 它们读 sessionStorage 时**只看到空数据**(LS 还没恢复),按「原始模板」渲染 DOM,`deleted-rows` / `contrib` / `static-edits` 全部不生效。**只在 `hasIDB === false` 时暴露**(`hasIDB === true` 路径有 `location.reload()` 兜底给 init 函数第二次机会读 LS),所以最常见的「几行删除 + 文字编辑、没贴大视频」导出最容易撞上(某双场战稿实战中踩出)。修复:把 `if (hasLS) { ... }` 块整体上移到任何 `await` 之前,LS 在同步段恢复完,后续 init 函数读到的就是齐的。

```js
(async function initEmbeddedData() {
  const SESSION_FLAG = LS_PREFIX + '__session_init__';
  if (__LS.getItem(SESSION_FLAG)) return;        // F5 刷新 早退
  __LS.setItem(SESSION_FLAG, '1');
  Object.keys(__LS).filter(k => k.startsWith(LS_PREFIX) && k !== SESSION_FLAG)
    .forEach(k => __LS.removeItem(k));

  const hasLS  = /* ... */;
  const hasIDB = /* ... */;

  // ✅ 先同步恢复 LS —— 必须在任何 await 之前
  if (hasLS) {
    Object.keys(window.__EMBED_STATE__).forEach(k => {
      try { __LS.setItem(k, window.__EMBED_STATE__[k]); } catch (e) {}
    });
  }

  // 再走异步:IDB 清空 + 恢复
  if (window.__clearContribIDB) {
    try { await window.__clearContribIDB(); } catch (e) {}   // ← 第一个 await
  }
  if (hasIDB && window.__saveContribToIDB) { /* 写 IDB + location.reload() */ }
})();
```

**4. `tr.changeset-old::before` / 任何 `tr.<class>::before` 用 `position: absolute` 都会漂位**
`<tr>` 是 `display: table-row`,**浏览器忽略其 `position: relative`** —— 不能做定位锚点。在 `tr.changeset-old { position: relative }` + `tr.changeset-old::before { position: absolute }` 写法下,`::before` 会顺着 DOM 链找下一个 positioned 祖先(通常是 `<section>` 或 `<body>`)做定位,**徽章漂到祖先左上角** —— 整页冒出莫名其妙的「✗ 已移除」小标签 / 表格右侧空白红框 / 标签摞在不相关元素上(某 Boss 稿评审标记实战中踩出)。block 容器(`<div class="changeset-old">`)没问题,因为 `display: block` 可正常做定位锚点。**修复:对 TR 行禁用 ::before 徽章,改在首列 `td:first-child::before` 内联标签**(TD 是 `display: table-cell`,支持 `position: relative` 锚点):

```css
/* 禁掉 TR 上的漂位徽章 */
tr.changeset-old::before, tr.changeset-new::before { content: none !important; }

/* 改用首列 TD 内联徽章 */
tr.changeset-old > td:first-child::before {
  content: "✗ 已移除 ";
  display: inline-block;
  background: #999;
  color: white;
  padding: 0 5px;
  border-radius: 2px;
  font-size: 9px;
  font-weight: 600;
  letter-spacing: 0.4px;
  text-decoration: none !important;    /* 抵御父级 .changeset-old * 强制划线 */
  margin-right: 4px;
  vertical-align: middle;
}
```

**通用规则**:凡是要给「行」加角标徽章,**只能挂在 `td:first-child::before`**,不能挂 `tr::before`。`tr` 一律只用来做**整行样式**(背景 / 文字色 / 划线)的 selector。

---

## 六、评审反馈标记套件(已拆到标记套件文档)

设计稿第二 / 三轮评审的「旧 vs 新」标记套件(`.changeset-old/new` block + `.cs-old/new-inline` + `.changeset-summary` 摘要框 + 完整 CSS + 标准工作流)已拆到 [评审反馈标记套件](review-markup-kit.md),按需查阅。

> 拆分原因:「首次出稿组件实现」(本文 § 一~五) 与「评审迭代标记」(标记套件文档) 是两个关注点,分开维护。TR 行徽章 CSS 仍留在本文 § 五 陷阱 4(那里连「为何 TR 不能做定位锚点」的原理一起讲)。

---

## 七、主题换肤 + SECTIONS 目录源

模板默认是**冷蓝**视觉基底(`:root` 里 `--accent` 系蓝)。若新对象要换主题色,工作量**远比想象大** —— 颜色分两类:`:root` 变量(好改)+ **散落各处的 hard-coded 颜色**(不走 var,易漏),后者要多轮 grep 才能清干净。

> 🚨 **真实教训**:本模板从一份「米黄古风」稿换肤成「冷蓝」时,仍漏了两处暖色没改 —— 未选中 Tab 底 `#e9dfc9`、阶段条 `.hp-stage` 底 `#d9d2c5`,在蓝主题里一眼违和(后来才修掉)。**这就是"hard-coded 颜色最容易漏"的活证**:换肤后必须**逐区域看渲染核对**,别以为改完 `:root` 就完事。

### 换肤 checklist(主题无关,任何配色都按这套)

1. **先改 `:root` 变量段**(~20 个):基底 `--bg / --paper / --ink`、强调 `--accent / --accent-soft`、`--gold / --line / --star`、双场 `--p1-* / --p2-*`(各 4 个)。**基础,但远不够**。
2. **「次级强调变量」是隐藏大头**:像 `--gold` 这种被边框 / 卡片数字 / 虚线 / chip / h3 标记 等**几十处** `var(--gold)` 引用 —— 改前先 grep 它被引用多少处,改一个影响一大片。
3. **hard-coded 颜色(不走 var)是漏网重灾区**,grep 多轮清理。典型藏身处(按区域核对):
   - **Tab 区**:未选中 `.tab-btn` 底 / `.tab-hint` 渐变 / `.tab-btn:hover` 的 `box-shadow rgba(...)`
   - **阶段条** `.hp-stage.*` 各档底色(注意它是"冷静→狂暴"热度梯度,见第 4 点)
   - **深色块**:`pre` 代码块 / 引言框 / 导出按钮 / 置顶按钮 的深底 + 它们的 `rgba(...)` 阴影
   - **编辑态 / 占位**:editing 行底 / 空占位符灰 / 高亮星标
   - 方法:把全页 `#[0-9a-f]{3,6}` 和 `rgba(...)` 都 grep 出来,逐一归类。
4. **保留「功能语义色」,别无脑全改成主题色**:视觉预警契约色(金 = 可格挡 / 紫 = 必闪)、删除红 / 恢复绿 / 评审标记黄、阶段条的"冷静→狂暴"热度梯度 —— 这些靠**与主题色的对比**传达语义,改了反而失义。
5. **grep 收口**:逐一判断每个色值"是主题色 / 语义色 / 漏网旧色",直到无残留。**推荐写一张色值映射表用脚本批量替换**,比手改快且不漏。

### ⚠️ `SECTIONS` 是 hard-coded 的目录源(不是纯动态扫 h2)

`initTocs()` 里有一个 **hard-coded 的 `const SECTIONS = [...]` 数组**,浮动目录 + 顶部目录的**主章节名 / 编号都从这里取**(只有每节的 h3 子项是动态扫的)。所以:

- **改章节标题 / 编号** → 必须同步改 `SECTIONS` 数组的 `label`(带编号,如 `'叁 · Boss 详细设计'`)+ `topLabel`(不带编号)
- **删/加章节**(如单场战删 `diff` / 把详细设计拆两章)→ 必须同步增删 `SECTIONS` 条目:删了不删条目 → 目录跳空;加了不加条目 → 新章节不进目录
- 只改 `<section>` 里的 `<h2>` **不会**自动同步目录 —— 目录显示的还是 `SECTIONS` 里的旧文本

> 🚨 踩坑实录:改完 `<h2>` 内容后目录仍显示旧文本,因为 `SECTIONS` 数组没同步。**改完 h2 务必同步 `SECTIONS`**。
