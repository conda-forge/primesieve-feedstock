#!/bin/bash

cmake ${CMAKE_ARGS} -DCMAKE_INSTALL_PREFIX=${PREFIX} -DBUILD_STATIC_LIBS=OFF -DBUILD_TESTS=ON -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_PRIMESIEVE=OFF .
make install -j${CPU_COUNT}
if test "${host_alias}" == "${build_alias}"
then
  ctest -j${CPU_COUNT} --output-on-failure
fi
