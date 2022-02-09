#!/bin/bash

declare -a font=("AnekBangla" "AnekDevanagari" "AnekGujarati" "AnekGurmukhi" "AnekKannada" "AnekLatin" "AnekMalayalam" "AnekOdia" "AnekTamil" "AnekTelugu")

set -e

fontnumber=${#font[@]}

for (( i=0; i<${fontnumber}; i++ ));
do
  gftools builder sources/${font[$i]}/builder.yaml
done
