#!/bin/bash

main()
{
    if [ "$TMPNAME" != "tcpflow" ]; then
	PIDS=`ps -ef|grep $TMPNAME|awk '{if($8 !~ /grep/){print $0}}'|awk '{printf ($2",")}'|sed 's/,$//g'`
    else
	PIDS=`ps -ef|grep  "tcpflow"|awk '{if($8 !~ /sh/){print $0}}'|awk '{if($0 !~ /dev/){print $0}}'|awk '{printf ($2",")}'|sed 's/,$//g'`
    fi

    top -p $PIDS
}

usage()
{
    echo "`basename $0` processName"
}

echo $#
if [ $# -eq 1 ]; then
    TMPNAME=$1
    main
else
    usage
fi
