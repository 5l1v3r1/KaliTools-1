#!/bin/bash

help_menu(){
    echo "usage: ${0##*/} <option>"
    echo
    echo "Optons:"
    echo "     --add-keys        :  add the Kali keys"
    echo "     --add-sources     :  add the Kali repository"
    echo "     --remove-sources  :  remove the Kali repositorys"
    echo "     --version         :  print the version"
    echo
    exit 0
}

about_me(){
	echo -e "This script was written by \e[91m\e[5mGregor Löffler\e[0m."
	echo -e "My website: \e[92mhttp://appprinter.weebly.com\e[0m"
	echo
	exit 0
}


if [ -z $1 ]
then
    help_menu
fi

case $1 in
    --help)
        help_menu
    ;;

    --add-keys)
        sudo apt-key adv --keyserver pgp.mit.edu --recv-keys ED444FF07D8D0BF6
        sudo apt update
        exit 0
    ;;

    --add-sources)
        sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
        sudo sh -c 'echo "# added by kalitools.sh" >> /etc/apt/sources.list'
        sudo sh -c 'echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list'
        sudo apt update -m
        exit 0
    ;;

    --remove-sources)
        sudo mv /etc/apt/sources.list.bak /etc/apt/sources.list
        sudo apt update -m
    ;;

    --version)
        about_me
    ;;

    *)
        echo "${0##*/}: Unknown option '$1'"
        echo "\"${0##*/} --help\" for help."
        exit 0
    ;;
esac