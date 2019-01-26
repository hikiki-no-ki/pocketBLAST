setting <- as.matrix( read.delim( "../Input/Setting.txt", header=F, skip=1 ) )
query <- "../Input/Query/Sequence_FocusedGene.fasta"
reference <- list.files( "../Input/Reference", full.names=T )[1]

if( strsplit(setting[1,1], " = ")[[1]][2] != "blastn" && strsplit(setting[1,1], " = ")[[1]][2] != "blastp" ){
  print("Error@setting.txt: mode must be blastn or blastp.")
  exit()
}

option <- c("-evalue", "-outfmt", "-word_size", "-gapopen", "-gapextend", "-num_alignments")

shellcode <- paste( strsplit(setting[1,1], " = ")[[1]][2], "-db", reference, "-query", query )

for( i in 1:length(option) ){
  if( strsplit(setting[i+1,1], " = ")[[1]][2] != "#" ){
    shellcode <- paste( shellcode, option[i], strsplit(setting[i+1,1], " = ")[[1]][2] )
  }
}

write(shellcode, "./blast.sh" )
