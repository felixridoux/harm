#!/bin/bash

#Command line arguments
#$1 is the csv file ./deepApproxResults.csv
#$2 is the file csIDS.txt inside the "info" folder of each benchmark
#$3 is the row number (header not included, 0 is the first non-header entry) of the csv file containing the cluster be used for the approximation
#Warning: this script must be run from the root of a benchmark folder such as ffnn

#check if $3 is not defined and set row to 1
if [ -z "$3" ]; then
    row=0
else
    row=$3
fi

approximation=$(python3 $BENCHMARK_ROOT/support/daToDea.py --csv $1 --txt $2 --row $row)

##check program return value
if [ $? -ne 0 ]; then
    echo $approximation
    exit 1
fi

echo $approximation
bash scripts/simulateCS.sh "$approximation" "traces/" 1 0



