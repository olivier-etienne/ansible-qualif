#!/bin/bash

DIR=`dirname $0`

if [ -f ${DIR}/programmeTV.txt ]; then
  rm -f ${DIR}/programmeTV.txt
fi

java -jar ${DIR}/ProgrammeTV.jar ${DIR}/programmeTV.txt

if [ -f ${DIR}/programmeTV.txt ]; then
	cp ${DIR}/programmeTV.txt /home/standalone/www/FR/ProgramTV/
        cp ${DIR}/programmeTV.txt /home/standalone/www/FR-R4/ProgramTV/
	chown jenkins. /home/standalone/www/FR/ProgramTV/*
        chown jenkins. /home/standalone/www/FR-R4/ProgramTV/*
fi
