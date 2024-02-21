#!/bin/env bash

tag=${1-latest}
basepath="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

command dgoss &> /dev/null
dgoss_found=$?
if [ $dgoss_found -eq 127 ]; then
  echo "dgoss not found"
  exit 127
fi

image=pgschk/alpine-toolkit:${tag}
image_extended=pgschk/alpine-toolkit:${tag}-extended

cd ${basepath}/dgoss
echo "Testing ${image}"
dgoss run -it pgschk/alpine-toolkit:${tag}
cd ${basepath}/dgoss-extended
echo "Testing ${image_extended}"
dgoss run -it pgschk/alpine-toolkit:${tag}-extended
