#!/bin/bash

declare -A TAGS_MAP
TAGS_MAP=( ["master"]="master")

BRANCH=$(echo ${GITHUB_REF} | sed -e "s/refs\/heads\///g")
TAG=${TAGS_MAP[$BRANCH]}

# if contains /refs/tags/
if [ $(echo ${GITHUB_REF} | sed -e "s/refs\/tags\///g") != ${GITHUB_REF} ]; then
  TAG="latest"
fi;

echo "branch=${BRANCH}" >> ${GITHUB_OUTPUT}
echo "tag=${TAG}" >> ${GITHUB_OUTPUT}
