library(seqinr)

gene <- as.matrix( read.table("../Input/Targetgene.txt") )
query_db <- read.fasta( list.files("../Input/Query", full.names=T)[1], seqtype="AA" )

query <- query_db[ gene ]
write.fasta( sequences=query, names=t(gene), "../Input/Query/Sequence_FocusedGene.fasta" )
