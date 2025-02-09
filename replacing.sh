#!/bin/bash

# Input file path
input_file="yourfile.txt"

# Process the file
awk 'NR >= 5 { 
    if ($0 ~ /welcome/) {
        gsub(/\bgive\b/, "learning"); 
    }
}1' "$input_file" > temp.txt && mv temp.txt "$input_file"

echo "Replaced 'give' with 'learning' in lines containing 'welcome' from the 5th line onward."
