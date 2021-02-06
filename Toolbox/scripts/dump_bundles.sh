#!/bin/sh

#info
TOPIC=Bundles
DESCRIPTION="This script will dump all files in /eso/bundles/"

#Volumes/files
ORIGINAL=/eso/bundles/*.jar

echo $DESCRIPTION

. /eso/hmi/engdefs/scripts/mqb/util_info.sh
. /eso/hmi/engdefs/scripts/mqb/util_mountsd.sh
if [[ -z "$VOLUME" ]] 
then
	echo "No SD-card found, quitting"
	exit 0
fi

#Make dump folder
DUMPFOLDER=$VOLUME/Dump/$VERSION/$FAZIT/$TOPIC

echo Dump-folder: $DUMPFOLDER
mkdir -p $DUMPFOLDER
echo "Please wait while the files are dumped"
sleep 1

echo
echo "Dumping, this can take a moment. Please be patient."
cp  $ORIGINAL $DUMPFOLDER/

# Make readonly again
mount -ur $VOLUME

echo "Done. Bundles dump can be found in the Dump folder on your SD-card"

exit 0
