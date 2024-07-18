##########################################
# Project: Extract sequence of focused genes
# Date:2019/12/28
# Author:Yusuke Hiki
##########################################

readRenviron("~/.Rprofile")     
newpath <- gsub(pattern=")",replacement="", x=Sys.getenv(".libPaths(new"))
.libPaths( new=newpath )

library(seqinr)

## Function to add directory
addir <- function(outputdir){
  if( !file.exists(outputdir) ){
    dir.create(outputdir, recursive=T)
    print( paste("Generated:", outputdir) )
  }
}

args <- commandArgs()[ 2:length(commandArgs()) ]
args <- args[ substring(args, 1, 1)!="-" ]
queryfile <- args[1]
targetgenefile <- args[2]
outputdir <- args[3]

query_db <- read.fasta( queryfile, seqtype="AA" )
if(targetgenefile != "0"){
  gene <- as.matrix( read.table(targetgenefile) )
}else{
  gene <- names(query_db)
}

query <- query_db[ gene ]
addir( outputdir )
write.fasta( sequences=query, names=t(gene), paste(outputdir, "SequenceofFocusedGene.fasta", sep="/") )
