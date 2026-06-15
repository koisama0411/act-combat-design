# -*- coding: utf-8 with BOM -*-
# inspect_template.ps1
# !! Windows-only: 需要 Windows + Excel 或 WPS (经 Excel COM 自动化)。
# 用法: powershell -File inspect_template.ps1 -Path "C:\path\to\template.xlsx" [-OutFile "dump.txt"] [-MaxRows 20] [-MaxCols 20]
#
# 用途: dump 任意 xlsx 模板每个 sheet 的 cell 详细信息 —— 值 / 合并区 / 底色 / 字色 /
#       粗体 / 字号 / 字体 / 对齐 / 换行,外加列宽 / 行高。供「复刻你自己团队的模板」时参考:
#       拿到模板后第一件事先 inspect 一遍,反推真实样式规则,再 1:1 复刻,不靠截图猜。
#
# 关键:Excel COM Interior.Color 是 BGR int 值,直接照搬不要转 RGB

param(
    [Parameter(Mandatory=$true)]
    [string]$Path,

    [string]$OutFile = $null,

    [int]$MaxRows = 20,

    [int]$MaxCols = 20
)

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
$ErrorActionPreference = 'Stop'

if (-not (Test-Path $Path)) {
    throw "File not found: $Path"
}

# kill 残留 EXCEL
Get-Process EXCEL -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
Start-Sleep -Milliseconds 300

$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false
$excel.DisplayAlerts = $false

$output = New-Object System.Collections.ArrayList
function Emit($line) {
    [void]$output.Add($line)
}

try {
    $wb = $excel.Workbooks.Open($Path)

    Emit "=== 工作表清单 ==="
    foreach ($s in $wb.Sheets) {
        $used = $s.UsedRange
        Emit "Sheet: '$($s.Name)' rows=$($used.Rows.Count) cols=$($used.Columns.Count)"
    }

    foreach ($s in $wb.Sheets) {
        Emit ""
        Emit "============================================================"
        Emit "Sheet: $($s.Name)"
        Emit "============================================================"
        $used = $s.UsedRange
        $rows = [Math]::Min($used.Rows.Count, $MaxRows)
        $cols = [Math]::Min($used.Columns.Count, $MaxCols)

        Emit "--- 列宽 ---"
        for ($c = 1; $c -le $cols; $c++) {
            $w = $s.Columns.Item($c).ColumnWidth
            $letter = if ($c -le 26) { [char]([byte]([char]'A') + $c - 1) } else { "(col$c)" }
            Emit "  $letter ($c) = $w"
        }

        Emit "--- 行高 ---"
        for ($r = 1; $r -le $rows; $r++) {
            $h = $s.Rows.Item($r).RowHeight
            Emit "  row $r = $h"
        }

        Emit "--- Cell 详细 dump ---"
        for ($r = 1; $r -le $rows; $r++) {
            for ($c = 1; $c -le $cols; $c++) {
                $cell = $s.Cells.Item($r, $c)
                $val = [string]$cell.Value2
                if ($val.Length -gt 60) { $val = $val.Substring(0, 57) + '...' }
                $merge = $cell.MergeArea.Address($false, $false)
                $bg = $cell.Interior.Color
                $fg = $cell.Font.Color
                $bold = $cell.Font.Bold
                $size = $cell.Font.Size
                $fontName = $cell.Font.Name
                $halign = $cell.HorizontalAlignment
                $valign = $cell.VerticalAlignment
                $wrap = $cell.WrapText
                $letter = if ($c -le 26) { [char]([byte]([char]'A') + $c - 1) } else { "(col$c)" }
                $addr = "$letter$r"
                $isMerged = $cell.MergeCells
                Emit "  $addr | merge=$merge merged=$isMerged | bg=$bg fg=$fg | bold=$bold size=$size font=$fontName | halign=$halign valign=$valign wrap=$wrap | val='$val'"
            }
        }
    }

    $wb.Close($false)

    if ($OutFile) {
        $output | Out-File -FilePath $OutFile -Encoding utf8
        Write-Output "Dump saved: $OutFile ($($output.Count) lines)"
    } else {
        $output | ForEach-Object { Write-Output $_ }
    }

} finally {
    if ($excel) {
        $excel.Quit()
        [System.Runtime.InteropServices.Marshal]::ReleaseComObject($excel) | Out-Null
    }
    Start-Sleep -Milliseconds 200
    Get-Process EXCEL -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
}
