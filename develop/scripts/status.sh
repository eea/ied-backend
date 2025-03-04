#!/bin/bash

for repo in $(ls sources); do
  if [ ! -d "sources/$repo" ]; then
    continue
  fi

  cd "sources/$repo"
  STATUS=`git status -s`
  if [ ! -z "$STATUS" ]; then
    echo "$repo"
    echo "$STATUS"
  fi

  cd ../../
done
