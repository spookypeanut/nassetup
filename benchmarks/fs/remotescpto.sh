#!/bin/bash

DATETIME=$(date +%s)
RESULTDIR=results/remotescpto/$DATETIME
FILE=tiny.mp3
mkdir -p $RESULTDIR

for i in $(cat types.txt); do
    echo Doing $i
    LOG=$RESULTDIR/$i.txt
    SRC=../../data/$FILE
    DESTFILE=/mnt/$i/$FILE
    DEST=spookybackup:/mnt/$i/
    ssh spookybackup rm $DESTFILE
    (time scp $SRC $DEST) &>> $LOG
done
