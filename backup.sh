#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Использование: $0 <путь_к_каталогу>"
    exit 1
fi

target_dir="$1"
output_archive="backup_$(date +%Y%m%d).tar.gz"

if [[ ! -d "$target_dir" ]]; then
    echo "Ошибка: каталог $target_dir не существует"
    exit 1
fi

echo "Архивируются файлы в $target_dir, изменённые менее недели назад..."
find "$target_dir" -type f -mtime -7 -print0 | tar -czvf "$output_archive" --null -T -

if [[ $? -eq 0 ]]; then
    echo "Создан архив: $output_archive"
    ls -lh "$output_archive"
else
    echo "Ошибка при создании архива"
    exit 1
fi
