#!/bin/bash

FESHUBHOME=$HOME/usr/local/FES-hub
FESWORKDIR=$(pwd)

# Processing options & parameters with getopts
while getopts :d: opt
do
    case "$opt" in
        d) FESWORKDIR=$OPTARG ;;
        *) echo "Unknown option: $opt" ;;
    esac
done

shift $[ $OPTIND - 1 ]
for param in "$@"
do
    echo "Unknown parameter: $param"
done

cd $FESWORKDIR

mkdir anal
for i in `seq 0 10`
do
    cp prod/_sol.$i.dhdl.xvg anal/dhdl.$i.xvg
done

alchemical_analysis -d anal