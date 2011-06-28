#!/usr/bin/env bash

cwd=$(dirname $(pwd)/$0)

mv -i "$1" "$cwd"
echo $(basename $1) >> "$cwd/FILES"
exec $cwd/linkup.sh
