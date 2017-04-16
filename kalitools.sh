#!/bin/bash

function help {
    echo "usage: KaliTools.sh <option>"
    echo
    echo "Optons:"
    echo "    -a, --add-sources      :   add the Kali repository"
    echo "    -r, --remove-sources   :   remove the Kali repositorys"
    echo "    --help                 :   print this help"
    echo "    --version              :   print the version"
    exit
}

function about {
	echo -e "KaliTools (c) 2017 - AppPrinter"
	echo -e "This script was written by \e[92m\e[5mGregor Löffler\e[0m."
	echo -e "Github: \e[94mhttps://github.com/AppPrinter\e[0m"
	exit
}


if [ -z $1 ]
then
    help
fi

case $1 in
    --help)
        help
    ;;

    -a|--add-sources)
        cp /etc/apt/sources.list /etc/apt/sources.list.bak
        echo "# added by kalitools.sh" >> /etc/apt/sources.list
        echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list
        apt update -m
        exit
    ;;

    -r|--remove-sources)
        mv /etc/apt/sources.list.bak /etc/apt/sources.list
        apt update -m
    ;;

    --version)
        about
    ;;

    *)
        echo "Unknown option '$1'"
        echo "'KaliTools.sh --help' for more help."
        exit
    ;;
esac
