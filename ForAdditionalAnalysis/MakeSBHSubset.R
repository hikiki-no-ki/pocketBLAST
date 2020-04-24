##########################################
# Project: Make subset table by Single directional Best Hit(SBH)
# Date:2019/12/28
# Author:Yusuke Hiki
##########################################

args <- commandArgs()[ 2:length(commandArgs()) ]

targetdir <- prefix1 <- prefix2 <- NA
usage <- " USAGE: -t targetdir -p prefix1 prefix2 "
for(i_arg in 1:length(args)){
  if(args[i_arg]=="-t"){  # -file option
    if( !is.na(args[i_arg+1]) ){
      targetdir <- args[i_arg+1]
    } else{ stop(usage) }
  }
  if(args[i_arg]=="-p"){  # -prefix option
    if( !any(c(is.na(args[i_arg+1]), is.na(args[i_arg+2]))) ){
      prefix1 <- args[i_arg+1]
      prefix2 <- args[i_arg+2]
    } else{ stop(usage) }
  }
}

# For Error
if( any(c(is.na(targetdir), is.na(prefix1), is.na(prefix2))) ){
  stop(usage)
}

paramset <- c( "pident", "length", "mismatch", "gapopen", "qstart", "qend", "sstart", "send", "evalue", "bitscore" )

# print( "========================================" )
# print( paste("Target directory:", targetdir) )
# print( paste("query name", prefix1) )
# print( paste("reference name", prefix2) )
# print( "========================================" )

complist <- read.table( paste(targetdir, "BLAST_Result.txt", sep="/") )
genes <- unique( complist[,1] )

newlist <- complist[ match( genes, complist[,1] ), ]
colnames(newlist) <- append(c(prefix1, prefix2), paramset)

write.table(newlist, paste( targetdir, "Subset_SBH.txt", sep="/" ), quote=F, sep="\t", row.names=F, col.names=T)
