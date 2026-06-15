# 资源需求 xlsx 生成

把一份战斗设计(html / markdown 草稿)转成「美术资源需求 xlsx」(动作需求 + 特效需求糙版),套**你自己团队的模板格式**输出。

> 说明:不同团队的美术需求表长得完全不一样(列字段 / 配色 / 合并区 / 字体各异)。本文方法论的核心**不是**复刻某一份特定模板,而是教你一套通用流程:**inspect 你团队的模板 → 1:1 复刻它的样式 → 逐 cell verify**。下面出现的具体规格(颜色 int / 列宽 / 表头文字 / 30 或 60 fps 等)**全是示例**,换成你 inspect 出来的真实值即可。

**触发场景**:
- 设计文档敲定后,需要把它转成给美术排期用的资源需求表
- 你手上有一份团队模板 xlsx 当格式范本(**必备**,否则不知道往哪个格式套)

**产出位置**:由你自己约定(如 `<你的产出目录>/<角色名>_资源需求.xlsx`)。脚本默认输出到 `.\output\<Name>_资源需求.xlsx`,可在脚本顶部改。

---

## 工作流(3 步)

### Step 1: inspect 模板(必走,绝不靠截图猜样式)

```powershell
powershell -File scripts/inspect_template.ps1 `
    -Path 'C:\path\to\你的团队模板.xlsx' `
    -OutFile 'template_dump.txt'
```

dump 每个 sheet 的所有 cell:**值 / 合并区 / 底色 / 字色 / 粗体 / 字号 / 字体 / 对齐 / 换行**,外加列宽 / 行高。

**Read 落地的 txt** → 把模板的真实结构(sheet 数 / 各 sheet 有什么 / 颜色 int 值 / 合并区分布 / 字段顺序 / 字段值规约)**全部摸清**,再开 Step 2。**别凭截图估颜色**——dump 出来的 int 是什么就用什么。

### Step 2: 完全复刻(基于你模板的真实规格)

复制 [scripts/gen_resource_xlsx_skeleton.ps1](../scripts/gen_resource_xlsx_skeleton.ps1) 一份,改顶部**配置区**两块:

**配置区 (1) — 模板规格**(对照 Step 1 dump 出来的真实值填):

| 变量 | 内容 |
|---|---|
| `$Headers` | 列表头数组(字段顺序对齐你的模板) |
| `$ColWidths` | A..P 各列列宽数组 |
| `$Colors` | 各区域底色 / 标记字色的 BGR int(hashtable) |
| `$TitleTextLeft` / `$TitleTextRight` | 左右半区主标题文字 |
| `$FontName` / `$FontSize*` | 字体名 + 各级字号 |
| `$Sheet1Name` / `$Sheet2Name` / `$Sheet2Placeholder` | sheet 名 + 占位文案 |

**配置区 (2) — 本单位的实际数据**(每出一个新单位都改):

| 变量 | 内容 |
|---|---|
| `$OutputPath` | xlsx 输出路径 |
| `$TitleSubtext` | 行 2 副标完整文字(整段战斗 / 招式概述) |
| `$Rows` | 二维数组,每行对应数据列 |
| `$Groups` | 资源用法分组列表 `@{ Name; StartRow; EndRow }` 数组 |
| `$RowHeights`(可选) | 行高数组,长度 = `$Rows.Length` — 不传则全默认 |

骨架的生成逻辑(合并区结构 / 边框 / 冻结窗格 / COM 释放)按一种常见的「单 sheet 横向并排两区 + 占位 Sheet2」布局写死;**如果你团队模板布局不同**(比如真·双 sheet、或没有右半区),改生成逻辑那一段。规格类的东西都已上提到配置区,改配置区就够覆盖大多数差异。

### Step 3: verify(必走,跟模板逐 cell 比对)

写一个 verify 脚本(或直接用 `inspect_template.ps1` 分别 dump 生成物 + 模板),对**关键抽样点**做 diff。

