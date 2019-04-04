. ./scripts/utils.sh

project=$1
project_path=$(pwd)/
log_file=$(pwd)/build/unity-mac.log

install "MacEditorTargetInstaller/UnitySetup-Mac-Support-for-Editor-$VERSION.pkg"

error_code=0

echo "[RedOwl] Building $project for Mac OS."
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile "$log_file" \
  -projectPath "$project_path" \
  -buildOSX64Player "$(pwd)/build/osx/$project.app" \
  -quit
if [ $? = 0 ] ; then
  echo "[RedOwl] Building Mac OS completed successfully."
  error_code=0
else
  echo "[RedOwl] Building Mac OS failed. Exited with $?."
  error_code=1
fi

echo "[RedOwl] Build logs:"
cat $log_file

echo "[RedOwl] Finishing with code $error_code"
exit $error_code