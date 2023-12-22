# Bash tools for editing and extracting data from fna/faa files
This repository contains 

## tools I have in this repository
### change_headers.sh:
In bioinformatics, we often need to analyze large size/numbers of FASTA files at once. In such cases, it is very helpful to have a tool that can modify sequence headers to contain additional information (ex. the name of samples associated with the sequences. change_headers.sh is a Bash script that does this task.

change_headers.sh adds the accession number to the beginning of each header line in the file and outputs the modified FASTA sequence to a new file in a valid FASTA format. 

Synopsis:  
    
    ./change_headers.sh <input_file> <output_file>



### find_perfect_matches.sh
This Bash script does the following tasks:
1. Runs a BLAST of a query file against a subject file
2. Writes only perfect matches to an output file
3. Prints the number of perfect matches to stdout.

Synopsis: 

    ./find_perfect_matches.sh <query_file> <subject_file> <output_file> 



### find_homologs.sh
In FASTA files, it is a not common task to search for perfect hits in assemblies. A strength of BLAST is the speed with
which it can identify approximate matches. Most of the time, we may wish to identify approximate matches is when searching for homologous genes in different organisms. 

find_homologs.sh script does the following tasks:
1. Given a protein sequence query, perform a blast search against a nucleotide subject.
2. Filter hits to keep only hits with >30% sequence identity and >90% match length (= 90% of the query sequence length).
3. Output matches to a file with an assigned name.
4. Print the number of matches identified to stdout.

Synopsis: 
    
    ./find_homologs.sh <query_file> <subject_file> <output_file>


### homolog_identify.sh
Protein domains are often found as a combination of a variety of other domains. Histidine kinases are a good example that you can see their domains are found 
in combination with different domains. Because of the presence of the HK domains, we can still infer the function of HK genes even without knowing what the other domains do.
If you are interested in bacterial environmental responses, you may want to identify HK domain-containing proteins as likely candidates of how the organism senses the environmental signal of interest. You could subsequently perform gene deletions for each of the HK-domain genes and examine the phenotype of each mutant to check if one of the genes is important.

In a study like the one described above, the process of finding sequence matches to a query of interest in a sequence database is an important primary step to address such
a gene analysis.

./homolog_identify.sh is an extension of find_homologs.sh script that performs the following: 

1. Identify putative homologous domains (= homologs) of query amino acid sequences in FASTA format (This is the same as what find_homologs.sh does).
2. Use loops & conditional statements to identify which genes in a BED file contain the identified homologs.
3. Write an output file containing the unique gene names (from a given BED file) which your script identified as containing predicted domains.

Synopsis:

    ./homolog_identify.sh <query.faa> <subject.fna> <BED_file> <output_file>

