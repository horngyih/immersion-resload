#! /bin/sh
for FILE in `find . -name '*txt' -type f`
do
	iconv -f utf-16 -t utf-8 $FILE > $FILE.utf8
done;
