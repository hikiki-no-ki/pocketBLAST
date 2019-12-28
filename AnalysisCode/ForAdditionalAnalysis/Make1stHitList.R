args <- commandArgs()[ 2:length(commandArgs()) ]
args <- args[ -grep("-", args) ]
nameset <- c(args[1], args[2])
paramset <- c( "pident", "length", "mismatch", "gapopen", "qstart", "qend", "sstart", "send", "evalue", "bitscore" )

complist <- read.table("../../Result/BLAST_Result.txt")
genes <- unique( complist[,1] )

newlist <- complist[ match( genes, complist[,1] ), ]
colnames(newlist) <- append(nameset, paramset)

write.table(newlist, "../../Result/SubsetBySBH.txt", quote=F, sep="\t", row.names=F, col.names=T)
