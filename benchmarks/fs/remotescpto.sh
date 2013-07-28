#!/bin/bash

DATETIME=$(date +%s)
RESULTDIR=results/remotescpto/$DATETIME
FILE=largefilm.m4v
mkdir -p $RESULTDIR

for i in $(cat types.txt); do
    echo Doing $i
    LOG=$RESULTDIR/$i.txt
    SRC=../../data/$FILE
    DESTFILE=/mnt/$i/$FILE
    DEST=spookybackup:/mnt/$i/
    ssh spookybackup rm $DESTFILE
    ssh spookybackup sync
    (time scp $SRC $DEST) &>> $LOG
    sync
    echo "Sleeping for 1 minute"
    sleep 1m
done
