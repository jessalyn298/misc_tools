#!/bin/bash

###################################################################
#Script Name:oneline.sh
#Description:make a fasta file one line per sequence. 
#Last modified: 2023-04-19
#Args: 
#	$1 = input file Name
#	$2 = output file name
#Author:Jess Friedersdorff
###################################################################

if [ "$#" -ne 2 ]; then
     echo "oneline.sh - a generic script to change a multilined FASTA file to a one lined FASTA file."
     echo "Please make sure there are no %s in the file to be changed."
     echo ""
     echo "To use:"
     echo "oneline.sh <filename> <outputfilename>"
else

    cat <"$1" | sed 's/^>/\%>/g' | sed '/>/s/$/\t/g' | tr -d '\n' | tr '\%' '\n' | sed '1d' > $2
fi 