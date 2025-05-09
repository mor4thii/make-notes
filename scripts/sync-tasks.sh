#!/usr/bin/env bash

source scripts/shared.sh

get_data_folder DATA_FOLDER

CONFIG_TARGET="${DATA_FOLDER:-.}/backups/.config/task"
mkdir -p "$CONFIG_TARGET"
rsync -av --delete ~/.config/task/taskrc "$CONFIG_TARGET/taskrc"

DATA_TARGET="${DATA_FOLDER:-.}/backups/.local/share/task"
mkdir -p "$DATA_TARGET"
rsync -av --delete ~/.local/share/task/ "$DATA_TARGET"
