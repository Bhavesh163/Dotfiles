# Cargo
set -gx PATH $HOME/.cargo/bin $PATH

# NVM
if test -d $HOME/.nvm
    set -gx NVM_DIR $HOME/.nvm
    function nvm
        bass source $NVM_DIR/nvm.sh --no-use ';' nvm $argv
    end
end

# Aliases
alias ls='eza --color=always --icons --group-directories-first'
alias lt='eza --tree --color=always --icons --group-directories-first'
alias q='kiro-cli'
alias v='nvim'

# Syntax highlighting colors
set -g fish_color_normal brwhite
set -g fish_color_command brgreen
set -g fish_color_keyword brmagenta
set -g fish_color_quote bryellow
set -g fish_color_redirection brcyan
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_param brblue
set -g fish_color_comment brblack
set -g fish_color_operator brcyan
set -g fish_color_escape brcyan
set -g fish_color_autosuggestion brblack

if status is-interactive
    # Commands to run in interactive sessions can go here
end
