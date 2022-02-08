#!/bin/bash

declare -a font=("AnekDevanagari" "AnekGujarati" "AnekGurmukhi" "AnekKannada" "AnekLatin" "AnekMalayalam" "AnekOdia" "AnekTamil" "AnekTelugu" "AnekBangla")

set -e

fontnumber=${#font[@]}

for (( i=0; i<${fontnumber}; i++ ));
do
  gftools builder sources/${font[$i]}/builder.yaml
  python3 sources/fix_stat.py fonts/${font[$i]}/variable/${font[$i]}[wdth,wght].ttf
done
