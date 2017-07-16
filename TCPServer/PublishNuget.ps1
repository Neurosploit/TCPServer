rm "bin\release\" -Recurse -Force
dotnet pack --configuration release
dotnet nuget push "bin\release\" --source "https://api.nuget.org/v3/index.json"
$ver = ((ls .\bin\release)[1].Name -replace '[^\.]*\.(\d+(\.\d+){1,3}).*', '$1')
git tag -a "v$ver" -m "$ver"
git push --tags
