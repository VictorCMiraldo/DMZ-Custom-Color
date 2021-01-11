#!/bin/bash

if [[ "$#" -ne "1" ]]; then
  echo "Gimme an image!"
  exit 1
fi

file=$1

# The target color you want in HSL representation
h=37
s=76
l=60

# Don't change steps and thresh; I've experimented around and found these to be
# optimal.

# Define the number of steps we want to go through
steps=20

# And the threshold for color matching
thresh="2%"

# Define the interval of colors to substitute from. Anything darker
# than hsl(0, 0%, ${gray_l}%) will be left untouched.
white_l=100
gray_l=20

for i in $(seq 0 "$steps"); do
  src_l=$(echo "scale=2; $white_l - $i * ($white_l - $gray_l)/$steps" | bc)
  dst_l=$(echo "scale=2; $l - $i * $l/$steps" | bc)

  mogrify -fuzz "$thresh" -fill "hsl($h, ${s}%, ${dst_l}%)" -opaque "hsl(0, 0%, ${src_l}%)" $file
done

