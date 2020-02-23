# ███████╗███████╗██╗  ██╗██████╗  ██████╗
# ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#   ███╔╝ ███████╗███████║██████╔╝██║
#  ███╔╝  ╚════██║██╔══██║██╔══██╗██║
# ███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/harambe/.oh-my-zsh"
# Set name of the theme to load
ZSH_THEME=""

# Highlight auto suggestion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#99ecfd,bg=#ff92d0,bold"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=14

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  #aws
  kubectl
  docker
  #vscode
  #tmux
  zsh-syntax-highlighting
  zsh-completions
  zsh-autosuggestions
  brew
  #npm
  #yum
  #yarn
  #pip
  #osx
  history
)

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# User configuration

# Load Pure Theme
autoload -U promptinit; promptinit

# Optionally define some options
PURE_CMD_MAX_EXEC_TIME=10

# Change the path color
zstyle :prompt:pure:path color magenta

# Change the color for both `prompt:success` and `prompt:error`
zstyle ':prompt:pure:prompt:*' color cyan

# Turn on git stash status
zstyle :prompt:pure:git:stash show yes

prompt pure

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

# History in cache directory:
HISTSIZE=50000
SAVEHIST=50000

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
zle-keymap-select() {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}

zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.

# Use beam shape cursor for each new prompt.
preexec() {
  echo -ne '\e[5 q' ;
}

# Use lf to switch directories and bind it to ctrl-o
#lfcd() {
#  tmp="$(mktemp)"
#  lf -last-dir-path="$tmp" "$@"
#  if [ -f "$tmp" ]; then
#    dir="$(cat "$tmp")"
#    rm -f "$tmp"
#    [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
#  fi
#}

#bindkey -s '^o' 'lfcd\n'
bindkey -s '^o' 'ranger\n'

# Edit command line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Using bat to colorize pager for man, by setting the MANPAGER environment variable
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Set environment variable to point to bat config file
export BAT_CONFIG_PATH="~/.config/bat/bat.conf"

# Search files
alias f='find . -print | grep -i $1'

# Exa
alias ls='exa -G -l --icons --git -h'
alias la='exa -G -la --icons --git -h'
alias lt='exa -G -la -T --icons --git'
alias lr='exa -G -la -R --icons --git'


# Automatically do an ls after each cd
cd() {
  if [ -n "$1" ]; then
    builtin cd "$@" && ll
  else
    builtin cd ~ && ll
  fi
}

alias md='mkdir -p'

# Extract different type of compressed files
extract() {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2) tar xvjf $1   ;;
      *.tar.gz)  tar xvzf $1   ;;
      *.bz2)     bunzip2 $1    ;;
      *.rar)     unrar x $1    ;;
      *.gz)      gunzip $1     ;;
      *.tar)     tar xvf $1    ;;
      *.tbz2)    tar xvjf $1   ;;
      *.tgz)     tar xvzf $1   ;;
      *.zip)     unzip $1      ;;
      *.Z)       uncompress $1 ;;
      *.7z)      7z x $1       ;;
      *)         echo "Don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

# Remove older duplicate entries from history
setopt hist_ignore_all_dups

# cd by typing directory name if it's not a command
setopt auto_cd

# Automatically list choices on ambiguous completion
setopt auto_list

# Edit zshrc
editZsh() {
  vim ~/.zshrc
  exec zsh
}

# Edit Vim
alias editVim='vim ~/.vimrc'
alias editPlug='vim ~/.vimrc.plug'

# Create a new react app
react-app() {
  npx create-react-app $1
  cd $1
  npm i -D eslint
  npm i -D eslint-config-prettier eslint-plugin-prettier
  npm i -D eslint-config-airbnb eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react eslint-plugin-react-hooks
  cp "${HOME}/.eslintrc.json" .
  cp "${HOME}/.prettierrc" .
  echo $1 > README.md
  rm -rf yarn.lock
  cd src
  rm -f App.css App.test.js index.css logo.svg serviceWorker.js
  mkdir components views
  git add -A
  git commit -m "Initial commit."
  cd ..
  clear
  code .
}

# touch
alias t='touch'

# Trash-cli
alias tr='trash'
alias trp='trash-put'
alias trl='trash-list'
alias trre='trash-restore'
alias trrm='trash-rm'
alias trem='trash-empty'
alias rm='echo "This is not the command you are looking for."; false'
alias rd='echo "This is not the command you are looking for."; false'
alias rmdir='echo "This is not the command you are looking for."; false'

# Vim
alias v='vim'
alias vi='vim'

# Previous directory
alias bd='cd "$OLDPWD"'

# chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Search running processes
alias p="ps aux | grep"

# Dot to go up a directory
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# cat clone with syntax highlighting and Git integration
alias cat='bat'

# Python
alias python='python3'
alias pip='pip3'

# youtube-dl
alias yt='youtube-dl'

# cmus
bindkey -s '^k' 'cmus\n'

# iTerm2 Utilities
alias icat='imgcat'
alias ils='imgls'

# Neomutt
alias mutt='neomutt'

# Alpine
alias alp='alpine'

# htop
alias top='gotop -c vice'

# wttr.in
alias weather='curl wttr.in'

# Cheatsheet
#alias cheat='curl cheat.sh/$1'

# Tmux binding
bindkey -s '^t' 'tmux\n'

# thefuck
eval $(thefuck --alias)

# Source fzf
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#echo "                                                                                    "
#echo "\e[35m ███████╗\e[0m \e[36m ███████╗\e[0m\e[33m██╗  ██╗███████╗██╗     ██╗\e[0m"
#echo "\e[35m ╚══███╔╝\e[0m \e[36m ██╔════╝\e[0m\e[33m██║  ██║██╔════╝██║     ██║\e[0m"
#echo "\e[35m   ███╔╝\e[0m  \e[36m ███████╗\e[0m\e[33m███████║█████╗  ██║     ██║\e[0m"
#echo "\e[35m  ███╔╝ \e[0m  \e[36m ╚════██║\e[0m\e[33m██╔══██║██╔══╝  ██║     ██║\e[0m"
#echo "\e[35m ███████╗ \e[0m\e[36m ███████║\e[0m\e[33m██║  ██║███████╗███████╗███████╗\e[0m"
#echo "\e[35m ╚══════╝ \e[0m\e[36m ╚══════╝\e[0m\e[33m╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝\e[0m"
#echo "                                                                                    "
#neofetch
