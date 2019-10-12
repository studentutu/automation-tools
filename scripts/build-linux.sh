error_code=0

echo "[RedOwl] Building $project for Linux."
$UNITY \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile \
  -projectPath "$(pwd)" \
  -buildLinux64Player "$(pwd)/build/linux/$project.app" \
  -quit
if [ $? = 0 ] ; then
  echo "[RedOwl] Building Linux completed successfully."
  error_code=0
else
  echo "[RedOwl] Building Linux failed. Exited with $?."
  error_code=1
fi

exit $error_code
