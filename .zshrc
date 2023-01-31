
export VISUAL='nano'
export EDITOR="${VISUAL}"
export REACT_EDITOR='code'
export PROJECTS_DIR="$HOME/Projects"

# commands history settings
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=5000
export SAVEHIST=5000
setopt INC_APPEND_HISTORY   # Write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY        # Share history between all sessions
setopt HIST_IGNORE_ALL_DUPS # Delete old recorded entry if new entry is a duplicate
setopt HIST_REDUCE_BLANKS   # Remove superfluous blanks before recording entry

# other custom zsh settings
setopt INTERACTIVE_COMMENTS # Allow comments even in interactive shells

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
YELLOW='\033[0;33m'
WHITE='\033[0;37m'
NO_COLOR='\033[0m'
BOLD_WHITE='\033[1;37m'

# set PATH, so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# linuxbrew settings if it exists
type /home/linuxbrew/.linuxbrew/bin/brew &>/dev/null &&
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
    # autoenv settings
    AUTOENV_ENABLE_LEAVE=true
    source $(brew --prefix autoenv)/activate.sh
fi

# add kubectl krew plugin manager to path if it exists
[[ -d "${HOME}/.krew/bin" ]] &&
    export PATH="${PATH}:${HOME}/.krew/bin"

# colorize commands
[[ -s "/home/linuxbrew/.linuxbrew/etc/grc.zsh" ]] &&
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
POWERLEVEL9K_VIRTUALENV_FOREGROUND=black
POWERLEVEL9K_VIRTUALENV_BACKGROUND=purple
POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=true
POWERLEVEL9K_VIRTUALENV_SHOW_WITH_PYENV=false
POWERLEVEL9K_VIRTUALENV_CONTENT_EXPANSION='${P9K_CONTENT%% *}'
POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%F{blue}╭─'
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{blue}╰%f '
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator ssh dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv vi_mode status command_execution_time background_jobs time ram)

# zsh plugins settings
zlong_ignore_cmds='vim ssh nano vi code gedit less cat top man'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=243'

# zsh plugins
source /usr/share/zplug/init.zsh
zplug "plugins/gitfast", from:oh-my-zsh
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
zplug "plugins/ng", from:oh-my-zsh
zplug "cowboyd/zsh-volta", depth:1
zplug "plugins/volta", from:oh-my-zsh
zplug "plugins/vscode", from:oh-my-zsh
zplug "chrisands/zsh-yarn-completions", depth:1
zplug "paulirish/git-open", depth:1, as:plugin
zplug "kevinywlui/zlong_alert.zsh", depth:1
zplug "andrewferrier/fzf-z", depth:1
#zplug "zsh-users/zsh-autosuggestions", depth:1
zplug "marlonrichert/zsh-autocomplete", depth:1
zplug "Tricked-dev/deno-zsh-plugin", depth:1
zplug "zsh-users/zsh-syntax-highlighting", depth:1
zplug "romkatv/powerlevel10k", as:theme, depth:1
if ! zplug check; then
    zplug install
fi

zplug load

# tools autocomplete config
ZSH_AUTOCOMPLETE_CACHE_DIR="${ZSH_CACHE_DIR}completions"
mkdir -p ${ZSH_AUTOCOMPLETE_CACHE_DIR}
# volta autocomplete
ZSH_AUTOCOMPLETE_CACHE_DIR="${ZSH_CACHE_DIR}completions"
VOLTA_AUTOCOMPLETE_CACHE_FILE="${ZSH_AUTOCOMPLETE_CACHE_DIR}/_volta"
if [[ ! -f "$VOLTA_AUTOCOMPLETE_CACHE_FILE" ]]; then
    volta completions zsh > "$VOLTA_AUTOCOMPLETE_CACHE_FILE"
fi
# deno autocomplete
DENO_AUTOCOMPLETE_CACHE_FILE="${ZSH_AUTOCOMPLETE_CACHE_DIR}/_deno"
if [[ ! -f "$DENO_AUTOCOMPLETE_CACHE_FILE" ]]; then
    deno completions zsh > "$DENO_AUTOCOMPLETE_CACHE_FILE"
