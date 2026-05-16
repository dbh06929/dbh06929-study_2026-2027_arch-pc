#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Использование: $0 <имя_команды>"
    echo "Пример: $0 ls"
    exit 1
fi

CMD=$1
MAN_DIR="/usr/share/man/man1"

if [ -f "$MAN_DIR/${CMD}.1.gz" ]; then
    echo "Отображение справки для команды $CMD..."
    zless "$MAN_DIR/${CMD}.1.gz"
elif [ -f "$MAN_DIR/${CMD}.1.bz2" ]; then
    echo "Отображение справки для команды $CMD..."
    bzless "$MAN_DIR/${CMD}.1.bz2"
elif [ -f "$MAN_DIR/${CMD}.1" ]; then
    echo "Отображение справки для команды $CMD..."
    less "$MAN_DIR/${CMD}.1"
elif [ -f "$MAN_DIR/${CMD}.1.xz" ]; then
    echo "Отображение справки для команды $CMD..."
    xzless "$MAN_DIR/${CMD}.1.xz"
else
    echo "Ошибка: справка для команды $CMD не найдена"
    echo "Проверьте каталог: $MAN_DIR"
fi
