#! /bin/sh

set -e

SCRIPT_DIR="$(cd $(dirname $0) && pwd -L)"
BACKUP_DIR="$HOME/.myrc/backup/$(date +%Y-%m-%d)"
HOME_DIR="$HOME"
RCFILES="$(find "$SCRIPT_DIR" -name ".*" -type f -depth 1 | xargs basename)"

for ((i=0; ; i++)); do
    if [ $i = "0" ] && [ ! -e "$BACKUP_DIR" ]; then
        DEST_DIR="$BACKUP_DIR"
        break
    elif [ $i != "0" ] && [ ! -e "$BACKUP_DIR-$i" ]; then
        DEST_DIR="$BACKUP_DIR-$i"
        break
    fi
done

mkdir -p "$DEST_DIR"

# Back up old files.
for f in $RCFILES; do
    cp -pLR "$HOME_DIR/$f" "$DEST_DIR/"
done

# Link all rc files.
for f in $RCFILES; do
    ln -sf "$SCRIPT_DIR/$f" "$HOME_DIR/$f"
done

