#!/bin/bash

PARSER_COMMAND=../tools/parser
SOL_DIR=
MAUDE_COMMAND=
INSTANCES_DIR=../instances/
CODE_DIR=../code/
ARGV_0=
ARGV_1=
ARGV_2=
TIMEOUT=

LOG_FILE="$SOL_DIR/log.txt"

FILES=`ls $INSTANCES_DIR`
cd $CODE_DIR

rm $LOG_FILE

for SOL in $FILES; do
    FILENAME=$(basename "$SOL")
    FNAME="${FILENAME%.*}"
    
    echo "Analyzing $SOL" >> $LOG_FILE
    
    $PARSER_COMMAND $ARGV_0 $ARGV_1 $ARGV_2 < $DIFFICULTY_DIR/$SOL > $SOL_DIR/"in.txt"
    timeout $TIMEOUT $MAUDE_COMMAND < $SOL_DIR/"in.txt" > /$SOL_DIR/"$FNAME.txt"
    RES="$?"

    if [ $RES -eq "0" ]; then
        echo "$SOL OK" >> $LOG_FILE
    elif [ $RES -eq "124" ]; then
        echo "$SOL BASH TIMEOUT" >> $LOG_FILE
    else
        echo "$SOL UNKNOWN ERROR" >> $LOG_FILE
    fi

done
