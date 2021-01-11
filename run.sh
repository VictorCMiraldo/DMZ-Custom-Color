#! /bin/bash

if [[ -d DMZ-Yellow ]]; then
  echo "The DMZ-Yellow directory already exists, remove it before re-running"
  exit 1
fi

## Copy everything,
cp -r DMZ-White DMZ-Yellow

for file in $(find DMZ-Yellow -name '*.png'); do
  echo "Recolorizing: $file"
  ./recolorize-one.sh $file
done

