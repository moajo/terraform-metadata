#!/usr/bin/env bash

METADATA_PATH=$1
METADATA=`cat ${METADATA_PATH}`

for key in $(echo "$METADATA" | jq -r 'keys[]'); do
    echo "$key=$(echo "$METADATA" | jq -r ".$key")"
done
