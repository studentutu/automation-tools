prerequisites()
{
  if (( $# != 1 ))
  then
    echo "Usage: prerequisites <platform>"
    exit 1
  fi
  if [ "$1" == "linux" ]
  then
    apt-get update -y
    apt-get install -y curl jq
    apt-get clean
    rm -rf /var/lib/apt/lists/*
  elif [ "$1" == "darwin" ]
  then
    brew update
    brew install curl jq
  fi
}

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
  UNITY_PLATFORM=${1:-"linux"}
  UNITY_VERSION=${2:-"2018.4"}
  UNITY_MODULES=${3:-"webgl"}
  prerequisites $UNITY_PLATFORM
  UNITY_JSON=$(curl -s "https://public-cdn.cloud.unity3d.com/hub/prod/releases-${UNITY_PLATFORM}.json")
  UNITY_VERSION_JSON=$(echo $UNITY_JSON | jq -r --arg VERSION "$UNITY_VERSION" '.official[] | select( .version | contains($VERSION))')
  install $UNITY_PLATFORM $(echo $UNITY_VERSION_JSON | jq -r '.downloadUrl')
  for module in $UNITY_MODULES; do
    install $UNITY_PLATFORM $(echo $UNITY_VERSION_JSON | jq -r --arg MODULE "$module" '.modules[] | select( .id == $MODULE) | .downloadUrl')
  done
}

install_unity_macosx() {
  install_unity "darwin" $1 $2
  export UNITY=/Applications/Unity/Unity.app/Contents/MacOS/Unity
}

install_unity_linux() {
  install_unity "linux" $1 $2
  ln -x /opt/Unity/Editor/Unity /usr/bin/unity
  export UNITY=/usr/bin/unity
}
