install() {
  if (( $# != 2 ))
  then
    echo "Usage: install <platform> <url>"
    exit 1
  fi
  if [ "$1" == "linux" ]
  then
    curl -so "DownloadedPackage.tar.xz" "$2"
    mkdir -p  "/opt/Unity"
    tar -C "/opt/Unity" -xf "DownloadedPackage.tar.xz"
    rm "DownloadedPackage.tar.xz"
  elif [ "$1" == "darwin" ]
  then
    curl -so "DownloadedPackage.pkg" "$2"
    sudo installer -dumplog -package "DownloadedPackage.pkg" -target /
    rm "DownloadedPackage.pkg"
  fi
}

install_unity() {
  install $UNITY_PLATFORM $(echo $UNITY_VERSION_JSON | jq -r '.downloadUrl')
  if (( $# > 0 ))
  then
    for module in $@; do
        install $UNITY_PLATFORM $(echo $UNITY_VERSION_JSON | jq -r --arg MODULE "$module" '.modules[] | select( .id == $MODULE) | .downloadUrl')
    done
  fi
}

install_unity_macosx() {
  install_unity $@
  export UNITY=/Applications/Unity/Unity.app/Contents/MacOS/Unity
}

install_unity_linux() {
  install_unity $@
  ln -x /opt/Unity/Editor/Unity /usr/bin/unity
  export UNITY=/usr/bin/unity
}
