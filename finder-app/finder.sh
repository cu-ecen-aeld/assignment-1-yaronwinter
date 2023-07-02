#!/bin/bash

# Function to count files in a directory recursively
count_files() {
    local directory=$1
    local count=0

    # Loop through each item in the directory
    for item in "$directory"/*; do
        if [[ -f "$item" ]]; then
            # Increment count if the item is a file
            ((count++))
        elif [[ -d "$item" ]]; then
            # Recursively call the function if the item is a directory
            count=$(($count + $(count_files "$item")))
        fi
    done

    echo "$count"
}

# Check if all parameters are provided.
if [ $# -lt 2 ]
then
    echo "not all required parameters were supplied"
    exit 1
fi

# Check if the directory exists
if [ ! -d $1 ]
then
    echo "The specified directory does not exist."
    exit 1
fi

# Call the count_files function and display the result
file_count=$(count_files $1)

lines_count=`grep -r $2 $1 | wc -l`
echo "The number of files are $file_count and the number of matching lines are $lines_count"
