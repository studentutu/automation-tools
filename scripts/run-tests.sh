error_code=0

echo "[RedOwl] Running unit tests."
$Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile \
  -projectPath "$(pwd)" \
  -editorTestsResultFile "$(pwd)/reports/unit-test-results.xml" \
  -runEditorTests \
  -quit

if [ $? = 0 ] ; then
  echo "[RedOwl] Unit tests all passed successfully."
  error_code=0
else
  echo "[RedOwl] Unit tests failed. Exited with $?."
  error_code=1
fi

echo "[RedOwl] Test results:"
cat $test_results

exit $error_code
