#!/bin/bash

DATETIME=$(date +%s)
RESULTDIR=results/remotenfsfrom/$DATETIME
mkdir -p $RESULTDIR

for i in $(cat types.txt); do
    echo Doing $i
    rm /tmp/largefilm.m4v
    LOG=$RESULTDIR/$i.txt
    SRC=/mnt/spookybackup-nfs/export/$i/largefilm.m4v
    DEST=/tmp/
    (time rsync -vv $SRC $DEST) &>> $LOG
    sync
    echo "Sleeping for 1 minute"
    sleep 1m
done
