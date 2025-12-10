cmake -LAH -G "Ninja" %CMAKE_ARGS% ^
  -DBUILD_TESTS=ON ^
  -DBUILD_STATIC_LIBS=OFF ^
  .
if errorlevel 1 exit 1

cmake --build . --config Release --target install
if errorlevel 1 exit 1

ctest --output-on-failure
if errorlevel 1 exit 1

