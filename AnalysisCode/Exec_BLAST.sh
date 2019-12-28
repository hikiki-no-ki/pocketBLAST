## Execute BLAST+
REF=`\ls ../Input/Reference/`
echo Make BLAST DataBase......
Rscript --vanilla --slave ./MakeExecMakeBlastDBCode.R
zsh ./tmp_makeblastdb.sh
echo OK.
Rscript --vanilla --slave ./MakeExecBlastCode.R
echo Make Query......
Rscript --vanilla --slave ./Extract_SeqofFocusedGene.R
echo OK.
mkdir ../Result
echo BLAST.......
zsh ./blast.sh > ../Result/BLAST_Result.txt
echo OK.
rm ./tmp_makeblastdb.sh
rm ../Input/Reference/${REF}.???
echo Completed.
