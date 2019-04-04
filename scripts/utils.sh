BASE_URL=http://netstorage.unity3d.com/unity
HASH=5063218e4ab8
VERSION=2018.3.11f1

download() {
  url="$BASE_URL/$HASH/$package"

  echo "[RedOwl] Downloading from $url: "
  curl -o `basename "$package"` "$url"
}

install() {
  package=$1
  download "$package"

  echo "[RedOwl] Installing "`basename "$package"`
  sudo installer -dumplog -package `basename "$package"` -target /
}
