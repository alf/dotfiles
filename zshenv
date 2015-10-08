SELF=$HOME/.zshenv
ZSH_ROOT=${SELF:A:h}/zsh/

source $ZSH_ROOT/zshenv_basic.zsh

HOST_ENV=$ZSH_ROOT//zshenv_$(hostname -s).zsh
[[ -f $HOST_ENV ]] && source $HOST_ENV
