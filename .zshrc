# If you come from bash you might have to change your $PATH.  export
PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/Users/adam/.oh-my-zsh"

ZSH_THEME="agnoster"
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for
# completion.  COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.  DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.  You can set one of the optional
# three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd" or set a custom format
# using the strftime function format specifications, see 'man strftime' for
# details.  HIST_STAMPS="mm/dd/yyyy"

plugins=(
    docker
    docker-compose	
    git
    osx
    brew
    python
    zsh-syntax-highlighting
    virtualenv
)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# fpath=(/usr/local/share/zsh-completions $fpath)

export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
export PATH="/Users/adam/Developer/garmin/connectiq-sdk-mac-3.1.8-2020-05-01-5a72d0ab2/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"
export PATH="/usr/local/sbin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi
if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"; 
fi
eval "`pip completion --zsh`"