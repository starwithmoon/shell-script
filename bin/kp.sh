#!/bin/bash

killProcess(){
    ps -ef|grep "$PROCNAME"|awk '{if($8 !~ /grep|kp.sh/){print $2}}'|xargs -r kill -9
}

main()
{
    ps -ef|grep "$PROCNAME"|awk '{if($8 !~ /grep|kp.sh/){print $0}}'
    echo "kill these process ? [yes|no]"
    read answer
    if [ "$answer" == "y" ]; then
	killProcess
    elif [ "$answer" == "yes" ]; then
	killProcess
    fi
}

usage()
{
    echo "`basename $0` [-y] processName"
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
elif [ $# -eq 2 ]; then
    case "$1" in
	-y)
	    PROCNAME=$2
	    killProcess
	    ;;
	*)
	    usage
	    ;;
    esac   
else
    usage
fi
