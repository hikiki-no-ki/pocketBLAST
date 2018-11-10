setting <- as.matrix( read.delim( "../setting.txt", header=F, skip=1 ) )
reference <- list.files( "../reference", full.names=T )[1]

mode <- substring( setting[1,1], 8)
if( mode != "blastn" && mode != "blastp" ){
  print("Error@setting.txt: mode must be blastn or blastp.")
  exit()
} else if(mode == "blastp"){
  Shellcode <- paste("makeblastdb -in", reference, "-dbtype prot -hash_index > ./makeblast_log.txt")
} else if(mode == "blastn"){
  Shellcode <- paste("makeblastdb -in", reference, "-dbtype nucl -hash_index > ./makeblast_log.txt")
}

write(Shellcode, "./tmp_makeblastdb.sh" )
