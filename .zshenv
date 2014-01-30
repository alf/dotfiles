#{{{1 Set environmental variables
# General
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient"
export XEDITOR="emacsclient --no-wait +%l %f"
export CLICOLOR=1
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=20000
export SAVEHIST=10000
export FIGNORE=.svn:.DS_Store
export PAGER='less'
export NODE_PATH=/usr/local/lib/node_modules
export PATH=/usr/local/bin:$HOME/local/bin:$PATH:$HOME/.gem/ruby/1.8/bin
#export PATH=$PATH:$(npm bin)
export JAVA_HOME=$(/usr/libexec/java_home)

if [[ -r /opt/boxen/env.sh ]]; then
    . /opt/boxen/env.sh
fi
#{{{1 Modeline ----------------------------------------------------------------
# vim: set foldmethod=marker ff=unix:
