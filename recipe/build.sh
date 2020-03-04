#!/usr/bin/env bash

mkdir build
cd build

cmake \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    ..

make

make install
