##########################################
# Project: Make subset table by Single directional Best Hit(SBH)
# Date:2019/12/28
# Author:Yusuke Hiki
##########################################

args <- commandArgs()[ 2:length(commandArgs()) ]
args <- args[ substring(args, 1, 1)!="-" ]
targetdir <- args[1]
nameset <- c(args[2], args[3])
paramset <- c( "pident", "length", "mismatch", "gapopen", "qstart", "qend", "sstart", "send", "evalue", "bitscore" )

print( "========================================" )
print( paste("Target directory:", targetdir) )
print( paste("query name", nameset[1]) )
print( paste("reference name", nameset[2]) )
print( "========================================" )

complist <- read.table( paste(targetdir, "BLAST_Result.txt", sep="/") )
genes <- unique( complist[,1] )

newlist <- complist[ match( genes, complist[,1] ), ]
colnames(newlist) <- append(nameset, paramset)

write.table(newlist, paste( targetdir, "Subset_SBH.txt", sep="/" ), quote=F, sep="\t", row.names=F, col.names=T)
