#!/bin/bash

#file assignment
query="$1"
subject="$2"
bedfile="$3"
outfile="$4"

#perform BLAST with task and output format 6 with std + qlen (13 culumns) -> copy only homologs to output
tblastn -query $query -subject $subject -task tblastn -outfmt "6 std qlen" | awk '$3 > 30 && $4 > $13*0.9' | awk '{print $9, $10}' > homolog_coordinates

> output
while read homolog_start homolog_end
do
    while read chr bed_start bed_stop bed_gn dot sign
    do
        #Find sequence features that contain start/end positions of homolog file
        if [[ $homolog_start -gt $bed_start ]] && [[ $homolog_end -le $bed_stop ]]
        then
            #Output gene names of the matched squence features
            echo $bed_gn >> output
        fi
    done < $bedfile
done < homolog_coordinates

#sort the file and output only unique gene name values to the output file
sort output | uniq > $outfile

#remove the temporary file
rm output
rm homolog_coordinates

# Print the number of matches to stdout
echo "Number of homolog matches in $bedfile: "$(wc -l < $outfile)""
