#!/bin/bash

DATETIME=$(date +%s)
RESULTDIR=results/opensharefrom/$DATETIME
mkdir -p $RESULTDIR

FILM=largefilm.m4v

i="openshare"

rm /tmp/$FILM
sync
LOG=$RESULTDIR/$i.txt
SRC=/media/openshare/nassetup/$FILM
DEST=/tmp/
(time rsync -vv $SRC $DEST) &>> $LOG
sync
