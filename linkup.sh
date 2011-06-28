#!/usr/bin/env bash

if [[ $0 == /* ]]; then
    cwd=$(dirname $0)
else
    cwd=$(dirname $(pwd)/$0)
fi

linkup () {
    target=$cwd/$1
    link=$HOME/$1

    if [ -e "$link" -o -h "$link" ]; then
	if [ ! "$target" -ef "$link" ]; then
	    echo "$link has conflict that must be resolved manually."
	fi
    else
	ln -s "$target" "$link"
    fi
}

while read FILE ; do
    linkup $FILE
done < $cwd/FILES
