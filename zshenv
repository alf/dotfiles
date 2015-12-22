SELF=$HOME/.zshenv
ZSH_ROOT=${SELF:A:h}/zsh
echo $PATH
source $ZSH_ROOT/zshenv_basic.zsh
echo $PATH
HOST_ENV=$ZSH_ROOT/zshenv_$(hostname -s).zsh
[[ -f $HOST_ENV ]] && source $HOST_ENV
echo $PATH
