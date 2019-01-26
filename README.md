==========================
BLAST+ Development toolkit
==========================

# OVERVIEW
This project contains the programs to execute easily blast+ at CUI from input data including query sequences, 
target gene names, reference sequences, and setting file. First, the database is made from reference sequences 
as pretreatment. Second, target genes are extracted from query sequences and ./query/Sequence_FocusedGene.fasta.
Finally, blastn or blastp is executed with the parameters written in ./setting.txt.

# DEPENDENCY

  * zsh
  * blast+
  * R

# EXECUTE
< Pretreatment: Preparation of input data >
1. Reference sequences(fasta format)
Put the reference sequences (in many cases, all nucleotide or amino acid sequences) in ./Input/Reference/.
The file name may be arbitrary but the format must be fasta.

2. Query sequences(fasta format)
Put the query sequences including target nucleotide or amino acid sequences in ./Input/Query/.
The file name may be arbitrary but the format must be fasta.

3. Target gene names "TargetGene.txt" (txt format)
List up the target gene names in ./Input/TargetGene.txt.
The nucleotide or amino acid sequences of genes listed up in this file will be extracted in 
./Input/Query/Sequence_FocusedGene.fasta.

4. Setting file "Setting.txt" (txt format)
Fill in the option of blast+ in ./Input/Setting.txt.
( The detail of options is available at: https://www.ncbi.nlm.nih.gov/books/NBK279684/ )

< Execution >
------ Main Analysis ------
% cd ./AnalysisCode
zsh ./Exec_BLAST.sh

------ Additional Analysis ------
1. Making 1st hit list
% cd ./AnalysisCode/ForAdditionalAnalysis
% Rscript --vanilla --slave ./Make1stHitList.R

Have fun!!