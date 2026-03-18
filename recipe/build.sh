#!/usr/bin/env bash

# IPO setup.
if [[ "$target_platform" != "linux-ppc64le" && "$target_platform" != "osx-arm64" ]]; then
  CMAKE_ARGS="${CMAKE_ARGS} -DPYGMO_ENABLE_IPO=ON"
fi

mkdir build
cd build

cmake ${CMAKE_ARGS} \
    -DCMAKE_BUILD_TYPE=Release \
    -DPython3_EXECUTABLE=$PREFIX/bin/python \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    ..

make -j${CPU_COUNT} VERBOSE=1

make install
