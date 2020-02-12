##########################################
# Project: Extract result of Bidirectional Best Hit(BBH)
# Date: 2020/02/12
# Author:Yusuke Hiki
##########################################

args <- commandArgs()[ 2:length(commandArgs()) ]

# Input information
file1 <- file2 <- prefix1 <- prefix2 <- out_file <- NA
usage <- " USAGE: -f file1 file2 -p prefix1 prefix2 -o output_file_name "
for(i_arg in 1:length(args)){
  if(args[i_arg]=="-f"){  # -file option
    if( !any(c(is.na(args[i_arg+1]), is.na(args[i_arg+2]))) ){
      file1 <- args[i_arg+1]
      file2 <- args[i_arg+2]
    } else{ print(usage); stop(usage) }
  }
  if(args[i_arg]=="-p"){  # -prefix option
    if( !any(c(is.na(args[i_arg+1]), is.na(args[i_arg+2]))) ){
      prefix1 <- args[i_arg+1]
      prefix2 <- args[i_arg+2]
    } else{ print(usage); stop(usage) }
  }
  if(args[i_arg]=="-o"){  # -output_file option
    if( !is.na(args[i_arg+1]) ){
      out_file <- args[i_arg+1]
    } else{ print(usage); stop(usage) }
  }
}

# For Error
if( any(c(is.na(file1), is.na(file2), is.na(prefix1), is.na(prefix2), is.na(out_file))) ){
  stop(usage)
}

f1Tof2 <- read.table(file1, header=T)
f2Tof1 <- read.table(file2, header=T)

forward <- paste(f1Tof2[,1], f1Tof2[,2], sep="======")
backward <- paste(f2Tof1[,2], f2Tof1[,1], sep="======")

BBH <- intersect(forward, backward)
BBH_pairs <- t(matrix(unlist( strsplit(x=BBH, "======") ), nrow=2))
colnames(BBH_pairs) <- c(prefix1, prefix2)

write.table(BBH_pairs, out_file, sep="\t", quote=F, row.names=F)
print( paste("Exported:", out_file) )

print(" --- Make Bi-directional Best Hit subset Completed. --- ")
