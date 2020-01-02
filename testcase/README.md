# Testcase result check

## Execution
```zsh
% cd ../
% ./execBLAST -m blastn -q ./testcase/test_query.fasta -r ./testcase/test_reference.fasta -o ./testcase
```

## Output files
<< SequenceofFocusedGene.fasta >>
>test_query1
ACAGTAAGTCGGCAGCTGAGTACGATGGGATGGTATC
>test_query2
ATGACAAGCTGGCATGCATACCAGTGCCGAGGTGGCGAGTTT
>test_query3
GTTGGACATGGATAGCCATAGGAAGGCTGCAGT

<< Blast_Result.txt >>
test_query1	test_reference1	100.000	37	0	0	1	37	2	38	6.21e-18	69.4
test_query2	test_reference3	97.619	42	1	0	1	42	1	42	5.25e-19	73.1
test_query3	test_reference5	100.000	33	0	0	1	33	5	37	9.04e-16	62.1

# HAVE FUN!!!
