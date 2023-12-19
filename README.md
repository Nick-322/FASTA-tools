This repository contains 


"change_headers.sh:" In bioinformatics, we often need to analyze large size/numbers of FASTA files at once. In such cases, it is very helpful to have a tool that can modify sequence headers to contain additional information (ex. the name of samples associated with the sequences. change_headers.sh is a Bash script that does this task.

change_headers.sh adds the accession number to the beginning of each header line in the file and outputs the modified FASTA sequence to a new file in a valid FASTA format. 

Synopsis:  "./change_headers.sh <input file> <output file>"


