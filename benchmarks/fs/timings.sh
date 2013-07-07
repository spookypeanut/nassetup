for i in $(cat types.txt); do
    echo Doing $i
    LOG=$i.timings.txt
    rm $LOG
    echo dd output >> $LOG
    OUTFILE=/mnt/$i/output.img
    rm $OUTFILE
    (time dd if=/dev/zero of=$OUTFILE bs=8k count=256k) &>> $LOG
done
