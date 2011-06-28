# Check if already sourced
if [ ! "$already_sourced" ]; then
  already_sourced=1
else
  return
fi

#{{{1 Virtualenv setup
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/Cellar/python/2.7.1/bin/virtualenvwrapper.sh

#{{{1 Define aliases
alias mv="mv -i"
alias cp="cp -i"
alias du="du -c"
alias dato='date +"Uke %V, %A %d. %B, %Y -- %T"'

#{{{1 Options
umask 022           # Default file permissions
watch=all           # Notify all logins or logouts

# Turn on/off some zsh options
unsetopt bgnice
setopt nohup
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
       command 'ps --forest -u alf.lervag -o pid,user,cmd'
zstyle ':completion:*:processes-names' command 'ps axho command'

#{{{1 Set command prompt
ps_blue="%{$terminfo[bold]$fg[blue]%}"
ps_green="%{$terminfo[bold]$fg[green]%}"
ps_red="%{$terminfo[bold]$fg[red]%}"
ps_white="%{$terminfo[bold]$fg[white]%}"
ps_reset="%{$terminfo[sgr0]%}"
export PS1="$ps_blue%n$ps_white@$ps_green%m$ps_reset:$ps_red%3~$ps_reset%(!.#.$) " 
#export RPS1="$PR_LIGHT_YELLOW(%D{%m-%d %H:%M})$PR_NO_COLOR"

#{{{1 Add some keybindings
bindkey ' '    magic-space
bindkey "^R"   history-incremental-search-backward
bindkey "\e[Z" reverse-menu-complete
bindkey "^U"   history-incremental-search-backward

#{{{1 Modeline ----------------------------------------------------------------
# vim: set foldmethod=marker ff=unix:
