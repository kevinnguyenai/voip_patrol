#!/bin/sh
TAG="0.4.0"
PLATFORM="linux/arm64"
docker build -f Dockerfile.arm . --no-cache --platform ${PLATFORM} -t voip_patrol
docker tag voip_patrol_arm:latest ocpasia/voip_patrol_arm:latest
docker tag voip_patrol_arm:latest ocpasia/voip_patrol_arm:${TAG}
echo "Don't forget to push !"
echo "docker tag voip_patrol_arm:latest  ocpasia/voip_patrol_arm:latest && docker push ocpasia/voip_patrol_arm:latest && docker push ocpasia/voip_patrol_arm:${TAG}"
