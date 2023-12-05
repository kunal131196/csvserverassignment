#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <start_index> <end_index>"
    exit 1
fi

start_index=$1
end_index=$2

if [ "$start_index" -gt "$end_index" ]; then
    echo "Error: Start index must be less than or equal to end index."
    exit 1
fi

for i in $(seq "$start_index" "$end_index"); do
    echo "$i, $((RANDOM % 100))" >> inputFile
done

echo "CSV file 'inputFile' generated with entries from $start_index to $end_index."
