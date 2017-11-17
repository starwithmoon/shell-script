#!/bin/bash

curdir=$(cd $(dirname $0); pwd)

tarShell(){
    tmpPath=`dirname $target`
    tmpBaseName=`basename $target`

    cd $target
    find . -iname "*.sh"|xargs dos2unix
    find . -iname "*.sh"|xargs chmod 777
    
    cd ../
    tar -cf $tmpBaseName.tar $tmpBaseName/
}

usage()
{
    echo "`basename $0` -d|--dir dirName"
}

# extract options and their arguments into variables.
while true ; do
    case "$1" in
        -d|--dir) 
	    target=$2
	    tarShell; break ;;
	"") break;;
        *) usage ; exit 1 ;;
    esac
done
