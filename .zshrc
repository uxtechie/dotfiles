# custom settings
export VISUAL='nano'
export EDITOR="${VISUAL}"
export REACT_EDITOR='code'
export NODE_ENV=development
export NVM_DIR="$HOME/.nvm" # node nvm dir
export PROJECTS_DIR="$HOME/Projects"

# commands history settings
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=5000
export SAVEHIST=5000
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY             # Share history between all sessions
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry

# other custom zsh settings
setopt INTERACTIVE_COMMENTS      # Allow comments even in interactive shells      

# command history search settings
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[OA" up-line-or-beginning-search   # or "^[[A" depending on your terminal
bindkey "^[OB" down-line-or-beginning-search # or "^[[B" depending on your terminal

# configure keybindings
bindkey '^[[2~' overwrite-mode
bindkey '^[[3~' delete-char
bindkey '^[[H' beginning-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[3;5~' kill-word
bindkey '^[[5~' beginning-of-buffer-or-history
bindkey '^[[6~' end-of-buffer-or-history

# color helpers
RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\033[0;37m'
NO_COLOR='\033[0m'
BOLD_WHITE='\033[1;37m'

# set PATH, so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# linuxbrew settings if it exists
type /home/linuxbrew/.linuxbrew/bin/brew &>/dev/null && \
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
#   autoload -Uz compinit && compinit
fi

# add kubectl krew plugin manager to path if it exists
[[ -d "${HOME}/.krew/bin" ]] && \
	export PATH="${PATH}:${HOME}/.krew/bin"

# colorize commands
[[ -s "/home/linuxbrew/.linuxbrew/etc/grc.zsh" ]] && \
    source /home/linuxbrew/.linuxbrew/etc/grc.zsh

# colorize man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# zsh theme settings
# WARNING: the automatic configuration tool creates its configuration file
# in ~/.p10k.zsh and adds a few lines in this one.
# You can comment the next line to enable the theme autoconfiguration tool:
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
# Or enter this command to start it manually:
# p10k configure

POWERLEVEL9K_MODE=nerdfont-complete
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_beginning
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='${P9K_CONTENT} $(whoami | grep -v "^root\$")'
POWERLEVEL9K_OS_ICON_BACKGROUND=red
POWERLEVEL9K_OS_ICON_FOREGROUND=white
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND=black
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND=red
POWERLEVEL9K_SSH_BACKGROUND=white
POWERLEVEL9K_SSH_FOREGROUND=blue
POWERLEVEL9K_FOLDER_ICON=
POWERLEVEL9K_DIR_BACKGROUND=blue
POWERLEVEL9K_DIR_FOREGROUND=black
POWERLEVEL9K_DIR_WRITABLE_BACKGROUND=black
POWERLEVEL9K_DIR_WRITABLE_FOREGROUND=red
POWERLEVEL9K_VCS_CLEAN_FOREGROUND=black
POWERLEVEL9K_VCS_CLEAN_BACKGROUND=green
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=black
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=yellow
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=white
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=black
POWERLEVEL9K_VCS_UNTRACKED_ICON=●
POWERLEVEL9K_VCS_UNSTAGED_ICON=±
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=↓
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=↑
POWERLEVEL9K_VCS_COMMIT_ICON=$s
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_EXECUTION_TIME_ICON=$s
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=black
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=blue
POWERLEVEL9K_COMMAND_BACKGROUND_JOBS_BACKGROUND=black
POWERLEVEL9K_COMMAND_BACKGROUND_JOBS_FOREGROUND=cyan
POWERLEVEL9K_TIME_ICON=
POWERLEVEL9K_TIME_FORMAT='%D{%I:%M}'
POWERLEVEL9K_TIME_BACKGROUND=black
POWERLEVEL9K_TIME_FOREGROUND=white
POWERLEVEL9K_RAM_ICON=
POWERLEVEL9K_RAM_FOREGROUND=black
POWERLEVEL9K_RAM_BACKGROUND=yellow
POWERLEVEL9K_VI_MODE_FOREGROUND=black
POWERLEVEL9K_VI_COMMAND_MODE_STRING=NORMAL
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND=green
POWERLEVEL9K_VI_VISUAL_MODE_STRING=VISUAL
POWERLEVEL9K_VI_MODE_VISUAL_BACKGROUND=blue
POWERLEVEL9K_VI_OVERWRITE_MODE_STRING=OVERTYPE
POWERLEVEL9K_VI_MODE_OVERWRITE_BACKGROUND=red
POWERLEVEL9K_VI_INSERT_MODE_STRING=
POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%F{blue}╭─'
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{blue}╰%f '
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator ssh dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status command_execution_time background_jobs time ram)

# zsh plugins settings
zlong_ignore_cmds='vim ssh nano vi code gedit less cat top man'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=243'

# zsh plugins
source /usr/share/zplug/init.zsh
[ -s "$NVM_DIR/nvm.sh" ] && \
    zplug "plugins/nvm", from:oh-my-zsh # init node nvm if it exists
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/systemd", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/helm", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/nmap", from:oh-my-zsh
zplug "plugins/ufw", from:oh-my-zsh
zplug "plugins/cp", from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/z", from:oh-my-zsh
zplug "kevinywlui/zlong_alert.zsh", depth:1
zplug "andrewferrier/fzf-z", depth:1
zplug "zsh-users/zsh-autosuggestions", depth:1
zplug "zsh-users/zsh-syntax-highlighting", depth:1
zplug "romkatv/powerlevel10k", as:theme, depth:1
if ! zplug check; then
    zplug install
fi
zplug load

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
fi

# custom aliases
type bpytop > /dev/null && alias top='bpytop'
type bat > /dev/null && alias bat='bat --theme=ansi'
type bat > /dev/null && alias cat='bat --pager=never'
type bat > /dev/null && alias less='bat'
type vim > /dev/null && alias vi='vim'
type lsd > /dev/null && alias ls='lsd --group-dirs first'
alias tree='ls --tree'
alias ll='ls -lF'
alias la='ll -A'
alias l='ls -CF'
alias dir='ls'
alias sc-failed="systemctl --failed"
alias scu-failed="systemctl --user --failed"
alias pip='pip3'
alias history="history 0"

# platform dependent aliases
if [ $(uname -r | sed -n 's/.*\( *Microsoft *\).*/\1/ip') ];
then # Microsoft WSL2 platform:
    alias clip="clip.exe"
else # Linux native platform:
    alias clip="xclip -sel clip"
fi

# advanced aliases
alias cclip=CatToClipboard
function CatToClipboard()
{
    if set -o pipefail; \cat $1 | clip; then
        echo -e "    ${BOLD_WHITE}${1}${NO_COLOR} 📋 file content ${GREEN}added to clipboard${NO_COLOR}...\n"
    fi
    set +o pipefail
}
