#! /bin/bash

if [[ "$#" -ne "4" ]]; then
  echo "usage: run <name> h s l"
  exit 1
fi

tgt=$1
h=$2
s=$3
l=$4

if [[ -d "$tgt" ]]; then
  echo "The $tgt directory already exists, remove it before re-running"
  exit 1
fi

## Copy everything,
cp -r DMZ-White $tgt

for file in $(find $tgt -name '*.png'); do
  echo "Recolorizing: $file"
  ./recolorize-one.sh $file $h $s $l
done

