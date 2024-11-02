export XDG_CONFIG_HOME=$HOME/.config
export LDFLAGS="-L/usr/local/opt/libpq/lib"
export CPPFLAGS="-I/usr/local/opt/libpq/include"
export PKG_CONFIG_PATH="/usr/local/opt/libpq/lib/pkgconfig"
# If you come from bash you might have to change your $PATH.  export
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'               # Make completions non case-sensitive
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'            # Add colors
zstyle ':completion:*' menu-no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'tree -L 2 $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'tree -L 2 --color $realpath'
zstyle ':fzf-tab:complete:ls:*' fzf-preview 'if [ -d $realpath ]; then ls --color $realpath; elif [[ "$(file -b --mime-type $realpath)" == "text"* ]]; then bat --style=numbers --color=always $realpath; fi'
zstyle ':fzf-tab:*' popup-min-size 1000
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
# completions
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
# fpath+=("$(brew --prefix)/share/zsh/site-functions")

zinit for \
    light-mode \
  Aloxaf/fzf-tab\
  zsh-users/zsh-autosuggestions \
  zsh-users/zsh-completions \
  zsh-users/zsh-syntax-highlighting 
  
# Snippets
zinit snippet OMZP::git

autoload -Uz compinit && compinit
zinit cdreplay -q 

# # history setup
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt append_history
setopt share_history
setopt hist_ignore_space
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_verify
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# # aliases
alias ls="ls --color"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias vim=nvim
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.pr0f37.catpuccin_frappe.omp.json)"
fi
