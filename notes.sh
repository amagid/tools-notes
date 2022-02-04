#!/bin/bash
templateName="blank"
TOOLDIR="/mnt/c/Users/ahm64/OneDrive/Desktop/Eradani/Tools/notes"
TEMPLATESDIR="$TOOLDIR/templates"

function quit() {
    read -p "===== Press enter to exit =====" dummy
    exit
}

while getopts "hmb" opt; do
    case $opt in
        h)  printf "notes - Start new notes document\n"
            printf "\n"
            printf "This script will create a new notes document with a given template\n"
            printf "\n"
            printf "Usage:\n"
            printf "    notes [-h] [-m]"
            printf "\n\n"
            printf "Examples:\n"
            printf "    notes -m         # Create using Meeting template\n"
            printf "    notes            # Create using Blank template\n"
            printf "\n"
            printf "Options:\n"
            printf "    -h               Show script help\n"
            printf "    -m               Create using Meeting template\n"
            printf "    -b               No Template. Open fully blank document \n"
            printf "\n\n"
            exit
        ;;
        m) templateName="meeting"
        ;;
        b) templateName=""
        ;;
        \?) printf "Unknown option '${opt}'"
            exit
        ;;
    esac
done

if [ ! -z "$templateName" ]
then
    template="$TEMPLATESDIR/$templateName.md"
    currentDate=$(date +"%F")

    cat "$template" | sed "s/{DATE}/$currentDate/g" | clip.exe

    printf "\e[1;33mRemember to paste!\e[0;37m\n"
fi

/mnt/c/Program\ Files/Typora/bin/typora

