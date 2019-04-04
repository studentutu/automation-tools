. ./scripts/utils.sh

project=$1
project_path=$(pwd)/
log_file=$(pwd)/build/unity-mac.log

install "MacEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-$VERSION.pkg"

error_code=0

echo "[RedOwl] Building $project for WebGL."
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile "$log_file" \
  -projectPath "$project_path" \
  -executeMethod RedOwlWebGLBuilder.build \
  -quit
if [ $? = 0 ] ; then
  echo "[RedOwl] Building WebGL completed successfully."
  error_code=0
else
  echo "[RedOwl] Building WebGL failed. Exited with $?."
  error_code=1
fi

echo "[RedOwl] Build logs:"
cat $log_file

echo "[RedOwl] Finishing with code $error_code"
exit $error_code