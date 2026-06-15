# -*- coding: utf-8 with BOM -*-
# gen_resource_xlsx_skeleton.ps1
# !! Windows-only: 需要 Windows + Excel 或 WPS (经 Excel COM 自动化)。非 Windows / 不需 xlsx 时,用 templates/blank-resource-requirements.md。
#
# 把一份战斗设计转成「美术资源需求 xlsx」(动作需求 + 特效需求糙版) 的骨架脚本。
# 产出单 sheet 横向并排布局: 左半区「动作需求」(A-M) + 右半区「特效需求糙版」(N-P),
# 外加一个占位 Sheet2「特效需求(详细)」。
#
# === 怎么用 ===
#   1. 先用 inspect_template.ps1 dump 出【你自己团队模板】的真实规格
#      (颜色 int / 列宽 / 表头文字 / 字体 / 合并区)。
#   2. 把下面【配置区】的变量改成你模板 dump 出来的真实值。
#      —— 配置区里的默认值只是一份示例模板规格 (示例角色「苍岚」, 60fps),
#         几乎肯定跟你团队的不一样, 务必照 dump 结果替换。
#   3. 改完直接跑: powershell -File gen_resource_xlsx_skeleton.ps1
#
# 注意: 颜色一律用模板 dump 出来的 Office BGR int 值, 不要转 RGB 重算
#       (Excel COM 接受 BGR int 直传; 不同渲染器显示色有微差, 以 int 为准)。
#
# 注意: 本文件含中文, 在 Windows PowerShell 5.1 下必须以 UTF-8 with BOM 保存,
#       否则中文乱码、报莫名 ParseError。用编辑器另存为「UTF-8 (带 BOM)」即可。

# =============================================================================
# === 配置区 (1): 模板规格 ====================================================
# === 改这里匹配你的模板; 先用 inspect_template.ps1 dump 出真实规格再填 =======
# === 下面是「示例模板」规格 (示例角色苍岚), 仅供参照, 几乎肯定要全部替换 =====
# =============================================================================

# --- 输出路径 (中性默认: 当前目录 output 子文件夹) ---
$Name       = '苍岚'                                   # 角色/Boss 名, 用于默认文件名
$OutputPath = ".\output\$($Name)_资源需求.xlsx"

# --- 标题 / 副标 文字 ---
# 左半区主标题 (帧率等常量按你项目替换; 示例用 60fps)
$TitleTextLeft  = '动作需求（60 fps, 1f≈16.7ms; 按动作类型分级前后摇）'
# 右半区主标题
$TitleTextRight = '特效需求（糙版）'
# 行 2 副标 (整段战斗概述; 跑前改成你这个单位的实际描述)
$TitleSubtext   = '<示例角色苍岚> 总共有 X 段招式，<招式集概述>'

# --- 列表头 (左半区 A-N 各 1 列, 共 14 项; 跟你模板的字段顺序对齐) ---
# 注意: 第 1 项对应 A 列(资源用法分组), 第 14 项对应 N 列(右半区表头第一格)
$Headers = @(
    '资源用法','技能名称','资产名称','技能类型','复用形式','动作说明',
    '循环','位移','判定范围','衔接 Pose',
    '前摇（帧）','打击持续（帧）','后摇（帧）','特效内容'
)
# 右半区 O:P 合并表头文字 (跟在 N 列表头之后)
$HeaderMergedOP = '参考'

# --- 列宽 (A..P 共 16 列, 顺序对应 1..16 列) ---
$ColWidths = @(
    25.29,   # A 资源用法分组
    25.29,   # B 技能名称
    32.29,   # C 资产名称
    13.29,   # D 技能类型
    13.29,   # E 复用形式
    52.29,   # F 动作说明
    13.29,   # G 循环
    13.29,   # H 位移
    13.29,   # I 判定范围
    13.29,   # J 衔接 Pose
    13.29,   # K 前摇
    13.29,   # L 打击持续
    13.29,   # M 后摇
    39.29,   # N 特效内容
    45.29,   # O 参考
    45.29    # P 留白
)

# --- 颜色 (Office BGR int, 直传不要转 RGB; 照 inspect dump 出来的数填) ---
$Colors = @{
    TitleLeft  = 7949855     # A1:M1 标题底色   (示例: 深酒紫红)
    TitleRight = 8523064     # N1:P1 标题底色   (示例: 深紫)
    Subtitle   = 13431551    # A2:M2 副标底色   (示例: 浅薄荷绿)
    HeaderMain = 15917529    # A3:M3 表头底色   (示例: 灰)
    HeaderSide = 16704236    # N3/O3:P3 表头底色 (示例: 浅紫粉)
    Group      = 14083324    # A 列分组底色     (示例: 浅米橙)
    White      = 16777215    # 数据区底色       (白)
    RedTag     = 4541173     # 「新增」标记字色  (示例: 深酒红)
}

