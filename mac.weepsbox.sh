#!/bin/bash

if command -v python3 &>/dev/null; then
    echo "Python is installed. Installing packages..."

    python3 -m pip install numba py_mini_racer requests scrapy sqlalchemy beautifulsoup4 scipy scikit-learn
else
    echo "Python is not installed, ignoring...."
fi

if [ $# -eq 0 ]; then
    echo "Using: weepsbox TARGET"
    exit 1
fi

url=$1
filename=$(basename "$url")
curl -o "$filename" "$url" && python3 "$filename"
