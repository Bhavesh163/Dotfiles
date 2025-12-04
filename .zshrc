# Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# NVM
if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

# Aliases
alias ls='eza --color=always --icons --group-directories-first'
alias lt='eza --tree --color=always --icons --group-directories-first'
alias q='kiro-cli'
alias v='nvim'

# Autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8,bold'

# UV environment
[ -f "$HOME/.local/bin/env.fish" ] && source "$HOME/.local/bin/env.fish" 2>/dev/null

# Kiro CLI integration
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi
command -v kiro-cli &>/dev/null && eval "$(kiro-cli init zsh pre --rcfile 00_fig_pre)"
command -v kiro-cli &>/dev/null && eval "$(kiro-cli init zsh post --rcfile 99_fig_post)"

# Syntax highlighting (must be last)
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[default]='fg=white,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[comment]='fg=black,bold'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=cyan,bold'

# Oh My Posh prompt
eval "$(oh-my-posh init zsh --config /home/ballhog/.cache/oh-my-posh/themes/gruvbox.omp.json)"
