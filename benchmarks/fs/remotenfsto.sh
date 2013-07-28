#!/bin/bash

DATETIME=$(date +%s)
RESULTDIR=results/remotenfsto/$DATETIME
mkdir -p $RESULTDIR

for i in $(cat types.txt); do
    echo Doing $i
    LOG=$RESULTDIR/$i.txt
    SRC=../../data/largefilm.m4v
    DEST=/mnt/spookybackup-nfs/export/$i/
    (time rsync -vv $SRC $DEST) &>> $LOG
    sync
    echo "Sleeping for 1 minute"
    sleep 1m
done
