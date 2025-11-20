function fish_prompt
    set -l last_status $status
    set -l cwd (prompt_pwd)
    
    # User and host
    set_color brmagenta
    echo -n "┌─["
    set_color bryellow
    echo -n "$USER"
    set_color brwhite
    echo -n "@"
    set_color brcyan
    echo -n (prompt_hostname)
    set_color brmagenta
    echo -n "]"
    
    # Current directory
    set_color brmagenta
    echo -n "─["
    set_color brblue
    echo -n "$cwd"
    set_color brmagenta
    echo -n "]"
    
    # Git branch
    if git rev-parse --git-dir >/dev/null 2>&1
        set -l branch (git branch 2>/dev/null | sed -n '/\* /s///p')
        set_color brmagenta
        echo -n "─["
        set_color brgreen
        echo -n " $branch"
        set_color brmagenta
        echo -n "]"
    end
    
    echo
    
    # Second line with status indicator
    set_color brmagenta
    echo -n "└─"
    if test $last_status -eq 0
        set_color brgreen
        echo -n "➜ "
    else
        set_color brred
        echo -n "✗ "
    end
    set_color normal
end
