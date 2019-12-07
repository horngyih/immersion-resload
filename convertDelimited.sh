#! /bin/sh

COLUMNS1="9 13 11 97 55 55 10 7 7 81 55";
COLUMNS2="9 13 11 97 55 55 10 7 7 81 55 12";

for FILE in `find . -name '*.utf8' -type f`
do
	FILENAME=`basename $FILE | cut -d '.' -f 1,2`; 
	HAS_ROOM_TYPE=`egrep 'ROOM_TYPE' $FILE | wc -l`;
	FIXEDWIDTHS=$COLUMNS1;
	if [ $HAS_ROOM_TYPE -eq 1 ];
	then
		echo $FILENAME - $HAS_ROOM_TYPE - $COLUMNS2;
		head -n -3 $FILE | awk -v widths="$COLUMNS2" -v source="$FILENAME" -f res-roomtype.awk > $FILE.csv
	else
		echo $FILENAME - $HAS_ROOM_TYPE - $COLUMNS1;
		head -n -3 $FILE | awk -v widths="$COLUMNS1" -v source="$FILENAME" -f res.awk > $FILE.csv
	fi
done;

