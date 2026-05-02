#!/bin/bash
target="${1:-.}"
if [ ! -d "$target" ]; then
    echo "Error: '$target' is not a directory."
    exit 1
fi
echo "Contents of directory: $target"
echo "================================="
for file in "$target"/*; do
    if [ -e "$file" ]; then
        perm=$(stat -c "%A" "$file" 2>/dev/null || stat -f "%Sp" "$file" 2>/dev/null)
        echo "$perm  $(basename "$file")"
    fi
done
