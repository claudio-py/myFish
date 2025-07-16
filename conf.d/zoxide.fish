# # ================================ #
# # Utility functions for zoxide.
function cd
    if test -d $argv[1]
        builtin cd $argv

    else
        z $argv

    end
end

function run_zi
    set -l path (commandline -c)
    zi $path
    commandline -f repaint
end
