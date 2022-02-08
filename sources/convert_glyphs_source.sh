#!/bin/bash

declare -a font=("AnekBangla" "AnekGujarati" "AnekGurmukhi" "AnekLatin" "AnekOdia" "AnekTamil" "AnekTelugu" )

set -e

fontnumber=${#font[@]}

for (( i=0; i<${fontnumber}; i++ ));
do
  fontmake -g sources/${font[$i]}/GlyphsFile/${font[$i]}.glyphs -o ufo
  cp -Rf master_ufo/* sources/${font[$i]}/Masters
  rm -r master_ufo
done
