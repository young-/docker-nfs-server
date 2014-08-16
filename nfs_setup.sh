#!/bin/bash

set -e

mounts="${@}"

if [[ -z $PARAMS ]]; then
  PARAMS="*(rw,sync,no_root_squash,no_subtree_check,insecure)"
fi

# Specify mounts via --env-file using a list of EXPORT variables
# EXPORT1="/export 10.0.0.1(ro,sync,no_subtree_check,insecure)"
# EXPORT2="/path/to/volume 10.0.0.2(rw,sync,no_subtree_check,insecure)"
for v in EXPORT{1..100}; do 
  echo "${!v}" >> /etc/exports
done

for mnt in "${mounts[@]}"; do
  src=$(echo $mnt | awk -F':' '{ print $1 }')
  echo "$src $PARAMS" >> /etc/exports
  echo "Added: $src $PARAMS"
done



exec runsvdir /etc/sv
