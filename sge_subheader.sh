#!/bin/bash 

###################################################################
#Script Name:sge_subheader.sh
#Description:Create submission script for Sun Grid Engine. 
#Last modified: 2023-04-19
#Args:
#	$1 is the name ofthe run"
#	$2 is the memory i.e. 2G
#	$3 is the time i.e. 8:00:00
#	$4 is the query input ie contigs.fa
#Author:Jess Friedersdorff
###################################################################


if [ "$#" -ne 4 ]; then
    echo "Script usage:"
    echo "subheader.sh <Run name> <Max Memory (give units)> <Max Time (use h:m:s)> <Threads (integer)>"
    echo ""
    echo "i.e. subheader.sh my_run 2G 8:00:00 8"
else

    echo "#$ -e $PWD/$1.err"
    echo "#$ -o $PWD/$1.out"
    echo "#$ -N $1"
    echo "#$ -cwd"
    echo "#$ -j y"
    echo "#$ -S /bin/bash"
    echo "#$ -pe multithread $4"
    echo "#$ -m eas"
    echo "#$ -M jess.friedersdorff@ukhsa.gov.uk"
    echo "#$ -V"
    echo "#$ -v MALLOC_ARENA_MAX=1"
    echo "#$ -l h_vmem=$2"
    echo "#$ -l h_rt=$3"
fi 