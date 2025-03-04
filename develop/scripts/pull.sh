#!/bin/bash

for repo in $(ls sources); do
  if [ ! -d "sources/$repo" ]; then
    continue
  fi

  cd "sources/$repo"
  STATUS=`git status -s`
  echo "============= $repo =========="
  if [ -z "$STATUS" ]; then
    git pull
  else
    echo "$STATUS"
  fi

  cd ../../
done
