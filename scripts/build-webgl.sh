project=$1

error_code=0

curl -sL -o $(pwd)Assets/RedOwlWebGLBuilder.cs https://raw.githubusercontent.com/red-owl-games/automation-tools/master/scripts/RedOwlWebGLBuilder.cs

echo "[RedOwl] Building $project for WebGL."
$Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile \
  -projectPath "$(pwd)" \
  -executeMethod RedOwlWebGLBuilder.build \
  -quit
if [ $? = 0 ] ; then
  echo "[RedOwl] Building WebGL completed successfully."
  error_code=0
else
  echo "[RedOwl] Building WebGL failed. Exited with $?."
  error_code=1
fi
exit $error_code
