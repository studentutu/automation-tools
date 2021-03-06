project=$1

error_code=0

echo "[RedOwl] Building $project for Windows."
$Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile \
  -projectPath "$(pwd)" \
  -buildWindows64Player "$(pwd)/build/windows/$project.exe" \
  -quit
if [ $? = 0 ] ; then
  echo "[RedOwl] Building Windows completed successfully."
  error_code=0
else
  echo "[RedOwl] Building Windows failed. Exited with $?."
  error_code=1
fi

exit $error_code
