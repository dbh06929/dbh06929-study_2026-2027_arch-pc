#!/bin/bash

t1=10
t2=5
LOCKFILE="/tmp/semaphore.lock"

echo "[$$] Процесс запущен, PID=$$"
echo "[$$] Ожидание освобождения ресурса (максимум $t1 сек)..."

WAITED=0
while [ $WAITED -lt $t1 ]; do
    if [ ! -f "$LOCKFILE" ]; then
        break
    fi
    echo "[$$] Ресурс занят, ожидание... ($WAITED/$t1 сек)"
    sleep 1
    WAITED=$((WAITED + 1))
done

if [ -f "$LOCKFILE" ]; then
    echo "[$$] Время ожидания истекло, ресурс не получен"
    exit 1
fi

touch "$LOCKFILE"
echo "[$$] Ресурс получен, использование в течение $t2 сек..."

for ((i=1; i<=t2; i++)); do
    echo "[$$] Использование ресурса... ($i/$t2 сек)"
    sleep 1
done

rm -f "$LOCKFILE"
echo "[$$] Ресурс освобождён"
