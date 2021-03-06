export UNITY=/Applications/Unity/Hub/Editor/2019.3.9f1/Unity.app

mkdir -p ./scripts
curl -sL -o ./scripts/unity.sh https://raw.githubusercontent.com/red-owl-games/automation-tools/master/scripts/unity.sh
curl -sL -o ./scripts/install.sh https://raw.githubusercontent.com/red-owl-games/automation-tools/master/scripts/install.sh
curl -sL -o ./scripts/install-linux.sh https://raw.githubusercontent.com/red-owl-games/automation-tools/master/scripts/install-linux.sh
curl -sL -o ./scripts/install-macosx.sh https://raw.githubusercontent.com/red-owl-games/automation-tools/master/scripts/install-macosx.sh
curl -sL -o ./scripts/install-license.sh https://raw.githubusercontent.com/red-owl-games/automation-tools/master/scripts/install-license.sh
curl -sL -o ./scripts/clean.sh https://raw.githubusercontent.com/red-owl-games/automation-tools/master/scripts/clean.sh
curl -sL -o ./scripts/build-windows.sh https://raw.githubusercontent.com/red-owl-games/automation-tools/master/scripts/build-windows.sh
curl -sL -o ./scripts/build-osx.sh https://raw.githubusercontent.com/red-owl-games/automation-tools/master/scripts/build-osx.sh
curl -sL -o ./scripts/build-linux.sh https://raw.githubusercontent.com/red-owl-games/automation-tools/master/scripts/build-linux.sh
curl -sL -o ./scripts/build-webgl.sh https://raw.githubusercontent.com/red-owl-games/automation-tools/master/scripts/build-webgl.sh
curl -sL -o ./scripts/run-tests.sh https://raw.githubusercontent.com/red-owl-games/automation-tools/master/scripts/run-tests.sh
curl -sL -o ./scripts/export-package.sh https://raw.githubusercontent.com/red-owl-games/automation-tools/master/scripts/export-package.sh
chmod a+x ./scripts/*.sh
