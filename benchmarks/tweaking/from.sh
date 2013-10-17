#!/bin/bash

DATETIME=$(date +%s)
RESULTDIR=results/tweaking/$DATETIME
mkdir -p $RESULTDIR
FILM=largefilm.m4v

i=from.txt
echo Doing $i
rm /tmp/$FILM
sync
LOG=$RESULTDIR/$i
SRC=/mnt/fred/tweaking/$FILM
DEST=/tmp/
(time rsync -vv $SRC $DEST) &>> $LOG
sync
echo "Sleeping for 1 minute"
sleep 1m
