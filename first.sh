#!/bin/bash
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 310961312410.dkr.ecr.ap-south-1.amazonaws.com
docker pull 310961312410.dkr.ecr.ap-south-1.amazonaws.com/test:$(echo $CIRCLE_SHA1 | head -c7)
docker images
docker run -itd --name test-container 310961312410.dkr.ecr.ap-south-1.amazonaws.com/test:$(echo $CIRCLE_SHA1 | head -c7)
