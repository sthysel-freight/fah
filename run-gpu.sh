#!/usr/bin/env bash

docker run -d \
       --gpus all \
       -e USER=sthysel \
       -e TEAM=248479 \
       -e ENABLE_GPU=true \
       -e ENABLE_SMP=true \
       --restart unless-stopped \
       fah-gpu \
       --allow 0/0 --web-allow 0/0