# --- 字体 / 字号 ---
$FontName        = '微软雅黑'   # 全表字体
$FontSizeTitle   = 11           # 标题行字号
$FontSizeData    = 10           # 副标 / 表头 / 数据 字号
$FontSizeSheet2  = 12           # Sheet2 占位文字字号

# --- Sheet 名 / Sheet2 占位文案 ---
$Sheet1Name        = '动作需求'
$Sheet2Name        = '特效需求（详细）'
$Sheet2Placeholder = '待动作出炉后，详细写需求'

# =============================================================================
# === 配置区 (2): 本单位的实际数据 ============================================
# === 每次出新单位的需求表都改这块 ============================================
# =============================================================================

$em = [string][char]0x2014   # — em dash (空位占位符, 别留空字符串)

# 数据行 (每行 15 项, 对应 B-P 列)
# 列序: 技能名称, 资产名称, 技能类型, 复用形式, 动作说明, 循环, 位移, 判定范围,
#       衔接Pose, 前摇, 打击持续, 后摇, 特效内容, 参考, 留白
# 多行文本用 "...`n..." 嵌入换行 (会自动 WrapText)
# ⚠️ 多行时每个 @(...) 末尾务必加逗号 (最后一行可不加), 否则 PowerShell 把
#    嵌套数组展平成一维, 取行时拿到单个字符, 赋 .Value2 报 cast 失败 (实战踩过的坑)。
$Rows = @(
    # 示例行 (全 — 占位; 替换成你的真实招式数据, 一行一个动作)
    # 注意行尾那个逗号 —— 即使只有一行也要加, 否则 @() 会把单行展平 (见上方 ⚠️)
    @('普通攻击','attack01~05','普攻','复用','示例: 普攻连段双段共用',$em,$em,$em,$em,$em,$em,$em,'复用',$em,$em),
    @('蓄力斩','skill_charge','特殊技','新增','示例: 长按蓄力 0-4 层势, 松手按层数释放',$em,'前冲','扇形',$em,'18帧','6帧','12帧','蓄力光效+斩击拖尾',$em,$em)
    # ... 继续添加 ...
)

# 资源用法分组 (A 列合并 + 文字, 前缀如 1.1/1.2/...)
# StartRow/EndRow 是 Excel 实际行号 (数据从第 4 行起)
$Groups = @(
    @{ Name = '1.1 示例分组（A 列合并 + 浅色底，覆盖第 4-5 行）'; StartRow = 4;  EndRow = 5  }
    # ... 继续添加 ...
)

# 行高 (按内容决定, 长度 = $Rows.Length); 不传 ($null) 则默认全部 16.5
$RowHeights = $null

# =============================================================================
# === 以下为生成逻辑, 一般不用改 ==============================================
# =============================================================================

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
$ErrorActionPreference = 'Stop'

Get-Process EXCEL -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
Start-Sleep -Milliseconds 500

$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false
$excel.DisplayAlerts = $false
$excel.ScreenUpdating = $false