抽样点至少覆盖:
- 标题行 — 颜色 + 合并区
- 副标行 — 颜色 + 合并区
- 表头行 — 各表头颜色差异(如左半区灰 vs 右半区另一色)
- 分组行 — 分组前缀 + 颜色 + 合并区
- 标记单元格 — 如「新增」红字 + bold
- 代表性数据列 — 字体 + 对齐
- 留白 / 占位 cell — 占位规约(空字符串 vs em-dash)

---

## 示例:某团队模板长这样(仅供参照,换成你的真实规格)

> ⚠️ 以下整节是**一份示例模板**的 inspect 结果,用来演示「dump 出来之后该摸清哪些维度」。**这不是标准、不是默认值**——你的模板 inspect 出来几乎肯定不一样,以你的 dump 为准。脚本配置区的默认值也对应这份示例(示例角色「苍岚」,60fps),记得替换。

⚠️ **常被截图误导的坑**:这份示例模板看起来像「两个 sheet 双视图」,实际是 **单 sheet 横向并排两个区**。这类结构判断必须靠 inspect,不能靠肉眼看截图。

### Sheet 列表

| Sheet | 内容 | 列范围 |
|---|---|---|
| 动作需求 | 全部数据在这一个 sheet | A-P |
| 特效需求(详细) | **占位 sheet**,只 A1 一句红字「待动作出炉后,详细写需求」 | A1 一个 cell |

### Sheet 1「动作需求」结构

| 区段 | 行 / 列范围 | 内容 |
|---|---|---|
| 行 1 - 动作需求标题 | A1:M1 合并 | 「动作需求(示例: 60 fps, 1f≈16.7ms; ...)」深色底白字 size=11 bold |
| 行 1 - 特效需求标题 | N1:P1 合并 | 「特效需求(糙版)」另一深色底白字 size=11 bold |
| 行 2 - 副标 | A2:M2 合并 / N2-P2 单独 | 浅色底,左对齐 size=10。N2/O2/P2 不合并但同底色 |
| 行 3 - 表头(左) | A3:M3 各单独 | 灰底 size=10 bold:资源用法 / 技能名称 / 资产名称 / 技能类型 / 复用形式 / 动作说明 / 循环 / 位移 / 判定范围 / 衔接 Pose / 前摇(帧) / 打击持续(帧) / 后摇(帧) |
| 行 3 - 表头(右) | N3 单独 / O3:P3 合并 | 另一浅色底 size=10 bold:特效内容 / 参考 |
| 行 4-N 数据 | A 列分组合并 / B-P 数据 | 白底 size=10,A 列分组前缀「1.1 / 1.2 / 1.3 / …」浅色底 bold |

### 颜色规约(Office BGR int,**直接传不要转 RGB**)

> 下面这些 int 是这份示例模板 dump 出来的原值。**你照搬没意义**——你要 dump 你自己模板的 int 填进脚本 `$Colors`。

| 用途 | 示例 int 值 | 主观感受 |
|---|---|---|
| 左标题底 | `7949855` | 深酒紫红 |
| 右标题底 | `8523064` | 深紫 |
| 副标底 | `13431551` | 浅薄荷绿 |
| 左表头底 | `15917529` | 灰 |
| 右表头底 | `16704236` | 浅紫粉 |
| A 列分组底 | `14083324` | 浅米橙 |
| 数据底色 | `16777215` | 白 |
| 字色「新增」标记 | `4541173` | 深酒红 |

### 列宽规约(示例)

| 列 | 宽 | 内容 |
|---|---|---|
| A | 25.29 | 资源用法分组 |
| B | 25.29 | 技能名称 |
| C | 32.29 | 资产名称 |
| D-E | 13.29 | 技能类型 / 复用形式 |
| F | 52.29 | 动作说明 |
| G-M | 13.29 | 循环 / 位移 / 判定 / 衔接 / 前摇 / 打击 / 后摇 |
| N | 39.29 | 特效内容 |
| O-P | 45.29 | 参考 / 留白 |

### 对齐规约(示例)

| 列 | 水平 | 垂直 |
|---|---|---|
| 技能名称 / 资产名称 / 动作说明 / 特效内容(长文本列) | **左对齐(-4131)** | 居中(-4108) |
| 其他所有数据列 | 居中(-4108) | 居中(-4108) |

