#! /bin/sh
psql -U postgres -p 5555 -f create-temp-resload.sql;
for FILE in `find . -name '*.csv' -type f`
do
	psql -U postgres -p 5555 -c "\COPY \"tempResLoad\" FROM '$FILE' DELIMITER '|';";
done;
