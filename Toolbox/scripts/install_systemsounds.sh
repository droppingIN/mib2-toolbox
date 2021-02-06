#!/bin/sh
export TOPIC=Systemsounds
export MIBPATH=/net/rcc/mnt/efs-system/opt/audio/tones/*.*
export SDPATH=/$TOPIC/
export DESCRIPTION="This script will install Systemsounds"
export TYPE="file"

echo $DESCRIPTION


. /eso/hmi/engdefs/scripts/mqb/util_info.sh

#include script to mount the sd-card and set variable $VOLUME as the SD-location
. /eso/hmi/engdefs/scripts/mqb/util_mountsd.sh
if [[ -z "$VOLUME" ]] 
then
	echo "No SD-card found, quitting"
	exit 0
fi

#include script to make backup
. /eso/hmi/engdefs/scripts/mqb/util_backup.sh


# include script tocopy file(s)
# remount everything as read-only again
. /eso/hmi/engdefs/scripts/mqb/util_copy.sh


echo "Done. Now restart the unit."
exit 0
