company=$1
project=$2
package=$3
project_path=$(pwd)/
export_directory=$(pwd)/current-package
if [ -z "$package" ]; then
  export_path=$export_directory/$project.unitypackage
  asset_path="Assets/$company/$project"
else
  export_path=$export_directory/$project.$package.unitypackage
  asset_path="Assets/$company/$project/$package"
fi
error_code=0

mkdir -p $export_directory

echo "[RedOwl] Creating package."
$Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile \
  -projectPath "$project_path" \
  -exportPackage "$asset_path" "$export_path" \
  -quit
if [ $? = 0 ] ; then
  echo "[RedOwl] Created package successfully."
  error_code=0
else
  echo "[RedOwl] Creating package failed. Exited with $?."
  error_code=1
fi

exit $error_code