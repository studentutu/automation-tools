project=$1
project_path=$(pwd)/

error_code=0

echo "[RedOwl] Building $project for Mac OS."
$Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile \
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

exit $error_code