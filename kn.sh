#!/bin/bash

main()
{
    netstat -anp|grep "$PROCNAME"
    echo "kill these process ? [yes|no]"
    read answer
    if [ "$answer" == "y" ]; then
	netstat -anp|grep "$PROCNAME"|awk '{print $7}'|awk -F"/" '{print $1}'|xargs -r kill -9
    elif [ "$answer" == "yes" ]; then
	netstat -anp|grep "$PROCNAME"|awk '{print $7}'|awk -F"/" '{print $1}'|xargs -r kill -9
    fi
}

usage()
{
    echo "`basename $0` SearchPorts"
}

if [ $# -eq 1 ]; then
    case "$1" in
	--help)
	    usage
	    ;;
	*)
	    PROCNAME=$1
	    main
	    ;;
    esac   
else
    usage
fi
