#!/bin/bash

set -e +x

pushd movie-fun-source
  echo "Packaging WAR"
  ./mvnw clean package -DskipTests
popd

war_count=`find movie-fun-source/target -type f -name *.war | wc -l`

if [ $war_count -gt 1 ]; then
  echo "More than one jar found, don't know which one to deploy. Exiting"
  exit 1
fi

echo “is war file present for cp process?”
find movie-fun-source/target -type f -name *.war > ./temp.txt
cat ./temp.txt

find movie-fun-source/target -type f -name *.war -exec cp "{}" package-output/moviefun.war \;

echo “is war file present after cp process?”
find movie-fun-source/target -type f -name package-output/moviefun.war > ./temp2.txt
cat ./temp2.txt

echo "Done packaging"
exit 0
