#!/usr/bin/env bash

mkdir build
cd build

cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DPAGMO_BUILD_PAGMO=no \
    -DPAGMO_BUILD_PYGMO=yes \
    ..

make

make install
