#!/usr/bin/env bash

USER=sthysel
TEAM=248479

while getopts ":u:t:" opt
do
  case $opt in
      u) USER="$OPTARG" ;;
      t) TEAM="$OPTARG" ;;
      \?) echo "Invalid option -$OPTARG" >&2 ;;
  esac
done

USER=

IMAGE_NAME=fah-gpu
CONTAINER_NAME=fah-gpu

docker build ./gpu/ -t ${IMAGE_NAME}

docker run -d \
       --name ${CONTAINER_NAME} \
       --gpus all \
       -e USER=${USER} \
       -e TEAM=${TEAM} \
       -e PASSKEY=${FAH_PASSKEY} \
       -e ENABLE_GPU=true \
       -e ENABLE_SMP=true \
       --restart unless-stopped \
       ${IMAGE_NAME} \
       --allow 0/0 --web-allow 0/0
