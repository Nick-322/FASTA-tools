#!/bin/bash
#argument assignment
input_file="$1"
output_file="$2"

#assign filename (without extension) to an accession number
accession=$(basename -s .fna $input_file)

#add filename to input file’s header and output the modified file to a new file
sed "s/>/>$accession /g" "$input_file" > "$output_file" 

