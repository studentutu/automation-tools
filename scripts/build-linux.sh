. ./scripts/utils.sh

project=$1
project_path=$(pwd)/
log_file=$(pwd)/build/unity-mac.log

install "MacEditorTargetInstaller/UnitySetup-Linux-Support-for-Editor-$VERSION.pkg"

error_code=0

echo "[RedOwl] Building $project for Linux."
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile "$log_file" \
  -projectPath "$project_path" \
  -buildLinux64Player "$(pwd)/build/linux/$project.app" \
  -quit
if [ $? = 0 ] ; then
  echo "[RedOwl] Building Linux completed successfully."
  error_code=0
else
  echo "[RedOwl] Building Linux failed. Exited with $?."
  error_code=1
fi

echo "[RedOwl] Build logs:"
cat $log_file

echo "[RedOwl] Finishing with code $error_code"
exit $error_code