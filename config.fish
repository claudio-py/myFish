if status is-interactive
    # Commands to run in interactive sessions can go here
    source ~/.asdf/asdf.fish
    zoxide init fish | source
    fzf --fish | source

end

set -g __fish_ls_command eza --group-directories-first --icons
#key bindings---------------------------
bind \cg fzf_rg
bind \cf fzf_fd
bind \ec run_zi
