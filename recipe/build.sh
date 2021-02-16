#!/usr/bin/env bash

mkdir build
cd build

cmake ${CMAKE_ARGS} \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DPYGMO_ENABLE_IPO=yes \
    ..

make -j${CPU_COUNT} VERBOSE=1

make install
