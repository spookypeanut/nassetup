#!/bin/bash

DATETIME=$(date +%s)
RESULTDIR=results/remotesambafrom/$DATETIME
mkdir -p $RESULTDIR

FILM=largefilm.m4v

for i in $(cat types.txt); do
    echo Doing $i
    rm /tmp/$FILM
    LOG=$RESULTDIR/$i.txt
    SRC=/mnt/spookybackup/$i/$FILM
    DEST=/tmp/
    (time rsync -vv $SRC $DEST) &>> $LOG
    sync
    echo "Sleeping for 1 minute"
    sleep 1m
done