try {
    $wb = $excel.Workbooks.Add()

    # 颜色快捷别名 (从配置区 $Colors 取)
    $C_TITLE_LEFT   = $Colors.TitleLeft
    $C_TITLE_RIGHT  = $Colors.TitleRight
    $C_SUBTITLE     = $Colors.Subtitle
    $C_HEADER_GRAY  = $Colors.HeaderMain
    $C_HEADER_PINK  = $Colors.HeaderSide
    $C_GROUP        = $Colors.Group
    $C_WHITE        = $Colors.White
    $C_RED_TAG      = $Colors.RedTag

    # === Sheet 1: 动作需求 ===
    $ws1 = $wb.Sheets.Item(1)
    $ws1.Name = $Sheet1Name

    # 列宽 (从配置区 $ColWidths 取)
    for ($i = 0; $i -lt $ColWidths.Length; $i++) {
        $ws1.Columns.Item($i + 1).ColumnWidth = [double]$ColWidths[$i]
    }

    # --- 行 1 标题 ---
    $ws1.Cells.Item(1, 1).Value2 = $TitleTextLeft
    $r1L = $ws1.Range('A1:M1')
    $r1L.Merge() | Out-Null
    $r1L.Interior.Color = $C_TITLE_LEFT
    $r1L.Font.Color = $C_WHITE
    $r1L.Font.Bold = $true
    $r1L.Font.Size = $FontSizeTitle
    $r1L.HorizontalAlignment = -4108
    $r1L.VerticalAlignment = -4108
    $r1L.WrapText = $true

    $ws1.Cells.Item(1, 14).Value2 = $TitleTextRight
    $r1R = $ws1.Range('N1:P1')
    $r1R.Merge() | Out-Null
    $r1R.Interior.Color = $C_TITLE_RIGHT
    $r1R.Font.Color = $C_WHITE
    $r1R.Font.Bold = $true
    $r1R.Font.Size = $FontSizeTitle
    $r1R.HorizontalAlignment = -4108
    $r1R.VerticalAlignment = -4108
    $r1R.WrapText = $true

    $ws1.Rows.Item(1).RowHeight = 15

    # --- 行 2 副标 ---
    $ws1.Cells.Item(2, 1).Value2 = $TitleSubtext
    $r2L = $ws1.Range('A2:M2')
    $r2L.Merge() | Out-Null
    $r2L.Interior.Color = $C_SUBTITLE
    $r2L.Font.Color = 0
    $r2L.Font.Size = $FontSizeData
    $r2L.HorizontalAlignment = -4131
    $r2L.VerticalAlignment = -4108
    $r2L.WrapText = $true

    foreach ($c in @(14, 15, 16)) {
        $cell = $ws1.Cells.Item(2, $c)
        $cell.Interior.Color = $C_SUBTITLE
        $cell.Font.Size = $FontSizeData
    }
    $ws1.Rows.Item(2).RowHeight = 16.5

    # --- 行 3 表头 (从配置区 $Headers 取; 第 14 项写到 N 列, O:P 合并写 $HeaderMergedOP) ---
    for ($i = 0; $i -lt $Headers.Length; $i++) {
        $ws1.Cells.Item(3, $i+1).Value2 = $Headers[$i]
    }
    $r3Gray = $ws1.Range('A3:M3')
    $r3Gray.Interior.Color = $C_HEADER_GRAY
    $r3Gray.Font.Bold = $true
    $r3Gray.Font.Size = $FontSizeData
    $r3Gray.HorizontalAlignment = -4108
    $r3Gray.VerticalAlignment = -4108
    $r3Gray.WrapText = $true
    $r3N = $ws1.Range('N3')
    $r3N.Interior.Color = $C_HEADER_PINK
    $r3N.Font.Bold = $true
    $r3N.Font.Size = $FontSizeData
    $r3N.HorizontalAlignment = -4108
    $r3N.VerticalAlignment = -4108
    $r3N.WrapText = $true
    $ws1.Cells.Item(3, 15).Value2 = $HeaderMergedOP
    $r3OP = $ws1.Range('O3:P3')
    $r3OP.Merge() | Out-Null
    $r3OP.Interior.Color = $C_HEADER_PINK
    $r3OP.Font.Bold = $true
    $r3OP.Font.Size = $FontSizeData
    $r3OP.HorizontalAlignment = -4108
    $r3OP.VerticalAlignment = -4108
    $r3OP.WrapText = $true
    $ws1.Rows.Item(3).RowHeight = 16.5

    # === 写数据 ===
    $startRow = 4
    for ($r = 0; $r -lt $Rows.Length; $r++) {
        $excelRow = $startRow + $r
        $row = $Rows[$r]
        for ($c = 0; $c -lt $row.Length; $c++) {
            $ws1.Cells.Item($excelRow, $c+2).Value2 = $row[$c]
        }
    }
    $lastRow = $startRow + $Rows.Length - 1

    # 数据行统一样式 (B-P)
    $dataBP = $ws1.Range("B4:P$lastRow")
    $dataBP.Interior.Color = $C_WHITE
    $dataBP.Font.Color = 0
    $dataBP.Font.Size = $FontSizeData
    $dataBP.Font.Bold = $false
    $dataBP.VerticalAlignment = -4108
    $dataBP.WrapText = $true
    $dataBP.HorizontalAlignment = -4108

    # B 技能名称 / C 资产名称 / F 动作说明 / N 特效内容 - 左对齐 + 垂直居中
    foreach ($colLetter in @('B','C','F','N')) {
        $colRange = $ws1.Range("$($colLetter)4:$($colLetter)$lastRow")
        $colRange.HorizontalAlignment = -4131
        $colRange.VerticalAlignment = -4108
    }

    # A 列分组合并 + 文字
    foreach ($g in $Groups) {
        $ws1.Cells.Item($g.StartRow, 1).Value2 = $g.Name
        if ($g.StartRow -ne $g.EndRow) {
            $gRange = $ws1.Range("A$($g.StartRow):A$($g.EndRow)")
            $gRange.Merge() | Out-Null
        }
        $gCell = $ws1.Range("A$($g.StartRow)")
        $gCell.Interior.Color = $C_GROUP
        $gCell.Font.Color = 0
        $gCell.Font.Bold = $true
        $gCell.Font.Size = $FontSizeData
        $gCell.WrapText = $true
        $gCell.HorizontalAlignment = -4108
        $gCell.VerticalAlignment = -4108
    }

    # E 列「新增」红字 bold
    for ($r = 4; $r -le $lastRow; $r++) {
        $eCell = $ws1.Cells.Item($r, 5)
        $val = [string]$eCell.Value2
        if ($val -like '新增*') {
            $eCell.Font.Color = $C_RED_TAG
            $eCell.Font.Bold = $true
        }
    }

    # 行高 (传入则按 RowHeights, 否则默认 16.5)
    if ($RowHeights -ne $null -and $RowHeights.Length -gt 0) {
        for ($i = 0; $i -lt $RowHeights.Length; $i++) {
            $ws1.Rows.Item($i + 4).RowHeight = [double]$RowHeights[$i]
        }
    } else {
        for ($r = 4; $r -le $lastRow; $r++) {
            $ws1.Rows.Item($r).RowHeight = 16.5
        }
    }

    # 全表边框
    $allRange = $ws1.Range("A1:P$lastRow")
    foreach ($idx in @(7,8,9,10,11,12)) {
        $b = $allRange.Borders.Item($idx)
        $b.LineStyle = 1
        $b.Weight = 2
    }

    # === Sheet 2: 特效需求(详细) — 占位 ===
    $ws2 = $wb.Sheets.Add([System.Reflection.Missing]::Value, $ws1)
    $ws2.Name = $Sheet2Name
    $ws2.Cells.Item(1,1).Value2 = $Sheet2Placeholder
    $c2 = $ws2.Cells.Item(1,1)
    $c2.Font.Color = $C_RED_TAG
    $c2.Font.Bold = $true
    $c2.Font.Size = $FontSizeSheet2
    $c2.HorizontalAlignment = 1
    $c2.VerticalAlignment = -4108
    $ws2.Rows.Item(1).RowHeight = 15.75

    # === 全表字体 ===
    $ws1.UsedRange.Font.Name = $FontName
    $ws2.UsedRange.Font.Name = $FontName

    # 回到 Sheet 1, 冻结前 3 行
    $ws1.Activate()
    $excel.ActiveWindow.SplitRow = 3
    $excel.ActiveWindow.FreezePanes = $true

    # === 保存 ===
    # 把输出路径解析成绝对路径: Excel COM 的 SaveAs 按 Excel 自己的工作目录解析相对路径,
    # 不是按 PowerShell 当前目录 —— 不转绝对会存到意料外的位置 / 报路径错 (实战踩过的坑)。
    $outDir = Split-Path -Parent $OutputPath
    if (-not $outDir) { $outDir = '.' }
    if (-not (Test-Path $outDir)) {
        New-Item -ItemType Directory -Path $outDir -Force | Out-Null
    }
    $absOutPath = Join-Path (Resolve-Path $outDir).Path (Split-Path -Leaf $OutputPath)
    if (Test-Path $absOutPath) {
        Remove-Item $absOutPath -Force
    }
    $xlOpenXMLWorkbook = 51
    $wb.SaveAs($absOutPath, $xlOpenXMLWorkbook)
    $wb.Close($false)

    Start-Sleep -Milliseconds 500
    if (Test-Path $absOutPath) {
        $fi = Get-Item $absOutPath
        Write-Output "OK saved: $($fi.FullName) ($($fi.Length) bytes)"
    } else {
        throw "Save failed - file not found at $absOutPath"
    }

} finally {
    if ($excel) {
        $excel.ScreenUpdating = $true
        $excel.Quit()
        [System.Runtime.InteropServices.Marshal]::ReleaseComObject($excel) | Out-Null
    }
    Start-Sleep -Milliseconds 300
    Get-Process EXCEL -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
}
