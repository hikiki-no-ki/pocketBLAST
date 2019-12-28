==========================
BLAST+ Development toolkit
==========================

# OVERVIEW
This project contains the programs to execute easily blast+ at CUI from input data including query sequences, 
reference sequences, target gene names, setting file, and output directory path.
First, the database is made from reference sequences as pretreatment.
Second, target genes are extracted from query sequences and make the file Sequence_FocusedGene.fasta.
Finally, blastn or blastp is executed with the parameters written in ./setting.txt or default.

# DEPENDENCY
  * zsh
  * blast+
  * R

# EXECUTION
< Input data format >
1. Reference sequences(fasta format) [MUST]
Specify the reference sequence file path (in many cases, all nucleotide or amino acid sequences).
The file name may be arbitrary but the format must be fasta.
Set command line in the form of -r [reference file path].

2. Query sequences(fasta format) [MUST]
Specify the query sequence file path including target nucleotide or amino acid sequences.
The file name may be arbitrary but the format must be fasta.
Set command line in the form of -q [query file path].

3. Target gene names "TargetGene.txt" (txt format) [OPTIONAL]
List up the target gene names in ./TargetGene.txt or a specified file.
The nucleotide or amino acid sequences of genes listed up in this file will be extracted to
[output directory path]/Sequence_FocusedGene.fasta.
Set command line in the form of -t [target gene file path].

4. Setting file "Setting.txt" (txt format) [OPTIONAL]
Fill the optional setting of blast+ in ./Setting.txt.
( The detail of options is available at: https://www.ncbi.nlm.nih.gov/books/NBK279684/ )
Set command line in the form of -s ./Setting.txt.

5. Output directory path [OPTIONAL]
Specify the output directory path to put the target sequence file "Sequence_FocusedGene.fasta"
and result file "BLAST_Result.txt".
If no specification, current directory ./ is set as default.
Set command line in the form of -o [output directory path].

< Execution >

<< Main Analysis >>
```zsh
% ./execBLAST -q [query file] -r [reference file] -t [target gene file] -s [setting file] -o [output directory path]
```

<< Additional Analysis >>
1. Making Single directional Best hit(SBH) list ( "Subset_SBH.txt" is outputed )
```zsh
% cd ./ForAdditionalAnalysis
% Rscript ./Make1stHitList.R [result file directory path] [query name] [reference name]
```

Have fun!!