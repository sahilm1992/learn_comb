#!/bin/bash
#Usage: ./flow.sh <graph> <seeds> <data-set-name> 12
execfilecelf="../Executables/celf"
pathtograph="../Dataset/hepph/graph_lt.inf"
model="LT"
outputcelf="../Results/freshRuns/algorithmOutput/fig14c/celf"
mkdir -p ../Results/freshRuns/algorithmOutput/fig14c
mkdir -p $outputcelf
numiter=10000
execFlow="../Executables/ltFlow"
for mc in 1000 2500 5000 7500 10000
#for mc in 1 #to test use this line instead of above for quick result check
do
	echo "running celf" 
	$execfilecelf -propModel $model -mcruns $mc -budget 200 -celfPlus 0 -probGraphFile $pathtograph -outdir $outputcelf
	echo $execFlow $pathtograph $outputcelf"/seeds_CELF_LT_"$mc".txt" 200 1 $numiter 3 $outputcelf"/flowst_"$mc".txt" $outputcelf"/spread.txt"
	$execFlow $pathtograph $outputcelf"/seeds_CELF_LT_"$mc".txt" 200 1 $numiter 3 $outputcelf"/flowst_"$mc".txt" $outputcelf"/spread.txt"
done
mkdir -p ../Results/freshRuns/processed/fig14c
python ../Codes/process5.py celf $outputcelf"/flowst_" ../Results/freshRuns/processed/fig14c/output.txt