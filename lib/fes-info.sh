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

echo "===== Wellcome to FES-hub! ====="
echo
echo "- Author : Haoyu Lin"
echo "- Version: 1.0.0"
echo "- Usage  : \`fes xxxx\`, e.g. \`fes exec\`."
echo
echo "- Running env:"
echo "  - FESHUBHOME: $FESHUBHOME"
echo "  - FESWORKDIR: $FESWORKDIR"
echo 
echo "=========== Goodbye! ==========="