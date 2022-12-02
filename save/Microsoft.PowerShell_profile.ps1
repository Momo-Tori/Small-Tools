# 使用 utf - 8 编码
CHCP 65001
# 清屏
clear

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
# 下面是三条是文档里推荐的，根据自己的习惯决定是否添加
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# 每次回溯输入历史，光标定位于输入内容末尾
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

Set-PSReadLineKeyHandler -Key Tab -Function Complete

# oh-my-posh init
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/capr4n.omp.json" | Invoke-Expression