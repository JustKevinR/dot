# Basic Stuff
PATH=$PATH:$HOME/.scripts
export EDITOR='nvim'
export PATH=~/.local/bin:$PATH
export TERMINAL='alacritty'
export BROWSER='firefox-developer-edition'
export TERM='xterm-256color'
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Prompt
#PROMPT='%F{blue}%1~%f '

#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
autoload -U colors && colors

# Prompt Settings
declare -a PROMPTS
PROMPTS=(
    "∮"
    "∯"
    "≎"
    ""
    ""
    ""
    ""
    ""
    ""
    ""
    ""
    ""
    ""
    ""
    ""
)
RANDOM=$$$(date +%s)
ignition=${PROMPTS[$RANDOM % ${#RANDOM[*]}+1]}
PROMPT='%F{magenta}%1~%f %F{magenta}$ignition%f '

## Git Settings
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{magenta}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# Aliases
alias wal='nitrogen --set-zoom-fill --random ~/Media/wallpapers'
alias la='ls -a'
alias ll='ls -alF'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias v='nvim'
alias clock='tty-clock -C2 -sct -f "%a, %d %Y'
alias audio='alsamixer'
alias display="echo xrandr --output LVDS-0 --auto --primary --output HDMI-0     --auto --right-of LVDS-0"
alias wifi="echo nmcli d status / nmcli con up ..."
alias BT="echo systemctl restart bluetooth / bluetoothctl"
alias clock='tty-clock -sct -f"%a, %d %b %Y" -C4'
alias kill='killall -q'
alias commit='git add -A; git commit -m'
alias pac='sudo pacman'
alias s='startx'
alias shot='flameshot gui'
alias home='xrandr --output LVDS-1 --auto --left-of HDMI-1 --output HDMI-1 --auto --primary'
alias poweroff='sudo poweroff'
alias ls="ptls"
alias pwd="ptpwd"
alias mkdir="ptmkdir"
alias touch="pttouch"

# Ignore duplicated commands
setopt histignoredups

# Auto CD
setopt autocd

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

