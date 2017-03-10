#!/bin/sh

# Link with french language plugin to PocketSphinx
if [ -z ${FR_LINK+x} ]; then
    FR_LINK="https://www.dropbox.com/s/115e3mf3y21x0b8/fr-FR.zip?dl=1"
fi


# Install some PocketSphinx and SpeechRecognition dependencies
if [ -f "/etc/lsb-release" ]; then  # Ubuntu-way
    sudo apt-get update -y
    sudo apt-get install python3 python3-dev python3-pip build-essential swig git libpulse-dev wget unzip -y
    if [ $? -ne 0 ]; then
        exit 1
    fi
else
    if [ -f "/etc/arch-release" ]; then  # Archlinux-way
        sudo pacman -S archlinux-keyring --noconfirm
        sudo pacman-key --init
        sudo pacman-key --populate archlinux
        sudo pacman-key --refresh-keys
        sudo pacman -S python python-setuptools python-six python-packaging python-pyparsing base-devel python-pip swig git libpulse wget unzip --noconfirm --force
        if [ $? -ne 0 ]; then
            exit 1
        fi
    else
        echo "Distributive isn't supported."
    fi
fi

# There could be some bugs with sudo+pip destination folder
yes | sudo pip3 install SpeechRecognition pocketsphinx
if [ $? -ne 0 ]; then
    exit 1
fi

SR_LIB=$(sudo python3 -c "import speech_recognition as sr, os.path as p; print(p.dirname(sr.__file__))")
FR_ZIP="$SR_LIB/fr-FR.zip"

# Download plugin if we haven't done it yet
if [ ! -f "$FR_ZIP" ]; then
    wget $FR_LINK -O $FR_ZIP
fi

# Unpack data to PocketSphinx folder
unzip -o $FR_ZIP -d "$SR_LIB"
chmod --recursive a+r "$SR_LIB/pocketsphinx-data/fr-FR/"
