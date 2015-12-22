#{{{1: Environment

export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -nw"
export XEDITOR="emacsclient --no-wait +%l %f"
export CLICOLOR=1
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=20000
export SAVEHIST=10000
export FIGNORE=.svn:.DS_Store
export PAGER='less'

export LC_ALL=en_US.UTF-8
export LC_LOGNAME=$USER

typeset -U path # Get's rid of duplicate entries in the path
export path=(~/bin $path /usr/local/bin)

#{{{1 Define aliases
alias mv="mv -i"
alias cp="cp -i"
alias du="du -c"
alias dato='date +"Uke %V, %A %d. %B, %Y -- %T"'
alias vim="emacsclient -nw"
alias e="emacsclient -nw"
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias dgc='docker rm $(docker ps -aq); docker rmi $(docker images -qf dangling=true)'
function dssh() { ssh -l root $(dip $1); }

# Make zsh work better when running in emacs
[[ $EMACS ]] && unsetopt zle

#{{{1 Options
umask 022           # Default file permissions
watch=all           # Notify all logins or logouts

# Turn on/off some zsh options
unsetopt bgnice
setopt nohup
setopt noflowcontrol
setopt interactive_comments
setopt clobber
setopt extended_history \
       inc_append_history \
       bang_hist \
       hist_expire_dups_first \
       hist_ignore_dups \
       hist_reduce_blanks
setopt correct_all
setopt notify
setopt complete_aliases \
       rec_exact
setopt extended_glob
setopt longlistjobs
setopt auto_cd \
       auto_list
setopt auto_pushd \
       pushd_ignore_dups \
       pushd_to_home

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile

# Add plugins and stuff
autoload -U compinit
autoload -U colors
autoload -U zsh/terminfo
autoload -U select-word-style
select-word-style bash
compinit
colors

#{{{1 Autocompletion styles

# Turn on cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Set more verbose output
zstyle ':completion:*' verbose yes

# Fuzzy matching of completions for when you mistype them
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' max-errors \
          'reply=($((($#PREFIX+$#SUFFIX)/2)) numeric)'

# Ignore completion functions for commands I don't have
zstyle ':completion:*:functions' ignored-patterns '_*'

zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt \
       '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*:processes' \
       command 'ps -u alf.lervag -o pid,user,command'
zstyle ':completion:*:processes-names' command 'ps axho command'

#{{{1 Set command prompt
autoload -U promptinit
promptinit

prompt redhat
#export RPS1="$PR_LIGHT_YELLOW(%D{%m-%d %H:%M})$PR_NO_COLOR"

#{{{1 Add some keybindings
bindkey ' ' magic-space
bindkey -M isearch '^@' accept-search

#{{{1 Custom configuration based on host and os

# Set up configuration root folder
local self zsh_root hostrc
self=$HOME/.zshrc
zsh_root=${self:A:h}/zsh
hostrc=$zsh_root/zshrc_$(hostname -s).zsh 
[[ -f $hostrc ]] && source $hostrc

#{{{1 Modeline ----------------------------------------------------------------
# vim: set foldmethod=marker ff=unix:

