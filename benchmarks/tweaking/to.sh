#!/bin/bash

DATETIME=$(date +%s)
RESULTDIR=results/tweaking/$DATETIME
mkdir -p $RESULTDIR
FILE=largefilm.m4v

i=to.txt
echo Doing $i
LOG=$RESULTDIR/$i
SRC=../../data/$FILE
DEST=/mnt/fred/tweaking/
(time rsync -vv $SRC $DEST) &>> $LOG
sync
echo Sleeping...
sleep 1m
