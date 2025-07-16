function fzf_fd
    set file ( \
	fzf --ansi --disabled --prompt '1.File> ' \
	--preview "$check_dir_file" --header '---------------------- 
Remove <C-r> | Clear<C-c> | Copy <C-y> |File <C-f> | Dir <C-d>' \
	--bind "ctrl-f:change-prompt(1.File> )+reload($fd_file {q})" \
	--bind "ctrl-d:change-prompt(2.Dir> )+reload($fd_dir {q})" \
	--bind "ctrl-y:execute-silent(wl-copy '{}')+abort" \
	--bind "ctrl-c:clear-query" \
	--bind "ctrl-r:execute(rm -rf {})" \
	)

    if test -d "$file"
        cd $file
        commandline -f repaint
    else if test -f "$file"
        nvim $file
    end
end
