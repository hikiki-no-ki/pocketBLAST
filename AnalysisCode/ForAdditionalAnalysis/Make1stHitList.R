complist <- read.table("../../Result/BLAST_Result.txt")
genes <- unique( complist[,1] )

newlist <- c()
for( i in genes){
  for(j in 1:nrow(complist)){
    if(complist[j,1] == i){
      newlist <- rbind(newlist, complist[j,])
      break()
    }
  }
}

write.table(newlist, "../../Result/SubsetList.txt", quote=F, sep="\t", row.names=F, col.names=F)
