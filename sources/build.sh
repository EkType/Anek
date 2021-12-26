#!/bin/bash

declare -a font=("AnekDevanagari" "AnekGujarati" "AnekGurmukhi" "AnekKannada" "AnekLatin" "AnekMalayalam" "AnekOdia" "AnekTamil" "AnekTelugu" "AnekBangla")

set -x

fontnumber=${#font[@]}

for (( i=0; i<${fontnumber}; i++ ));
do
  
  cd "${font[$i]}"
  
  fontmake -m ./Masters/"${font[$i]}".designspace -o variable --output-path "${font[$i]}"[wdth,wght].ttf --flatten-components --no-production-names

  gftools fix-dsig --autofix "${font[$i]}"\[wdth\,wght\].ttf  

  gftools gen-stat "${font[$i]}"\[wdth\,wght\].ttf --axis-order wdth wght

  mv "${font[$i]}"\[wdth\,wght\].ttf.fix "${font[$i]}"\[wdth\,wght\].ttf

  gftools fix-nonhinting "${font[$i]}"\[wdth\,wght\].ttf "${font[$i]}"\[wdth\,wght\].ttf.fix

  mv "${font[$i]}"\[wdth\,wght\].ttf.fix "${font[$i]}"\[wdth\,wght\].ttf

  gftools fix-unwanted-tables "${font[$i]}"\[wdth\,wght\].ttf 
  
  rm "${font[$i]}"\[wdth\,wght\]-backup-fonttools-prep-gasp.ttf

# fontbakery check-googlefonts "${font[$i]}"\[wdth\,wght\].ttf -l WARN -m WARN --ghmarkdown "${font[$i]}"_report.md
 
  mv "${font[$i]}"\[wdth\,wght\].ttf ../
  
# mv "${font[$i]}"_report.md ../reports/

  cd ..
done
