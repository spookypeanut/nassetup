#!/bin/bash

DATETIME=$(date +%s)
RESULTDIR=results/remotescpfrom/$DATETIME
FILE=tiny.mp3
mkdir -p $RESULTDIR

for i in $(cat types.txt); do
    echo Doing $i
    LOG=$RESULTDIR/$i.txt
    DEST=/tmp/$FILE
    SRC=spookybackup:/mnt/$i/$FILE
    rm $DEST
    (time scp $SRC $DEST) &>> $LOG
    sync
    #echo "Sleeping for 1 minute"
    #sleep 1m
done
