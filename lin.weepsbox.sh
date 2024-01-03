#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Using: weepsbox TARGET"
    exit 1
fi

url=$1
filename=$(basename "$url")
wget "$url" -O "$filename" && python3 "$filename"
