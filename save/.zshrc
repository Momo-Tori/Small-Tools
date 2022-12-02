# ls aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep="grep --color=auto"

# set ls color

LS_COLORS=''
LS_COLORS=$LS_COLORS:'no=36'
LS_COLORS=$LS_COLORS:'fi=37'
LS_COLORS=$LS_COLORS:'di=33;4'
LS_COLORS=$LS_COLORS:'tw=33;4'
LS_COLORS=$LS_COLORS:'ow=33;4'

export LS_COLORS


# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# npm setting
npm set prefix ~/.npm
PATH="$HOME/.npm/bin:$PATH"
PATH="./node_modules/.bin:$PATH"

# git aliases
alias gs="git status"
alias ga="git add"
alias gc="git cz"

# zsh configuration

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/momotori/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

POWERLEVEL9K_MODE="nerdfont-complete"

POWERLEVEL9K_DISABLE_RPROMPT=false
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="> "
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir_writable dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time time)

POWERLEVEL9K_TIME_BACKGROUND='seagreen1'
POWERLEVEL9K_TIME_FOREGROUND='grey30'

POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='pink1'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='grey30'

POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND=$P9KGT_YELLOW
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND=$P9KGT_RED

POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=$P9KGT_TERMINAL_BACKGROUND
POWERLEVEL9K_DIR_HOME_FOREGROUND=$P9KGT_TERMINAL_BACKGROUND
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=$P9KGT_TERMINAL_BACKGROUND
POWERLEVEL9K_DIR_ETC_FOREGROUND=$P9KGT_TERMINAL_BACKGROUND
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=$P9KGT_BLUE
POWERLEVEL9K_DIR_HOME_BACKGROUND=$P9KGT_BLUE
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=$P9KGT_BLUE
POWERLEVEL9K_DIR_ETC_BACKGROUND=$P9KGT_BLUE

POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='lightcoral'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='grey30'

ZSH_DISABLE_COMPFIX=true

# make cd use the ls colours
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

# 忽略大小写
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'