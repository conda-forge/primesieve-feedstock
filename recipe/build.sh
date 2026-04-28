#!/bin/bash

cmake -G Ninja ${CMAKE_ARGS} -DBUILD_STATIC_LIBS=OFF -DBUILD_TESTS=ON -DWITH_MULTIARCH=OFF .
cmake --build . --target install --parallel ${CPU_COUNT}
if test "${host_alias}" == "${build_alias}"
then
  ctest -j${CPU_COUNT} --output-on-failure
fi
