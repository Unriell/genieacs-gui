
#!/bin/bash 

source build/build.env.sh
$DOCKER login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD" 
$DOCKER tag $DOCKER_IMAGE $DOCKER_IMAGE
echo $DOCKER push $DOCKER_IMAGE
$DOCKER push $DOCKER_IMAGE

