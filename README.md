# FASTA tools for editing and extracting data from fna/faa files you want
This repository contains 

## tools I have in this repository
### change_headers.sh:
In bioinformatics, we often need to analyze large size/numbers of FASTA files at once. In such cases, it is very helpful to have a tool that can modify sequence headers to contain additional information (ex. the name of samples associated with the sequences. change_headers.sh is a Bash script that does this task.

change_headers.sh adds the accession number to the beginning of each header line in the file and outputs the modified FASTA sequence to a new file in a valid FASTA format. 

Synopsis:  "./change_headers.sh <input_file> <output_file>"



### find_perfect_matches.sh
This Bash script does the following tasks:
1. Runs a BLAST of a query file against a subject file
2. Writes only perfect matches to an output file
3. Prints the number of perfect matches to stdout.

Synopsis: "./find_perfect_matches.sh <query_file> <subject_file> <output_file>" 



### find_homologs.sh
In FASTA files, it is a not common task to search for perfect hits in assemblies. A strength of BLAST is the speed with
which it can identify approximate matches. Most of the time, we may wish to identify approximate matches is when searching for homologous genes in different organisms. 

find_homologs.sh script does the following tasks:
1. Given a protein sequence query, perform a blast search against a nucleotide subject
2. Filter hits to keep only hits with >30% sequence identity and >90% match length (= 90% of the query sequence length)
3. Output matches to a file with an assigned name
4. Print the number of matches identified to stdout

Synopsis: ./find_homologs.sh <query_file> <subject_file> <output_file>

