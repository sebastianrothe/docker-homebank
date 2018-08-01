#!/bin/bash
scriptPath="$( readlink -f "$( dirname "$0" )" )/$( basename "$0" )"
currentDirectory=$(dirname $scriptPath)
fileDirectory=$currentDirectory/files

# Create the shared directory
if [ ! -e "$fileDirectory" ]
then
    mkdir $fileDirectory
fi

# Authorize X server to accept connections
xhost + $(hostname)

# Run the application
docker run -it --rm \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $fileDirectory:/root/files \
    -e DISPLAY=$(hostname)$DISPLAY \
    --name homebank \
    homebank