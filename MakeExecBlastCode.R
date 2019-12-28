##########################################
# Project: Make command for blast+
# Date:2019/12/28
# Author:Yusuke Hiki
##########################################

args <- commandArgs()[ 2:length(commandArgs()) ]
args <- args[ -grep("-", args) ]
mode <- args[1]
queryfile <- args[2]
referencefile <- args[3]
settingfile <- args[4]

shellcode <- paste( mode, "-db", referencefile, "-query", queryfile )

option <- c("-evalue", "-outfmt", "-word_size", "-gapopen", "-gapextend", "-num_alignments")
if(settingfile != "0"){
  setting <- as.matrix( read.delim( settingfile, header=F, skip=1 ) )
  for( i in 1:length(option) ){
    if( strsplit(setting[i,1], " = ")[[1]][2] != "#" ){
      shellcode <- paste( shellcode, option[i], strsplit(setting[i,1], " = ")[[1]][2] )
    }
  }
}else{
  shellcode <- paste( shellcode, option[1], "1e-15", option[2], "6" )
}

write(shellcode, "./blast.sh" )
