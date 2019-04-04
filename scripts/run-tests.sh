project=$1
project_path=$(pwd)/src/$project
log_file=$(pwd)/build/unity-mac.log
test_results=$(pwd)/reports/unit-test-results.xml

error_code=0

echo "[RedOwl] Running unit tests."
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile "$log_file" \
  -projectPath "$project_path" \
  -editorTestsResultFile "$test_results" \
  -runEditorTests \
  -quit

if [ $? = 0 ] ; then
  echo "[RedOwl] Unit tests all passed successfully."
  error_code=0
else
  echo "[RedOwl] Unit tests failed. Exited with $?."
  error_code=1
fi

echo "[RedOwl] Build logs:"
cat $log_file

echo "[RedOwl] Test results:"
cat $test_results

echo "[RedOwl] Finishing with code $error_code"
exit $error_code