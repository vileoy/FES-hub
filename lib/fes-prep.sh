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

# FES Preparation
gro="morph.gro"
top="morph.top"
base="_sol"

echo "Energy Minimization"
gmx grompp -f $FESHUBHOME/misc/fes-min.mdp -c $gro -p $top -o em.tpr
gmx mdrun -deffnm em
 
nstates=11
mkdir prod
for (( i = 0; i < nstates; i++ ))
do
	imdp="$base.$i.mdp"
	itpr="$base.$i.tpr"
	sed 's/%L%/'"$i"'/' $base.mdp > $imdp
	gmx grompp -f $imdp -c em.gro -p $top -o prod/$itpr
done