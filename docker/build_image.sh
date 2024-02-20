#!/bin/sh
TAG="0.4.0"
PLATFORM="linux/amd64"
docker build . --no-cache --platform ${PLATFORM} -t voip_patrol
docker tag voip_patrol:latest ocpasia/voip_patrol:latest
docker tag voip_patrol:latest ocpasia/voip_patrol:${TAG}
echo "Don't forget to push !"
echo "docker tag voip_patrol:latest  ocpasia/voip_patrol:latest && docker push ocpasia/voip_patrol:latest && docker push ocpasia/voip_patrol:${TAG}"
