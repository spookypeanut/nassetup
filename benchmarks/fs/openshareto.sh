#!/bin/bash

DATETIME=$(date +%s)
RESULTDIR=results/openshareto/$DATETIME
mkdir -p $RESULTDIR
FILE=largefilm.m4v

i=openshare
echo Doing $i
LOG=$RESULTDIR/$i.txt
SRC=../../data/$FILE
DEST=/media/openshare/nassetup/
(time rsync -vv $SRC $DEST) &>> $LOG
sync
