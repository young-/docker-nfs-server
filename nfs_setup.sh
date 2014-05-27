#!/bin/bash

set -e

mounts="${@}"

if [[ -z $PARAMS ]]; then
        PARAMS="*(rw,sync,no_subtree_check,fsid=0,no_root_squash)"
fi

for mnt in "${mounts[@]}"; do
  src=$(echo $mnt | awk -F':' '{ print $1 }')
  echo "$src $PARAMS" >> /etc/exports
done

exec runsvdir /etc/sv
