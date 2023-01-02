#!/bin/bash

set -x

USER='andylytical'
IMAGE='flasktut'
TAG=$( date '+%Y%m%dT%H%M%S' )


get_images_matching_name() {
  docker images \
  | awk "/${IMAGE}/ {print \$3}"
}


delete_images_matching_name() {
  # DELETE ALL IMAGES MATCHING NAME
  get_images_matching_name \
  | sort -u \
  | xargs -r docker rmi -f
}


build() {
  delete_images_matching_name
  # BUILD IMAGE
  docker build . -t $IMAGE:$TAG
  #docker tag $IMAGE:$TAG $USER/$IMAGE:$TAG
  #docker push $USER/$IMAGE:$TAG
}


run() {
  # RUN IMAGE
  iname=$(get_images_matching_name | head -1)
  docker run -it --rm \
  --mount type=bind,src=$HOME,dst=/home \
  --mount type=bind,src=$(pwd),dst=/work \
  -p 8000:8000 \
  $iname
}


if [[ $# -gt 0 ]] ; then
  action="$1"
fi
case "$action" in
  show|ls)
    echo "IMAGES"
    get_images_matching_name
    echo "CONTAINERS"
    docker ps -a
    ;;
  build|rebuild)
    build
    ;;
  run)
    run
    ;;
  delete|rm|clean)
    delete_images_matching_name
    ;;
  *)
    build
    run
    ;;
esac
