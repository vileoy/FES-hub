#!/bin/bash

FESHUBHOME=$HOME/usr/local/FES-hub

task=$1; shift
$FESHUBHOME/lib/fes-$task.sh $*