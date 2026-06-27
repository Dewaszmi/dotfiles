# env variables
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"

# theme
ZSH_THEME="apple"

# oh-my-zsh plugins
plugins=(
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# some path extensions
export PATH=$PATH:/home/dewaszmi/.local/bin

eval "$(zoxide init zsh)"
source <(fzf --zsh)

# ===========================
# aliases
alias c="clear"
alias rmf="rm -rf"
alias md="mkdir -p"
alias open="xdg-open"

mkcd () {
  mkdir -p "$1"
  cd "$1"
}

# zoxide so I wont forget
alias cd="z"

alias vi="nvim"
alias yz="yazi"
alias ff="fastfetch"

# tmux
alias t="tmux"
alias tn="tmux new-session -s"
alias ta="tmux attach"
alias td="tmux detach"
alias tl="tmux list-sessions"
alias tk="tmux kill-session -t"

# other
alias sv="source .venv/bin/activate"
alias kps="keepassxc-cli open $KEEPASS_DATABASE_PATH"
alias zconf="vi $HOME/.zshrc"
alias viconf="vi $XDG_CONFIG_HOME/nvim"

# git
alias lzg="lazygit"
alias gcl="git clone"
