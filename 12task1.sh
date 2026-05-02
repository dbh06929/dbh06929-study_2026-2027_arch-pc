#!/bin/bash
src="$0"
backup_dir="$HOME/backup"
mkdir -p "$backup_dir"
base=$(basename "$src")
timestamp=$(date +%Y%m%d-%H%M%S)
backup_file="$backup_dir/${base}_${timestamp}.tar.gz"
tar czf "$backup_file" "$src"
echo "Backup created: $backup_file"

