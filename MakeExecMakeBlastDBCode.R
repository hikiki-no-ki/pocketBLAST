##########################################
# Project: Make command for makeblastdb
# Date:2019/12/28
# Author:Yusuke Hiki
##########################################

args <- commandArgs()[ 2:length(commandArgs()) ]
args <- args[ -grep("-", args) ]
mode <- args[1]
reference <- args[2]

if(mode == "blastp"){
  Shellcode <- paste("makeblastdb -in", reference, "-dbtype prot -hash_index > ./makeblast_log.txt")
} else if(mode == "blastn"){
  Shellcode <- paste("makeblastdb -in", reference, "-dbtype nucl -hash_index > ./makeblast_log.txt")
} else{
  print("Error@MakeExecMakeBlastDBCode: mode after '-m' must be blastn or blastp.")
  exit()
}

write(Shellcode, "./tmp_makeblastdb.sh" )
