#!/bin/bash

cmake ${CMAKE_ARGS} -DBUILD_STATIC_LIBS=OFF -DBUILD_TESTS=ON .
make install -j${CPU_COUNT}
if test "${host_alias}" == "${build_alias}"
then
  ctest -j${CPU_COUNT} --output-on-failure
fi
