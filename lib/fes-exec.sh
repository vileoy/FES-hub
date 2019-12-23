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

# FESetup
cd $FESWORKDIR
FESetup setup.in
FESetup morph.in

# Preparation & Production MD
cd _perturbations/gromacs
perts=$(ls)
for pert in $perts
do
    fes prep -d $pert/complex
    fes prod -d $pert/complex
    fes prep -d $pert/solvated
    fes prod -d $pert/solvated
done