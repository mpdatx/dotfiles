#!/bin/bash
# when inotify is not available

TIMESTAMP=`ls -l --time-style=full-iso $1 | cut -d ' ' -f 7`
sleep 1
TIMESTAMP2=`ls -l --time-style=full-iso $1 | cut -d ' ' -f 7`

while :
do
	while [ $TIMESTAMP == $TIMESTAMP2 ]; do
		sleep 1
		TIMESTAMP2=`ls -l --time-style=full-iso $1 | cut -d ' ' -f 7`
	done
	TIMESTAMP=$TIMESTAMP2
	$2
done

