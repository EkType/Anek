#!/bin/bash

declare -a font=("AnekDevanagari" "AnekGujarati" "AnekGurmukhi" "AnekKannada" "AnekLatin" "AnekMalayalam" "AnekOdia" "AnekTamil" "AnekTelugu" "AnekBangla")

set -e

fontnumber=${#font[@]}

for (( i=0; i<${fontnumber}; i++ ));
do
  gftools builder sources/${font[$i]}/builder.yaml
done
