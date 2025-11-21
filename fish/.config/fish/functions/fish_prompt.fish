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
    
    # Git branch and status
    if git rev-parse --git-dir >/dev/null 2>&1
        set -l branch (git branch 2>/dev/null | sed -n '/\* /s///p')
        set_color brmagenta
        echo -n "─["
        set_color brgreen
        echo -n " $branch"
        
        # Untracked files
        set -l untracked (git ls-files --others --exclude-standard 2>/dev/null)
        if test -n "$untracked"
            set_color brred
            echo -n " +"
        end
        
        # Uncommitted changes (modified or staged)
        if not git diff --quiet 2>/dev/null; or not git diff --cached --quiet 2>/dev/null
            set_color bryellow
            echo -n " ●"
        end
        
        # Unpushed commits (only if tracking a remote branch)
        set -l upstream (git rev-parse --abbrev-ref @{u} 2>/dev/null)
        if test -n "$upstream"
            set -l unpushed (git log @{u}.. --oneline 2>/dev/null | wc -l)
            if test $unpushed -gt 0
                set_color brcyan
                echo -n " ↑"
            end
        end
        
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