### 字体(示例)

**全表微软雅黑**(`Font.Name = '微软雅黑'`),数据 size=10,标题 size=11,占位 sheet size=12。(你的模板可能用别的字体 / 字号,以 dump 为准。)

### 数据格式约定(示例,跟着你模板的习惯走)

| 字段 | 规约 |
|---|---|
| 帧数 | `9帧` / `15帧` / `10帧,loop` — **无空格**(示例命名,定义你自己的) |
| 「比原版延长 N 帧」/「拉长 N 帧」 | 写完整短语 |
| 空位 | em-dash `—`(`[char]0x2014`),**不留空字符串** |
| 参考列(留图位置) | 留**空字符串**(不写 —),便于后续贴图;其他写 — |
| 多行动作说明 | 用 PowerShell 的 `` `n `` 嵌入换行(配合 WrapText=True) |
| 复用形式「新增」标记 | **红字 + bold** 高亮(脚本按 `$Colors.RedTag` 自动上色) |

---

## 关键陷阱(PowerShell + Excel COM 通用技术,踩过的坑)

这些是跟具体模板无关的 xlsx 技术坑,任何团队复刻流程都会遇到。

### 1. 不读模板瞎猜样式 ❌

**症状**:凭截图估颜色(深蓝 / 浅黄)→ 实际是别的色;猜 sheet 结构(双 sheet 镜像)→ 实际是单 sheet 横向并排 + 占位 sheet。

**正解**:第一件事就是 inspect 模板,**colors 直接用 dump 出来的 int 值**,不要转 RGB 反推感觉。

### 2. PowerShell COM `Worksheet.Copy($null, $ws1)` 报错 ❌

**症状**:`不能取得类 Worksheet 的 Copy 属性`。

**原因**:PowerShell 调 COM 时 `$null` 不能跳过参数。

**正解**:
```powershell
$missing = [System.Reflection.Missing]::Value
$ws1.Copy($missing, $ws1)
```

或干脆用 `Sheets.Add([System.Reflection.Missing]::Value, $ws1)` 新建空 sheet。

### 3. RowHeight 用 hashtable 枚举赋值 ❌

**症状**:`Specified cast is not valid`。

```powershell
# ❌ 不工作
$ht = @{ 4 = 16.5; 5 = 33; ... }
foreach ($r in $ht.Keys) { $ws.Rows.Item($r).RowHeight = $ht[$r] }
```

**原因**:hashtable 枚举时 key/value 类型被装箱,COM RowHeight 不接受。

**正解**:用整数索引 + 类型化数组,或展开式直接赋值:
```powershell
$ws.Rows.Item(4).RowHeight = 16.5
$ws.Rows.Item(5).RowHeight = 33
# ...
```

### 4. 颜色不要转 RGB 反推 ❌

**症状**:看 dump 出来的 `13431551`,按 R+G*256+B*65536 公式转成 RGB(127,254,204),感觉「不像浅黄」,改成自己估的颜色 int → 跟模板对不上。

**正解**:**Excel COM 接受 BGR int 直接传**,模板 dump 是什么数就用什么数,不要因为「主观感受」改。WPS / Excel / 在线表格在不同渲染器下显示色微差,以 int 值为准。

### 5. PowerShell 字符串插值反引号转义陷阱 ❌

**症状**:`"$colLetter`4:$colLetter`$lastRow"` 期望生成 `B4:B16`,实际生成字面 `B4:B$lastRow` → `Range()` 报 HRESULT 0x800A03EC。

**原因**:反引号 `` ` `` 在双引号字符串里是转义符,`` `$lastRow `` 让 `$lastRow` 不展开变成字面。

**正解**:用 `$()` 子表达式语法,清晰且避坑:
```powershell
"$($colLetter)4:$($colLetter)$lastRow"   # ✓ 生成 B4:B16
```

### 6. 多行 `$Rows` 必须每行加逗号(PowerShell 数组展平)❌

**症状**:`$Rows` 跑起来报 `Unable to cast object of type 'System.Char' to type 'System.String'`(在 `.Value2 = $row[$c]` 那行)。

**原因**:PowerShell 的 `@()` 里**换行/分号分隔的嵌套数组会被展平**。多行 `@(...)` 之间不加逗号 → `$Rows` 被拍平成一个"全字符串"的一维数组 → `$Rows[$r]` 取到的是**单个字符串**而非子数组 → `$row[$c]` 取到字符串里的**单个字符(Char)** → 赋给 `.Value2`(期望 String)时报 cast 失败。

**正解**:`$Rows` 每行 `@(...)` **末尾加逗号**(最后一行可不加),让它成为"数组的数组":

```powershell
$Rows = @(
    @('普攻','attack_01',...),   # ← 逗号
    @('导弹','skill_01',...),    # ← 逗号
    @('护盾','skill_02',...)     # 最后一行可不加
)
```

⚠️ **即使只有一行也要加逗号** —— 单行 `@( @(...) )` 不加逗号同样会被展平触发本坑(实战中踩过的坑)。

### 7. Excel COM 的 SaveAs / Open 按 Excel 工作目录解析相对路径 ❌

**症状**:`$OutputPath = '.\output\xxx.xlsx'`(相对路径)→ `SaveAs` 报「不能访问文件」,而且中文文件名被 mangle 成乱码串;或 `Open` 一个明明存在的相对路径文件却报「无法找到」。

**原因**:Excel COM 不按 PowerShell 当前目录解析相对路径,而是按 **Excel 自己进程的工作目录**(通常是 `我的文档`)。你 `New-Item` 建的 `.\output` 在 PowerShell CWD 下,Excel 却去别处找。

**正解**:传给 `SaveAs` / `Open` 前**把路径转成绝对路径**:
```powershell
$absOutPath = Join-Path (Resolve-Path $outDir).Path (Split-Path -Leaf $OutputPath)
$wb.SaveAs($absOutPath, 51)
```
(本 skill 的 `gen_resource_xlsx_skeleton.ps1` 已内置此处理;`inspect_template.ps1` 请用绝对路径传 `-Path`。)

### 8. 其他通用 xlsx 操作陷阱

还有几条跟本流程无关但跑 PowerShell + Excel COM 普遍会遇到的坑,顺手记一下:

1. **含中文的 .ps1 必须存成 UTF-8 with BOM** —— PowerShell 5.1 默认按系统 codepage 解码 .ps1,无 BOM 的 UTF-8 中文会乱码 + 报莫名 ParseError(行号还指向无关行)。
2. **`Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force`** —— 跑 .ps1 前先放开,否则报「running scripts is disabled」。Process 作用域只影响当前会话,不持久。
3. **`Range.PasteSpecial` 在 PS 5.1 易报错** —— 复制带格式的行用 `Range.Copy($Destination)` 一次性带格式 + 值,别走 PasteSpecial。
4. **EXCEL 进程残留持锁 → Save 静默失败**(最坑)—— 启动前先 `Get-Process EXCEL | Stop-Process -Force` kill 干净;`finally` 块里 `Quit()` + `ReleaseComObject` + 再 kill 兜底;Save 后 `Test-Path` 验证文件真的写出来了。
5. **`$CutCopyMode` 不能赋 `$false`** —— 用 `$excel.CutCopyMode = 0`。

---

## 脚本

| 文件 | 用途 |
|---|---|
| [scripts/inspect_template.ps1](../scripts/inspect_template.ps1) | 参数化 inspect 任意 xlsx 模板,dump 所有 cell 属性 + 列宽行高 |
| [scripts/gen_resource_xlsx_skeleton.ps1](../scripts/gen_resource_xlsx_skeleton.ps1) | 生成骨架,改顶部配置区即可。配置区已把模板规格(颜色 / 列宽 / 表头 / 字体 / 占位文案)全部上提,对照 inspect 结果填 |

**建议**:把你团队 inspect + 复刻成功的第一份 xlsx 存一份当**活模板**,下次出新单位的需求表时先 Read 它当参考,比每次从头摸快。
