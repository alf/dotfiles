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
export PATH=/Applications/Emacs.app/Contents/MacOS/bin:/usr/local/bin:$HOME/bin:$PATH
#export PATH=$PATH:$(npm bin)
export JAVA_HOME=$(/usr/libexec/java_home)
export SESAM_HOME=$HOME/sesam

# docker-machine
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/alf/.docker/machine/machines/dev"
export DOCKER_MACHINE_NAME="dev"

export LC_ALL=en_US.UTF-8
export LC_LOGNAME=$USER

if [[ -r /opt/boxen/env.sh ]]; then
    . /opt/boxen/env.sh
fi
#{{{1 Modeline ----------------------------------------------------------------
# vim: set foldmethod=marker ff=unix:
