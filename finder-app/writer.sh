#!/bin/bash

# Check if all parameters are provided.
if [ $# -lt 2 ]
then
    echo "not all required parameters were supplied"
    exit 1
fi

# Create the folder, if needed
mkdir -p "$(dirname $1)"

# Write the text into the file.
echo $2 > $1
