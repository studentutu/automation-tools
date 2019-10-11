#! /bin/bash

. ./scripts/unity.sh

install() {
  if (( $# != 2 ))
  then
    echo "Usage: install <platform> <url>"
    exit 1
  fi
  if [ "$1" == "linux" ]
  then
    echo "[RedOwl] Downloading... $2"
    curl -so "DownloadedPackage.tar.xz" "$2"
    mkdir -p  "/opt/Unity"
    tar -C "/opt/Unity" -xf "DownloadedPackage.tar.xz"
    rm "DownloadedPackage.tar.xz"
  elif [ "$1" == "darwin" ]
  then
    echo "[RedOwl] Downloading... $2"
    curl -so "DownloadedPackage.pkg" "$2"
    sudo installer -dumplog -package "DownloadedPackage.pkg" -target /
    rm "DownloadedPackage.pkg"
  fi
}

install_unity() {
  echo "[RedOwl] Installing ${UNITY_VERSION_FULL} for ${UNITY_PLATFORM}."
  install $UNITY_PLATFORM $(echo $UNITY_VERSION_JSON | jq -r '.downloadUrl')
  for module in $UNITY_MODULES; do
      echo "[RedOwl] Installing Unity Module ${module}."
      install $UNITY_PLATFORM $(echo $UNITY_VERSION_JSON | jq -r --arg MODULE "$module" '.modules[] | select( .id == $MODULE) | .downloadUrl')
  done
}
