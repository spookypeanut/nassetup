#!/bin/bash

DATETIME=$(date +%s)
RESULTDIR=results/remotesamba/$DATETIME
mkdir -p $RESULTDIR

for i in $(cat types.txt); do
    echo Doing $i
    LOG=$RESULTDIR/$i.samba.txt
    SRC=../../data/largefilm.m4v
    DEST=/mnt/spookybackup/$i/
    (time rsync -vv $SRC $DEST) &>> $LOG
    sync
    echo Sleeping...
    sleep 1m
done
