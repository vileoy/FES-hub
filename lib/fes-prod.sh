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

# FES Production
nstates=11
for (( i = 0; i < nstates; i++ ))
do
	sed 's/$NUM/'"$i"'/g' $FESHUBHOME/misc/fes-job.slurm > fes-job$i.slurm
	sbatch fes-job$i.slurm
done
