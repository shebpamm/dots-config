function _get_herbstclient_completion
    set -l tokens (commandline -op)

    # Delete "herbstclient"
    set -e tokens[1]

    # Filter herbstclient options
    set -l index (count $tokens)
    for token in $tokens[-1..1]
        if string match --quiet -- "-" (string sub -l 1 -- $token)
            set -e tokens[$index]
        end
        set index (math "$index - 1")
    end

    set -l position (count $tokens)

    # If we have tokens but and cursor sits on a word (not space) decrease position due to 0-based in hlwm and 1-based in fish
    if test $position -gt 0 -a -n (commandline -ct)
        set position (math "$position - 1")
    end
    herbstclient -q complete $position $tokens
end

complete -xc herbstclient -d "" -a '(_get_herbstclient_completion)'

complete -c herbstclient -f -s n -l no-newline -d 'Do not print a newline if output does not end with a newline.'
complete -c herbstclient -f -s 0 -l print0 -d 'Use the null character as delimiter between the output of hooks.'
complete -c herbstclient -f -s l -l last-arg -d 'When using -i or -w, only print the last argument of the hook.'
complete -c herbstclient -f -s i -l idle -d 'Wait for hooks instead of executing commands.'
complete -c herbstclient -f -s w -l wait -d 'Same as --idle but exit after first --count hooks.'
complete -c herbstclient -f -s c -l count -r -d 'Let --wait exit after COUNT hooks were received and printed.'
complete -c herbstclient -f -s q -l quiet -d 'Do not print error messages if herbstclient cannot connect to the running herbstluftwm instance.'
complete -c herbstclient -f -s v -l version -d 'Print the herbstclient version.'
complete -c herbstclient -f -s h -l help -d 'Print the herbstclient usage with its command line options.'
