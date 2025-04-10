#!/usr/bin/env bash

source scripts/shared.sh

get_data_folder DATA_FOLDER

CONFIG_TARGET="${DATA_FOLDER:-.}/backups"
mkdir -p "$CONFIG_TARGET"
rsync -av --delete ~/.taskrc "$CONFIG_TARGET/.taskrc"

DATA_TARGET="${DATA_FOLDER:-.}/backups/.task/"
mkdir -p "$DATA_TARGET"
rsync -av --delete ~/.task/ "$DATA_TARGET"
