#!/bin/bash
# Batch strip the subtitles from Matroska containers.

if [ "$1" == "" ]; then
    echo "You have to give me a file"
    exit 1
fi

for arg in "$@" ; do

    filename=$(basename "$arg")
    extension="${filename##*.}"
    filename="${filename%.*}"
    
    if [ $extension != 'mkv' ] ; then
        echo -e "\nSkipping $arg; it isn't a Matroska container"
        # mkvmerge is much more verbose.
    else
        echo ""
        mkvmerge  --nosubs $arg -o $filename.nosubs.$extension
    fi

done

exit 0

