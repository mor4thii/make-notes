#!/usr/bin/env bash

source scripts/shared.sh

get_data_folder DATA_FOLDER

find "${DATA_FOLDER:-.}" -type f -name "*.md" | sort
