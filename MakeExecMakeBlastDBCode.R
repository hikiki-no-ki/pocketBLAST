##########################################
# Project: Make command for makeblastdb
# Date:2019/12/28
# Author:Yusuke Hiki
##########################################

args <- commandArgs()[ 2:length(commandArgs()) ]
args <- args[ substring(args, 1, 1)!="-" ]
mode <- args[1]
reference <- args[2]
scriptpath <- args[3]

if(mode == "blastp"){
  Shellcode <- paste("makeblastdb -in ", reference, " -dbtype prot -hash_index > ", scriptpath, "/makeblast_log.txt", sep="")
} else if(mode == "blastn"){
  Shellcode <- paste("makeblastdb -in ", reference, " -dbtype nucl -hash_index > ", scriptpath, "/makeblast_log.txt", sep="")
} else{
  print("Error@MakeExecMakeBlastDBCode: mode after '-m' must be blastn or blastp.")
  exit()
}

write(Shellcode, paste(scriptpath, "/makeblastdb.sh", sep="") )
