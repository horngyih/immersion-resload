#! /bin/sh

BASEDIR=$(dirname "$0");

DB_USER=postgres
DB_PORT=5555
DB_NAME=Immersion

psql -U $DB_USER -p $DB_PORT -d $DB_NAME -f $BASEDIR/create-temp-resload.sql;
for FILE in `find . -name '*.csv' -type f`
do
	psql -U $DB_USER -p $DB_PORT -d $DB_NAME -c "\COPY \"tempResLoad\" FROM '$FILE' DELIMITER '|';";
done;
