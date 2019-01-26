## Execute BLAST+
echo makeblastdb......
Rscript --vanilla --slave ./MakeExecMakeBlastDBCode.R
zsh ./tmp_makeblastdb.sh
echo OK.
Rscript --vanilla --slave ./MakeExecBlastCode.R
echo Make Query......
Rscript --vanilla --slave ./Extract_SeqofFocusedGene.R
echo OK.
mkdir ../Result
echo blast.......
zsh ./blast.sh > ../Result/BLAST_Result.txt
echo OK.
rm ./tmp_makeblastdb.sh
echo Completed.