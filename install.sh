#!/bin/bash

FESHUBBINA=$HOME/usr/local/bin
FESHUBHOME=$HOME/usr/local/FES-hub

echo "Installing FES-hub ..."

# Check and create directories
if [ -d $FESHUBBINA ]
then
	echo "The $FESHUBBINA directory exists."
else
	echo "Create $FESHUBBINA directory."
	mkdir -p $FESHUBBINA
fi

if [ -d $FESHUBHOME ]
then
	echo "The $FESHUBHOME directory exists."
else
	echo "Create $FESHUBHOME directory."
	mkdir -p $FESHUBHOME
fi

# Install FES-hub
cp -r src $FESHUBHOME
for file in $(ls src)
do
	chmod +x $FESHUBHOME/src/$file
	ln -s $FESHUBHOME/src/$file $FESHUBBINA/${file%.sh}
done

cp -r lib $FESHUBHOME
for file in $(ls lib)
do
	chmod +x $FESHUBHOME/lib/$file
done

cp -r misc $FESHUBHOME

echo "Normal installation. Congratulations!"