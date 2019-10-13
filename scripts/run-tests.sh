test_results="$(pwd)/TestResults.xml"
error_code=0

echo "[RedOwl] Running unit tests."
$Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile \
  -projectPath "$(pwd)" \
  -runEditorTests \
  -editorTestsResultFile "$test_results"

if [ $? = 0 ] ; then
  echo "[RedOwl] Unit tests all passed successfully."
  error_code=0
else
  echo "[RedOwl] Unit tests failed. Exited with $?."
  cat $test_results
  error_code=1
fi

exit $error_code
