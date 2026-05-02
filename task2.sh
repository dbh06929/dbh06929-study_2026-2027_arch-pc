#!/bin/bash
echo "Total parameters: $#"
echo "All parameters:"
count=1
for arg in "$@"; do
    echo "  Arg $count: $arg"
    ((count++))
done
if [ $# -ge 10 ]; then
    echo "The 10th argument is: ${10}"
fi
