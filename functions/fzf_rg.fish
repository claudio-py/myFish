function fzf_rg
    set result ( \
	fzf --ansi --disabled --delimiter : \
	--header '---------------------- 
Clear <C-c> | Copy <C-y>' \
	--bind "change:reload(sleep 0.5; $rg_fzf {q})" \
	--bind "ctrl-c:clear-query" \
	--bind "ctrl-y:execute-silent(wl-copy '{1}')+abort" \
	--color 'hl:-1:underline,hl+:-1:underline:reverse' \
	--preview $rg_bat  \
	)

    if test -n "$result"
        set file (echo $result | cut -d':' -f1)
        set line (echo $result | cut -d':' -f2)
        nvim $file +$line
    end
end
