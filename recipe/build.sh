#!/bin/bash

if [[ `uname` == 'Darwin' ]];
then
    export LIBRARY_SEARCH_VAR=DYLD_FALLBACK_LIBRARY_PATH
else
    export LIBRARY_SEARCH_VAR=LD_LIBRARY_PATH
fi

cmake ${CMAKE_ARGS} -DCMAKE_INSTALL_PREFIX=${PREFIX} -DBUILD_STATIC_LIBS=OFF -DBUILD_TESTS=ON -DCMAKE_INSTALL_LIBDIR=lib .
make install -j${CPU_COUNT}
eval ${LIBRARY_SEARCH_VAR}=$PREFIX/lib ctest -j${CPU_COUNT} --output-on-failure
