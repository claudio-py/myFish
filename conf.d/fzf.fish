set -gx FZF_CTRL_T_COMMAND ''
set -gx FZF_ALT_C_COMMAND ''

#--DEAD CONFS ABOVE---
#----------------------------------------------------------------
#functions
function bat_line_range
    set file $argv[1]
    set line $argv[2]

    # Clamp range 
    set start (math "max($line - 18, 1)")
    set end (math "$line + 18")

    bat --color=always --highlight-line $line --line-range $start:$end $file
end

# variables-----
set style '--no-height --layout=default --style minimal --preview-window up,80%'
set fd_bat 'bat --color=always --line-range :50'
set rg_bat 'bat_line_range {1} {2}'
set fd_eza 'eza -a -I .git --group-directories-first --tree --level 3 --color=always --icons=always'
set fd_dir 'fd --type directory -E .git --max-depth 3 --color=always --hidden'
set fd_file 'fd --type file -E .git --hidden --color=always'
set rg_fzf 'rg --hidden --glob "!.git/" --color=always --line-number --no-heading --smart-case --'
set check_dir_file "if test -f {}; $fd_bat {}; else; $fd_eza {}; end;"
#-----------------------------
set -gx FZF_DEFAULT_OPTS $style
set -gx FZF_CTRL_R_OPTS "--layout reverse"
