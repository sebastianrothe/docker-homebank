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
xhost +

# Run the application
docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v $fileDirectory:/root/files \
    --rm \
    --name homebank \
    neolao/homebank

