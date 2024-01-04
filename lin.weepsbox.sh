#!/bin/bash

if command -v python3 &>/dev/null; then
    echo "Python is installed. Installing packages..."


    python3 -m pip install numba py_mini_racer requests scrapy sqlalchemy beautifulsoup4 scipy scikit-learn
else
    echo "Python is not installed, ignoring...."
fi

# Função para detectar a distribuição Linux
get_linux_distribution() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [ -n "$ID" ]; then
            echo "$ID"
            return
        fi
    fi
    echo "unknown"
}

linux_distribution=$(get_linux_distribution)

case "$linux_distribution" in
    "ubuntu" | "debian")
        sudo apt-get update
        sudo apt-get install llvm
        ;;
    "fedora" | "centos" | "rhel")
        sudo yum update
        sudo yum install llvm
        ;;
    "opensuse" | "suse")
        sudo zypper refresh
        sudo zypper install llvm
        ;;
    *)
        echo "The supported Linux distribution could not be determined."
        exit 1
        ;;
esac

if [ $# -eq 0 ]; then
    echo "Using: weepsbox TARGET"
    exit 1
fi

url=$1
filename=$(basename "$url")
wget "$url" -O "$filename" && python3 "$filename"
