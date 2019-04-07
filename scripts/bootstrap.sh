
mkdir -p scripts
curl -sL -o scripts/utils.sh https://raw.githubusercontent.com/rocktavious/redowl-build-tools/master/scripts/utils.sh
curl -sL -o scripts/install-unity.sh https://raw.githubusercontent.com/rocktavious/redowl-build-tools/master/scripts/install-unity.sh
curl -sL -o scripts/clean.sh https://raw.githubusercontent.com/rocktavious/redowl-build-tools/master/scripts/clean.sh
curl -sL -o scripts/build-windows.sh https://raw.githubusercontent.com/rocktavious/redowl-build-tools/master/scripts/build-windows.sh
curl -sL -o scripts/build-osx.sh https://raw.githubusercontent.com/rocktavious/redowl-build-tools/master/scripts/build-osx.sh
curl -sL -o scripts/build-linux.sh https://raw.githubusercontent.com/rocktavious/redowl-build-tools/master/scripts/build-linux.sh
curl -sL -o scripts/build-webgl.sh https://raw.githubusercontent.com/rocktavious/redowl-build-tools/master/scripts/build-webgl.sh
curl -sL -o scripts/run-tests.sh https://raw.githubusercontent.com/rocktavious/redowl-build-tools/master/scripts/run-tests.sh
curl -sL -o scripts/export-package.sh https://raw.githubusercontent.com/rocktavious/redowl-build-tools/master/scripts/export-package.sh
chmod a+x ./scripts/*.sh