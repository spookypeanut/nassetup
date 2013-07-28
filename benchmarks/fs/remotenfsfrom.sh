#!/bin/bash

DATETIME=$(date +%s)
RESULTDIR=results/remotenfsfrom/$DATETIME
mkdir -p $RESULTDIR
FILE=tiny.mp3

for i in $(cat types.txt); do
    echo Doing $i
    rm /tmp/$FILE
    LOG=$RESULTDIR/$i.txt
    SRC=/mnt/spookybackup-nfs/export/$i/$FILE
    DEST=/tmp/
    (time rsync -vv $SRC $DEST) &>> $LOG
    sync
    echo "Sleeping for 1 minute"
    sleep 1m
done
