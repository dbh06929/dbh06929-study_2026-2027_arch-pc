#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "Использование: $0 create <N>   или   $0 delete <N>"
    exit 1
fi

action=$1
N=$2

if [[ "$action" == "create" ]]; then
    for i in $(seq 1 $N); do
        touch "${i}.tmp"
        echo "Создан ${i}.tmp"
    done
elif [[ "$action" == "delete" ]]; then
    for i in $(seq 1 $N); do
        if [[ -f "${i}.tmp" ]]; then
            rm "${i}.tmp"
            echo "Удалён ${i}.tmp"
        fi
    done
else
    echo "Неизвестная операция: $action"
    echo "Используйте 'create' или 'delete'"
    exit 1
fi