fi
FPATH=$ZSH_AUTOCOMPLETE_CACHE_DIR:$FPATH
# init autocompletions:
autoload -Uz compinit
compinit -u

# yarn bin path
if type yarn &>/dev/null; then
    export PATH="$PATH:$(yarn global bin)"
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
fi

# custom aliases
type bpytop >/dev/null && alias top='bpytop'
type bat >/dev/null && alias bat='bat --theme=ansi'
type bat >/dev/null && alias cat='bat --pager=never'
type bat >/dev/null && alias less='bat'
type vim >/dev/null && alias vi='vim'
type lsd >/dev/null && alias ls='lsd --group-dirs first'
type gitmoji >/dev/null && alias gce='git add . && gitmoji -c'
type git-open >/dev/null && alias go='git open'
alias tree='ls --tree'
alias ll='ls -lF'
alias la='ll -A'
alias l='ls -CF'
alias dir='ls'
alias sc-failed="systemctl --failed"
alias scu-failed="systemctl --user --failed"
alias pip='pip3'
alias create-venv='python3 -m venv venv'
alias history="history 0"

# pnpm alias
alias pn='pnpm'
alias pnx="pnpm nx"
## packages
alias pna='pnpm add'
alias pnad='pnpm add --save-dev'
alias pnap='pnpm add --save-peer'
alias pnrm='pnpm remove'
alias pnin='pnpm install'
alias pnun='pnpm uninstall'
alias pnls='pnpm list'
alias pnout='pnpm outdated'
alias pnau='pnpm audit'
alias pnwhy='pnpm why'
alias pnui='pnpm update --interactive'
alias pnuil='pnpm update --interactive --latest'
## global packages
alias pnga='pnpm add --global'
alias pngls='pnpm list --global'
alias pngrm='pnpm remove --global'
alias pngu='pnpm update --global'
## miscs
alias pninit='pnpm init'
alias pnset='pnpm setup'
alias pnpub='pnpm publish'

# platform dependent aliases
if [ $(uname -r | sed -n 's/.*\( *Microsoft *\).*/\1/ip') ]; then # Microsoft WSL2 platform:
    alias clip="clip.exe"
else # Linux native platform:
    alias clip="xclip -selection clipboard &> /dev/null"
    type kitty >/dev/null && alias ssh='kitty +kitten \ssh'
fi

# advanced aliases
alias cclip=CatToClipboard
function CatToClipboard() {
    if \cat $1 >/dev/null; then
        \cat $1 | clip
        echo -e "    ${BOLD_WHITE}${1}${NO_COLOR} 📋 file content ${GREEN}added to clipboard${NO_COLOR}...\n"
    else
        # end with errorlevel 1
        false
    fi
}

alias z=MagicZ
# manage Python environment and autoenv
function MagicZ() {

    # leave autoenv if exists
    [[ -s "./.env.leave" ]] && cd ..

    if _z $1 2>&1; then
        _ManageCurrentEnvironment
    else
        # undo previous cd .. if z search fails
        cd - >/dev/null
        echo -e "    search for ${BOLD_WHITE}${1}${NO_COLOR} directory ${YELLOW}failed${NO_COLOR}"
        echo -e "    use ${GREEN}cd${NO_COLOR} command instead to access manually..."
        # end with errorlevel 1
        false
    fi
}

function _ManageCurrentEnvironment() {
    # load autoenv if exists
    [[ -s "./.env" ]] && cd .

    # manage Python environment
    if [[ -z "$VIRTUAL_ENV" && -d ./venv ]]; then
# . ./venv/bin/activate  # commented out by conda initialize
    else
        type deactivate &>/dev/null && deactivate
    fi
}

# customize dev tools:
## yarn
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
## yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

## pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# nim
export PATH=$HOME/.nimble/bin:$PATH

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
