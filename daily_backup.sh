#!/usr/bin/env bash

BACKUP_DIR="/tmp/backup"
SOURCE_DIR="$HOME"
TAG="daily_sync"

mkdir -p "$BACKUP_DIR"

if rsync -a --delete --exclude='.*' "$SOURCE_DIR/" "$BACKUP_DIR"; then
    logger -t "$TAG" "Backup completed successfully."
    exit 0
else
    logger -t "$TAG" "Backup failed."
    exit 1
fi
