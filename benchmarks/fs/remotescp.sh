#!/bin/bash

DATETIME=$(date +%s)
RESULTDIR=results/remotescp/$DATETIME
mkdir -p $RESULTDIR

for i in $(cat types.txt); do
    echo Doing $i
    LOG=$RESULTDIR/$i.scp.txt
    SRC=../../data/largefilm.m4v
    DEST=spookybackup:/mnt/$i/
    (time scp $SRC $DEST) &>> $LOG
done
