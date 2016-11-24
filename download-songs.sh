#!/bin/bash

[ "$#" -eq 1 ] || { echo >&2 "Requires single text file (with youtube links on each line) name as argument."; exit 1; }

command -v youtube-dl >/dev/null 2>&1 || { echo >&2 "Install youtube-dl first."; exit 1; }

if [ ! -d "downloads" ]; then
    mkdir downloads
fi

while IFS='' read -r line || [[ -n "$line" ]]; do
    youtube-dl -x --audio-format mp3 $line -o './downloads/%(title)s.%(ext)s'
    grep -v "$line" $1 > temp
    mv temp $1
done < "$1"