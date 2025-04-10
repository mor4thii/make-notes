#!/usr/bin/env bash

source scripts/shared.sh

get_data_folder DATA_FOLDER

CONFIG_TARGET="${DATA_FOLDER:-.}/backups/.config/timewarrior/"
mkdir -p "$CONFIG_TARGET"
rsync -av --delete ~/.config/timewarrior/ "$CONFIG_TARGET"

DATA_TARGET="${DATA_FOLDER:-.}/backups/.local/share/timewarrior/"
mkdir -p "$DATA_TARGET"
rsync -av --delete ~/.local/share/timewarrior/ "$DATA_TARGET"
