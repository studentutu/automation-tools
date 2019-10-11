docker_build() {
  docker build . --file Dockerfile --build-arg UNITY_PLATFORM=${UNITY_PLATFORM} --build-arg UNITY_VERSION=${UNITY_VERSION} --tag docker.pkg.github.com/red-owl-games/unity-docker/linux:$UNITY_VERSION_FULL
}

docker_publish() {
  echo $GITHUB_TOKEN | docker login docker.pkg.github.com --username red-owl-games --password-stdin
  docker push docker.pkg.github.com/red-owl-games/unity-docker/unity:$UNITY_VERSION_FULL
}