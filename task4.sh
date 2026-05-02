#!/bin/bash
if [ $# -ne 2 ]; then
    echo "Usage: $0 <extension> <directory>"
    echo "Example: $0 .txt /home/user/docs"
    exit 1
fi
ext="$1"
dir="$2"
[[ "$ext" != .* ]] && ext=".$ext"
if [ ! -d "$dir" ]; then
    echo "Error: Directory '$dir' does not exist."
    exit 1
fi
shopt -s nullglob
files=("$dir"/*"$ext")
count=${#files[@]}
echo "Number of files with extension '$ext' in '$dir': $count"
