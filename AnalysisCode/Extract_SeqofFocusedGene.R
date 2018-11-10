library(seqinr)

gene <- as.matrix( read.table("../targetgene.txt") )
query_db <- read.fasta( list.files("../query", full.names=T)[1], seqtype="AA" )

query <- query_db[ gene ]
write.fasta( sequences=query, names=t(gene), "../query/Sequence_FocusedGene.fasta" )
