#!/bin/bash

FESHUBHOME=$HOME/usr/local/FES-hub
FESWORKDIR=$(pwd)

# Processing options & parameters with getopts
while getopts :d:f: opt
do
    case "$opt" in
        d) FESWORKDIR=$OPTARG ;;
        f) RAWFILE=$OPTARG ;;
        *) echo "Unknown option: $opt" ;;
    esac
done

shift $[ $OPTIND - 1 ]
for param in "$@"
do
    echo "Unknown parameter: $param"
done

cd $FESWORKDIR

sed -n -e '1p; /$$$$/{n;p}' $RAWFILE > pert.txt

PROFILE="ligand.mol2"
obabel -isdf $RAWFILE -omol2 -O $PROFILE -h -m

RESULTDIR=ligands

if [ -d $RESULTDIR ]
then
    echo "The $RESULTDIR directory exists"
else
    mkdir $RESULTDIR
fi

for lig in $(ls ligand*.mol2)
do
    LIGNAME=$(sed -n '2p' $lig)
    mkdir ligands/$LIGNAME
    mv $lig ligands/$LIGNAME/ligand.mol2
done

echo "Conversion complete. Congratulations!"