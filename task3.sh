#!/bin/bash

LENGTH=${1:-20}

echo "Генерация $LENGTH случайных букв латинского алфавита:"

for ((i=0; i<$LENGTH; i++)); do
    R=$((RANDOM % 26))
    printf "\\$(printf '%03o' $((97 + R)))"
done

echo ""
