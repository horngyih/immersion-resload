#! /bin/sh

BASEDIR=`dirname $0`;

TARGET_LOG=$1;
TARGET_DATE=$2;
CURR_DIR=$PWD;
TODAY=$(date +%Y-%m-%d);
TODAY_LOG_DATE=$(date +%m-%d);

if [ -z "$TARGET_LOG" ] 
then
    echo 'Usage : general-report.sh <log-file>';
    exit 0;
fi;

FIRST_LOG=`egrep -m 1 "$TODAY_LOG_DATE.+Entering" $TARGET_LOG`;
LAST_LOG=`egrep "$TODAY_LOG_DATE.+Completed" $TARGET_LOG | tail -n 1`;

echo FIRST LOG $FIRST_LOG;
echo LAST LOG $LAST_LOG;

START_TIME=`echo $FIRST_LOG | awk '{ print $3 }'`;
END_TIME=`echo $LAST_LOG | awk '{ print $3 }'`;

START_HOUR=`echo $START_TIME | cut -d ':' -f 1`;
START_MIN=`echo $START_TIME | cut -d ':' -f 2`;
START_SEC=`echo $START_TIME | cut -d ':' -f 3`;
START_HOUR_SEC=`expr $START_HOUR \* 60 \* 60`;
START_MIN_SEC=`expr $START_MIN \* 60`;
START=`expr $START_HOUR_SEC + $START_MIN_SEC + $START_SEC`;

END_HOUR=`echo $END_TIME | cut -d ':' -f 1`;
END_MIN=`echo $END_TIME | cut -d ':' -f 2`;
END_SEC=`echo $END_TIME | cut -d ':' -f 3`;
END_HOUR_SEC=`expr $END_HOUR \* 60 \* 60`;
END_MIN_SEC=`expr $END_MIN \* 60`;
END=`expr $END_HOUR_SEC + $END_MIN_SEC + $END_SEC`;

DURATION_IN_SEC=`expr $END - $START`;
FILE_COUNT=`$BASEDIR/count-todays-processed.sh`;

echo $TODAY File Drop Processing:-
echo 
echo First File drop @ $TODAY_DATE $START_TIME;
echo Last Completed @ $TODAT_DATE $END_TIME;
echo
echo Total Elapsed Time $((DURATION_IN_SEC/3600))h $(((DURATION_IN_SEC%3600)/60))m $((DURATION_IN_SEC%60))s;
echo Total files processed $FILE_COUNT;
echo Average file prcessing - $(($DURATION_IN_SEC/$FILE_COUNT))s; 
