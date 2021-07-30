if status is-interactive
    # Commands to run in interactive sessions can go here
    source ~/.config/fish/aliases.fish
    source ~/.config/fish/herbst_completion.fish

    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

# Source some env vars that are private and not to be committed, such as tokens etc...
source ~/.config/fish/private_variables
